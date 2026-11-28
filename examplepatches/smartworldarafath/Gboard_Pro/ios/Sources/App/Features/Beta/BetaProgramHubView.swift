import SwiftUI

struct BetaProgramHubView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    let navigate: (SettingsRoute) -> Void

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "BETA PROGRAM") {
                        SettingsNavRow(
                            title: "Beta version testing",
                            summary: "Pre-release beta builds, testing features & beta bug reports",
                            icon: "flask",
                            palette: palette
                        ) { navigate(.betaTesting) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "New features (Beta)",
                            summary: store.betaNewFeaturesSliderEnabled
                                ? "Experimental features slider is ON"
                                : "Turn on to preview upcoming beta features",
                            icon: "sparkles",
                            palette: palette
                        ) { navigate(.newBetaFeatures) }
                    }
                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Beta Program")
    }
}
