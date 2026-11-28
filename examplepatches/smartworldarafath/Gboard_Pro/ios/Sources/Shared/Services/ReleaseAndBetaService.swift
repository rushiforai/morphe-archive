import Foundation
#if canImport(Combine)
import Combine
#endif

public struct GitHubReleaseAsset: Codable, Equatable {
    public let name: String
    public let size: Int64
    public let browserDownloadUrl: String

    enum CodingKeys: String, CodingKey {
        case name
        case size
        case browserDownloadUrl = "browser_download_url"
    }
}

public struct GitHubReleaseDTO: Codable, Equatable {
    public let tagName: String
    public let name: String
    public let body: String
    public let draft: Bool
    public let prerelease: Bool
    public let publishedAt: String
    public let htmlUrl: String
    public let assets: [GitHubReleaseAsset]

    enum CodingKeys: String, CodingKey {
        case tagName = "tag_name"
        case name
        case body
        case draft
        case prerelease
        case publishedAt = "published_at"
        case htmlUrl = "html_url"
        case assets
    }
}

public struct BetaFeatureItem: Identifiable, Equatable {
    public let id = UUID()
    public let title: String
    public let summary: String
}

public final class ReleaseAndBetaService: ObservableObject {
    public static let shared = ReleaseAndBetaService()

    public enum BetaState: Equatable {
        case noActiveBeta
        case checking
        case available(version: String, fileName: String, sizeBytes: Int64, downloadUrl: String, htmlUrl: String, bullets: [String])
        case downloading(version: String, fileName: String, progress: Double, mbDownloaded: Double, mbTotal: Double)
        case completed(version: String, localFileURL: URL)
        case error(String)
    }

    @Published public var latestRelease: GitHubReleaseDTO?
    @Published public var isCheckingUpdate = false
    @Published public var updateStatusMessage = "Up to date"
    @Published public var betaState: BetaState = .noActiveBeta
    @Published public var testingFeatureBullets: [String] = [
        "No active beta testing build features are listed right now."
    ]
    @Published public var activeExperimentalBetaFeatures: [BetaFeatureItem] = []

    private init() {}

    @MainActor
    public func checkLatestStableRelease() async {
        isCheckingUpdate = true
        defer { isCheckingUpdate = false }
        guard let url = URL(string: AppGroupConfig.githubLatestReleaseAPI) else { return }
        var req = URLRequest(url: url, timeoutInterval: 8)
        req.setValue("Gboard-Pro-iOS-App", forHTTPHeaderField: "User-Agent")
        req.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await URLSession.shared.data(for: req)
            guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                updateStatusMessage = "Unable to check GitHub (HTTP status)"
                return
            }
            let decoded = try JSONDecoder().decode(GitHubReleaseDTO.self, from: data)
            latestRelease = decoded
            let cleanRemote = decoded.tagName.hasPrefix("v") ? String(decoded.tagName.dropFirst()) : decoded.tagName
            if isRemoteVersionNewer(remote: cleanRemote, current: AppGroupConfig.patchVersion) {
                updateStatusMessage = "Update available: v\(cleanRemote)"
            } else {
                updateStatusMessage = "You're up to date (v\(AppGroupConfig.patchVersion))"
            }
        } catch {
            updateStatusMessage = "Offline or unable to reach GitHub"
        }
    }

    @MainActor
    public func checkActiveBetaBuild(showCheckingIndicator: Bool) async {
        if showCheckingIndicator {
            betaState = .checking
        }
        guard let url = URL(string: AppGroupConfig.githubReleasesListAPI) else {
            betaState = .noActiveBeta
            return
        }
        var req = URLRequest(url: url, timeoutInterval: 6)
        req.setValue("Gboard-Pro-iOS-App", forHTTPHeaderField: "User-Agent")
        req.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await URLSession.shared.data(for: req)
            guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                if showCheckingIndicator {
                    betaState = .noActiveBeta
                }
                return
            }
            let list = try JSONDecoder().decode([GitHubReleaseDTO].self, from: data)
            if let found = list.first(where: { rel in
                !rel.draft && rel.prerelease && (
                    rel.body.contains("[BETA-TEST-IPA]")
                    || rel.body.contains("[BETA-TEST-APK]")
                    || rel.tagName.lowercased().contains("beta-test")
                    || rel.name.lowercased().contains("beta testing")
                )
            }), let asset = found.assets.first(where: {
                $0.name.hasSuffix(".ipa") || $0.name.hasSuffix(".apk")
            }) {
                let ver = found.tagName.hasPrefix("v") ? String(found.tagName.dropFirst()) : found.tagName
                let bullets = Self.extractBulletFeaturesWithoutEmojis(from: found.body)
                testingFeatureBullets = bullets.isEmpty
                    ? ["No active beta testing build features are listed right now."]
                    : bullets
                betaState = .available(
                    version: ver,
                    fileName: asset.name,
                    sizeBytes: asset.size,
                    downloadUrl: asset.browserDownloadUrl,
                    htmlUrl: found.htmlUrl,
                    bullets: testingFeatureBullets
                )
            } else {
                testingFeatureBullets = ["No active beta testing build features are listed right now."]
                betaState = .noActiveBeta
            }
        } catch {
            betaState = .noActiveBeta
        }
    }

    public static func stripEmojis(_ input: String) -> String {
        let filtered = input.unicodeScalars.filter { scalar in
            let v = scalar.value
            let isEmoji = (v >= 0x1F000 && v <= 0x1FAFF)
                || (v >= 0x2600 && v <= 0x27BF)
                || (v >= 0xFE00 && v <= 0xFE0F)
                || v == 0x200D
                || v == 0x20E3
            return !isEmoji
        }
        return String(String.UnicodeScalarView(filtered))
            .replacingOccurrences(of: "  +", with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public static func extractBulletFeaturesWithoutEmojis(from body: String) -> [String] {
        var result: [String] = []
        let lines = body.replacingOccurrences(of: "\r", with: "").components(separatedBy: "\n")
        for raw in lines {
            let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty || trimmed == "[BETA-TEST-APK]" || trimmed == "[BETA-TEST-IPA]" { continue }
            if trimmed.hasPrefix("- ") || trimmed.hasPrefix("* ") || trimmed.hasPrefix("• ") {
                let dropped = String(trimmed.dropFirst(2))
                let clean = stripEmojis(dropped)
                if !clean.isEmpty {
                    result.append(clean)
                }
            }
        }
        return result
    }

    public func isRemoteVersionNewer(remote: String, current: String) -> Bool {
        let rParts = remote.components(separatedBy: "-")[0].components(separatedBy: ".").map { Int($0.filter(\.isNumber)) ?? 0 }
        let cParts = current.components(separatedBy: "-")[0].components(separatedBy: ".").map { Int($0.filter(\.isNumber)) ?? 0 }
        let count = max(rParts.count, cParts.count)
        for i in 0..<count {
            let r = i < rParts.count ? rParts[i] : 0
            let c = i < cParts.count ? cParts[i] : 0
            if r > c { return true }
            if r < c { return false }
        }
        return false
    }
}
