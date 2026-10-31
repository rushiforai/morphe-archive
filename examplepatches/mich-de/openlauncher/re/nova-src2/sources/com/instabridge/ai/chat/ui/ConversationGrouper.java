package com.instabridge.ai.chat.ui;

import android.content.Context;
import com.instabridge.ai.chat.model.Conversation;
import com.instabridge.ai.chat.model.ConversationListItem;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J,\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u00052\b\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\f¨\u0006\r"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationGrouper;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "group", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/model/ConversationListItem;", "conversations", "Lcom/instabridge/ai/chat/model/Conversation;", "activeId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ConversationGrouper {
    public static final int $stable = 0;

    @NotNull
    public static final ConversationGrouper INSTANCE = new ConversationGrouper();

    private ConversationGrouper() {
    }

    private static final void group$addSection(List<ConversationListItem> list, String str, String str2, List<Conversation> list2) {
        if (list2.isEmpty()) {
            return;
        }
        list.add(new ConversationListItem.Header(str2));
        for (Conversation conversation : list2) {
            list.add(new ConversationListItem.ConversationRow(conversation, Intrinsics.b(conversation.getId(), str)));
        }
    }

    @NotNull
    public final List<ConversationListItem> group(@NotNull List<Conversation> conversations, @Nullable String activeId, @NotNull Context context) {
        Intrinsics.g(conversations, "conversations");
        Intrinsics.g(context, "context");
        if (conversations.isEmpty()) {
            return EmptyList.f71733a;
        }
        Calendar.getInstance();
        Calendar calendar = Calendar.getInstance();
        calendar.set(11, 0);
        calendar.set(12, 0);
        calendar.set(13, 0);
        calendar.set(14, 0);
        Object objClone = calendar.clone();
        Intrinsics.e(objClone, "null cannot be cast to non-null type java.util.Calendar");
        Calendar calendar2 = (Calendar) objClone;
        calendar2.add(6, -1);
        Object objClone2 = calendar.clone();
        Intrinsics.e(objClone2, "null cannot be cast to non-null type java.util.Calendar");
        Calendar calendar3 = (Calendar) objClone2;
        calendar3.add(6, -6);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        for (Conversation conversation : conversations) {
            Long lB = no.e.b(conversation.getUpdatedAt(), false);
            long jLongValue = lB != null ? lB.longValue() : 0L;
            if (jLongValue >= calendar.getTimeInMillis()) {
                arrayList.add(conversation);
            } else if (jLongValue >= calendar2.getTimeInMillis()) {
                arrayList2.add(conversation);
            } else if (jLongValue >= calendar3.getTimeInMillis()) {
                arrayList3.add(conversation);
            } else {
                arrayList4.add(conversation);
            }
        }
        ArrayList arrayList5 = new ArrayList();
        String string = context.getString(2132017391);
        Intrinsics.f(string, "getString(...)");
        group$addSection(arrayList5, activeId, string, arrayList);
        String string2 = context.getString(2132017392);
        Intrinsics.f(string2, "getString(...)");
        group$addSection(arrayList5, activeId, string2, arrayList2);
        String string3 = context.getString(2132017390);
        Intrinsics.f(string3, "getString(...)");
        group$addSection(arrayList5, activeId, string3, arrayList3);
        String string4 = context.getString(2132017389);
        Intrinsics.f(string4, "getString(...)");
        group$addSection(arrayList5, activeId, string4, arrayList4);
        return arrayList5;
    }
}
