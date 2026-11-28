import SwiftUI

struct ProSettingsView: View {
    let palette: GboardPalette
    let navigate: (SettingsRoute) -> Void

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "GBOARD PRO CUSTOMIZATIONS") {
                        SettingsNavRow(
                            title: "Amoled",
                            summary: "AMOLED Pure Black app & keyboard styling",
                            icon: "moon.stars",
                            palette: palette
                        ) { navigate(.amoled) }

                        CardDivider(palette: palette)

                        SettingsNavRow(
                            title: "Advanced Settings",
                            summary: "Gemini voice tools, writing tools & modular patches",
                            icon: "slider.horizontal.2.square",
                            palette: palette
                        ) { navigate(.advanced) }
                    }
                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Pro")
    }
}
