package dev.srwi.gintype.extension.multiglide;

import java.text.Normalizer;

/**
 * Accent folding and German digraph expansion for MultiGlide Trie insertion.
 * Ported from Kinetica's AccentFolder.
 */
public final class MultiGlideAccentFolder {

    private MultiGlideAccentFolder() {}

    public static String fold(String word) {
        StringBuilder sb = new StringBuilder(word.length() + 2);
        for (int i = 0; i < word.length(); i++) {
            char c = Character.toLowerCase(word.charAt(i));
            if (c == 'æ') {
                sb.append("ae");
                continue;
            }
            if (c == 'œ') {
                sb.append("oe");
                continue;
            }
            char mapped = mapSingleChar(c);
            if (mapped != 0) {
                sb.append(mapped);
            } else {
                String nfd = Normalizer.normalize(String.valueOf(c), Normalizer.Form.NFD);
                char base = nfd.isEmpty() ? 0 : nfd.charAt(0);
                if (base >= 'a' && base <= 'z') {
                    sb.append(base);
                }
            }
        }
        return sb.toString();
    }

    /**
     * Returns true if {@code c} is a Latin letter (including accented letters and ligatures such
     * as {@code ñ, å, ø, æ, œ, ç, ş, ğ}) that folds to ASCII {@code a-z} via {@link #fold(String)}.
     */
    public static boolean isFoldableLatinLetter(char c) {
        char lower = Character.toLowerCase(c);
        if (lower >= 'a' && lower <= 'z') return true;
        if (lower == 'æ' || lower == 'œ') return true;
        if (mapSingleChar(lower) != 0) return true;
        String nfd = Normalizer.normalize(String.valueOf(lower), Normalizer.Form.NFD);
        char base = nfd.isEmpty() ? 0 : nfd.charAt(0);
        return base >= 'a' && base <= 'z';
    }

    public static String foldGermanDigraphs(String word, boolean hasdedicatedUmlautKeys) {
        StringBuilder sb = new StringBuilder(word.length() + 4);
        boolean changed = false;

        for (int i = 0; i < word.length(); i++) {
            char c = Character.toLowerCase(word.charAt(i));
            switch (c) {
                case 'ß':
                    sb.append("ss");
                    changed = true;
                    break;
                case 'ä':
                    if (!hasdedicatedUmlautKeys) {
                        sb.append("ae");
                        changed = true;
                    } else {
                        sb.append('a');
                    }
                    break;
                case 'ö':
                    if (!hasdedicatedUmlautKeys) {
                        sb.append("oe");
                        changed = true;
                    } else {
                        sb.append('o');
                    }
                    break;
                case 'ü':
                    if (!hasdedicatedUmlautKeys) {
                        sb.append("ue");
                        changed = true;
                    } else {
                        sb.append('u');
                    }
                    break;
                case 'æ':
                    sb.append("ae");
                    break;
                case 'œ':
                    sb.append("oe");
                    break;
                default:
                    char mapped = mapSingleChar(c);
                    if (mapped != 0) {
                        sb.append(mapped);
                    } else {
                        String nfd = Normalizer.normalize(String.valueOf(c), Normalizer.Form.NFD);
                        char base = nfd.isEmpty() ? 0 : nfd.charAt(0);
                        if (base >= 'a' && base <= 'z') {
                            sb.append(base);
                        }
                    }
                    break;
            }
        }

        return changed ? sb.toString() : null;
    }

    public static char mapSingleChar(char c) {
        if (c >= 'a' && c <= 'z') return c;
        switch (c) {
            case 'ä':
            case 'à':
            case 'á':
            case 'â':
            case 'ã':
            case 'å':
            case 'ā':
            case 'ă':
            case 'ą':
                return 'a';
            case 'ç':
            case 'ć':
            case 'č':
                return 'c';
            case 'ď':
            case 'đ':
            case 'ð':
                return 'd';
            case 'è':
            case 'é':
            case 'ê':
            case 'ë':
            case 'ē':
            case 'ĕ':
            case 'ė':
            case 'ę':
            case 'ě':
                return 'e';
            case 'ğ':
            case 'ģ':
                return 'g';
            case 'ì':
            case 'í':
            case 'î':
            case 'ï':
            case 'ī':
            case 'į':
            case 'ı':
                return 'i';
            case 'ķ':
                return 'k';
            case 'ł':
            case 'ĺ':
            case 'ļ':
            case 'ľ':
                return 'l';
            case 'ñ':
            case 'ń':
            case 'ņ':
            case 'ň':
                return 'n';
            case 'ö':
            case 'ò':
            case 'ó':
            case 'ô':
            case 'õ':
            case 'ø':
            case 'ō':
            case 'ő':
                return 'o';
            case 'ŕ':
            case 'ř':
                return 'r';
            case 'ß':
            case 'ś':
            case 'š':
            case 'ş':
            case 'ș':
                return 's';
            case 'ť':
            case 'ţ':
            case 'ț':
            case 'þ':
                return 't';
            case 'ü':
            case 'ù':
            case 'ú':
            case 'û':
            case 'ū':
            case 'ů':
            case 'ű':
            case 'ų':
                return 'u';
            case 'ý':
            case 'ÿ':
                return 'y';
            case 'ź':
            case 'ż':
            case 'ž':
                return 'z';
            default:
                return 0;
        }
    }
}
