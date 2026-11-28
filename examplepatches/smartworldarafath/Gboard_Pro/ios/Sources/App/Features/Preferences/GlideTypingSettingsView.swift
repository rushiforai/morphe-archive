import SwiftUI

struct GlideTypingSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "GLIDE TYPING") {
                        SettingsToggleRow(title: "Enable glide typing", summary: "Input words by sliding across keys", icon: "scribble.variable", palette: palette, isOn: $store.glideTypingEnabled)
                        CardDivider(palette: palette)
                        SettingsToggleRow(title: "Show gesture trail", summary: "Render glowing fingertip path while swiping", icon: "waveform.path", palette: palette, isOn: $store.showGestureTrail)
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Glide typing")
    }
}
