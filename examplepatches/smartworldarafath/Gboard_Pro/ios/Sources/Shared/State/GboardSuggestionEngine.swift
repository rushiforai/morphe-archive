import Foundation

/// Lightweight predictive text & glide word matcher safe under iOS Keyboard Extension memory caps.
public enum GboardSuggestionEngine {
    private static let lexicon: [String] = [
        "the", "that", "there", "their", "they", "this", "these", "those", "thank", "thanks",
        "hello", "hey", "hi", "how", "have", "here", "help", "happy", "home", "good",
        "great", "gboard", "going", "goodness", "galaxy", "iphone", "ipad", "ios",
        "android", "awesome", "already", "always", "about", "amazing", "awesome",
        "what", "when", "where", "which", "who", "why", "will", "with", "would", "work",
        "working", "wonderful", "yes", "yeah", "you", "your", "yours", "today", "tomorrow",
        "tonight", "time", "take", "test", "testing", "keyboard", "liquid", "glass",
        "classic", "material", "dark", "amoled", "theme", "beta", "pro", "message",
        "please", "perfect", "okay", "sure", "nice", "cool", "bro", "love", "need", "make"
    ]

    public static func suggestions(for prefix: String) -> [String] {
        let clean = prefix.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !clean.isEmpty else {
            return ["I", "The", "Hello"]
        }
        let matches = lexicon.filter { $0.hasPrefix(clean) }
        var result: [String] = []
        if let first = matches.first, first != clean {
            result.append(prefix)
            result.append(contentsOf: matches.prefix(2))
        } else {
            result.append(prefix)
            result.append(contentsOf: matches.filter { $0 != clean }.prefix(2))
        }
        if result.count < 3 {
            let defaults = ["is", "and", "to"]
            for d in defaults where !result.contains(d) && result.count < 3 {
                result.append(d)
            }
        }
        return Array(result.prefix(3))
    }

    public static func matchGlideWord(swipedKeys: [String]) -> String? {
        guard let first = swipedKeys.first?.lowercased(),
              let last = swipedKeys.last?.lowercased(),
              swipedKeys.count >= 2 else {
            return swipedKeys.first
        }
        let keySet = Set(swipedKeys.map { $0.lowercased() })
        let candidates = lexicon.filter { word in
            guard let wf = word.first, let wl = word.last else { return false }
            return String(wf) == first && String(wl) == last
        }
        if let best = candidates.max(by: { a, b in
            let overlapA = Set(a.map { String($0) }).intersection(keySet).count
            let overlapB = Set(b.map { String($0) }).intersection(keySet).count
            return overlapA < overlapB
        }) {
            return best
        }
        return first
    }
}
