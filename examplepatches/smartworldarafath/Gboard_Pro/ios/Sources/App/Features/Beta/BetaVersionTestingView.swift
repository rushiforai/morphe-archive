import SwiftUI
import PhotosUI

struct BetaVersionTestingView: View {
    let palette: GboardPalette
    @StateObject private var service = ReleaseAndBetaService.shared
    @State private var issueTitle = ""
    @State private var issueDescription = ""
    @State private var deviceModel = GboardSettingsStore.deviceModelSummary
    @State private var pickerItems: [PhotosPickerItem] = []
    @State private var selectedImages: [(name: String, image: UIImage)] = []
    @State private var alertMessage: String?

    private var betaInstalled: Bool {
        GboardSettingsStore.isBetaVersionInstalled
    }

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 14) {
                    // 1. Pre-release English Testing Notice
                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 8) {
                            cardLabel("BETA TESTING NOTICE")
                            Text("Beta versions are released here for testing before an upcoming stable version launches. Because these builds are pre-release test versions, app crashes, unexpected glitches, or features not working properly may happen and bugs can be present. If you would like to test new upcoming versions prior to the next stable release, you can download and use them from here.")
                                .font(.system(size: 13.8))
                                .foregroundColor(palette.textSecondary)
                                .lineSpacing(3)
                        }
                        .padding(18)
                    }

                    // 2. Beta Build Check / Download Card
                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 10) {
                            cardLabel("BETA BUILD RELEASE")
                            betaReleaseContent()
                        }
                        .padding(18)
                    }

                    // 3. New Testing Features (Strictly Emoji-Free Bullet List)
                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 8) {
                            cardLabel("NEW TESTING FEATURES")
                            ForEach(Array(service.testingFeatureBullets.enumerated()), id: \.offset) { _, rawLine in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("\u{2022}")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(palette.accent)
                                    Text(ReleaseAndBetaService.stripEmojis(rawLine))
                                        .font(.system(size: 14))
                                        .foregroundColor(palette.textSecondary)
                                }
                            }
                        }
                        .padding(18)
                    }

                    // 4. Beta Bug Report & Feedback Form (Gated strictly on betaInstalled)
                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 12) {
                            cardLabel("BETA BUG REPORT & FEEDBACK")

                            Text(betaInstalled
                                 ? "Beta installed (v\(AppGroupConfig.patchVersion)) - Feedback active"
                                 : "Unavailable on stable build - Install a beta version to report beta bugs")
                                .font(.system(size: 12.5, weight: .bold))
                                .foregroundColor(betaInstalled ? palette.accent : Color.orange)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill((betaInstalled ? palette.accent : Color.orange).opacity(0.14))
                                )

                            fieldTitle("Device model")
                            styledField("Device model", text: $deviceModel)
                                .disabled(!betaInstalled)

                            fieldTitle("App beta version (Auto)")
                            styledField("Beta version", text: .constant("v\(AppGroupConfig.patchVersion)"))
                                .disabled(true)
                                .opacity(0.7)

                            fieldTitle("Issue title")
                            styledField("Enter issue title", text: $issueTitle)
                                .disabled(!betaInstalled)

                            fieldTitle("Issue description")
                            TextField("Describe the bug, steps to reproduce, and what happened...", text: $issueDescription, axis: .vertical)
                                .lineLimit(4...8)
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(palette.surfaceAlt)
                                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(palette.surfaceStroke, lineWidth: 1))
                                )
                                .foregroundColor(palette.textPrimary)
                                .disabled(!betaInstalled)

                            fieldTitle("Screenshots (up to 5)")
                            if !selectedImages.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(Array(selectedImages.enumerated()), id: \.offset) { idx, item in
                                            ZStack(alignment: .topTrailing) {
                                                Image(uiImage: item.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 74, height: 74)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                                Button {
                                                    selectedImages.remove(at: idx)
                                                } label: {
                                                    Image(systemName: "xmark.circle.fill")
                                                        .foregroundColor(.white)
                                                        .background(Circle().fill(Color.black.opacity(0.65)))
                                                }
                                                .offset(x: 4, y: -4)
                                            }
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                            }

                            PhotosPicker(
                                selection: $pickerItems,
                                maxSelectionCount: max(0, 5 - selectedImages.count),
                                matching: .images
                            ) {
                                HStack {
                                    Image(systemName: "photo.on.rectangle.angled")
                                    Text(selectedImages.count >= 5
                                         ? "Maximum 5 screenshots attached"
                                         : "Attach Screenshots (\(selectedImages.count)/5)")
                                }
                                .font(.system(size: 14.5, weight: .bold))
                                .foregroundColor(palette.accent)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(palette.surfaceAlt)
                                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(palette.surfaceStroke, lineWidth: 1))
                                )
                            }
                            .disabled(!betaInstalled || selectedImages.count >= 5)
                            .opacity(betaInstalled && selectedImages.count < 5 ? 1 : 0.45)

                            GboardPillButton(
                                title: "Submit Bug Report",
                                systemImage: nil,
                                palette: palette,
                                isEnabled: betaInstalled
                            ) {
                                submitBetaReport()
                            }
                        }
                        .padding(18)
                    }

                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Beta version testing")
        .task {
            await service.checkActiveBetaBuild(showCheckingIndicator: false)
        }
        .onChange(of: pickerItems) { newItems in
            Task {
                for item in newItems {
                    guard selectedImages.count < 5 else { break }
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let img = UIImage(data: data) {
                        selectedImages.append((name: "screenshot_\(selectedImages.count + 1).png", image: img))
                    }
                }
                pickerItems = []
            }
        }
        .alert("Beta Feedback", isPresented: Binding(get: { alertMessage != nil }, set: { if !$0 { alertMessage = nil } })) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage ?? "")
        }
    }

    @ViewBuilder
    private func betaReleaseContent() -> some View {
        switch service.betaState {
        case .checking:
            Text("Checking for active beta testing build...")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(palette.textPrimary)
            ProgressView().tint(palette.accent)
        case .noActiveBeta:
            Text("No beta version testing is active")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(palette.textPrimary)
            Text("Currently there is no beta testing build published. When a new beta release is uploaded for testing, it will appear here.")
                .font(.system(size: 13.5))
                .foregroundColor(palette.textSecondary)
            GboardPillButton(title: "Check for Beta Builds", systemImage: "arrow.clockwise", palette: palette) {
                Task { await service.checkActiveBetaBuild(showCheckingIndicator: true) }
            }
            .padding(.top, 4)
        case let .available(version, fileName, sizeBytes, _, htmlUrl, _):
            Text("Gboard Pro Beta \(version)")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(palette.textPrimary)
            Text("\(fileName) (\(String(format: "%.1f MB", Double(sizeBytes) / 1_048_576.0)))")
                .font(.system(size: 13.5))
                .foregroundColor(palette.textSecondary)
            GboardPillButton(title: "Open Release & Download", systemImage: "arrow.down.circle", palette: palette) {
                if let url = URL(string: htmlUrl) {
                    UIApplication.shared.open(url)
                }
            }
        case let .downloading(version, _, progress, mbDown, mbTotal):
            Text("Downloading Beta \(version)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(palette.textPrimary)
            ProgressView(value: progress)
                .tint(palette.accent)
            Text(String(format: "%.1f MB / %.1f MB (%d%%)", mbDown, mbTotal, Int(progress * 100)))
                .font(.system(size: 12.5, weight: .semibold))
                .foregroundColor(palette.accent)
        case let .completed(version, _):
            Text("Beta \(version) Ready")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(palette.accent)
        case let .error(msg):
            Text(msg)
                .font(.system(size: 13.5))
                .foregroundColor(.orange)
        }
    }

    private func submitBetaReport() {
        guard betaInstalled else { return }
        let title = issueTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let desc = issueDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !title.isEmpty, !desc.isEmpty else {
            alertMessage = "Please fill in both Issue Title and Issue Description."
            return
        }
        var body = "### Beta Bug Report (iOS)\n\n"
        body += "- **App Beta Version:** `v\(AppGroupConfig.patchVersion)`\n"
        body += "- **Device Model:** `\(deviceModel)`\n"
        body += "- **Attached Screenshots:** \(selectedImages.count)/5\n\n"
        body += "### Description\n\(desc)\n"
        UIPasteboard.general.string = body

        var components = URLComponents(string: AppGroupConfig.githubIssuesNewURL)
        components?.queryItems = [
            URLQueryItem(name: "title", value: "[Beta Bug iOS] \(title)"),
            URLQueryItem(name: "labels", value: "beta-bug"),
            URLQueryItem(name: "body", value: body)
        ]
        if let url = components?.url {
            UIApplication.shared.open(url)
        }
    }

    private func cardLabel(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 11.5, weight: .bold))
            .tracking(0.8)
            .foregroundColor(palette.accent)
    }

    private func fieldTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 13.5, weight: .medium))
            .foregroundColor(palette.textSecondary)
    }

    private func styledField(_ placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(palette.surfaceAlt)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(palette.surfaceStroke, lineWidth: 1))
            )
            .foregroundColor(palette.textPrimary)
    }
}
