import SwiftUI

struct AdditionalHubView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    let navigate: (SettingsRoute) -> Void

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "ADDITIONAL") {
                        SettingsNavRow(
                            title: "Choose UI",
                            summary: store.uiStyleMode == .liquidGlass
                                ? "3D Liquid Glass UI (Active)"
                                : "Classic Material UI (Default) (Active)",
                            icon: "paintpalette",
                            palette: palette
                        ) { navigate(.chooseUI) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "Notification",
                            summary: "App updates, beta release & beta feature alert settings",
                            icon: "bell",
                            palette: palette
                        ) { navigate(.notifications) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "Permissions",
                            summary: "Review keyboard Full Access & notification permissions",
                            icon: "checkmark.shield",
                            palette: palette
                        ) { navigate(.permissions) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "Reset",
                            summary: "Reset Gboard Pro settings & caches",
                            icon: "arrow.counterclockwise",
                            palette: palette
                        ) { navigate(.reset) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "Beta Program",
                            summary: "Beta version testing & experimental features",
                            icon: "flask",
                            palette: palette
                        ) { navigate(.betaProgram) }
                    }
                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Additional")
    }
}
