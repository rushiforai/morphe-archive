import SwiftUI

/// Interactive SwiftUI keyboard preview embedded inside host app so testing works immediately without switching system keyboards.
struct InAppKeyboardPreviewContainer: View {
    let palette: GboardPalette
    @ObservedObject var store: GboardSettingsStore
    let onInsertText: (String) -> Void
    let onBackspace: () -> Void

    @State private var shifted = false
    @State private var symbolsMode = false
    @State private var emojiMode = false

    private var activeLang: KeyboardLanguageItem {
        LanguageCatalog.item(for: store.activeLanguageCode)
    }

    var body: some View {
        VStack(spacing: 6) {
            if store.showSuggestionStrip {
                HStack(spacing: 8) {
                    WaterDropOrbIcon(systemName: "g.circle.fill", palette: palette, size: 32)
                    Spacer()
                    ForEach(GboardSuggestionEngine.suggestions(for: ""), id: \.self) { word in
                        Button {
                            onInsertText(word + " ")
                        } label: {
                            Text(word)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(palette.textPrimary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                        }
                        .buttonStyle(.plain)
                    }
                    Spacer()
                    Button {
                        emojiMode.toggle()
                    } label: {
                        WaterDropOrbIcon(systemName: emojiMode ? "keyboard" : "face.smiling", palette: palette, size: 32)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 10)
                .padding(.top, 6)
            }

            if emojiMode {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 38))], spacing: 8) {
                        ForEach(LanguageCatalog.emojiGrid, id: \.self) { emoji in
                            Button {
                                onInsertText(emoji)
                            } label: {
                                Text(emoji).font(.system(size: 26))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(10)
                }
            } else {
                let rows = symbolsMode ? LanguageCatalog.symbolRows : activeLang.rows
                if store.numberRowEnabled && !symbolsMode {
                    keyRow(LanguageCatalog.numberRow, isFunctionRow: false)
                }
                ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                    HStack(spacing: 5) {
                        if idx == rows.count - 1 {
                            specialKey(icon: symbolsMode ? "textformat.abc" : (shifted ? "shift.fill" : "shift"), width: 42) {
                                if !symbolsMode { shifted.toggle() }
                            }
                        }
                        keyRow(row, isFunctionRow: false)
                        if idx == rows.count - 1 {
                            specialKey(icon: "delete.left", width: 42) {
                                onBackspace()
                            }
                        }
                    }
                    .padding(.horizontal, 6)
                }
                HStack(spacing: 6) {
                    specialKey(title: symbolsMode ? "ABC" : "?123", width: 52) {
                        symbolsMode.toggle()
                    }
                    specialKey(icon: "globe", width: 38) {
                        store.cycleActiveLanguage()
                    }
                    Button {
                        onInsertText(" ")
                    } label: {
                        Text(activeLang.layoutLabel)
                            .font(.system(size: 13.5, weight: .medium))
                            .foregroundColor(palette.textSecondary)
                            .frame(maxWidth: .infinity, minHeight: 42)
                            .background(keyShape(isFunction: false))
                    }
                    .buttonStyle(.plain)
                    specialKey(title: ".", width: 34) {
                        onInsertText(".")
                    }
                    specialKey(icon: "return", width: 52, isAccent: true) {
                        onInsertText("\n")
                    }
                }
                .padding(.horizontal, 6)
                .padding(.bottom, 8)
            }
        }
        .background(Color(hex: palette.keyboardBackgroundHex))
        .cornerRadius(palette.isLiquidGlass ? 22 : 14)
    }

    @ViewBuilder
    private func keyRow(_ keys: [String], isFunctionRow: Bool) -> some View {
        HStack(spacing: 5) {
            ForEach(keys, id: \.self) { key in
                let display = shifted ? key.uppercased() : key
                Button {
                    onInsertText(display)
                    if shifted { shifted = false }
                } label: {
                    Text(display)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(palette.textPrimary)
                        .frame(maxWidth: .infinity, minHeight: 42)
                        .background(keyShape(isFunction: isFunctionRow))
                }
                .buttonStyle(.plain)
            }
        }
    }

    @ViewBuilder
    private func specialKey(title: String? = nil, icon: String? = nil, width: CGFloat, isAccent: Bool = false, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Group {
                if let icon {
                    Image(systemName: icon).font(.system(size: 16, weight: .medium))
                } else if let title {
                    Text(title).font(.system(size: 14, weight: .semibold))
                }
            }
            .foregroundColor(isAccent ? palette.ctaForeground : palette.textPrimary)
            .frame(width: width, height: 42)
            .background(
                Group {
                    if isAccent {
                        Capsule().fill(palette.accent)
                    } else {
                        keyShape(isFunction: true)
                    }
                }
            )
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private func keyShape(isFunction: Bool) -> some View {
        let base = Color(hex: isFunction ? palette.keyFunctionHex : palette.keyBackgroundHex)
        let radius: CGFloat = palette.isLiquidGlass ? 13 : 8
        RoundedRectangle(cornerRadius: radius, style: .continuous)
            .fill(base)
            .overlay(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .stroke(palette.isLiquidGlass ? palette.surfaceStroke : Color.black.opacity(palette.isDark ? 0.25 : 0.08), lineWidth: 0.8)
            )
            .shadow(color: palette.isAmoled ? .clear : Color.black.opacity(palette.isDark ? 0.22 : 0.09), radius: 1, x: 0, y: 1)
    }
}
