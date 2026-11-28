import Foundation

public struct KeyboardLanguageItem: Identifiable, Hashable, Codable {
    public let code: String
    public let displayName: String
    public let nativeName: String
    public let layoutLabel: String
    public let isSuggested: Bool
    public let rows: [[String]]

    public var id: String { code }
}

public enum LanguageCatalog {
    public static let allLanguages: [KeyboardLanguageItem] = [
        KeyboardLanguageItem(
            code: "en-US",
            displayName: "English (US)",
            nativeName: "QWERTY",
            layoutLabel: "English",
            isSuggested: true,
            rows: [
                ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
                ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
                ["z", "x", "c", "v", "b", "n", "m"]
            ]
        ),
        KeyboardLanguageItem(
            code: "bn-BD",
            displayName: "বাংলা (বাংলাদেশ)",
            nativeName: "বাংলা (Avro / Phonetic)",
            layoutLabel: "বাংলা",
            isSuggested: true,
            rows: [
                ["া", "ি", "ু", "ে", "ো", "ক", "খ", "গ", "ঘ", "প"],
                ["অ", "আ", "ই", "উ", "এ", "চ", "জ", "ত", "দ"],
                ["ন", "ম", "ব", "য", "র", "ল", "স"]
            ]
        ),
        KeyboardLanguageItem(
            code: "ko-KR",
            displayName: "한국어",
            nativeName: "두벌식",
            layoutLabel: "한국어",
            isSuggested: true,
            rows: [
                ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ", "ㅛ", "ㅕ", "ㅑ", "ㅐ", "ㅔ"],
                ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ", "ㅗ", "ㅓ", "ㅏ", "ㅣ"],
                ["ㅋ", "ㅌ", "ㅊ", "ㅍ", "ㅠ", "ㅜ", "ㅡ"]
            ]
        ),
        KeyboardLanguageItem(
            code: "ar",
            displayName: "العربية",
            nativeName: "Arabic",
            layoutLabel: "العربية",
            isSuggested: false,
            rows: [
                ["ض", "ص", "ث", "ق", "ف", "غ", "ع", "ه", "خ", "ح"],
                ["ش", "س", "ي", "ب", "ل", "ا", "ت", "ن", "م"],
                ["ئ", "ء", "ؤ", "ر", "لا", "ى", "ة"]
            ]
        ),
        KeyboardLanguageItem(
            code: "hi-IN",
            displayName: "हिन्दी",
            nativeName: "Hindi (Devanagari)",
            layoutLabel: "हिन्दी",
            isSuggested: false,
            rows: [
                ["ॉ", "ो", "े", "अ", "इ", "उ", "फ", "र", "क", "त"],
                ["ा", "ी", "ू", "ब", "ह", "ग", "द", "ज", "ड"],
                ["ो", "ए", "म", "न", "व", "ल", "स"]
            ]
        ),
        KeyboardLanguageItem(
            code: "es-ES",
            displayName: "Español",
            nativeName: "QWERTY",
            layoutLabel: "Español",
            isSuggested: false,
            rows: [
                ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
                ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ"],
                ["z", "x", "c", "v", "b", "n", "m"]
            ]
        ),
        KeyboardLanguageItem(
            code: "fr-FR",
            displayName: "Français",
            nativeName: "AZERTY",
            layoutLabel: "Français",
            isSuggested: false,
            rows: [
                ["a", "z", "e", "r", "t", "y", "u", "i", "o", "p"],
                ["q", "s", "d", "f", "g", "h", "j", "k", "l", "m"],
                ["w", "x", "c", "v", "b", "n", "é"]
            ]
        ),
        KeyboardLanguageItem(
            code: "de-DE",
            displayName: "Deutsch",
            nativeName: "QWERTZ",
            layoutLabel: "Deutsch",
            isSuggested: false,
            rows: [
                ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p"],
                ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ü"],
                ["y", "x", "c", "v", "b", "n", "m"]
            ]
        )
    ]

    public static let numberRow: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

    public static let symbolRows: [[String]] = [
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["@", "#", "$", "_", "&", "-", "+", "(", ")", "/"],
        ["*", "\"", "'", ":", ";", "!", "?"]
    ]

    public static let emojiGrid: [String] = [
        "😀", "😃", "😄", "😁", "😅", "😂", "🤣", "😊", "😇", "🙂", "😉", "😌",
        "😍", "🥰", "😘", "😋", "😜", "🤪", "😎", "🤩", "🥳", "😏", "😒", "😞",
        "😔", "😟", "😕", "🙁", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤",
        "😠", "😡", "🤬", "🤯", "😳", "🥵", "🥶", "😱", "😨", "😰", "🤗", "🤔",
        "👍", "👎", "👏", "🙌", "🤝", "🙏", "✌️", "🤞", "🤟", "🤘", "👌", "🤏",
        "❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🔥", "✨", "🎉", "💯",
        "🇧🇩", "🇺🇸", "🇬🇧", "🇮🇳", "🇰🇷", "🇯🇵", "🇸🇦", "🇨🇦", "🇦🇺", "🇩🇪", "🇫🇷", "🇧🇷"
    ]

    public static func item(for code: String) -> KeyboardLanguageItem {
        allLanguages.first { $0.code == code } ?? allLanguages[0]
    }
}
