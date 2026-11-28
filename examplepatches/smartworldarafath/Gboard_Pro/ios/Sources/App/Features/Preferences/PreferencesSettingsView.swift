import SwiftUI

struct PreferencesSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "KEYS") {
                        SettingsToggleRow(
                            title: "Number row",
                            summary: "Show dedicated 1-0 number keys above letters",
                            icon: "number",
                            palette: palette,
                            isOn: $store.numberRowEnabled
                        )
                        CardDivider(palette: palette)
                        SettingsToggleRow(
                            title: "Pop-up on keypress",
                            summary: "Show floating magnification badge when tapping keys on iPhone",
                            icon: "arrow.up.square",
                            palette: palette,
                            isOn: $store.keyPressPopupEnabled
                        )
                        CardDivider(palette: palette)
                        SettingsToggleRow(
                            title: "One-handed mode",
                            summary: "Compact keyboard towards one thumb on large iPhones",
                            icon: "rectangle.lefthalf.inset.filled",
                            palette: palette,
                            isOn: $store.oneHandedMode
                        )
                    }

                    SettingsCardGroup(palette: palette, title: "KEY PRESS") {
                        SettingsToggleRow(
                            title: "Haptic feedback on keypress",
                            summary: "Subtle Taptic Engine pulse on every tap",
                            icon: "iphone.radiowaves.left.and.right",
                            palette: palette,
                            isOn: $store.hapticFeedbackEnabled
                        )
                        CardDivider(palette: palette)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Keyboard height scale")
                                    .font(.system(size: 15.5, weight: .medium))
                                    .foregroundColor(palette.textPrimary)
                                Spacer()
                                Text("\(Int(store.keyboardHeightScale * 100))%")
                                    .font(.system(size: 13.5, weight: .bold))
                                    .foregroundColor(palette.accent)
                            }
                            Slider(value: $store.keyboardHeightScale, in: 0.85...1.20, step: 0.05)
                                .tint(palette.accent)
                        }
                        .padding(16)
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Preferences")
    }
}
