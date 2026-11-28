import SwiftUI

struct NewBetaFeaturesView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    @StateObject private var service = ReleaseAndBetaService.shared
    let palette: GboardPalette

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "BETA FEATURES SWITCH") {
                        SettingsToggleRow(
                            title: "Enable New Features (Beta)",
                            summary: "Turn ON to display experimental features currently being tested for future stable releases",
                            icon: "sparkles",
                            palette: palette,
                            isOn: $store.betaNewFeaturesSliderEnabled.animation(.easeInOut(duration: 0.25))
                        )
                    }

                    if store.betaNewFeaturesSliderEnabled {
                        SettingsCardGroup(palette: palette, title: "CURRENTLY TESTING BETA FEATURES") {
                            if service.activeExperimentalBetaFeatures.isEmpty {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("No new beta features available right now")
                                        .font(.system(size: 15.5, weight: .bold))
                                        .foregroundColor(palette.textPrimary)
                                    Text("There are currently no experimental features in active testing. New upcoming features for future stable versions will appear here automatically when added.")
                                        .font(.system(size: 13.5))
                                        .foregroundColor(palette.textSecondary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(16)
                            } else {
                                ForEach(Array(service.activeExperimentalBetaFeatures.enumerated()), id: \.element.id) { idx, item in
                                    if idx > 0 { CardDivider(palette: palette) }
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.title)
                                            .font(.system(size: 15.5, weight: .semibold))
                                            .foregroundColor(palette.textPrimary)
                                        Text(item.summary)
                                            .font(.system(size: 13.5))
                                            .foregroundColor(palette.textSecondary)
                                    }
                                    .padding(16)
                                }
                            }
                        }
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }

                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("New features (Beta)")
    }
}
