import SwiftUI
import UserNotifications

struct PermissionsSettingsView: View {
    let palette: GboardPalette
    @State private var notifStatusText = "Checking..."

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "IOS KEYBOARD & PERMISSIONS") {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Enable Gboard Pro Keyboard on iPhone / iPad")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(palette.textPrimary)
                            Text("Open iOS Settings -> General -> Keyboard -> Keyboards -> Add New Keyboard -> Gboard Pro -> Allow Full Access (for App Group theme & clipboard sync).")
                                .font(.system(size: 13.5))
                                .foregroundColor(palette.textSecondary)
                            Text("Notification Permission: \(notifStatusText)")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(palette.accent)
                            GboardPillButton(title: "Open iOS App Settings", systemImage: "gear", palette: palette) {
                                if let url = URL(string: UIApplication.openSettingsURLString) {
                                    UIApplication.shared.open(url)
                                }
                            }
                            .padding(.top, 4)
                        }
                        .padding(16)
                    }
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Permissions")
        .task {
            let settings = await UNUserNotificationCenter.current().notificationSettings()
            notifStatusText = settings.authorizationStatus == .authorized ? "Authorized" : "Not Authorized"
        }
    }
}
