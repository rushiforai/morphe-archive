package com.instabridge.ai.chat.ui.v2;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import b10.d0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.flexbox.FlexboxLayout;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.InteractiveChatTextView;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0001\u0018\u0000 \u001b2\u00020\u0001:\u0001\u001bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u001f\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u001f\u0010\u000f\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\u000f\u0010\u000eJ\u001f\u0010\u0010\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\u0010\u0010\u000eJ\u001f\u0010\u0011\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\u0011\u0010\u000eJ\u0017\u0010\u0012\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\nH\u0002¢\u0006\u0004\b\u0014\u0010\u0013J\u0015\u0010\u0015\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0015\u0010\u0013R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0016R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0017R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0019\u0010\u001a¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/ToolCallCardViewHolderV2;", "Landroidx/recyclerview/widget/s2;", "Landroid/widget/FrameLayout;", "container", "Lcom/instabridge/ai/chat/ui/v2/MessageActions;", "actions", "<init>", "(Landroid/widget/FrameLayout;Lcom/instabridge/ai/chat/ui/v2/MessageActions;)V", "Landroid/view/LayoutInflater;", "inflater", "Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bindAskClarification", "(Landroid/view/LayoutInflater;Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;)V", "bindConfirmAction", "bindInputForm", "bindShowChart", "bindGenericToolCall", "(Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;)V", "updateCompletedState", "bind", "Landroid/widget/FrameLayout;", "Lcom/instabridge/ai/chat/ui/v2/MessageActions;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "boundCallId", "Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ToolCallCardViewHolderV2 extends s2 {

    @NotNull
    private final MessageActions actions;

    @Nullable
    private String boundCallId;

    @NotNull
    private final FrameLayout container;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/ToolCallCardViewHolderV2$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "createContainer", "Landroid/widget/FrameLayout;", "parent", "Landroid/view/ViewGroup;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final FrameLayout createContainer(@NotNull ViewGroup parent) {
            Intrinsics.g(parent, "parent");
            FrameLayout frameLayout = new FrameLayout(parent.getContext());
            frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
            return frameLayout;
        }

        private Companion() {
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ToolCallCardViewHolderV2(@NotNull FrameLayout container, @NotNull MessageActions actions) {
        super(container);
        Intrinsics.g(container, "container");
        Intrinsics.g(actions, "actions");
        this.container = container;
        this.actions = actions;
    }

    private final void bindAskClarification(LayoutInflater inflater, ChatItem.ToolCallCard item) {
        ArrayList<Map> arrayList;
        View viewInflate = inflater.inflate(2131624024, (ViewGroup) this.container, false);
        this.container.addView(viewInflate);
        TextView textView = (TextView) viewInflate.findViewById(2131428662);
        FlexboxLayout flexboxLayout = (FlexboxLayout) viewInflate.findViewById(2131427672);
        View viewFindViewById = viewInflate.findViewById(2131427800);
        EditText editText = (EditText) viewInflate.findViewById(2131427799);
        ImageButton imageButton = (ImageButton) viewInflate.findViewById(2131428805);
        TextView textView2 = (TextView) viewInflate.findViewById(2131428865);
        TextView textView3 = (TextView) viewInflate.findViewById(2131427716);
        Object obj = item.getArguments().get("question");
        String str = obj instanceof String ? (String) obj : null;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        textView.setText(str);
        if (item.isCompleted()) {
            flexboxLayout.setVisibility(8);
            viewFindViewById.setVisibility(8);
            textView2.setVisibility(8);
            textView3.setVisibility(0);
            String selectedLabel = item.getSelectedLabel();
            if (selectedLabel == null) {
                selectedLabel = this.container.getContext().getString(2132017413);
                Intrinsics.f(selectedLabel, "getString(...)");
            }
            textView3.setText(selectedLabel);
            return;
        }
        Context context = this.container.getContext();
        float f11 = context.getResources().getDisplayMetrics().density;
        int color = context.getColor(2131099783);
        Object obj2 = item.getArguments().get("quick_replies");
        List list = obj2 instanceof List ? (List) obj2 : null;
        if (list != null) {
            arrayList = new ArrayList();
            for (Object obj3 : list) {
                if (obj3 instanceof Map) {
                    arrayList.add(obj3);
                }
            }
        } else {
            arrayList = null;
        }
        if (arrayList != null) {
            for (Map map : arrayList) {
                Object obj4 = map.get("label");
                String str2 = obj4 instanceof String ? (String) obj4 : null;
                if (str2 != null) {
                    Object obj5 = map.get("value");
                    String str3 = obj5 instanceof String ? (String) obj5 : null;
                    if (str3 == null) {
                        str3 = str2;
                    }
                    TextView textView4 = new TextView(context);
                    textView4.setText(str2);
                    textView4.setTextSize(13.5f);
                    textView4.setTextColor(color);
                    textView4.setTypeface(Typeface.create("sans-serif-medium", 0));
                    textView4.setBackground(context.getDrawable(2131231138));
                    int i5 = (int) (14 * f11);
                    int i11 = (int) (8 * f11);
                    textView4.setPadding(i5, i11, i5, i11);
                    textView4.setClickable(true);
                    textView4.setFocusable(true);
                    textView4.setOnClickListener(new j(this, item, str3));
                    FlexboxLayout.LayoutParams layoutParams = new FlexboxLayout.LayoutParams();
                    int i12 = (int) (4 * f11);
                    layoutParams.setMargins(0, i12, (int) (6 * f11), i12);
                    flexboxLayout.addView(textView4, layoutParams);
                }
            }
        }
        final d0 d0Var = new d0(5, editText, this, item);
        imageButton.setOnClickListener(new c(d0Var, 3));
        editText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.instabridge.ai.chat.ui.v2.k
            @Override // android.widget.TextView.OnEditorActionListener
            public final boolean onEditorAction(TextView textView5, int i13, KeyEvent keyEvent) {
                return ToolCallCardViewHolderV2.bindAskClarification$lambda$5(d0Var, textView5, i13, keyEvent);
            }
        });
        textView2.setOnClickListener(new l(this, item, 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bindAskClarification$lambda$1$lambda$0(ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, String str, View view) {
        toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), b70.k.e0(new Pair("answer", str)), null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindAskClarification$lambda$3(EditText editText, ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard) {
        String string = r70.k.u1(editText.getText().toString()).toString();
        if (string.length() > 0) {
            toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), b70.k.e0(new Pair("answer", string)), null);
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean bindAskClarification$lambda$5(Function0 function0, TextView textView, int i5, KeyEvent keyEvent) {
        if (i5 != 4) {
            return false;
        }
        function0.invoke();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bindAskClarification$lambda$6(ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, View view) {
        toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), MapsKt.j0(new Pair("answer", "skip"), new Pair("skipped", Boolean.TRUE)), null);
    }

    private final void bindConfirmAction(LayoutInflater inflater, ChatItem.ToolCallCard item) {
        View viewInflate = inflater.inflate(2131624025, (ViewGroup) this.container, false);
        this.container.addView(viewInflate);
        TextView textView = (TextView) viewInflate.findViewById(2131427391);
        TextView textView2 = (TextView) viewInflate.findViewById(2131428359);
        View viewFindViewById = viewInflate.findViewById(2131427614);
        Button button = (Button) viewInflate.findViewById(2131427727);
        Button button2 = (Button) viewInflate.findViewById(2131427626);
        TextView textView3 = (TextView) viewInflate.findViewById(2131427716);
        Object obj = item.getArguments().get("action_type");
        String str = obj instanceof String ? (String) obj : null;
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Object obj2 = item.getArguments().get(PglCryptUtils.KEY_MESSAGE);
        String str3 = obj2 instanceof String ? (String) obj2 : null;
        if (str3 != null) {
            str2 = str3;
        }
        Object obj3 = item.getArguments().get("confirm_label");
        String str4 = obj3 instanceof String ? (String) obj3 : null;
        String strE0 = r70.j.E0(str, '_', ' ');
        if (strE0.length() > 0) {
            StringBuilder sb2 = new StringBuilder();
            String strValueOf = String.valueOf(strE0.charAt(0));
            Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
            String upperCase = strValueOf.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            sb2.append((Object) upperCase);
            String strSubstring = strE0.substring(1);
            Intrinsics.f(strSubstring, "substring(...)");
            sb2.append(strSubstring);
            strE0 = sb2.toString();
        }
        textView.setText(strE0);
        textView2.setText(str2);
        if (str4 != null) {
            button.setText(str4);
        }
        if (!item.isCompleted()) {
            button.setOnClickListener(new l(this, item, 1));
            button2.setOnClickListener(new l(this, item, 2));
            return;
        }
        viewFindViewById.setVisibility(8);
        textView3.setVisibility(0);
        Context context = this.container.getContext();
        if (Intrinsics.b(item.getSelectedLabel(), "confirmed")) {
            textView3.setText(context.getString(2132017409));
            textView3.setTextColor(context.getColor(2131099715));
        } else {
            textView3.setText(context.getString(2132017406));
            textView3.setTextColor(context.getColor(2131099714));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bindConfirmAction$lambda$8(ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, View view) {
        toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), b70.k.e0(new Pair("confirmed", Boolean.TRUE)), null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bindConfirmAction$lambda$9(ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, View view) {
        toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), MapsKt.j0(new Pair("confirmed", Boolean.FALSE), new Pair("cancelled", Boolean.TRUE)), null);
    }

    private final void bindGenericToolCall(ChatItem.ToolCallCard item) {
        Context context = this.container.getContext();
        float f11 = context.getResources().getDisplayMetrics().density;
        int i5 = (int) (14 * f11);
        int i11 = (int) (12 * f11);
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(1);
        linearLayout.setBackground(context.getDrawable(2131231137));
        linearLayout.setPadding(i5, i11, i5, i11);
        this.container.addView(linearLayout);
        String strE0 = r70.j.E0(item.getToolName(), '_', ' ');
        if (strE0.length() > 0) {
            StringBuilder sb2 = new StringBuilder();
            String strValueOf = String.valueOf(strE0.charAt(0));
            Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
            String upperCase = strValueOf.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            sb2.append((Object) upperCase);
            String strSubstring = strE0.substring(1);
            Intrinsics.f(strSubstring, "substring(...)");
            sb2.append(strSubstring);
            strE0 = sb2.toString();
        }
        String str = strE0;
        InteractiveChatTextView interactiveChatTextView = new InteractiveChatTextView(context, null, 0, 6, null);
        interactiveChatTextView.setText(str);
        interactiveChatTextView.setTextIsSelectable(true);
        interactiveChatTextView.setTextSize(14.0f);
        interactiveChatTextView.setTextColor(context.getColor(2131099773));
        interactiveChatTextView.setTypeface(Typeface.create("sans-serif-medium", 0));
        interactiveChatTextView.setHighlightColor(context.getColor(2131099740));
        interactiveChatTextView.setLinkTextColor(context.getColor(2131099718));
        linearLayout.addView(interactiveChatTextView);
        String string = item.isCompleted() ? context.getString(2132017407) : context.getString(2132017411);
        Intrinsics.d(string);
        TextView textView = new TextView(context);
        textView.setText(string);
        textView.setTextSize(12.0f);
        textView.setTextColor(context.getColor(2131099774));
        textView.setPadding(0, (int) (4 * f11), 0, 0);
        linearLayout.addView(textView);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0226  */
    /* JADX WARN: Type inference failed for: r9v21, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r9v6, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r9v7, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void bindInputForm(LayoutInflater inflater, ChatItem.ToolCallCard item) {
        ?? arrayList;
        ArrayList arrayList2;
        int i5;
        boolean z11;
        View viewInflate = inflater.inflate(2131624026, (ViewGroup) this.container, false);
        this.container.addView(viewInflate);
        TextView textView = (TextView) viewInflate.findViewById(2131428089);
        LinearLayout linearLayout = (LinearLayout) viewInflate.findViewById(2131428047);
        Button button = (Button) viewInflate.findViewById(2131428936);
        TextView textView2 = (TextView) viewInflate.findViewById(2131427716);
        Object obj = item.getArguments().get("title");
        String str = obj instanceof String ? (String) obj : null;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Object obj2 = item.getArguments().get("submit_label");
        String str2 = obj2 instanceof String ? (String) obj2 : null;
        textView.setText(str);
        if (str2 != null) {
            button.setText(str2);
        }
        if (item.isCompleted()) {
            linearLayout.setVisibility(8);
            button.setVisibility(8);
            textView2.setVisibility(0);
            String selectedLabel = item.getSelectedLabel();
            if (selectedLabel == null) {
                selectedLabel = this.container.getContext().getString(2132017414);
                Intrinsics.f(selectedLabel, "getString(...)");
            }
            textView2.setText(selectedLabel);
            return;
        }
        Context context = this.container.getContext();
        float f11 = context.getResources().getDisplayMetrics().density;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Object obj3 = item.getArguments().get("fields");
        List list = obj3 instanceof List ? (List) obj3 : null;
        if (list != null) {
            arrayList = new ArrayList();
            for (Object obj4 : list) {
                if (obj4 instanceof Map) {
                    arrayList.add(obj4);
                }
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Map map = (Map) it.next();
            Object obj5 = map.get(PendingUpgradeStore.KEY_NAME);
            String str3 = obj5 instanceof String ? (String) obj5 : null;
            if (str3 != null) {
                Object obj6 = map.get("label");
                String str4 = obj6 instanceof String ? (String) obj6 : null;
                if (str4 == null) {
                    str4 = str3;
                }
                Object obj7 = map.get(TTConst.TRACK_TYPE);
                String str5 = obj7 instanceof String ? (String) obj7 : null;
                if (str5 == null) {
                    str5 = "text";
                }
                Object obj8 = map.get("placeholder");
                String str6 = obj8 instanceof String ? (String) obj8 : null;
                if (str6 == null) {
                    str6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                Object obj9 = map.get("options");
                List list2 = obj9 instanceof List ? (List) obj9 : null;
                if (list2 != null) {
                    ArrayList arrayList3 = new ArrayList();
                    for (Object obj10 : list2) {
                        if (obj10 instanceof String) {
                            arrayList3.add(obj10);
                        }
                    }
                    arrayList2 = arrayList3;
                } else {
                    arrayList2 = null;
                }
                String str7 = str6;
                String str8 = str5;
                float f12 = f11;
                Iterator it2 = it;
                InteractiveChatTextView interactiveChatTextView = new InteractiveChatTextView(context, null, 0, 6, null);
                interactiveChatTextView.setText(str4);
                interactiveChatTextView.setTextIsSelectable(true);
                interactiveChatTextView.setTextSize(11.5f);
                interactiveChatTextView.setTextColor(context.getColor(2131099774));
                interactiveChatTextView.setTypeface(Typeface.create("sans-serif-medium", 0));
                interactiveChatTextView.setHighlightColor(context.getColor(2131099740));
                interactiveChatTextView.setLinkTextColor(context.getColor(2131099718));
                interactiveChatTextView.setPadding(0, (int) (10 * f12), 0, (int) (4 * f12));
                linearLayout.addView(interactiveChatTextView);
                if (!str8.equals("select") || arrayList2 == null) {
                    switch (str8.hashCode()) {
                        case -1034364087:
                            if (str8.equals("number")) {
                                i5 = 2;
                                break;
                            } else {
                                i5 = 1;
                                break;
                            }
                        case -1003243718:
                            if (str8.equals("textarea")) {
                                i5 = 131073;
                                break;
                            }
                            break;
                        case 114715:
                            if (str8.equals("tel")) {
                                i5 = 3;
                                break;
                            }
                            break;
                        case 96619420:
                            if (str8.equals(ActionCategory.EMAIL)) {
                                i5 = 32;
                                break;
                            }
                            break;
                    }
                    EditText editText = new EditText(context);
                    editText.setHint(str7);
                    editText.setHintTextColor(context.getColor(2131099772));
                    editText.setTextColor(context.getColor(2131099773));
                    editText.setInputType(i5);
                    editText.setBackground(context.getDrawable(2131231140));
                    editText.setTextSize(14.0f);
                    int i11 = (int) (12 * f12);
                    editText.setPadding(i11, i11, i11, i11);
                    if (str8.equals("textarea")) {
                        editText.setMinLines(3);
                        z11 = false;
                        editText.setSingleLine(false);
                    } else {
                        z11 = false;
                        editText.setSingleLine(true);
                    }
                    linearLayout.addView(editText, new LinearLayout.LayoutParams(-1, -2));
                    linkedHashMap.put(str3, new b(editText, 2));
                    f11 = f12;
                    it = it2;
                } else {
                    Spinner spinner = new Spinner(context);
                    spinner.setAdapter((SpinnerAdapter) new ArrayAdapter(context, 17367049, arrayList2));
                    linearLayout.addView(spinner);
                    linkedHashMap.put(str3, new b(spinner, 1));
                    f11 = f12;
                    it = it2;
                }
            }
        }
        button.setOnClickListener(new j(0, linkedHashMap, this, item));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String bindInputForm$lambda$12(Spinner spinner) {
        String string;
        Object selectedItem = spinner.getSelectedItem();
        return (selectedItem == null || (string = selectedItem.toString()) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : string;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String bindInputForm$lambda$14(EditText editText) {
        return editText.getText().toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bindInputForm$lambda$16(Map map, ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, View view) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), (String) ((Function0) entry.getValue()).invoke());
        }
        toolCallCardViewHolderV2.actions.onToolResult(toolCallCard.getCallId(), linkedHashMap, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v3, types: [android.view.ViewGroup, android.widget.LinearLayout] */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v12, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r4v9, types: [kotlin.collections.EmptyList] */
    private final void bindShowChart(LayoutInflater inflater, ChatItem.ToolCallCard item) {
        Iterable<Map> arrayList;
        double d5;
        double dDoubleValue;
        String strValueOf;
        int i5 = 0;
        View viewInflate = inflater.inflate(2131624027, (ViewGroup) this.container, false);
        this.container.addView(viewInflate);
        TextView textView = (TextView) viewInflate.findViewById(2131427656);
        ?? r12 = (LinearLayout) viewInflate.findViewById(2131427833);
        Object obj = item.getArguments().get("title");
        String str = obj instanceof String ? (String) obj : null;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        textView.setText(str);
        Object obj2 = item.getArguments().get("data");
        List list = obj2 instanceof List ? (List) obj2 : null;
        if (list != null) {
            arrayList = new ArrayList();
            for (Object obj3 : list) {
                if (obj3 instanceof Map) {
                    arrayList.add(obj3);
                }
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object obj4 = ((Map) it.next()).get("value");
            Number number = obj4 instanceof Number ? (Number) obj4 : null;
            Double dValueOf = number != null ? Double.valueOf(number.doubleValue()) : null;
            if (dValueOf != null) {
                arrayList2.add(dValueOf);
            }
        }
        Double dK1 = b70.g.k1(arrayList2);
        double dDoubleValue2 = dK1 != null ? dK1.doubleValue() : 1.0d;
        Context context = this.container.getContext();
        float f11 = context.getResources().getDisplayMetrics().density;
        int color = context.getColor(2131099744);
        for (Map map : arrayList) {
            Object obj5 = map.get("label");
            String str2 = obj5 instanceof String ? (String) obj5 : null;
            if (str2 == null) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            Object obj6 = map.get("value");
            Number number2 = obj6 instanceof Number ? (Number) obj6 : null;
            if (number2 != null) {
                d5 = dDoubleValue2;
                dDoubleValue = number2.doubleValue();
            } else {
                d5 = dDoubleValue2;
                dDoubleValue = 0.0d;
            }
            double dC0 = d5 > 0.0d ? kotlin.ranges.a.c0(dDoubleValue / d5, 0.0d, 1.0d) : 0.0d;
            LinearLayout linearLayout = new LinearLayout(context);
            linearLayout.setOrientation(i5);
            linearLayout.setGravity(16);
            float f12 = 4 * f11;
            int i11 = (int) f12;
            linearLayout.setPadding(i5, i11, i5, i11);
            int i12 = color;
            InteractiveChatTextView interactiveChatTextView = new InteractiveChatTextView(context, null, 0, 6, null);
            interactiveChatTextView.setText(str2);
            interactiveChatTextView.setTextIsSelectable(true);
            interactiveChatTextView.setTextSize(13.0f);
            interactiveChatTextView.setTextColor(context.getColor(2131099774));
            interactiveChatTextView.setHighlightColor(context.getColor(2131099740));
            interactiveChatTextView.setLinkTextColor(context.getColor(2131099718));
            interactiveChatTextView.setLayoutParams(new LinearLayout.LayoutParams((int) (80 * f11), -2));
            interactiveChatTextView.setMaxLines(1);
            interactiveChatTextView.setEllipsize(TextUtils.TruncateAt.END);
            linearLayout.addView(interactiveChatTextView);
            int i13 = (int) (8 * f11);
            int i14 = (int) (((int) (120 * f11)) * dC0);
            int i15 = (int) (2 * f11);
            if (i14 < i15) {
                i14 = i15;
            }
            View view = new View(context);
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setShape(0);
            gradientDrawable.setCornerRadius(f12);
            gradientDrawable.setColor(i12);
            view.setBackground(gradientDrawable);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(i14, i13);
            layoutParams.setMarginStart(i13);
            layoutParams.setMarginEnd(i13);
            view.setLayoutParams(layoutParams);
            linearLayout.addView(view);
            long j11 = (long) dDoubleValue;
            if (dDoubleValue == j11) {
                strValueOf = String.valueOf(j11);
            } else {
                StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                strValueOf = String.format("%.1f", Arrays.copyOf(new Object[]{Double.valueOf(dDoubleValue)}, 1));
            }
            InteractiveChatTextView interactiveChatTextView2 = new InteractiveChatTextView(context, null, 0, 6, null);
            interactiveChatTextView2.setText(strValueOf);
            interactiveChatTextView2.setTextIsSelectable(true);
            interactiveChatTextView2.setTextSize(13.0f);
            interactiveChatTextView2.setTextColor(context.getColor(2131099773));
            interactiveChatTextView2.setTypeface(Typeface.create("sans-serif-medium", 0));
            interactiveChatTextView2.setHighlightColor(context.getColor(2131099740));
            interactiveChatTextView2.setLinkTextColor(context.getColor(2131099718));
            linearLayout.addView(interactiveChatTextView2);
            r12.addView(linearLayout);
            color = i12;
            i5 = 0;
            dDoubleValue2 = d5;
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterative(DepthRegionTraversal.java:31)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visit(SwitchOverStringVisitor.java:60)
     */
    private final void updateCompletedState(ChatItem.ToolCallCard item) {
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(this.container.getContext());
        this.container.removeAllViews();
        String toolName = item.getToolName();
        switch (toolName.hashCode()) {
            case -2003493378:
                if (toolName.equals("ask_clarification")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindAskClarification(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 622951573:
                if (toolName.equals("confirm_action")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindConfirmAction(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 1110647836:
                if (toolName.equals("show_chart")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindShowChart(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 1386265625:
                if (toolName.equals("input_form")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindInputForm(layoutInflaterFrom, item);
                    return;
                }
                break;
        }
        bindGenericToolCall(item);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    public final void bind(@NotNull ChatItem.ToolCallCard item) {
        Intrinsics.g(item, "item");
        if (Intrinsics.b(this.boundCallId, item.getCallId()) && this.container.getChildCount() > 0) {
            updateCompletedState(item);
            return;
        }
        this.boundCallId = item.getCallId();
        this.container.removeAllViews();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(this.container.getContext());
        String toolName = item.getToolName();
        switch (toolName.hashCode()) {
            case -2003493378:
                if (toolName.equals("ask_clarification")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindAskClarification(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 622951573:
                if (toolName.equals("confirm_action")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindConfirmAction(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 1110647836:
                if (toolName.equals("show_chart")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindShowChart(layoutInflaterFrom, item);
                    return;
                }
                break;
            case 1386265625:
                if (toolName.equals("input_form")) {
                    Intrinsics.d(layoutInflaterFrom);
                    bindInputForm(layoutInflaterFrom, item);
                    return;
                }
                break;
        }
        bindGenericToolCall(item);
    }
}
