import SwiftUI

struct LiveKeyboardSandboxView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    @State private var sampleText = ""

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            VStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("LIVE IPHONE / IPAD KEYBOARD SANDBOX")
                        .font(.system(size: 11.5, weight: .bold))
                        .tracking(0.8)
                        .foregroundColor(palette.accent)
                    TextField("Tap here or use the interactive keyboard below...", text: $sampleText, axis: .vertical)
                        .lineLimit(3...6)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 12).fill(palette.surfaceAlt))
                        .foregroundColor(palette.textPrimary)
                }
                .padding(16)
                .gboardCard(palette: palette)
                .padding(.horizontal, 16)

                Spacer()

                InAppKeyboardPreviewContainer(
                    palette: palette,
                    store: store,
                    onInsertText: { sampleText.append($0) },
                    onBackspace: {
                        if !sampleText.isEmpty { sampleText.removeLast() }
                    }
                )
                .frame(height: 310)
            }
            .frame(maxWidth: 740)
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
        }
        .navigationTitle("Live Keyboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}
