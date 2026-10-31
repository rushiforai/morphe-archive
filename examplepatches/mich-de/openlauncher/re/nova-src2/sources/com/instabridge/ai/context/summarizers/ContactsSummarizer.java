package com.instabridge.ai.context.summarizers;

import b.c0;
import b70.c;
import b70.g;
import com.instabridge.ai.context.collectors.ContactEntry;
import com.instabridge.ai.context.collectors.RecentMessage;
import com.instabridge.ai.tools.PhoneNumberNormalizer;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ShortcutType;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0007\u0018\u0000 \r2\u00020\u0001:\u0001\rB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\t\u001a\u00020\u0005J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\bH\u0002¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/context/summarizers/ContactsSummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "contacts", b.f42142b, "Lcom/instabridge/ai/context/collectors/ContactEntry;", "syncDate", "isGarbageContact", b.f42142b, ShortcutType.CONTACT, k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ContactsSummarizer {
    public static final int $stable = 0;
    private static final int MAX_LOWER_TIER = 200;
    private static final int MAX_TOP_TIER = 100;

    private final boolean isGarbageContact(ContactEntry contact) {
        String string = r70.k.u1(contact.getName()).toString();
        for (int i5 = 0; i5 < string.length(); i5++) {
            char cCharAt = string.charAt(i5);
            if (!Character.isDigit(cCharAt) && !r70.k.L0("+- ()", cCharAt)) {
                return string.length() <= 2 && contact.getScore() == 0;
            }
        }
        return true;
    }

    @NotNull
    public final String summarize(@NotNull List<ContactEntry> contacts, @NotNull String syncDate) {
        String str;
        Intrinsics.g(contacts, "contacts");
        Intrinsics.g(syncDate, "syncDate");
        if (contacts.isEmpty()) {
            return c1.m(')', "No contacts (synced ", syncDate);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : contacts) {
            ContactEntry contactEntry = (ContactEntry) obj;
            if (!contactEntry.getPhoneNumbers().isEmpty() || !contactEntry.getEmails().isEmpty()) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (!isGarbageContact((ContactEntry) next)) {
                arrayList2.add(next);
            }
        }
        List listE1 = g.E1(arrayList2, 100);
        List listE12 = g.E1(g.Q0(arrayList2, 100), 200);
        List<ContactEntry> list = listE1;
        ArrayList arrayList3 = new ArrayList(c.u0(list, 10));
        for (ContactEntry contactEntry2 : list) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("- " + contactEntry2.getName());
            String nickname = contactEntry2.getNickname();
            if (nickname != null && !r70.k.U0(nickname)) {
                sb2.append(" (" + contactEntry2.getNickname() + ')');
            }
            sb2.append(" | score=" + contactEntry2.getScore());
            if (contactEntry2.getStarred()) {
                sb2.append(" | favorite");
            }
            ArrayList arrayList4 = new ArrayList();
            if (contactEntry2.getCallCount() > 0) {
                arrayList4.add(contactEntry2.getCallCount() + " calls");
            }
            if (contactEntry2.getSmsCount() > 0) {
                arrayList4.add(contactEntry2.getSmsCount() + " texts");
            }
            if (contactEntry2.getTimesContacted() > 0 && contactEntry2.getCallCount() == 0 && contactEntry2.getSmsCount() == 0) {
                arrayList4.add(contactEntry2.getTimesContacted() + "× contacted");
            }
            if (!arrayList4.isEmpty()) {
                sb2.append(" | " + g.f1(arrayList4, ", ", null, null, 0, null, 62));
            }
            if (!contactEntry2.getPhoneNumbers().isEmpty()) {
                sb2.append(" | phone: " + g.f1(contactEntry2.getPhoneNumbers(), ", ", null, null, 0, null, 62));
                String countryForNumber = PhoneNumberNormalizer.INSTANCE.getCountryForNumber((String) g.W0(contactEntry2.getPhoneNumbers()));
                if (countryForNumber != null) {
                    sb2.append(" | country: ".concat(countryForNumber));
                }
            }
            if (!contactEntry2.getEmails().isEmpty()) {
                sb2.append(" | email: " + g.f1(contactEntry2.getEmails(), ", ", null, null, 0, null, 62));
            }
            if (contactEntry2.getLastMessage() != null) {
                RecentMessage lastMessage = contactEntry2.getLastMessage();
                String str2 = lastMessage.isIncoming() ? "them" : "you";
                if (lastMessage.getHoursAgo() == 0) {
                    str = "just now";
                } else if (lastMessage.getHoursAgo() == 1) {
                    str = "1h ago";
                } else {
                    str = lastMessage.getHoursAgo() + "h ago";
                }
                StringBuilder sbW = c0.w(" | last_sms (", str2, ", ", str, "): \"");
                sbW.append(lastMessage.getSnippet());
                sbW.append(AbstractJsonLexerKt.STRING);
                sb2.append(sbW.toString());
            }
            arrayList3.add(sb2.toString());
        }
        List<ContactEntry> list2 = listE12;
        ArrayList arrayList5 = new ArrayList(c.u0(list2, 10));
        for (ContactEntry contactEntry3 : list2) {
            StringBuilder sb3 = new StringBuilder();
            StringBuilder sb4 = new StringBuilder("- ");
            ArrayList arrayList6 = arrayList2;
            sb4.append(contactEntry3.getName());
            sb3.append(sb4.toString());
            String nickname2 = contactEntry3.getNickname();
            if (nickname2 != null && !r70.k.U0(nickname2)) {
                sb3.append(" (" + contactEntry3.getNickname() + ')');
            }
            sb3.append(" | score=" + contactEntry3.getScore());
            if (!contactEntry3.getPhoneNumbers().isEmpty()) {
                sb3.append(" | phone: " + ((String) g.W0(contactEntry3.getPhoneNumbers())));
                String countryForNumber2 = PhoneNumberNormalizer.INSTANCE.getCountryForNumber((String) g.W0(contactEntry3.getPhoneNumbers()));
                if (countryForNumber2 != null) {
                    sb3.append(" | country: ".concat(countryForNumber2));
                }
            }
            arrayList5.add(sb3.toString());
            arrayList2 = arrayList6;
        }
        ArrayList arrayList7 = arrayList2;
        int size = listE12.size() + listE1.size();
        String str3 = arrayList7.size() > size ? "\n...and " + (arrayList7.size() - size) + " more" : b.f42142b;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("Contacts (synced " + syncDate + "):\n");
        sb5.append("Schema: name | score (0-100, higher=closer relationship) | favorite | interactions | phone | country | email | last_sms\nUse score to decide importance: higher score = closer relationship.\nIMPORTANT: Never mention 'favorite', 'score', or other metadata in responses. These are internal signals only.\n");
        sb5.append(g.f1(arrayList3, "\n", null, null, 0, null, 62));
        if (!arrayList5.isEmpty()) {
            sb5.append("\n--- Other contacts (name + phone only) ---\n");
            sb5.append(g.f1(arrayList5, "\n", null, null, 0, null, 62));
        }
        sb5.append(str3);
        return sb5.toString();
    }
}
