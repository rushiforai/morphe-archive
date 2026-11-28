import SwiftUI

struct SettingsCardGroup<Content: View>: View {
    let palette: GboardPalette
    let title: String?
    @ViewBuilder let content: () -> Content

    init(palette: GboardPalette, title: String? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.palette = palette
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .tracking(0.8)
                    .foregroundColor(palette.accent)
                    .padding(.horizontal, 22)
            }
            VStack(spacing: 0) {
                content()
            }
            .gboardCard(palette: palette)
            .padding(.horizontal, 16)
        }
    }
}

struct SettingsNavRow: View {
    let title: String
    let summary: String
    let icon: String
    let palette: GboardPalette
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                WaterDropOrbIcon(systemName: icon, palette: palette, size: 42)
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(palette.textPrimary)
                        .multilineTextAlignment(.leading)
                    if !summary.isEmpty {
                        Text(summary)
                            .font(.system(size: 13.5))
                            .foregroundColor(palette.textSecondary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer(minLength: 8)
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(palette.textSecondary.opacity(0.6))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityIdentifier("row_\(title.lowercased().replacingOccurrences(of: " ", with: "_"))")
    }
}

struct SettingsToggleRow: View {
    let title: String
    let summary: String
    let icon: String
    let palette: GboardPalette
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: 14) {
            WaterDropOrbIcon(systemName: icon, palette: palette, size: 42)
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(palette.textPrimary)
                if !summary.isEmpty {
                    Text(summary)
                        .font(.system(size: 13))
                        .foregroundColor(palette.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Spacer(minLength: 8)
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(palette.accent)
                .accessibilityIdentifier("toggle_\(title.lowercased().replacingOccurrences(of: " ", with: "_"))")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
    }
}

struct CardDivider: View {
    let palette: GboardPalette
    var body: some View {
        Rectangle()
            .fill(palette.textSecondary.opacity(0.14))
            .frame(height: 0.7)
            .padding(.horizontal, 16)
    }
}

struct FooterWatermarkView: View {
    let palette: GboardPalette
    var body: some View {
        HStack(spacing: 12) {
            Rectangle().fill(palette.textSecondary.opacity(0.25)).frame(height: 1)
            Text("Gboard_Pro \(AppGroupConfig.patchVersion)")
                .font(.system(size: 12.5, weight: .medium))
                .foregroundColor(palette.textSecondary)
                .fixedSize()
            Rectangle().fill(palette.textSecondary.opacity(0.25)).frame(height: 1)
        }
        .padding(.horizontal, 28)
        .padding(.top, 12)
    }
}
