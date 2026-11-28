import SwiftUI

struct GboardProEmblemBadgeView: View {
    let size: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.27, style: .continuous)
                .fill(LinearGradient(colors: [Color(hex: 0xF4F5FC), Color(hex: 0xE3E6F4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(RoundedRectangle(cornerRadius: size * 0.27).stroke(Color.white, lineWidth: 1.5))
                .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 2)

            VStack(spacing: 4) {
                HStack(spacing: 3) {
                    ForEach(0..<4, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.85)).frame(width: size * 0.08, height: size * 0.08)
                    }
                }
                HStack(spacing: 3) {
                    RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.85)).frame(width: size * 0.08, height: size * 0.08)
                    RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.85)).frame(width: size * 0.22, height: size * 0.08)
                }
            }
            .frame(width: size * 0.66, height: size * 0.54)
            .background(
                RoundedRectangle(cornerRadius: size * 0.18, style: .continuous)
                    .fill(LinearGradient(colors: [Color(hex: 0x3E4F78), Color(hex: 0x283452)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .offset(x: size * 0.08, y: size * 0.10)

            ZStack {
                RoundedRectangle(cornerRadius: size * 0.14, style: .continuous)
                    .fill(LinearGradient(colors: [.white, Color(hex: 0xF1F4FE)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .shadow(color: Color.black.opacity(0.18), radius: 3, x: 0, y: 1.5)
                Text("G")
                    .font(.system(size: size * 0.30, weight: .heavy))
                    .foregroundColor(Color(hex: 0x4285F4))
            }
            .frame(width: size * 0.46, height: size * 0.46)
            .offset(x: -size * 0.12, y: -size * 0.12)
        }
        .frame(width: size, height: size)
    }
}
