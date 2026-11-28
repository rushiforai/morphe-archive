import SwiftUI

struct ChooseUiSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "CHOOSE UI STYLE") {
                        ForEach(Array(UIStyleMode.allCases.enumerated()), id: \.element.id) { idx, mode in
                            if idx > 0 { CardDivider(palette: palette) }
                            let selected = (store.uiStyleMode == mode)
                            Button {
                                withAnimation(.spring(response: 0.32, dampingFraction: 0.85)) {
                                    store.uiStyleMode = mode
                                }
                            } label: {
                                HStack(spacing: 14) {
                                    WaterDropOrbIcon(
                                        systemName: mode == .classic ? "square.stack.3d.up" : "drop.fill",
                                        palette: palette,
                                        size: 42
                                    )
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(mode.displayTitle)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(palette.textPrimary)
                                        Text(mode.displaySubtitle)
                                            .font(.system(size: 13))
                                            .foregroundColor(palette.textSecondary)
                                    }
                                    Spacer()
                                    Image(systemName: selected ? "largecircle.fill.circle" : "circle")
                                        .font(.system(size: 20))
                                        .foregroundColor(selected ? palette.accent : palette.textSecondary)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 13)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                            .accessibilityIdentifier("choose_ui_\(mode.rawValue)")
                        }
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Choose UI")
    }
}
