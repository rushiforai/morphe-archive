import SwiftUI
import UserNotifications

struct NotificationSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    let palette: GboardPalette

    var body: some View {
        ZStack {
            palette.windowBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    SettingsCardGroup(palette: palette, title: "NOTIFICATION PREFERENCES") {
                        SettingsToggleRow(
                            title: "App Update Notifications",
                            summary: store.notifyAppUpdatesAlert
                                ? "ON: Standard alert notification when a new app update releases"
                                : "OFF: Silent notification arrives quietly without sound or banner",
                            icon: "bell.badge",
                            palette: palette,
                            isOn: Binding(
                                get: { store.notifyAppUpdatesAlert },
                                set: { newValue in
                                    store.notifyAppUpdatesAlert = newValue
                                    if newValue { requestNotificationAuth() }
                                }
                            )
                        )
                        CardDivider(palette: palette)
                        SettingsToggleRow(
                            title: "Beta Testing APK Notifications",
                            summary: store.notifyBetaApkAlert
                                ? "ON: Standard alert notification when a new beta testing build releases"
                                : "OFF: Silent notification arrives quietly for new beta builds",
                            icon: "bell",
                            palette: palette,
                            isOn: Binding(
                                get: { store.notifyBetaApkAlert },
                                set: { newValue in
                                    store.notifyBetaApkAlert = newValue
                                    if newValue { requestNotificationAuth() }
                                }
                            )
                        )
                        CardDivider(palette: palette)
                        SettingsToggleRow(
                            title: "Beta Features Notifications",
                            summary: store.notifyBetaFeatures
                                ? "ON: Notify when new features are added to New features (Beta)"
                                : "OFF: Do not notify about new experimental beta features",
                            icon: "sparkles",
                            palette: palette,
                            isOn: Binding(
                                get: { store.notifyBetaFeatures },
                                set: { newValue in
                                    store.notifyBetaFeatures = newValue
                                    if newValue { requestNotificationAuth() }
                                }
                            )
                        )
                    }
                    FooterWatermarkView(palette: palette)
                }
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
        .navigationTitle("Notification")
    }

    private func requestNotificationAuth() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
}
