import SwiftUI

struct AboutOrUpdatesView: View {
    let palette: GboardPalette
    let isUpdatesScreen: Bool
    @StateObject private var service = ReleaseAndBetaService.shared

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    // Hero Gboard Pro Emblem Card matching Android About & Updates screens
                    SettingsCardGroup(palette: palette) {
                        VStack(spacing: 12) {
                            GboardProEmblemBadgeView(size: 74)
                            Text("Gboard Pro")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(palette.textPrimary)
                            Text("v\(AppGroupConfig.patchVersion)")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(palette.textSecondary)
                            Text("Gboard From Google Pixel 11 series crafted natively for iPhone & iPad with Adaptive Classic Material & 3D Liquid Glass UI")
                                .font(.system(size: 13.5))
                                .foregroundColor(palette.textSecondary)
                                .multilineTextAlignment(.center)
                            GboardPillButton(
                                title: service.isCheckingUpdate ? "Checking..." : "Check for Updates",
                                systemImage: "arrow.triangle.2.circlepath",
                                palette: palette,
                                isEnabled: !service.isCheckingUpdate
                            ) {
                                Task { await service.checkLatestStableRelease() }
                            }
                            .padding(.top, 6)
                        }
                        .padding(22)
                    }

                    if isUpdatesScreen {
                        SettingsCardGroup(palette: palette, title: "ACTIONS") {
                            SettingsNavRow(
                                title: "Check for Updates",
                                summary: service.updateStatusMessage,
                                icon: "arrow.down.circle",
                                palette: palette
                            ) {
                                Task { await service.checkLatestStableRelease() }
                            }
                            CardDivider(palette: palette)
                            SettingsNavRow(
                                title: "All Releases",
                                summary: "Browse changelogs & builds on GitHub",
                                icon: "chevron.left.forwardslash.chevron.right",
                                palette: palette
                            ) {
                                if let url = URL(string: "\(AppGroupConfig.githubRepoWebURL)/releases") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }
                    } else {
                        SettingsCardGroup(palette: palette, title: "DEVELOPER & COMMUNITY") {
                            SettingsNavRow(title: "Developer", summary: "Arafath Rahman", icon: "person.fill", palette: palette) {}
                            CardDivider(palette: palette)
                            SettingsNavRow(title: "Community", summary: "Telegram Community & Support", icon: "paperplane.fill", palette: palette) {
                                if let url = URL(string: AppGroupConfig.telegramCommunityURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                            CardDivider(palette: palette)
                            SettingsNavRow(title: "Source Code", summary: "GitHub Repository", icon: "chevron.left.forwardslash.chevron.right", palette: palette) {
                                if let url = URL(string: AppGroupConfig.githubRepoWebURL) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }
                        SettingsCardGroup(palette: palette, title: "APPLICATION & SYSTEM") {
                            SettingsNavRow(title: "Release Version", summary: AppGroupConfig.fullVersionName, icon: "shippingbox", palette: palette) {}
                        }
                    }

                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle(isUpdatesScreen ? "Gboard Pro Updates" : "About")
    }
}
