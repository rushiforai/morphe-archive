/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough)
*/

package app.morphe.extension.facebook.media;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import java.io.StringReader;
import java.net.URI;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilderFactory;

public final class DashManifestParser {
    private static final Pattern ADAPTATION_BLOCK = Pattern.compile(
            "(?is)<AdaptationSet\\b([^>]*)>(.*?)</AdaptationSet\\s*>"
    );
    private static final Pattern REPRESENTATION_BLOCK = Pattern.compile(
            "(?is)<Representation\\b([^>]*)>(.*?)</Representation\\s*>"
    );
    private static final Pattern ATTRIBUTE = Pattern.compile(
            "(?is)\\b([A-Za-z][A-Za-z0-9_]*)\\s*=\\s*([\"'])(.*?)\\2"
    );
    private static final Pattern BASE_URL = Pattern.compile(
            "(?is)<BaseURL\\b[^>]*>(.*?)</BaseURL\\s*>"
    );
    private DashManifestParser() {
    }

    public static List<MediaVariant> parse(String manifest) {
        if (manifest == null || manifest.trim().isEmpty()) {
            return Collections.emptyList();
        }
        String normalized = normalizeXml(manifest);
        try {
            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            factory.setXIncludeAware(false);
            factory.setExpandEntityReferences(false);
            setFeature(
                    factory,
                    "http://apache.org/xml/features/disallow-doctype-decl",
                    true
            );
            setFeature(
                    factory,
                    "http://xml.org/sax/features/external-general-entities",
                    false
            );
            setFeature(
                    factory,
                    "http://xml.org/sax/features/external-parameter-entities",
                    false
            );

            Document document = factory.newDocumentBuilder().parse(
                    new InputSource(new StringReader(normalized))
            );
            Element root = document.getDocumentElement();
            String manifestBase = childText(root, "BaseURL");
            String manifestId = manifestId(normalized);
            ArrayList<MediaVariant> variants = new ArrayList<>();
            NodeList adaptationSets =
                    document.getElementsByTagNameNS("*", "AdaptationSet");
            for (int index = 0; index < adaptationSets.getLength(); index++) {
                Element adaptation = (Element) adaptationSets.item(index);
                parseAdaptationSet(
                        adaptation,
                        manifestBase,
                        manifestId,
                        variants
                );
            }
            return variants.isEmpty()
                    ? parseRegex(normalized)
                    : Collections.unmodifiableList(variants);
        } catch (Throwable ignored) {
            return parseRegex(normalized);
        }
    }

    public static List<MediaVariant> parseFast(String manifest) {
        if (manifest == null || manifest.trim().isEmpty()) {
            return Collections.emptyList();
        }
        return parseRegex(normalizeXml(manifest));
    }

    private static List<MediaVariant> parseRegex(String value) {
        String normalized = normalizeXml(value);
        String manifestId = manifestId(normalized);
        ArrayList<MediaVariant> output = new ArrayList<>();
        Matcher adaptations = ADAPTATION_BLOCK.matcher(normalized);
        while (adaptations.find()) {
            String adaptationAttrs = adaptations.group(1);
            String adaptationBody = adaptations.group(2);
            Matcher representations =
                    REPRESENTATION_BLOCK.matcher(adaptationBody);
            while (representations.find()) {
                String representationAttrs = representations.group(1);
                String body = representations.group(2);
                String mime = firstNonEmpty(
                        attributeValue(representationAttrs, "mimeType"),
                        attributeValue(adaptationAttrs, "mimeType")
                );
                String content = firstNonEmpty(
                        attributeValue(representationAttrs, "contentType"),
                        attributeValue(adaptationAttrs, "contentType")
                );
                String codecs = firstNonEmpty(
                        attributeValue(representationAttrs, "codecs"),
                        attributeValue(adaptationAttrs, "codecs")
                );
                MediaVariant.Kind kind = kind(content, mime, codecs);
                if (kind == null) continue;
                Matcher base = BASE_URL.matcher(body);
                if (!base.find()) {
                    base = BASE_URL.matcher(adaptationBody);
                    if (!base.find()) continue;
                }
                String url = base.group(1)
                        .replace("&amp;", "&")
                        .trim();
                if (url.isEmpty()) continue;
                output.add(new MediaVariant(
                        kind,
                        url,
                        intValue(attributeValue(
                                representationAttrs,
                                "width"
                        )),
                        intValue(attributeValue(
                                representationAttrs,
                                "height"
                        )),
                        longValue(attributeValue(
                                representationAttrs,
                                "bandwidth"
                        )),
                        mime,
                        codecs,
                        attributeValue(
                                representationAttrs,
                                "id"
                        ),
                        manifestId,
                        "dash_regex",
                        false
                ));
            }
        }
        return output.isEmpty()
                ? Collections.emptyList()
                : Collections.unmodifiableList(output);
    }

    private static String attributeValue(
            String attributes,
            String wanted
    ) {
        Matcher matcher = ATTRIBUTE.matcher(attributes == null ? "" : attributes);
        while (matcher.find()) {
            if (wanted.equalsIgnoreCase(matcher.group(1))) {
                return matcher.group(3).trim();
            }
        }
        return "";
    }

    private static int intValue(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static long longValue(String value) {
        try {
            return Long.parseLong(value);
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    private static void parseAdaptationSet(
            Element adaptation,
            String manifestBase,
            String manifestId,
            List<MediaVariant> output
    ) {
        String adaptationBase = resolveUrl(
                manifestBase,
                childText(adaptation, "BaseURL")
        );
        String adaptationMime = attribute(adaptation, "mimeType");
        String adaptationContent = attribute(adaptation, "contentType");
        String adaptationCodecs = attribute(adaptation, "codecs");

        for (Element representation : childElements(
                adaptation,
                "Representation"
        )) {
            String mimeType = firstNonEmpty(
                    attribute(representation, "mimeType"),
                    adaptationMime
            );
            String contentType = firstNonEmpty(
                    attribute(representation, "contentType"),
                    adaptationContent
            );
            String codecs = firstNonEmpty(
                    attribute(representation, "codecs"),
                    adaptationCodecs
            );
            MediaVariant.Kind kind = kind(contentType, mimeType, codecs);
            if (kind == null) continue;

            String url = resolveUrl(
                    adaptationBase,
                    childText(representation, "BaseURL")
            );
            if (url == null || url.isEmpty()) continue;

            output.add(new MediaVariant(
                    kind,
                    url,
                    intAttribute(representation, "width"),
                    intAttribute(representation, "height"),
                    longAttribute(representation, "bandwidth"),
                    mimeType,
                    codecs,
                    attribute(representation, "id"),
                    manifestId,
                    hasDirectChild(representation, "SegmentBase")
                            ? "dash_segment_base"
                            : "dash_base_url",
                    false
            ));
        }
    }

    private static MediaVariant.Kind kind(
            String contentType,
            String mimeType,
            String codecs
    ) {
        String value = (
                emptyIfNull(contentType) + ' ' +
                        emptyIfNull(mimeType) + ' ' +
                        emptyIfNull(codecs)
        ).toLowerCase(Locale.US);
        if (value.contains("audio") ||
                value.contains("mp4a") ||
                value.contains("opus")) {
            return MediaVariant.Kind.DASH_AUDIO;
        }
        if (value.contains("video") ||
                value.contains("avc") ||
                value.contains("av01") ||
                value.contains("vp09") ||
                value.contains("hev1") ||
                value.contains("hvc1")) {
            return MediaVariant.Kind.DASH_VIDEO;
        }
        return null;
    }

    private static List<Element> childElements(
            Element owner,
            String localName
    ) {
        ArrayList<Element> result = new ArrayList<>();
        NodeList children = owner.getChildNodes();
        for (int index = 0; index < children.getLength(); index++) {
            Node child = children.item(index);
            if (child instanceof Element &&
                    localName.equals(localName(child))) {
                result.add((Element) child);
            }
        }
        return result;
    }

    private static String childText(Element owner, String localName) {
        for (Element child : childElements(owner, localName)) {
            String value = child.getTextContent();
            if (value != null && !value.trim().isEmpty()) {
                return value.trim();
            }
        }
        return null;
    }

    private static boolean hasDirectChild(
            Element owner,
            String localName
    ) {
        return !childElements(owner, localName).isEmpty();
    }

    private static String localName(Node node) {
        String localName = node.getLocalName();
        if (localName != null) return localName;
        String nodeName = node.getNodeName();
        int colon = nodeName.indexOf(':');
        return colon >= 0 ? nodeName.substring(colon + 1) : nodeName;
    }

    private static String attribute(Element element, String name) {
        String value = element.getAttribute(name);
        return value == null ? "" : value.trim();
    }

    private static int intAttribute(Element element, String name) {
        try {
            return Integer.parseInt(attribute(element, name));
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static long longAttribute(Element element, String name) {
        try {
            return Long.parseLong(attribute(element, name));
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static String resolveUrl(String parent, String child) {
        String base = emptyToNull(parent);
        String value = emptyToNull(child);
        if (value == null) return base;
        try {
            URI childUri = URI.create(value);
            if (childUri.isAbsolute() || base == null) return value;
            return URI.create(base).resolve(childUri).toString();
        } catch (Throwable ignored) {
            return value;
        }
    }

    private static String normalizeXml(String value) {
        String normalized = value.trim();
        String slash = "\\";
        normalized = normalized
                .replace(slash + "u003C", "<")
                .replace(slash + "u003c", "<")
                .replace(slash + "u003E", ">")
                .replace(slash + "u003e", ">")
                .replace(slash + "u0026", "&")
                .replace(slash + "u0022", "\"")
                .replace(slash + "u0027", "'")
                .replace(slash + "/", "/")
                .replace("\\\"", "\"")
                .replace("\\\\", "\\");
        if (!normalized.contains("<MPD") &&
                normalized.contains("&lt;MPD")) {
            normalized = normalized
                    .replace("&lt;", "<")
                    .replace("&gt;", ">")
                    .replace("&quot;", "\"")
                    .replace("&#39;", "'")
                    .replace("&amp;", "&");
        }
        int start = normalized.indexOf("<MPD");
        if (start < 0) start = normalized.indexOf("<mpd");
        if (start > 0) normalized = normalized.substring(start);
        int end = normalized.lastIndexOf("</MPD>");
        if (end < 0) end = normalized.lastIndexOf("</mpd>");
        if (end >= 0) normalized = normalized.substring(0, end + 6);
        return normalized;
    }

    private static String manifestId(String value) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(value.getBytes("UTF-8"));
            StringBuilder result = new StringBuilder(24);
            for (int index = 0; index < 12; index++) {
                result.append(String.format(Locale.US, "%02x", hash[index]));
            }
            return result.toString();
        } catch (Throwable ignored) {
            return Integer.toHexString(value.hashCode()) + '-' + value.length();
        }
    }

    private static void setFeature(
            DocumentBuilderFactory factory,
            String name,
            boolean value
    ) {
        try {
            factory.setFeature(name, value);
        } catch (Throwable ignored) {
        }
    }

    private static String firstNonEmpty(String... values) {
        for (String value : values) {
            if (value != null && !value.isEmpty()) return value;
        }
        return "";
    }

    private static String emptyIfNull(String value) {
        return value == null ? "" : value;
    }

    private static String emptyToNull(String value) {
        return value == null || value.isEmpty() ? null : value;
    }
}
