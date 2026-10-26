/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.contacts;
import java.util.ArrayList;
import java.util.LinkedHashSet;

/** Presentation copies only. Version-specific accessors are bound by the patch. */
public final class MergedFields {
    public static ArrayList emailsOf(Object contact) { throw new IllegalStateException("Missing contacts email binding"); }
    public static String notesOf(Object contact) { throw new IllegalStateException("Missing contacts note binding"); }
    public static ArrayList emails(ArrayList current, ArrayList duplicates) {
        LinkedHashSet<Object> result = new LinkedHashSet<>(current);
        for (Object contact : duplicates) result.addAll(emailsOf(contact));
        return new ArrayList<>(result);
    }
    public static String notes(String current, ArrayList duplicates) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (!current.isEmpty()) result.add(current);
        for (Object contact : duplicates) {
            String note = notesOf(contact);
            if (!note.isEmpty()) result.add(note);
        }
        return String.join("\n\n", result);
    }
}
