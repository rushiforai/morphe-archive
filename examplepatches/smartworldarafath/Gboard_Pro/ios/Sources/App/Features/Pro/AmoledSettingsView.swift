import SwiftUI

struct AmoledSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "DISPLAY & THEMES") {
                        SettingsToggleRow(
                            title: "AMOLED Pure Black Mode",
                            summary: "True #000000 black background across the entire app UI and keyboard",
                            icon: "moon.fill",
                            palette: palette,
                            isOn: $store.amoledBlackEnabled
                        )
                    }

                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("AMOLED Pure Black")
                                .font(.system(size: 15.5, weight: .bold))
                                .foregroundColor(palette.accent)
                            Text("When enabled, the entire Gboard Pro app UI and keyboard extension switch to true #000000 pure black for OLED iPhones and iPads.")
                                .font(.system(size: 13.5))
                                .foregroundColor(palette.textSecondary)
                        }
                        .padding(16)
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Amoled")
    }
}
