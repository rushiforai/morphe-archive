import SwiftUI

struct CorrectionsSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "SUGGESTIONS & CORRECTIONS") {
                        SettingsToggleRow(title: "Show suggestion strip", summary: "Display word predictions above keyboard", icon: "text.bubble", palette: palette, isOn: $store.showSuggestionStrip)
                        CardDivider(palette: palette)
                        SettingsToggleRow(title: "Auto-correction", summary: "Correct spelling as you type", icon: "checkmark.seal", palette: palette, isOn: $store.autoCorrectionEnabled)
                        CardDivider(palette: palette)
                        SettingsToggleRow(title: "Auto-capitalization", summary: "Capitalize first letter of each sentence", icon: "textformat", palette: palette, isOn: $store.autoCapitalizationEnabled)
                        CardDivider(palette: palette)
                        SettingsToggleRow(title: "Double-space period", summary: "Double tap spacebar inserts a period followed by space", icon: "space", palette: palette, isOn: $store.doubleSpacePeriodEnabled)
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Corrections")
    }
}
