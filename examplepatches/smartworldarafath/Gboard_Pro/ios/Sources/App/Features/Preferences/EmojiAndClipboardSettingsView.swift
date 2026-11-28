import SwiftUI

struct EmojiAndClipboardSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "CLIPBOARD HISTORY") {
                        SettingsToggleRow(
                            title: "Clipboard history",
                            summary: "Store recent copied snippets locally inside shared App Group",
                            icon: "doc.on.clipboard",
                            palette: palette,
                            isOn: $store.clipboardHistoryEnabled
                        )
                    }
                    SettingsCardGroup(palette: palette, title: "SAVED SNIPPETS") {
                        ForEach(Array(store.clipboardItems.enumerated()), id: \.offset) { idx, item in
                            if idx > 0 { CardDivider(palette: palette) }
                            Text(item)
                                .font(.system(size: 14.5))
                                .foregroundColor(palette.textPrimary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                        }
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Emoji & Clipboard")
    }
}
