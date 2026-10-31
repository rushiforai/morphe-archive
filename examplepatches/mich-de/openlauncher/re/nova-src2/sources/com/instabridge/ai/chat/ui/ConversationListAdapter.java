package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.text.format.DateUtils;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.b1;
import androidx.recyclerview.widget.s2;
import com.instabridge.ai.chat.model.Conversation;
import com.instabridge.ai.chat.model.ConversationListItem;
import com.instabridge.ai.chat.ui.ConversationListAdapter;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0004\u001f !\u001eB\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0017\u0010\b\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\r\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0011\u0010\u0012R0\u0010\u0015\u001a\u0010\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u00138\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR0\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u00138\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u001b\u0010\u0016\u001a\u0004\b\u001c\u0010\u0018\"\u0004\b\u001d\u0010\u001a¨\u0006\""}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationListAdapter;", "Landroidx/recyclerview/widget/b1;", "Lcom/instabridge/ai/chat/model/ConversationListItem;", "Landroidx/recyclerview/widget/s2;", "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "position", "getItemViewType", "(I)I", "Landroid/view/ViewGroup;", "parent", "viewType", "onCreateViewHolder", "(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/s2;", "holder", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onBindViewHolder", "(Landroidx/recyclerview/widget/s2;I)V", "Lkotlin/Function1;", "Lcom/instabridge/ai/chat/model/Conversation;", "onConversationClick", "Lkotlin/jvm/functions/Function1;", "getOnConversationClick", "()Lkotlin/jvm/functions/Function1;", "setOnConversationClick", "(Lkotlin/jvm/functions/Function1;)V", "onConversationLongClick", "getOnConversationLongClick", "setOnConversationLongClick", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "HeaderViewHolder", "ConversationViewHolder", "ItemDiffCallback", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ConversationListAdapter extends b1 {
    public static final int VIEW_TYPE_CONVERSATION = 1;
    public static final int VIEW_TYPE_HEADER = 0;

    @Nullable
    private Function1<? super Conversation, Unit> onConversationClick;

    @Nullable
    private Function1<? super Conversation, Unit> onConversationLongClick;
    public static final int $stable = 8;

    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\t\u0010\nJ\u0015\u0010\u000e\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fR\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u00108\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010\u0012¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationListAdapter$ConversationViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "view", "<init>", "(Lcom/instabridge/ai/chat/ui/ConversationListAdapter;Landroid/view/View;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iso", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "formatRelativeTime", "(Ljava/lang/String;)Ljava/lang/CharSequence;", "Lcom/instabridge/ai/chat/model/ConversationListItem$ConversationRow;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ConversationListItem$ConversationRow;)V", "Landroid/widget/TextView;", "titleText", "Landroid/widget/TextView;", "getTitleText", "()Landroid/widget/TextView;", "timestampText", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public final class ConversationViewHolder extends s2 {
        final /* synthetic */ ConversationListAdapter this$0;

        @NotNull
        private final TextView timestampText;

        @NotNull
        private final TextView titleText;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ConversationViewHolder(@NotNull ConversationListAdapter conversationListAdapter, View view) {
            super(view);
            Intrinsics.g(view, "view");
            this.this$0 = conversationListAdapter;
            View viewFindViewById = view.findViewById(2131427770);
            Intrinsics.f(viewFindViewById, "findViewById(...)");
            this.titleText = (TextView) viewFindViewById;
            View viewFindViewById2 = view.findViewById(2131427769);
            Intrinsics.f(viewFindViewById2, "findViewById(...)");
            this.timestampText = (TextView) viewFindViewById2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void bind$lambda$1(ConversationListAdapter conversationListAdapter, Conversation conversation, View view) {
            Function1<Conversation, Unit> onConversationClick = conversationListAdapter.getOnConversationClick();
            if (onConversationClick != null) {
                onConversationClick.invoke(conversation);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final boolean bind$lambda$2(ConversationListAdapter conversationListAdapter, Conversation conversation, View view) {
            Function1<Conversation, Unit> onConversationLongClick = conversationListAdapter.getOnConversationLongClick();
            if (onConversationLongClick == null) {
                return true;
            }
            onConversationLongClick.invoke(conversation);
            return true;
        }

        private final CharSequence formatRelativeTime(String iso) {
            if (r70.k.U0(iso)) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            try {
                Long lB = no.e.b(iso, false);
                if (lB != null) {
                    CharSequence relativeTimeSpanString = DateUtils.getRelativeTimeSpanString(lB.longValue(), System.currentTimeMillis(), 60000L, SQLiteDatabase.OPEN_PRIVATECACHE);
                    Intrinsics.d(relativeTimeSpanString);
                    return relativeTimeSpanString;
                }
            } catch (Exception unused) {
            }
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }

        /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final void bind(@NotNull ConversationListItem.ConversationRow item) {
            Intrinsics.g(item, "item");
            final Conversation conversation = item.getConversation();
            Context context = this.itemView.getContext();
            TextView textView = this.titleText;
            String title = conversation.getTitle();
            if (title == null) {
                title = context.getString(2132017297);
                Intrinsics.f(title, "getString(...)");
            } else {
                if (r70.k.U0(title)) {
                    title = null;
                }
                if (title == null) {
                }
            }
            textView.setText(title);
            this.timestampText.setText(formatRelativeTime(conversation.getUpdatedAt()));
            if (item.isActive()) {
                this.titleText.setTextColor(context.getColor(2131099741));
                this.itemView.setBackgroundColor(context.getColor(2131099698));
            } else {
                this.titleText.setTextColor(context.getColor(2131099741));
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16843534, typedValue, true);
                this.itemView.setBackgroundResource(typedValue.resourceId);
            }
            this.itemView.setOnClickListener(new z(4, this.this$0, conversation));
            View view = this.itemView;
            final ConversationListAdapter conversationListAdapter = this.this$0;
            view.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.instabridge.ai.chat.ui.o0
                @Override // android.view.View.OnLongClickListener
                public final boolean onLongClick(View view2) {
                    return ConversationListAdapter.ConversationViewHolder.bind$lambda$2(conversationListAdapter, conversation, view2);
                }
            });
        }

        @NotNull
        public final TextView getTitleText() {
            return this.titleText;
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationListAdapter$HeaderViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "view", "<init>", "(Lcom/instabridge/ai/chat/ui/ConversationListAdapter;Landroid/view/View;)V", "Lcom/instabridge/ai/chat/model/ConversationListItem$Header;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ConversationListItem$Header;)V", "Landroid/widget/TextView;", "label", "Landroid/widget/TextView;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public final class HeaderViewHolder extends s2 {

        @NotNull
        private final TextView label;
        final /* synthetic */ ConversationListAdapter this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public HeaderViewHolder(@NotNull ConversationListAdapter conversationListAdapter, View view) {
            super(view);
            Intrinsics.g(view, "view");
            this.this$0 = conversationListAdapter;
            View viewFindViewById = view.findViewById(2131428132);
            Intrinsics.f(viewFindViewById, "findViewById(...)");
            this.label = (TextView) viewFindViewById;
        }

        public final void bind(@NotNull ConversationListItem.Header item) {
            Intrinsics.g(item, "item");
            this.label.setText(item.getLabel());
        }
    }

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\b\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\n\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\t¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationListAdapter$ItemDiffCallback;", "Landroidx/recyclerview/widget/t;", "Lcom/instabridge/ai/chat/model/ConversationListItem;", "<init>", "()V", "old", "new", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "areItemsTheSame", "(Lcom/instabridge/ai/chat/model/ConversationListItem;Lcom/instabridge/ai/chat/model/ConversationListItem;)Z", "areContentsTheSame", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ItemDiffCallback extends androidx.recyclerview.widget.t {
        @Override // androidx.recyclerview.widget.t
        public boolean areContentsTheSame(@NotNull ConversationListItem old, @NotNull ConversationListItem conversationListItem) {
            Intrinsics.g(old, "old");
            Intrinsics.g(conversationListItem, "new");
            return old.equals(conversationListItem);
        }

        @Override // androidx.recyclerview.widget.t
        public boolean areItemsTheSame(@NotNull ConversationListItem old, @NotNull ConversationListItem conversationListItem) {
            Intrinsics.g(old, "old");
            Intrinsics.g(conversationListItem, "new");
            return Intrinsics.b(old.getStableId(), conversationListItem.getStableId());
        }
    }

    public ConversationListAdapter() {
        super(new ItemDiffCallback());
    }

    @Override // androidx.recyclerview.widget.m1
    public int getItemViewType(int position) {
        ConversationListItem conversationListItem = (ConversationListItem) getItem(position);
        if (conversationListItem instanceof ConversationListItem.Header) {
            return 0;
        }
        if (conversationListItem instanceof ConversationListItem.ConversationRow) {
            return 1;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Nullable
    public final Function1<Conversation, Unit> getOnConversationClick() {
        return this.onConversationClick;
    }

    @Nullable
    public final Function1<Conversation, Unit> getOnConversationLongClick() {
        return this.onConversationLongClick;
    }

    @Override // androidx.recyclerview.widget.m1
    public void onBindViewHolder(@NotNull s2 holder, int position) {
        Intrinsics.g(holder, "holder");
        ConversationListItem conversationListItem = (ConversationListItem) getItem(position);
        if (conversationListItem instanceof ConversationListItem.Header) {
            ((HeaderViewHolder) holder).bind((ConversationListItem.Header) conversationListItem);
        } else {
            if (!(conversationListItem instanceof ConversationListItem.ConversationRow)) {
                throw new NoWhenBranchMatchedException();
            }
            ((ConversationViewHolder) holder).bind((ConversationListItem.ConversationRow) conversationListItem);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    @NotNull
    public s2 onCreateViewHolder(@NotNull ViewGroup parent, int viewType) {
        Intrinsics.g(parent, "parent");
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(parent.getContext());
        if (viewType == 0) {
            View viewInflate = layoutInflaterFrom.inflate(2131623993, parent, false);
            Intrinsics.f(viewInflate, "inflate(...)");
            return new HeaderViewHolder(this, viewInflate);
        }
        View viewInflate2 = layoutInflaterFrom.inflate(2131623994, parent, false);
        Intrinsics.f(viewInflate2, "inflate(...)");
        return new ConversationViewHolder(this, viewInflate2);
    }

    public final void setOnConversationClick(@Nullable Function1<? super Conversation, Unit> function1) {
        this.onConversationClick = function1;
    }

    public final void setOnConversationLongClick(@Nullable Function1<? super Conversation, Unit> function1) {
        this.onConversationLongClick = function1;
    }
}
