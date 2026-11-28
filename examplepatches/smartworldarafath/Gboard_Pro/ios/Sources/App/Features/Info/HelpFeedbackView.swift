import SwiftUI

struct HelpFeedbackView: View {
    let palette: GboardPalette
    @State private var name = ""
    @State private var device = GboardSettingsStore.deviceModelSummary
    @State private var selectedCategory = 0
    @State private var message = ""
    @State private var showError = false

    private let categories = ["Feature request", "Bug report", "Feedback"]

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 14) {
                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("DETAILS")
                                .font(.system(size: 11.5, weight: .bold))
                                .tracking(0.8)
                                .foregroundColor(palette.accent)
                            Text("Name").font(.system(size: 13.5)).foregroundColor(palette.textSecondary)
                            TextField("Enter your name", text: $name)
                                .padding(11)
                                .background(RoundedRectangle(cornerRadius: 12).fill(palette.surfaceAlt))

                            Text("Device").font(.system(size: 13.5)).foregroundColor(palette.textSecondary)
                            TextField("Device model", text: $device)
                                .padding(11)
                                .background(RoundedRectangle(cornerRadius: 12).fill(palette.surfaceAlt))

                            Text("Type").font(.system(size: 13.5)).foregroundColor(palette.textSecondary)
                            ForEach(Array(categories.enumerated()), id: \.offset) { idx, cat in
                                let sel = (selectedCategory == idx)
                                Button {
                                    selectedCategory = idx
                                } label: {
                                    HStack(spacing: 10) {
                                        Image(systemName: sel ? "largecircle.fill.circle" : "circle")
                                            .foregroundColor(sel ? palette.accent : palette.textSecondary)
                                        Text(cat)
                                            .font(.system(size: 15.5, weight: sel ? .bold : .medium))
                                            .foregroundColor(sel ? palette.accent : palette.textPrimary)
                                        Spacer()
                                    }
                                    .padding(12)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(sel ? palette.accent.opacity(0.14) : palette.surfaceAlt))
                                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(sel ? palette.accent : palette.surfaceStroke, lineWidth: 1))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(18)
                    }

                    SettingsCardGroup(palette: palette) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("MESSAGE")
                                .font(.system(size: 11.5, weight: .bold))
                                .tracking(0.8)
                                .foregroundColor(palette.accent)
                            TextField("Write message .....", text: $message, axis: .vertical)
                                .lineLimit(5...10)
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 12).fill(palette.surfaceAlt))
                        }
                        .padding(18)
                    }

                    GboardPillButton(title: "Submit", systemImage: nil, palette: palette) {
                        submit()
                    }
                    .padding(.horizontal, 16)

                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Help & feedback")
        .alert("Missing Message", isPresented: $showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Please enter your message before submitting.")
        }
    }

    private func submit() {
        let msg = message.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !msg.isEmpty else {
            showError = true
            return
        }
        let body = "**Category:** \(categories[selectedCategory])\n**Name:** \(name.isEmpty ? "Anonymous" : name)\n**Device:** \(device)\n**Version:** v\(AppGroupConfig.patchVersion)\n\n\(msg)"
        UIPasteboard.general.string = body
        var comps = URLComponents(string: AppGroupConfig.githubIssuesNewURL)
        comps?.queryItems = [
            URLQueryItem(name: "title", value: "[\(categories[selectedCategory]) iOS] Feedback"),
            URLQueryItem(name: "body", value: body)
        ]
        if let url = comps?.url {
            UIApplication.shared.open(url)
        }
    }
}
