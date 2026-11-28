import SwiftUI

struct ThemeSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette
    let openSandbox: () -> Void

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "UI STYLE & AMOLED") {
                        SettingsNavRow(
                            title: "Style",
                            summary: store.uiStyleMode.displayTitle,
                            icon: "drop",
                            palette: palette
                        ) {
                            store.uiStyleMode = (store.uiStyleMode == .classic) ? .liquidGlass : .classic
                        }
                        CardDivider(palette: palette)
                        SettingsToggleRow(
                            title: "AMOLED Pure Black",
                            summary: "True #000000 OLED backdrop for app & keyboard",
                            icon: "moon.fill",
                            palette: palette,
                            isOn: $store.amoledBlackEnabled
                        )
                    }

                    SettingsCardGroup(palette: palette, title: "COLOR PALETTES") {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 12)], spacing: 12) {
                            ForEach(KeyboardThemeOption.allCases) { option in
                                let selected = (store.selectedTheme == option)
                                Button {
                                    withAnimation(.easeInOut(duration: 0.22)) {
                                        store.selectedTheme = option
                                    }
                                } label: {
                                    VStack(spacing: 10) {
                                        Circle()
                                            .fill(option.swatchColor)
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Circle().stroke(Color.white.opacity(0.65), lineWidth: 1.5)
                                            )
                                        Text(option.title)
                                            .font(.system(size: 13.5, weight: selected ? .bold : .medium))
                                            .foregroundColor(palette.textPrimary)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(selected ? palette.accent.opacity(0.14) : palette.surfaceAlt)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(selected ? palette.accent : palette.surfaceStroke, lineWidth: selected ? 1.8 : 0.8)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(14)
                    }

                    GboardPillButton(title: "Open Live Keyboard Preview", systemImage: "keyboard", palette: palette) {
                        openSandbox()
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Theme")
    }
}
