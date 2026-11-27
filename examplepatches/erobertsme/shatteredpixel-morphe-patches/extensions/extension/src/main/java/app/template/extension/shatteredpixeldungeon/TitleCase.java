package app.template.extension.shatteredpixeldungeon;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Button labels in Title Case: every word capitalized except short joining words in the middle.
 */
final class TitleCase {

	private static final Set<String> MINOR_WORDS = new HashSet<>(Arrays.asList(
		"a", "an", "the", "and", "but", "or", "nor", "for", "as", "at", "by", "in", "of", "on", "to", "via", "into", "onto", "from", "with"
	));

	private TitleCase() {
	}

	static String of(String text) {
		if (text == null || text.isEmpty()) return text;
		String[] words = text.split(" ", -1);
		int last = words.length - 1;
		while (last > 0 && words[last].isEmpty()) last--;
		StringBuilder result = new StringBuilder();
		for (int i = 0; i < words.length; i++) {
			if (i > 0) result.append(' ');
			String word = words[i];
			boolean minor = i > 0 && i < last && MINOR_WORDS.contains(word.toLowerCase(Locale.US));
			result.append(minor ? word.toLowerCase(Locale.US) : capitalize(word));
		}
		return result.toString();
	}

	private static String capitalize(String word) {
		for (int i = 0; i < word.length(); i++) {
			char c = word.charAt(i);
			if (!Character.isLetter(c)) continue;
			return word.substring(0, i) + Character.toUpperCase(c) + word.substring(i + 1);
		}
		return word;
	}
}
