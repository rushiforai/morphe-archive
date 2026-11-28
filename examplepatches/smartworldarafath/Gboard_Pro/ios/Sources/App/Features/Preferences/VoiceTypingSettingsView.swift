import SwiftUI

struct VoiceTypingSettingsView: View {
    let palette: GboardPalette
    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "IOS DICTATION") {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("iOS Keyboard Extension Dictation Note")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(palette.textPrimary)
                            Text("Apple's iOS sandbox reserves the system microphone button on the keyboard toolbar for native Apple Dictation, or requires \"Allow Full Access\" for custom voice recording inside third-party keyboard extensions.")
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
        .navigationTitle("Voice typing")
    }
}
