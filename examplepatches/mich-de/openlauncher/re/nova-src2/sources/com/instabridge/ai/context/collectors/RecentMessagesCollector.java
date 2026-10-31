package com.instabridge.ai.context.collectors;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.provider.Telephony;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.tools.PhoneNumberNormalizer;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.l;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J(\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u00052\u0006\u0010\b\u001a\u00020\t2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00060\u000bJ\u001a\u0010\f\u001a\u0004\u0018\u00010\u00062\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u0006H\u0002¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/context/collectors/RecentMessagesCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, b.f42142b, "Lcom/instabridge/ai/context/collectors/RecentMessage;", "context", "Landroid/content/Context;", "contactNames", b.f42142b, "resolveContactName", "phoneNumber", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class RecentMessagesCollector {
    public static final int $stable = 0;

    private final String resolveContactName(Context context, String phoneNumber) throws IOException {
        try {
            Cursor cursorQuery = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(phoneNumber)), new String[]{"display_name"}, null, null, null);
            if (cursorQuery != null) {
                try {
                    String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                    cursorQuery.close();
                    return string;
                } finally {
                }
            }
        } catch (Exception unused) {
        }
        return null;
    }

    @NotNull
    public final Map<String, RecentMessage> collect(@NotNull Context context, @NotNull Set<String> contactNames) {
        String string;
        Intrinsics.g(context, "context");
        Intrinsics.g(contactNames, "contactNames");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        try {
            Cursor cursorQuery = context.getContentResolver().query(Telephony.Sms.CONTENT_URI, new String[]{PlaceTypes.ADDRESS, "body", TTConst.TRACK_TYPE, "date"}, "date > ?", new String[]{String.valueOf(System.currentTimeMillis() - 604800000)}, "date DESC");
            if (cursorQuery != null) {
                try {
                    LinkedHashSet linkedHashSet = new LinkedHashSet();
                    while (cursorQuery.moveToNext()) {
                        String string2 = cursorQuery.getString(0);
                        if (string2 != null && (string = cursorQuery.getString(1)) != null) {
                            int i5 = cursorQuery.getInt(2);
                            long j11 = cursorQuery.getLong(3);
                            String strNormalize = PhoneNumberNormalizer.INSTANCE.normalize(string2, context);
                            if (strNormalize.length() != 0) {
                                string2 = strNormalize;
                            }
                            String strResolveContactName = resolveContactName(context, string2);
                            if (strResolveContactName != null && contactNames.contains(strResolveContactName) && !linkedHashSet.contains(strResolveContactName)) {
                                linkedHashSet.add(strResolveContactName);
                                linkedHashMap.put(strResolveContactName, new RecentMessage(strResolveContactName, j.E0(l.G1(100, string), '\n', ' '), i5 == 1, (int) ((System.currentTimeMillis() - j11) / 3600000)));
                            }
                        }
                    }
                    Unit unit = Unit.f71706a;
                    cursorQuery.close();
                    return linkedHashMap;
                } finally {
                }
            }
        } catch (SecurityException | Exception unused) {
        }
        return linkedHashMap;
    }
}
