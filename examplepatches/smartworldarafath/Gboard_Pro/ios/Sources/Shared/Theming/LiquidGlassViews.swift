import SwiftUI

/// Renders a 3D water-drop Liquid Glass orb matching Android's LiquidGlassOrbDrawable
/// (Light mode: frosted pearlescent droplet; Dark/AMOLED mode: deep smoked lens,
/// upper-left dome specular + angled wet glint, bottom-right caustic crescent, Fresnel rim).
public struct WaterDropOrbIcon: View {
    public let systemName: String
    public let palette: GboardPalette
    public var size: CGFloat = 44

    public init(systemName: String, palette: GboardPalette, size: CGFloat = 44) {
        self.systemName = systemName
        self.palette = palette
        self.size = size
    }

    public var body: some View {
        if palette.isLiquidGlass {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(hex: palette.orbBodyTopHex),
                                Color(hex: palette.orbBodyMidHex),
                                Color(hex: palette.orbBodyBotHex)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(
                        color: palette.isAmoled ? .clear : Color.black.opacity(palette.isDark ? 0.34 : 0.08),
                        radius: palette.isDark ? 3.5 : 2.5,
                        x: 0,
                        y: 1.5
                    )

                // Clipped water-droplet internal optics
                ZStack {
                    RadialGradient(
                        colors: [
                            Color.white.opacity(palette.isDark ? (palette.isAmoled ? 0.42 : 0.48) : 0.85),
                            Color.white.opacity(palette.isDark ? 0.14 : 0.0),
                            Color.clear
                        ],
                        center: UnitPoint(x: 0.32, y: 0.31),
                        startRadius: 0,
                        endRadius: size * 0.44
                    )

                    if palette.isDark || palette.isAmoled {
                        // Crisp angled wet pinpoint glint for dark water droplet realism
                        Ellipse()
                            .fill(
                                RadialGradient(
                                    colors: [Color.white.opacity(0.72), Color.white.opacity(0.22), Color.clear],
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: size * 0.16
                                )
                            )
                            .frame(width: size * 0.30, height: size * 0.15)
                            .rotationEffect(.degrees(-36))
                            .offset(x: -size * 0.17, y: -size * 0.18)

                        // Bottom-right internal caustic bounce
                        RadialGradient(
                            colors: [
                                palette.accent.opacity(palette.isAmoled ? 0.36 : 0.42),
                                Color.white.opacity(0.12),
                                Color.clear
                            ],
                            center: UnitPoint(x: 0.62, y: 0.77),
                            startRadius: 0,
                            endRadius: size * 0.34
                        )
                    } else {
                        RadialGradient(
                            colors: [Color.white.opacity(0.55), Color.clear],
                            center: UnitPoint(x: 0.60, y: 0.77),
                            startRadius: 0,
                            endRadius: size * 0.32
                        )
                    }
                }
                .clipShape(Circle())

                // 3D Fresnel Rim
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: palette.isDark || palette.isAmoled
                                ? [Color.white.opacity(palette.isAmoled ? 0.76 : 0.82), Color.white.opacity(0.14), palette.accent.opacity(0.65)]
                                : [Color.white, Color(hex: 0x8690B8, alpha: 0.22), Color.white.opacity(0.95)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.25
                    )

                Image(systemName: systemName)
                    .font(.system(size: size * 0.42, weight: .semibold))
                    .foregroundColor(palette.isDark ? Color(hex: 0xF2F5FF) : Color(hex: 0x1A2033))
            }
            .frame(width: size, height: size)
        } else {
            Image(systemName: systemName)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(palette.textSecondary)
                .frame(width: 28, height: 28)
        }
    }
}

public struct GboardCardModifier: ViewModifier {
    public let palette: GboardPalette
    public var cornerRadius: CGFloat = 18

    public func body(content: Content) -> some View {
        let r = palette.isLiquidGlass ? max(cornerRadius, 22) : min(cornerRadius, 16)
        content
            .background(
                RoundedRectangle(cornerRadius: r, style: .continuous)
                    .fill(
                        palette.isLiquidGlass
                            ? AnyShapeStyle(
                                LinearGradient(
                                    colors: palette.isDark
                                        ? [palette.surface.opacity(0.96), palette.surfaceAlt.opacity(0.92)]
                                        : [Color.white.opacity(0.94), palette.surface.opacity(0.95)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            : AnyShapeStyle(palette.surface)
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: r, style: .continuous)
                    .stroke(palette.surfaceStroke, lineWidth: palette.isLiquidGlass ? 1.15 : 0.75)
            )
            .shadow(
                color: palette.isLiquidGlass && !palette.isAmoled
                    ? Color.black.opacity(palette.isDark ? 0.26 : 0.05)
                    : .clear,
                radius: palette.isLiquidGlass ? 8 : 0,
                x: 0,
                y: palette.isLiquidGlass ? 3 : 0
            )
    }
}

public extension View {
    func gboardCard(palette: GboardPalette, cornerRadius: CGFloat = 18) -> some View {
        modifier(GboardCardModifier(palette: palette, cornerRadius: cornerRadius))
    }
}

public struct GboardPillButton: View {
    public let title: String
    public let systemImage: String?
    public let palette: GboardPalette
    public var isEnabled: Bool = true
    public let action: () -> Void

    public init(
        title: String,
        systemImage: String? = nil,
        palette: GboardPalette,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.palette = palette
        self.isEnabled = isEnabled
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 15, weight: .bold))
                }
                Text(title)
                    .font(.system(size: 15.5, weight: .bold))
            }
            .foregroundColor(palette.isLiquidGlass ? palette.accent : palette.ctaForeground)
            .frame(maxWidth: .infinity, minHeight: 48)
            .padding(.horizontal, 20)
            .background(
                Capsule()
                    .fill(
                        palette.isLiquidGlass
                            ? AnyShapeStyle(
                                LinearGradient(
                                    colors: palette.isDark
                                        ? [palette.surfaceAlt, palette.surface]
                                        : [Color.white, palette.surfaceAlt],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            : AnyShapeStyle(palette.accent)
                    )
            )
            .overlay(
                Capsule()
                    .stroke(
                        palette.isLiquidGlass ? palette.surfaceStroke : Color.clear,
                        lineWidth: palette.isLiquidGlass ? 1.2 : 0
                    )
            )
            .shadow(
                color: palette.isLiquidGlass && !palette.isAmoled
                    ? Color.black.opacity(palette.isDark ? 0.30 : 0.08)
                    : .clear,
                radius: 6,
                x: 0,
                y: 2
            )
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.45)
        .buttonStyle(.plain)
    }
}
