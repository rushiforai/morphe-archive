import SwiftUI

@main
struct GboardProApp: App {
    @StateObject private var store = GboardSettingsStore.shared
    @Environment(\.colorScheme) private var systemColorScheme

    var body: some Scene {
        WindowGroup {
            RootSettingsView()
                .environmentObject(store)
                .preferredColorScheme(store.amoledBlackEnabled ? .dark : nil)
        }
    }
}

enum SettingsRoute: Hashable {
    case languages
    case preferences
    case theme
    case corrections
    case glideTyping
    case voiceTyping
    case emojiAndClipboard
    case pro
    case amoled
    case advanced
    case additional
    case chooseUI
    case notifications
    case permissions
    case reset
    case betaProgram
    case betaTesting
    case newBetaFeatures
    case updates
    case about
    case helpFeedback
    case liveSandbox
}

struct RootSettingsView: View {
    @EnvironmentObject private var store: GboardSettingsStore
    @Environment(\.colorScheme) private var colorScheme
    @State private var path: [SettingsRoute] = []

    var palette: GboardPalette {
        GboardPalette.resolve(
            style: store.uiStyleMode,
            theme: store.selectedTheme,
            isDark: colorScheme == .dark || store.amoledBlackEnabled,
            isAmoled: store.amoledBlackEnabled
        )
    }

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                palette.windowBackground.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Gboard Pro Settings")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(palette.textPrimary)
                            Spacer()
                            Button {
                                path.append(.liveSandbox)
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: "keyboard")
                                    Text("Preview")
                                }
                                .font(.system(size: 13.5, weight: .semibold))
                                .foregroundColor(palette.accent)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Capsule().fill(palette.surfaceAlt))
                                .overlay(Capsule().stroke(palette.surfaceStroke, lineWidth: 1))
                            }
                            .accessibilityIdentifier("btn_preview_keyboard")
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)

                        SettingsCardGroup(palette: palette) {
                            SettingsNavRow(
                                title: "Languages",
                                summary: store.enabledLanguageCodes.map { LanguageCatalog.item(for: $0).displayName }.joined(separator: ", "),
                                icon: "globe",
                                palette: palette
                            ) { path.append(.languages) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Preferences",
                                summary: "Number row, haptics, key popup & height",
                                icon: "slider.horizontal.3",
                                palette: palette
                            ) { path.append(.preferences) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Theme",
                                summary: "\(store.selectedTheme.title) • \(store.uiStyleMode.displayTitle)",
                                icon: "paintpalette",
                                palette: palette
                            ) { path.append(.theme) }
                        }

                        SettingsCardGroup(palette: palette) {
                            SettingsNavRow(
                                title: "Corrections & suggestions",
                                summary: "Auto-correction, strip & smart punctuation",
                                icon: "textformat.abc.dottedunderline",
                                palette: palette
                            ) { path.append(.corrections) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Glide typing",
                                summary: store.glideTypingEnabled ? "Enabled with gesture trail" : "Disabled",
                                icon: "scribble.variable",
                                palette: palette
                            ) { path.append(.glideTyping) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Voice typing",
                                summary: "System & iOS Dictation tools",
                                icon: "mic",
                                palette: palette
                            ) { path.append(.voiceTyping) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Emojis, stickers & clipboard",
                                summary: "Emoji grid, flags & local clipboard manager",
                                icon: "face.smiling",
                                palette: palette
                            ) { path.append(.emojiAndClipboard) }
                        }

                        SettingsCardGroup(palette: palette) {
                            SettingsNavRow(
                                title: "Pro",
                                summary: "Amoled Pure Black & Advanced customizations",
                                icon: "sparkles",
                                palette: palette
                            ) { path.append(.pro) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Additional",
                                summary: "Choose UI, Notification, Permissions, Reset & Beta Program",
                                icon: "square.grid.2x2",
                                palette: palette
                            ) { path.append(.additional) }
                        }

                        SettingsCardGroup(palette: palette) {
                            SettingsNavRow(
                                title: "Gboard Pro Updates",
                                summary: "Check GitHub releases & changelogs",
                                icon: "arrow.down.circle",
                                palette: palette
                            ) { path.append(.updates) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "About",
                                summary: "Gboard Pro v\(AppGroupConfig.patchVersion)",
                                icon: "info.circle",
                                palette: palette
                            ) { path.append(.about) }

                            CardDivider(palette: palette)

                            SettingsNavRow(
                                title: "Help & feedback",
                                summary: "Send bug reports or feature requests",
                                icon: "questionmark.bubble",
                                palette: palette
                            ) { path.append(.helpFeedback) }
                        }

                        FooterWatermarkView(palette: palette)
                    }
                    .frame(maxWidth: 680)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 24)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: SettingsRoute.self) { route in
                destinationView(for: route)
            }
        }
        .animation(.spring(response: 0.34, dampingFraction: 0.86), value: store.uiStyleMode)
        .animation(.easeInOut(duration: 0.25), value: store.amoledBlackEnabled)
    }

    @ViewBuilder
    private func destinationView(for route: SettingsRoute) -> some View {
        switch route {
        case .languages:
            LanguagesSettingsView(palette: palette)
        case .preferences:
            PreferencesSettingsView(palette: palette)
        case .theme:
            ThemeSettingsView(palette: palette, openSandbox: { path.append(.liveSandbox) })
        case .corrections:
            CorrectionsSettingsView(palette: palette)
        case .glideTyping:
            GlideTypingSettingsView(palette: palette)
        case .voiceTyping:
            VoiceTypingSettingsView(palette: palette)
        case .emojiAndClipboard:
            EmojiAndClipboardSettingsView(palette: palette)
        case .pro:
            ProSettingsView(palette: palette, navigate: { path.append($0) })
        case .amoled:
            AmoledSettingsView(palette: palette)
        case .advanced:
            AdvancedSettingsView(palette: palette)
        case .additional:
            AdditionalHubView(palette: palette, navigate: { path.append($0) })
        case .chooseUI:
            ChooseUiSettingsView(palette: palette)
        case .notifications:
            NotificationSettingsView(palette: palette)
        case .permissions:
            PermissionsSettingsView(palette: palette)
        case .reset:
            ResetSettingsView(palette: palette)
        case .betaProgram:
            BetaProgramHubView(palette: palette, navigate: { path.append($0) })
        case .betaTesting:
            BetaVersionTestingView(palette: palette)
        case .newBetaFeatures:
            NewBetaFeaturesView(palette: palette)
        case .updates:
            AboutOrUpdatesView(palette: palette, isUpdatesScreen: true)
        case .about:
            AboutOrUpdatesView(palette: palette, isUpdatesScreen: false)
        case .helpFeedback:
            HelpFeedbackView(palette: palette)
        case .liveSandbox:
            LiveKeyboardSandboxView(palette: palette)
        }
    }
}
