import UIKit

/// Renders fingertips glide typing trail cleanly using CoreAnimation CAShapeLayer.
final class GlideTrailOverlayView: UIView {
    private let trailLayer = CAShapeLayer()
    private var points: [CGPoint] = []

    var trailColor: UIColor = .systemBlue {
        didSet { trailLayer.strokeColor = trailColor.withAlphaComponent(0.72).cgColor }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        trailLayer.fillColor = UIColor.clear.cgColor
        trailLayer.lineWidth = 4.5
        trailLayer.lineCap = .round
        trailLayer.lineJoin = .round
        layer.addSublayer(trailLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func appendPoint(_ pt: CGPoint) {
        points.append(pt)
        rebuildPath()
    }

    func clearTrail() {
        points.removeAll()
        trailLayer.path = nil
    }

    private func rebuildPath() {
        guard points.count >= 2 else {
            trailLayer.path = nil
            return
        }
        let path = UIBezierPath()
        path.move(to: points[0])
        for i in 1..<points.count {
            let prev = points[i - 1]
            let curr = points[i]
            let mid = CGPoint(x: (prev.x + curr.x) * 0.5, y: (prev.y + curr.y) * 0.5)
            path.addQuadCurve(to: mid, controlPoint: prev)
        }
        if let last = points.last {
            path.addLine(to: last)
        }
        trailLayer.path = path.cgPath
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex >> 16) & 0xFF) / 255.0
        let g = CGFloat((hex >> 8) & 0xFF) / 255.0
        let b = CGFloat(hex & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
