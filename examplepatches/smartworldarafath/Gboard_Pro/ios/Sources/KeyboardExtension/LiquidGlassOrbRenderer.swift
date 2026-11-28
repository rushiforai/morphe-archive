import UIKit

enum KeyboardOrbRole {
    case normal
    case functionKey
    case accentAction
    case orbButton
}

/// Memory-efficient CoreGraphics keycap / water-drop orb view tailored for iOS Keyboard Extension (~50 MB watchdog safe).
final class LiquidGlassKeyButton: UIButton {
    var palette: GboardPalette? {
        didSet { setNeedsDisplay() }
    }
    var orbRole: KeyboardOrbRole = .normal {
        didSet { setNeedsDisplay() }
    }
    var isCircularOrb: Bool = false {
        didSet { setNeedsDisplay() }
    }

    override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                setNeedsDisplay()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .redraw
        isOpaque = false
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext(), let palette else { return }
        let insetRect = rect.insetBy(dx: 0.5, dy: 0.5)
        let radius = isCircularOrb
            ? min(insetRect.width, insetRect.height) / 2.0
            : (palette.isLiquidGlass ? 11.0 : 6.0)

        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: radius)

        if !palette.isLiquidGlass {
            let fillColor: UIColor
            switch orbRole {
            case .accentAction:
                fillColor = UIColor(palette.accent)
            case .functionKey, .orbButton:
                fillColor = UIColor(hex: palette.keyFunctionHex)
            case .normal:
                fillColor = UIColor(hex: palette.keyBackgroundHex)
            }
            let effective = isHighlighted ? fillColor.withAlphaComponent(0.76) : fillColor
            ctx.saveGState()
            if !palette.isAmoled {
                ctx.setShadow(
                    offset: CGSize(width: 0, height: 1),
                    blur: 0.5,
                    color: UIColor.black.withAlphaComponent(palette.isDark ? 0.30 : 0.18).cgColor
                )
            }
            effective.setFill()
            path.fill()
            ctx.restore()
            return
        }

        // 3D Water-Drop / Frosted Keycap Lens
        ctx.saveGState()
        path.addClip()

        let colors: [CGColor]
        switch orbRole {
        case .accentAction:
            colors = [
                UIColor(palette.accent).withAlphaComponent(0.95).cgColor,
                UIColor(palette.accent).cgColor
            ]
        case .functionKey, .orbButton:
            if palette.isAmoled {
                colors = [UIColor(hex: 0x263046).cgColor, UIColor(hex: 0x06080E).cgColor, UIColor(hex: 0x1B2336).cgColor]
            } else if palette.isDark {
                colors = [UIColor(hex: 0x454E69).cgColor, UIColor(hex: 0x1F2538).cgColor, UIColor(hex: 0x333B54).cgColor]
            } else {
                colors = [UIColor(hex: 0xD2D6E6).cgColor, UIColor(hex: 0xC2C7DC).cgColor, UIColor(hex: 0xE6E9F5).cgColor]
            }
        case .normal:
            if palette.isAmoled {
                colors = [UIColor(hex: 0x1D2333).cgColor, UIColor(hex: 0x0D1018).cgColor, UIColor(hex: 0x171D2B).cgColor]
            } else if palette.isDark {
                colors = [UIColor(hex: 0x394466).cgColor, UIColor(hex: 0x141928).cgColor, UIColor(hex: 0x2D3754).cgColor]
            } else {
                colors = [UIColor.white.cgColor, UIColor(hex: 0xE5E8F6).cgColor, UIColor(hex: 0xF7F8FE).cgColor]
            }
        }

        let space = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = colors.count == 3 ? [0.0, 0.55, 1.0] : [0.0, 1.0]
        if let grad = CGGradient(colorsSpace: space, colors: colors as CFArray, locations: locations) {
            ctx.drawLinearGradient(
                grad,
                start: CGPoint(x: insetRect.minX, y: insetRect.minY),
                end: CGPoint(x: insetRect.maxX, y: insetRect.maxY),
                options: []
            )
        }

        // Upper-left water-drop specular dome
        let domeAlpha: CGFloat = palette.isDark || palette.isAmoled ? 0.36 : 0.72
        let domeColors = [UIColor.white.withAlphaComponent(domeAlpha).cgColor, UIColor.clear.cgColor] as CFArray
        if let dome = CGGradient(colorsSpace: space, colors: domeColors, locations: [0.0, 1.0]) {
            let center = CGPoint(x: insetRect.minX + insetRect.width * 0.28, y: insetRect.minY + insetRect.height * 0.25)
            ctx.drawRadialGradient(
                dome,
                startCenter: center,
                startRadius: 0,
                endCenter: center,
                endRadius: max(insetRect.width, insetRect.height) * 0.62,
                options: []
            )
        }

        if isHighlighted {
            UIColor(palette.accent).withAlphaComponent(0.28).setFill()
            ctx.fill(insetRect)
        }
        ctx.restore()

        // Fresnel Outer Specular Rim
        ctx.saveGState()
        let rimColor: UIColor = palette.isDark || palette.isAmoled
            ? UIColor.white.withAlphaComponent(0.48)
            : UIColor.white.withAlphaComponent(0.92)
        rimColor.setStroke()
        path.lineWidth = 1.15
        path.stroke()
        ctx.restore()
    }
}
