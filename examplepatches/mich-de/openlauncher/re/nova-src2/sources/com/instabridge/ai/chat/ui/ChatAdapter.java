package com.instabridge.ai.chat.ui;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.view.animation.LinearInterpolator;
import android.view.animation.TranslateAnimation;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatButton;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.b1;
import androidx.recyclerview.widget.s2;
import b.c9;
import b.u4;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.flexbox.FlexboxLayout;
import com.google.android.gms.internal.measurement.wg;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.model.ChatMessage;
import com.instabridge.ai.chat.model.FeedbackState;
import com.instabridge.ai.chat.ui.ChatAdapter;
import com.instabridge.ai.chat.util.CitationMarkdownTransform;
import com.instabridge.ai.chat.util.CitationPreparedMarkdown;
import com.instabridge.ai.chat.util.DomainUtils;
import com.instabridge.ai.chat.util.MarkdownTableSplitter;
import com.instabridge.ai.protocol.Suggestion;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\b\u0007\u0018\u0000 [2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0007\\]^_`a[B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0017\u0010\b\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\r\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J-\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u00062\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013H\u0016¢\u0006\u0004\b\u0011\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0017\u0010\u0018R0\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u00198\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 Ri\u0010(\u001aI\u0012\u0013\u0012\u00110\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(%\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(&\u0012\u0013\u0012\u00110\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b('\u0012\u0004\u0012\u00020\u0010\u0018\u00010!8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b(\u0010)\u001a\u0004\b*\u0010+\"\u0004\b,\u0010-R?\u0010/\u001a\u001f\u0012\u0013\u0012\u00110\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(.\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u00198\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b/\u0010\u001c\u001a\u0004\b0\u0010\u001e\"\u0004\b1\u0010 R*\u00103\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u0001028\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b3\u00104\u001a\u0004\b5\u00106\"\u0004\b7\u00108R{\u0010=\u001a[\u0012\u0013\u0012\u00110\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(9\u0012#\u0012!\u0012\u0004\u0012\u00020\"\u0012\u0006\u0012\u0004\u0018\u00010\u0014\u0018\u00010:¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(;\u0012\u0015\u0012\u0013\u0018\u00010\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u0010\u0018\u00010!8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b=\u0010)\u001a\u0004\b>\u0010+\"\u0004\b?\u0010-R$\u0010A\u001a\u0004\u0018\u00010@8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\bA\u0010B\u001a\u0004\bC\u0010D\"\u0004\bE\u0010FR\"\u0010H\u001a\u00020G8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\bH\u0010I\u001a\u0004\bJ\u0010K\"\u0004\bL\u0010MR(\u0010P\u001a\b\u0012\u0004\u0012\u00020O0N8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bP\u0010Q\u001a\u0004\bR\u0010S\"\u0004\bT\u0010UR2\u0010X\u001a\u0012\u0012\u0004\u0012\u00020V\u0012\u0006\u0012\u0004\u0018\u00010W\u0018\u00010\u00198\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bX\u0010\u001c\u001a\u0004\bY\u0010\u001e\"\u0004\bZ\u0010 ¨\u0006b"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter;", "Landroidx/recyclerview/widget/b1;", "Lcom/instabridge/ai/chat/model/ChatItem;", "Landroidx/recyclerview/widget/s2;", "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "position", "getItemViewType", "(I)I", "Landroid/view/ViewGroup;", "parent", "viewType", "onCreateViewHolder", "(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/s2;", "holder", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onBindViewHolder", "(Landroidx/recyclerview/widget/s2;I)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "payloads", "(Landroidx/recyclerview/widget/s2;ILjava/util/List;)V", "onViewRecycled", "(Landroidx/recyclerview/widget/s2;)V", "Lkotlin/Function1;", "Lcom/instabridge/ai/protocol/Suggestion;", "onSuggestionClick", "Lkotlin/jvm/functions/Function1;", "getOnSuggestionClick", "()Lkotlin/jvm/functions/Function1;", "setOnSuggestionClick", "(Lkotlin/jvm/functions/Function1;)V", "Lkotlin/Function3;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "itemId", "messageIndex", "signal", "onFeedback", "Lkotlin/jvm/functions/Function3;", "getOnFeedback", "()Lkotlin/jvm/functions/Function3;", "setOnFeedback", "(Lkotlin/jvm/functions/Function3;)V", "content", "onCopy", "getOnCopy", "setOnCopy", "Lkotlin/Function0;", "onRegenerate", "Lkotlin/jvm/functions/Function0;", "getOnRegenerate", "()Lkotlin/jvm/functions/Function0;", "setOnRegenerate", "(Lkotlin/jvm/functions/Function0;)V", "callId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "result", "error", "onToolResult", "getOnToolResult", "setOnToolResult", "Lcom/instabridge/ai/chat/ui/ChatTheme;", "theme", "Lcom/instabridge/ai/chat/ui/ChatTheme;", "getTheme", "()Lcom/instabridge/ai/chat/ui/ChatTheme;", "setTheme", "(Lcom/instabridge/ai/chat/ui/ChatTheme;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "showRegenerateAction", "Z", "getShowRegenerateAction", "()Z", "setShowRegenerateAction", "(Z)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/ui/AnswerAction;", "answerActions", "Ljava/util/List;", "getAnswerActions$instabridge_ai_sdk_release", "()Ljava/util/List;", "setAnswerActions$instabridge_ai_sdk_release", "(Ljava/util/List;)V", "Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;", "Lcom/instabridge/ai/chat/ui/AnswerRef;", "answerRefFor", "getAnswerRefFor$instabridge_ai_sdk_release", "setAnswerRefFor$instabridge_ai_sdk_release", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "PreparedMarkdown", "UserMessageViewHolder", "AiMessageViewHolder", "ToolCallCardViewHolder", "SystemMessageViewHolder", "ChatDiffCallback", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ChatAdapter extends b1 {

    @NotNull
    private static final String PAYLOAD_TEXT_UPDATE = "text_update";

    @NotNull
    private static final String PAYLOAD_TOOL_CARD_UPDATE = "tool_card_update";

    @NotNull
    private static final String TAG = "ChatAdapter";
    private static final int VIEW_TYPE_AI = 1;
    private static final int VIEW_TYPE_SYSTEM = 2;
    private static final int VIEW_TYPE_TOOL_CARD = 3;
    private static final int VIEW_TYPE_USER = 0;

    @NotNull
    private List<AnswerAction> answerActions;

    @Nullable
    private Function1<? super ChatItem.AiMessage, AnswerRef> answerRefFor;

    @Nullable
    private Function1<? super String, Unit> onCopy;

    @Nullable
    private Function3<? super String, ? super Integer, ? super String, Unit> onFeedback;

    @Nullable
    private Function0<Unit> onRegenerate;

    @Nullable
    private Function1<? super Suggestion, Unit> onSuggestionClick;

    @Nullable
    private Function3<? super String, ? super Map<String, ? extends Object>, ? super String, Unit> onToolResult;
    private boolean showRegenerateAction;

    @Nullable
    private ChatTheme theme;
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000 \u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010!\n\u0002\b\u0004\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u001f\u0010\r\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\r\u0010\fJ\r\u0010\u000e\u001a\u00020\n¢\u0006\u0004\b\u000e\u0010\u000fJ\r\u0010\u0010\u001a\u00020\n¢\u0006\u0004\b\u0010\u0010\u000fJ\r\u0010\u0011\u001a\u00020\n¢\u0006\u0004\b\u0011\u0010\u000fJ\r\u0010\u0012\u001a\u00020\n¢\u0006\u0004\b\u0012\u0010\u000fJ\r\u0010\u0013\u001a\u00020\n¢\u0006\u0004\b\u0013\u0010\u000fJ\u0017\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u001f\u0010\u0018\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0017\u001a\u00020\u0014H\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\n2\u0006\u0010\u0017\u001a\u00020\u0014H\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\nH\u0002¢\u0006\u0004\b\u001c\u0010\u000fJ\u000f\u0010\u001d\u001a\u00020\nH\u0002¢\u0006\u0004\b\u001d\u0010\u000fJ\u0017\u0010\u001e\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u001e\u0010\u001fJ\u0017\u0010\"\u001a\u00020\n2\u0006\u0010!\u001a\u00020 H\u0002¢\u0006\u0004\b\"\u0010#J\u000f\u0010$\u001a\u00020\nH\u0002¢\u0006\u0004\b$\u0010\u000fJ\u000f\u0010%\u001a\u00020\nH\u0002¢\u0006\u0004\b%\u0010\u000fJ\u0017\u0010(\u001a\u00020\n2\u0006\u0010'\u001a\u00020&H\u0002¢\u0006\u0004\b(\u0010)J\u001f\u0010*\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b*\u0010\fJ\u0017\u0010+\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b+\u0010\u001fJ\u0017\u0010,\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b,\u0010\u001fJ\u000f\u0010-\u001a\u00020\nH\u0002¢\u0006\u0004\b-\u0010\u000fJ\u001d\u00101\u001a\u00020\n2\f\u00100\u001a\b\u0012\u0004\u0012\u00020/0.H\u0002¢\u0006\u0004\b1\u00102J\u0017\u00104\u001a\u00020\n2\u0006\u00103\u001a\u00020 H\u0002¢\u0006\u0004\b4\u0010#J\u000f\u00105\u001a\u00020\nH\u0002¢\u0006\u0004\b5\u0010\u000fJ\u0017\u00106\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b6\u0010\u001fJ\u001d\u00109\u001a\u00020\n2\f\u00108\u001a\b\u0012\u0004\u0012\u0002070.H\u0002¢\u0006\u0004\b9\u00102J\u001f\u0010=\u001a\u00020\n2\u0006\u0010:\u001a\u00020 2\u0006\u0010<\u001a\u00020;H\u0002¢\u0006\u0004\b=\u0010>R\u0014\u0010?\u001a\u00020;8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b?\u0010@R\u0014\u0010A\u001a\u00020;8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bA\u0010@R\u0014\u0010B\u001a\u00020;8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bB\u0010@R\u0017\u0010C\u001a\u00020 8\u0006¢\u0006\f\n\u0004\bC\u0010D\u001a\u0004\bE\u0010FR\u0014\u0010H\u001a\u00020G8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bH\u0010IR\u0014\u0010K\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bK\u0010LR\u0014\u0010M\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bM\u0010NR\u0014\u0010O\u001a\u00020 8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bO\u0010DR\u0014\u0010P\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bP\u0010NR\u0016\u0010Q\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bQ\u0010RR\u0014\u0010T\u001a\u00020S8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bT\u0010UR\u0014\u0010V\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bV\u0010LR\u0014\u0010W\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bW\u0010LR\u0014\u0010Y\u001a\u00020X8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bY\u0010ZR\u0014\u0010[\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b[\u0010LR\u0014\u0010\\\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\\\u0010LR\u0014\u0010]\u001a\u00020J8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b]\u0010LR\u0014\u0010_\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b_\u0010`R\u0014\u0010a\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\ba\u0010`R\u0014\u0010b\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bb\u0010`R\u0014\u0010c\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bc\u0010`R\u0014\u0010d\u001a\u00020^8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bd\u0010`R\u0018\u0010f\u001a\u0004\u0018\u00010e8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bf\u0010gR\u0018\u0010i\u001a\u0004\u0018\u00010h8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bi\u0010jR\u0018\u0010l\u001a\u0004\u0018\u00010k8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bl\u0010mR\u0018\u0010n\u001a\u0004\u0018\u00010k8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bn\u0010mR\u0018\u0010o\u001a\u0004\u0018\u00010&8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bo\u0010pR\u001a\u0010r\u001a\b\u0012\u0004\u0012\u00020k0q8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\br\u0010sR\u0016\u0010t\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bt\u0010R¨\u0006u"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$AiMessageViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "view", "<init>", "(Lcom/instabridge/ai/chat/ui/ChatAdapter;Landroid/view/View;)V", "Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isLast", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;Z)V", "updateText", "stopShimmerAnimation", "()V", "stopPulseAnimation", "stopSuggestionShimmerAnimations", "dismissAnswerActionsMenu", "stopCursorAnimation", "Lcom/instabridge/ai/chat/ui/ChatAdapter$PreparedMarkdown;", "prepareMarkdown", "(Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;)Lcom/instabridge/ai/chat/ui/ChatAdapter$PreparedMarkdown;", "prepared", "renderMarkdownSafely", "(Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;Lcom/instabridge/ai/chat/ui/ChatAdapter$PreparedMarkdown;)V", "renderWithRecyclerTable", "(Lcom/instabridge/ai/chat/ui/ChatAdapter$PreparedMarkdown;)V", "showContentView", "hideContentView", "updateThinkingState", "(Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;)V", "Landroid/widget/TextView;", "textView", "startShimmerAnimation", "(Landroid/widget/TextView;)V", "hideThinking", "startPulseAnimation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "newText", "setThinkingTextWithCrossfade", "(Ljava/lang/String;)V", "updateActionsRow", "bindMoreActions", "showAnswerActionsMenu", "startCursorAnimation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "sources", "showSources", "(Ljava/util/List;)V", "tv", "applyBrandGradientToText", "syncActionAndSourcesRowVisibility", "showToolStatus", "Lcom/instabridge/ai/protocol/Suggestion;", "suggestions", "showSuggestions", "button", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "startSuggestionShimmer", "(Landroid/widget/TextView;I)V", "shimmerOrange", "I", "shimmerPeach", "shimmerViolet", "contentText", "Landroid/widget/TextView;", "getContentText", "()Landroid/widget/TextView;", "Landroidx/recyclerview/widget/RecyclerView;", "markdownRecycler", "Landroidx/recyclerview/widget/RecyclerView;", "Landroid/widget/LinearLayout;", "thinkingContainer", "Landroid/widget/LinearLayout;", "thinkingPulseIndicator", "Landroid/view/View;", "thinkingText", "typingCursor", "usingRecycler", "Z", "Landroid/widget/HorizontalScrollView;", "suggestionsScrollView", "Landroid/widget/HorizontalScrollView;", "suggestionsContainer", "actionAndSourcesRow", "Landroid/widget/FrameLayout;", "sourcesContainer", "Landroid/widget/FrameLayout;", "sourcesExpandedList", "toolStatusContainer", "actionsRow", "Landroid/widget/ImageButton;", "thumbUpButton", "Landroid/widget/ImageButton;", "thumbDownButton", "copyButton", "regenerateButton", "moreActionsButton", "Landroid/widget/PopupMenu;", "answerActionsMenu", "Landroid/widget/PopupMenu;", "Landroid/animation/ObjectAnimator;", "cursorAnimator", "Landroid/animation/ObjectAnimator;", "Landroid/animation/ValueAnimator;", "shimmerAnimator", "Landroid/animation/ValueAnimator;", "pulseAnimator", "lastThinkingText", "Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "suggestionAnimators", "Ljava/util/List;", "sourcesExpanded", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public final class AiMessageViewHolder extends s2 {

        @NotNull
        private final LinearLayout actionAndSourcesRow;

        @NotNull
        private final LinearLayout actionsRow;

        @Nullable
        private PopupMenu answerActionsMenu;

        @NotNull
        private final TextView contentText;

        @NotNull
        private final ImageButton copyButton;

        @Nullable
        private ObjectAnimator cursorAnimator;

        @Nullable
        private String lastThinkingText;

        @NotNull
        private final RecyclerView markdownRecycler;

        @NotNull
        private final ImageButton moreActionsButton;

        @Nullable
        private ValueAnimator pulseAnimator;

        @NotNull
        private final ImageButton regenerateButton;

        @Nullable
        private ValueAnimator shimmerAnimator;
        private final int shimmerOrange;
        private final int shimmerPeach;
        private final int shimmerViolet;

        @NotNull
        private final FrameLayout sourcesContainer;
        private boolean sourcesExpanded;

        @NotNull
        private final LinearLayout sourcesExpandedList;

        @NotNull
        private final List<ValueAnimator> suggestionAnimators;

        @NotNull
        private final LinearLayout suggestionsContainer;

        @NotNull
        private final HorizontalScrollView suggestionsScrollView;

        @NotNull
        private final LinearLayout thinkingContainer;

        @NotNull
        private final View thinkingPulseIndicator;

        @NotNull
        private final TextView thinkingText;
        final /* synthetic */ ChatAdapter this$0;

        @NotNull
        private final ImageButton thumbDownButton;

        @NotNull
        private final ImageButton thumbUpButton;

        @NotNull
        private final LinearLayout toolStatusContainer;

        @NotNull
        private final View typingCursor;
        private boolean usingRecycler;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[FeedbackState.values().length];
                try {
                    iArr[FeedbackState.LIKED.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    iArr[FeedbackState.DISLIKED.ordinal()] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AiMessageViewHolder(@NotNull ChatAdapter chatAdapter, View view) {
            super(view);
            Intrinsics.g(view, "view");
            this.this$0 = chatAdapter;
            this.shimmerOrange = view.getContext().getColor(2131099699);
            this.shimmerPeach = view.getContext().getColor(2131099700);
            this.shimmerViolet = view.getContext().getColor(2131099731);
            View viewFindViewById = view.findViewById(2131427464);
            Intrinsics.f(viewFindViewById, "findViewById(...)");
            this.contentText = (TextView) viewFindViewById;
            View viewFindViewById2 = view.findViewById(2131428306);
            Intrinsics.f(viewFindViewById2, "findViewById(...)");
            this.markdownRecycler = (RecyclerView) viewFindViewById2;
            View viewFindViewById3 = view.findViewById(2131429024);
            Intrinsics.f(viewFindViewById3, "findViewById(...)");
            this.thinkingContainer = (LinearLayout) viewFindViewById3;
            View viewFindViewById4 = view.findViewById(2131429025);
            Intrinsics.f(viewFindViewById4, "findViewById(...)");
            this.thinkingPulseIndicator = viewFindViewById4;
            View viewFindViewById5 = view.findViewById(2131429026);
            Intrinsics.f(viewFindViewById5, "findViewById(...)");
            this.thinkingText = (TextView) viewFindViewById5;
            View viewFindViewById6 = view.findViewById(2131429083);
            Intrinsics.f(viewFindViewById6, "findViewById(...)");
            this.typingCursor = viewFindViewById6;
            View viewFindViewById7 = view.findViewById(2131428943);
            Intrinsics.f(viewFindViewById7, "findViewById(...)");
            this.suggestionsScrollView = (HorizontalScrollView) viewFindViewById7;
            View viewFindViewById8 = view.findViewById(2131428942);
            Intrinsics.f(viewFindViewById8, "findViewById(...)");
            this.suggestionsContainer = (LinearLayout) viewFindViewById8;
            View viewFindViewById9 = view.findViewById(2131427387);
            Intrinsics.f(viewFindViewById9, "findViewById(...)");
            this.actionAndSourcesRow = (LinearLayout) viewFindViewById9;
            View viewFindViewById10 = view.findViewById(2131428881);
            Intrinsics.f(viewFindViewById10, "findViewById(...)");
            this.sourcesContainer = (FrameLayout) viewFindViewById10;
            View viewFindViewById11 = view.findViewById(2131428882);
            Intrinsics.f(viewFindViewById11, "findViewById(...)");
            this.sourcesExpandedList = (LinearLayout) viewFindViewById11;
            View viewFindViewById12 = view.findViewById(2131429058);
            Intrinsics.f(viewFindViewById12, "findViewById(...)");
            this.toolStatusContainer = (LinearLayout) viewFindViewById12;
            View viewFindViewById13 = view.findViewById(2131427443);
            Intrinsics.f(viewFindViewById13, "findViewById(...)");
            this.actionsRow = (LinearLayout) viewFindViewById13;
            View viewFindViewById14 = view.findViewById(2131429029);
            Intrinsics.f(viewFindViewById14, "findViewById(...)");
            this.thumbUpButton = (ImageButton) viewFindViewById14;
            View viewFindViewById15 = view.findViewById(2131429028);
            Intrinsics.f(viewFindViewById15, "findViewById(...)");
            this.thumbDownButton = (ImageButton) viewFindViewById15;
            View viewFindViewById16 = view.findViewById(2131427772);
            Intrinsics.f(viewFindViewById16, "findViewById(...)");
            this.copyButton = (ImageButton) viewFindViewById16;
            View viewFindViewById17 = view.findViewById(2131428687);
            Intrinsics.f(viewFindViewById17, "findViewById(...)");
            this.regenerateButton = (ImageButton) viewFindViewById17;
            View viewFindViewById18 = view.findViewById(2131428378);
            ((ImageButton) viewFindViewById18).addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.instabridge.ai.chat.ui.ChatAdapter$AiMessageViewHolder$moreActionsButton$1$1
                @Override // android.view.View.OnAttachStateChangeListener
                public void onViewAttachedToWindow(View v11) {
                    Intrinsics.g(v11, "v");
                }

                @Override // android.view.View.OnAttachStateChangeListener
                public void onViewDetachedFromWindow(View v11) {
                    Intrinsics.g(v11, "v");
                    this.this$0.dismissAnswerActionsMenu();
                }
            });
            Intrinsics.f(viewFindViewById18, "apply(...)");
            this.moreActionsButton = (ImageButton) viewFindViewById18;
            this.suggestionAnimators = new ArrayList();
        }

        private final void applyBrandGradientToText(TextView tv2) {
            tv2.post(new d0(tv2, this, 0));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void applyBrandGradientToText$lambda$26(TextView textView, AiMessageViewHolder aiMessageViewHolder) {
            if (textView.isAttachedToWindow()) {
                float fMeasureText = textView.getPaint().measureText(textView.getText().toString());
                textView.getPaint().setShader(new LinearGradient(0.0f, 0.0f, fMeasureText < 40.0f ? 40.0f : fMeasureText, 0.0f, new int[]{aiMessageViewHolder.shimmerOrange, aiMessageViewHolder.shimmerPeach, aiMessageViewHolder.shimmerViolet}, new float[]{0.0f, 0.5f, 1.0f}, Shader.TileMode.CLAMP));
                textView.invalidate();
            }
        }

        public static /* synthetic */ void bind$default(AiMessageViewHolder aiMessageViewHolder, ChatItem.AiMessage aiMessage, boolean z11, int i5, Object obj) {
            if ((i5 & 2) != 0) {
                z11 = false;
            }
            aiMessageViewHolder.bind(aiMessage, z11);
        }

        private final void bindMoreActions(ChatItem.AiMessage item) {
            if (!this.this$0.getAnswerActions$instabridge_ai_sdk_release().isEmpty()) {
                Function1<ChatItem.AiMessage, AnswerRef> answerRefFor$instabridge_ai_sdk_release = this.this$0.getAnswerRefFor$instabridge_ai_sdk_release();
                if ((answerRefFor$instabridge_ai_sdk_release != null ? (AnswerRef) answerRefFor$instabridge_ai_sdk_release.invoke(item) : null) != null) {
                    this.moreActionsButton.setVisibility(0);
                    this.moreActionsButton.setOnClickListener(new z(1, this, item));
                    return;
                }
            }
            this.moreActionsButton.setVisibility(8);
            this.moreActionsButton.setOnClickListener(null);
        }

        private final void hideContentView() {
            this.contentText.setVisibility(8);
            this.markdownRecycler.setVisibility(8);
        }

        private final void hideThinking() {
            stopShimmerAnimation();
            stopPulseAnimation();
            this.thinkingContainer.setVisibility(8);
            this.thinkingText.setAlpha(1.0f);
            this.lastThinkingText = null;
        }

        private final PreparedMarkdown prepareMarkdown(ChatItem.AiMessage item) {
            CitationPreparedMarkdown citationPreparedMarkdownPrepare = CitationMarkdownTransform.INSTANCE.prepare(item.getContent(), item.getSources());
            DecoratedMarkdown decoratedMarkdownDecorate = CodeBlockCopyDecorator.INSTANCE.decorate(citationPreparedMarkdownPrepare.getContent());
            return new PreparedMarkdown(decoratedMarkdownDecorate.getMarkdown(), citationPreparedMarkdownPrepare.getNormalizedSources(), decoratedMarkdownDecorate.getCodeBlocks());
        }

        private final void renderMarkdownSafely(ChatItem.AiMessage item, PreparedMarkdown prepared) {
            try {
                if (!item.isStreaming() && MarkdownTableSplitter.INSTANCE.hasTable(prepared.getMarkdown())) {
                    renderWithRecyclerTable(prepared);
                    return;
                }
                MarkwonProvider markwonProvider = MarkwonProvider.INSTANCE;
                Context context = this.contentText.getContext();
                Intrinsics.f(context, "getContext(...)");
                h60.b forMessage = markwonProvider.getForMessage(context, prepared.getNormalizedSources(), prepared.getCodeBlocks());
                this.usingRecycler = false;
                this.markdownRecycler.setVisibility(8);
                this.contentText.setVisibility(0);
                h60.d dVar = (h60.d) forMessage;
                dVar.c(this.contentText, dVar.d(prepared.getMarkdown()));
            } catch (Throwable th2) {
                Log.e(ChatAdapter.TAG, "Markdown render failed for message=" + item.getId(), th2);
                this.usingRecycler = false;
                this.markdownRecycler.setVisibility(8);
                this.contentText.setVisibility(0);
                this.contentText.setText(item.getContent());
            }
        }

        private final void renderWithRecyclerTable(PreparedMarkdown prepared) {
            this.usingRecycler = true;
            this.contentText.setVisibility(8);
            this.markdownRecycler.setVisibility(0);
            MarkwonProvider markwonProvider = MarkwonProvider.INSTANCE;
            Context context = this.contentText.getContext();
            Intrinsics.f(context, "getContext(...)");
            h60.b forRecycler = markwonProvider.getForRecycler(context, prepared.getNormalizedSources(), prepared.getCodeBlocks());
            q60.e eVar = new q60.e();
            SparseArray sparseArray = new SparseArray(3);
            wg wgVar = new wg();
            renderWithRecyclerTable$lambda$2(wgVar);
            int i5 = wgVar.f33198a;
            if (i5 == 0) {
                throw new IllegalStateException("`tableLayoutResId` argument is required");
            }
            int i11 = wgVar.f33200c;
            if (i11 == 0) {
                throw new IllegalStateException("`textLayoutResId` argument is required");
            }
            sparseArray.append(w90.a.class.hashCode(), new r60.d(i5, wgVar.f33199b, i11));
            q60.c cVar = new q60.c(sparseArray, eVar, new b50.d());
            RecyclerView recyclerView = this.markdownRecycler;
            this.contentText.getContext();
            recyclerView.setLayoutManager(new LinearLayoutManager());
            this.markdownRecycler.setAdapter(cVar);
            cVar.c(forRecycler, prepared.getMarkdown());
            cVar.notifyDataSetChanged();
        }

        private static final void renderWithRecyclerTable$lambda$2(r60.b builder) {
            Intrinsics.g(builder, "builder");
            wg wgVar = (wg) builder;
            wgVar.f33198a = 2131624001;
            wgVar.f33199b = 2131428971;
            wgVar.f33200c = 2131624000;
        }

        private final void setThinkingTextWithCrossfade(String newText) {
            String str = this.lastThinkingText;
            if (str != null && !str.equals(newText)) {
                this.thinkingText.animate().cancel();
                this.thinkingText.animate().alpha(0.0f).setDuration(75L).withEndAction(new k(1, this, newText)).start();
            } else {
                this.thinkingText.animate().cancel();
                this.thinkingText.setAlpha(1.0f);
                this.thinkingText.setText(newText);
                this.lastThinkingText = newText;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void setThinkingTextWithCrossfade$lambda$8(AiMessageViewHolder aiMessageViewHolder, String str) {
            aiMessageViewHolder.thinkingText.setText(str);
            aiMessageViewHolder.lastThinkingText = str;
            aiMessageViewHolder.startShimmerAnimation(aiMessageViewHolder.thinkingText);
            aiMessageViewHolder.thinkingText.animate().alpha(1.0f).setDuration(75L).start();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void showAnswerActionsMenu(ChatItem.AiMessage item) {
            final AnswerRef answerRef;
            if (this.answerActionsMenu != null) {
                return;
            }
            final List<AnswerAction> answerActions$instabridge_ai_sdk_release = this.this$0.getAnswerActions$instabridge_ai_sdk_release();
            Function1<ChatItem.AiMessage, AnswerRef> answerRefFor$instabridge_ai_sdk_release = this.this$0.getAnswerRefFor$instabridge_ai_sdk_release();
            if (answerRefFor$instabridge_ai_sdk_release == null || (answerRef = (AnswerRef) answerRefFor$instabridge_ai_sdk_release.invoke(item)) == null) {
                return;
            }
            PopupMenu popupMenu = new PopupMenu(this.moreActionsButton.getContext(), this.moreActionsButton);
            List<AnswerAction> list = answerActions$instabridge_ai_sdk_release;
            int i5 = 0;
            for (Object obj : list) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                AnswerAction answerAction = (AnswerAction) obj;
                MenuItem menuItemAdd = popupMenu.getMenu().add(0, i5, i5, answerAction.getLabel());
                Integer icon = answerAction.getIcon();
                if (icon != null) {
                    menuItemAdd.setIcon(icon.intValue());
                }
                i5 = i11;
            }
            if (Build.VERSION.SDK_INT >= 29 && (!(list instanceof Collection) || !list.isEmpty())) {
                Iterator<T> it = list.iterator();
                while (true) {
                    if (it.hasNext()) {
                        if (((AnswerAction) it.next()).getIcon() != null) {
                            popupMenu.setForceShowIcon(true);
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
            popupMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.instabridge.ai.chat.ui.e0
                @Override // android.widget.PopupMenu.OnMenuItemClickListener
                public final boolean onMenuItemClick(MenuItem menuItem) {
                    return ChatAdapter.AiMessageViewHolder.showAnswerActionsMenu$lambda$18(answerActions$instabridge_ai_sdk_release, answerRef, menuItem);
                }
            });
            popupMenu.setOnDismissListener(new PopupMenu.OnDismissListener() { // from class: com.instabridge.ai.chat.ui.f0
                @Override // android.widget.PopupMenu.OnDismissListener
                public final void onDismiss(PopupMenu popupMenu2) {
                    ChatAdapter.AiMessageViewHolder.showAnswerActionsMenu$lambda$19(this.f35348a, popupMenu2);
                }
            });
            this.answerActionsMenu = popupMenu;
            popupMenu.show();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final boolean showAnswerActionsMenu$lambda$18(List list, AnswerRef answerRef, MenuItem menuItem) {
            AnswerAction answerAction = (AnswerAction) b70.g.Z0(menuItem.getItemId(), list);
            if (answerAction == null) {
                return false;
            }
            try {
                answerAction.getOnClick().invoke(answerRef);
                return true;
            } catch (Exception e3) {
                Log.e(ChatAdapter.TAG, "Host answer action failed", e3);
                return true;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void showAnswerActionsMenu$lambda$19(AiMessageViewHolder aiMessageViewHolder, PopupMenu popupMenu) {
            if (aiMessageViewHolder.answerActionsMenu == popupMenu) {
                aiMessageViewHolder.answerActionsMenu = null;
            }
        }

        private final void showContentView() {
            if (this.usingRecycler) {
                this.markdownRecycler.setVisibility(0);
                this.contentText.setVisibility(8);
            } else {
                this.contentText.setVisibility(0);
                this.markdownRecycler.setVisibility(8);
            }
        }

        private final void showSources(List<ChatMessage.Source> sources) {
            this.sourcesContainer.removeAllViews();
            this.sourcesExpandedList.removeAllViews();
            if (sources.isEmpty()) {
                this.sourcesContainer.setVisibility(8);
                this.sourcesExpandedList.setVisibility(8);
                syncActionAndSourcesRowVisibility();
                return;
            }
            Context context = this.itemView.getContext();
            LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
            View viewInflate = layoutInflaterFrom.inflate(2131624011, (ViewGroup) this.sourcesContainer, false);
            this.sourcesContainer.addView(viewInflate);
            TextView textView = (TextView) viewInflate.findViewById(2131428884);
            ImageView imageView = (ImageView) viewInflate.findViewById(2131428880);
            ImageView imageView2 = (ImageView) viewInflate.findViewById(2131428879);
            textView.setText(sources.size() == 1 ? context.getString(2132017403) : context.getString(2132017402, Integer.valueOf(sources.size())));
            applyBrandGradientToText(textView);
            int i5 = this.shimmerPeach;
            PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
            imageView.setColorFilter(i5, mode);
            imageView2.setColorFilter(this.shimmerOrange, mode);
            int i11 = 0;
            for (Object obj : sources) {
                int i12 = i11 + 1;
                if (i11 < 0) {
                    ul.b.e0();
                    throw null;
                }
                ChatMessage.Source source = (ChatMessage.Source) obj;
                View viewInflate2 = layoutInflaterFrom.inflate(2131624010, (ViewGroup) this.sourcesExpandedList, false);
                ((TextView) viewInflate2.findViewById(2131428877)).setText("[" + i12 + AbstractJsonLexerKt.END_LIST);
                TextView textView2 = (TextView) viewInflate2.findViewById(2131428878);
                String title = source.getTitle();
                if (r70.k.U0(title)) {
                    title = DomainUtils.INSTANCE.extractDomain(source.getUrl());
                }
                textView2.setText(title);
                ((ImageView) viewInflate2.findViewById(2131428876)).setColorFilter(Color.parseColor("#9CA3AF"), PorterDuff.Mode.SRC_IN);
                viewInflate2.setOnClickListener(new z(2, context, source));
                this.sourcesExpandedList.addView(viewInflate2);
                i11 = i12;
            }
            this.sourcesExpanded = false;
            this.sourcesExpandedList.setVisibility(8);
            imageView.setRotation(0.0f);
            viewInflate.setOnClickListener(new z(3, this, imageView));
            this.sourcesContainer.setVisibility(0);
            syncActionAndSourcesRowVisibility();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void showSources$lambda$23$lambda$22(Context context, ChatMessage.Source source, View view) {
            ChatUrlOpeners chatUrlOpeners = ChatUrlOpeners.INSTANCE;
            Intrinsics.d(context);
            chatUrlOpeners.open(context, source.getUrl());
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void showSources$lambda$25(AiMessageViewHolder aiMessageViewHolder, ImageView imageView, View view) {
            boolean z11 = aiMessageViewHolder.sourcesExpanded;
            aiMessageViewHolder.sourcesExpanded = !z11;
            if (z11) {
                aiMessageViewHolder.sourcesExpandedList.setVisibility(8);
                imageView.animate().rotation(0.0f).setDuration(200L).start();
                return;
            }
            aiMessageViewHolder.sourcesExpandedList.setVisibility(0);
            AnimationSet animationSet = new AnimationSet(true);
            animationSet.addAnimation(new TranslateAnimation(0.0f, 0.0f, -40.0f, 0.0f));
            animationSet.addAnimation(new AlphaAnimation(0.0f, 1.0f));
            animationSet.setDuration(200L);
            aiMessageViewHolder.sourcesExpandedList.startAnimation(animationSet);
            imageView.animate().rotation(180.0f).setDuration(200L).start();
        }

        private final void showSuggestions(List<Suggestion> suggestions) {
            stopSuggestionShimmerAnimations();
            this.suggestionsContainer.removeAllViews();
            ArrayList arrayList = new ArrayList();
            for (Object obj : suggestions) {
                Suggestion suggestion = (Suggestion) obj;
                if (Intrinsics.b(suggestion.getType(), "tool_call") || Intrinsics.b(suggestion.getType(), "prompt")) {
                    arrayList.add(obj);
                }
            }
            List listE1 = b70.g.E1(arrayList, 3);
            if (listE1.isEmpty()) {
                this.suggestionsScrollView.setVisibility(8);
                return;
            }
            float f11 = this.itemView.getResources().getDisplayMetrics().density;
            int color = this.itemView.getContext().getColor(2131099741);
            ChatAdapter chatAdapter = this.this$0;
            int i5 = 0;
            for (Object obj2 : listE1) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                Suggestion suggestion2 = (Suggestion) obj2;
                boolean z11 = i5 == 0;
                TextView appCompatButton = new AppCompatButton(this.itemView.getContext(), null);
                appCompatButton.setText(suggestion2.getLabel());
                appCompatButton.setAllCaps(false);
                appCompatButton.setSingleLine(true);
                appCompatButton.setEllipsize(TextUtils.TruncateAt.END);
                appCompatButton.setMaxWidth((int) (PerAppFeatureCatalog.MAX_TOOLS * f11));
                int i12 = (int) (36 * f11);
                appCompatButton.setMinHeight(i12);
                appCompatButton.setMinimumHeight(i12);
                appCompatButton.setTextSize(12.0f);
                int i13 = (int) (12 * f11);
                int i14 = (int) (6 * f11);
                appCompatButton.setPadding(i13, i14, i13, i14);
                if (z11) {
                    GradientDrawable gradientDrawable = new GradientDrawable();
                    gradientDrawable.setShape(0);
                    gradientDrawable.setCornerRadius(18 * f11);
                    gradientDrawable.setColor(appCompatButton.getContext().getColor(2131099704));
                    gradientDrawable.setStroke((int) (1 * f11), appCompatButton.getContext().getColor(2131099716));
                    appCompatButton.setBackground(gradientDrawable);
                    appCompatButton.setTextColor(color);
                } else {
                    GradientDrawable gradientDrawable2 = new GradientDrawable();
                    gradientDrawable2.setShape(0);
                    gradientDrawable2.setCornerRadius(18 * f11);
                    gradientDrawable2.setStroke((int) (1 * f11), appCompatButton.getContext().getColor(2131099716));
                    gradientDrawable2.setColor(appCompatButton.getContext().getColor(17170445));
                    appCompatButton.setBackground(gradientDrawable2);
                    appCompatButton.setTextColor(color);
                }
                appCompatButton.setOnClickListener(new z(0, chatAdapter, suggestion2));
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
                layoutParams.setMarginStart(i14);
                layoutParams.setMarginEnd((int) (2 * f11));
                this.suggestionsContainer.addView(appCompatButton, layoutParams);
                startSuggestionShimmer(appCompatButton, i5);
                i5 = i11;
            }
            this.suggestionsScrollView.setVisibility(0);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void showSuggestions$lambda$33$lambda$31$lambda$30(ChatAdapter chatAdapter, Suggestion suggestion, View view) {
            Function1<Suggestion, Unit> onSuggestionClick = chatAdapter.getOnSuggestionClick();
            if (onSuggestionClick != null) {
                onSuggestionClick.invoke(suggestion);
            }
        }

        private final void showToolStatus(ChatItem.AiMessage item) {
            this.toolStatusContainer.removeAllViews();
            this.toolStatusContainer.setVisibility(8);
        }

        private final void startCursorAnimation() {
            if (this.cursorAnimator != null) {
                return;
            }
            this.typingCursor.setVisibility(0);
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.typingCursor, "alpha", 1.0f, 0.0f);
            objectAnimatorOfFloat.setDuration(500L);
            objectAnimatorOfFloat.setRepeatMode(2);
            objectAnimatorOfFloat.setRepeatCount(-1);
            objectAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            objectAnimatorOfFloat.start();
            this.cursorAnimator = objectAnimatorOfFloat;
        }

        private final void startPulseAnimation() {
            if (this.pulseAnimator != null) {
                return;
            }
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
            valueAnimatorOfFloat.setDuration(1000L);
            valueAnimatorOfFloat.setRepeatCount(-1);
            valueAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.instabridge.ai.chat.ui.y
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ChatAdapter.AiMessageViewHolder.startPulseAnimation$lambda$7$lambda$6(this.f35479a, valueAnimator);
                }
            });
            valueAnimatorOfFloat.start();
            this.pulseAnimator = valueAnimatorOfFloat;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void startPulseAnimation$lambda$7$lambda$6(AiMessageViewHolder aiMessageViewHolder, ValueAnimator animator) {
            Intrinsics.g(animator, "animator");
            Object animatedValue = animator.getAnimatedValue();
            Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
            float fAbs = 1.0f - (Math.abs(0.5f - ((Float) animatedValue).floatValue()) * 2.0f);
            float f11 = (0.25f * fAbs) + 0.9f;
            aiMessageViewHolder.thinkingPulseIndicator.setAlpha((fAbs * 0.65f) + 0.35f);
            aiMessageViewHolder.thinkingPulseIndicator.setScaleX(f11);
            aiMessageViewHolder.thinkingPulseIndicator.setScaleY(f11);
        }

        private final void startShimmerAnimation(TextView textView) {
            ValueAnimator valueAnimator = this.shimmerAnimator;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            this.shimmerAnimator = null;
            textView.post(new d0(textView, this, 1));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void startShimmerAnimation$lambda$5(TextView textView, AiMessageViewHolder aiMessageViewHolder) {
            float fMeasureText = textView.getPaint().measureText(textView.getText().toString());
            if (fMeasureText < 100.0f) {
                fMeasureText = 100.0f;
            }
            float f11 = fMeasureText * 2.0f;
            int i5 = aiMessageViewHolder.shimmerOrange;
            int i11 = aiMessageViewHolder.shimmerPeach;
            LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, f11, 0.0f, new int[]{i5, i11, aiMessageViewHolder.shimmerViolet, i11, i5}, new float[]{0.0f, 0.25f, 0.5f, 0.75f, 1.0f}, Shader.TileMode.REPEAT);
            textView.getPaint().setShader(linearGradient);
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, f11);
            valueAnimatorOfFloat.setDuration(3000L);
            valueAnimatorOfFloat.setRepeatCount(-1);
            valueAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            valueAnimatorOfFloat.addUpdateListener(new b0(textView, 1, linearGradient));
            valueAnimatorOfFloat.start();
            aiMessageViewHolder.shimmerAnimator = valueAnimatorOfFloat;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void startShimmerAnimation$lambda$5$lambda$4$lambda$3(LinearGradient linearGradient, TextView textView, ValueAnimator animator) {
            Intrinsics.g(animator, "animator");
            Object animatedValue = animator.getAnimatedValue();
            Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
            float fFloatValue = ((Float) animatedValue).floatValue();
            Matrix matrix = new Matrix();
            matrix.setTranslate(-fFloatValue, 0.0f);
            linearGradient.setLocalMatrix(matrix);
            textView.invalidate();
        }

        private final void startSuggestionShimmer(TextView button, int index) {
            button.post(new c0(button, this, index, 0));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void startSuggestionShimmer$lambda$37(TextView textView, AiMessageViewHolder aiMessageViewHolder, int i5) {
            if (textView.isAttachedToWindow()) {
                float fMeasureText = textView.getPaint().measureText(textView.getText().toString());
                if (fMeasureText < 80.0f) {
                    fMeasureText = 80.0f;
                }
                float f11 = fMeasureText * 2.0f;
                int i11 = aiMessageViewHolder.shimmerOrange;
                int i12 = aiMessageViewHolder.shimmerPeach;
                LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, f11, 0.0f, new int[]{i11, i12, aiMessageViewHolder.shimmerViolet, i12, i11}, new float[]{0.0f, 0.25f, 0.5f, 0.75f, 1.0f}, Shader.TileMode.REPEAT);
                textView.getPaint().setShader(linearGradient);
                ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, f11);
                valueAnimatorOfFloat.setDuration(3200L);
                valueAnimatorOfFloat.setStartDelay(i5 * 120);
                valueAnimatorOfFloat.setRepeatCount(-1);
                valueAnimatorOfFloat.setInterpolator(new LinearInterpolator());
                valueAnimatorOfFloat.addUpdateListener(new b0(textView, 0, linearGradient));
                valueAnimatorOfFloat.start();
                aiMessageViewHolder.suggestionAnimators.add(valueAnimatorOfFloat);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void startSuggestionShimmer$lambda$37$lambda$36$lambda$35(LinearGradient linearGradient, TextView textView, ValueAnimator valueAnimator) {
            Intrinsics.g(valueAnimator, "valueAnimator");
            Object animatedValue = valueAnimator.getAnimatedValue();
            Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
            float fFloatValue = ((Float) animatedValue).floatValue();
            Matrix matrix = new Matrix();
            matrix.setTranslate(-fFloatValue, 0.0f);
            linearGradient.setLocalMatrix(matrix);
            textView.invalidate();
        }

        private final void syncActionAndSourcesRowVisibility() {
            this.actionAndSourcesRow.setVisibility((this.actionsRow.getVisibility() == 0 || this.sourcesContainer.getVisibility() == 0) ? 0 : 8);
        }

        private final void updateActionsRow(ChatItem.AiMessage item, boolean isLast) {
            int i5 = 8;
            if (item.isError() || r70.k.U0(item.getContent())) {
                this.actionsRow.setVisibility(8);
                return;
            }
            this.actionsRow.setVisibility(0);
            Context context = this.itemView.getContext();
            int color = context.getColor(2131099697);
            int color2 = context.getColor(2131099715);
            int color3 = context.getColor(2131099714);
            ColorStateList colorStateListValueOf = ColorStateList.valueOf(color);
            Intrinsics.f(colorStateListValueOf, "valueOf(...)");
            FeedbackState feedbackState = item.getFeedbackState();
            int i11 = feedbackState == null ? -1 : WhenMappings.$EnumSwitchMapping$0[feedbackState.ordinal()];
            if (i11 == -1) {
                this.thumbUpButton.setImageTintList(colorStateListValueOf);
                this.thumbDownButton.setImageTintList(colorStateListValueOf);
            } else if (i11 == 1) {
                this.thumbUpButton.setImageTintList(ColorStateList.valueOf(color2));
                this.thumbDownButton.setImageTintList(colorStateListValueOf);
            } else {
                if (i11 != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                this.thumbUpButton.setImageTintList(colorStateListValueOf);
                this.thumbDownButton.setImageTintList(ColorStateList.valueOf(color3));
            }
            this.copyButton.setImageTintList(colorStateListValueOf);
            this.regenerateButton.setImageTintList(colorStateListValueOf);
            this.moreActionsButton.setImageTintList(colorStateListValueOf);
            boolean z11 = item.getMessageIndex() >= 0;
            this.thumbUpButton.setVisibility(z11 ? 0 : 8);
            this.thumbDownButton.setVisibility(z11 ? 0 : 8);
            ImageButton imageButton = this.regenerateButton;
            if (this.this$0.getShowRegenerateAction() && isLast) {
                i5 = 0;
            }
            imageButton.setVisibility(i5);
            this.thumbUpButton.setOnClickListener(new a0(item, this.this$0, 0));
            this.thumbDownButton.setOnClickListener(new a0(item, this.this$0, 1));
            this.copyButton.setOnClickListener(new a0(this.this$0, item));
            if (this.this$0.getShowRegenerateAction()) {
                this.regenerateButton.setOnClickListener(new b(this.this$0, 2));
            } else {
                this.regenerateButton.setOnClickListener(null);
            }
            bindMoreActions(item);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void updateActionsRow$lambda$10(ChatItem.AiMessage aiMessage, ChatAdapter chatAdapter, View view) {
            String str = aiMessage.getFeedbackState() == FeedbackState.LIKED ? null : "like";
            Function3<String, Integer, String, Unit> onFeedback = chatAdapter.getOnFeedback();
            if (onFeedback != null) {
                String id2 = aiMessage.getId();
                Integer numValueOf = Integer.valueOf(aiMessage.getMessageIndex());
                if (str == null) {
                    str = "remove_like";
                }
                onFeedback.invoke(id2, numValueOf, str);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void updateActionsRow$lambda$11(ChatItem.AiMessage aiMessage, ChatAdapter chatAdapter, View view) {
            String str = aiMessage.getFeedbackState() == FeedbackState.DISLIKED ? null : "dislike";
            Function3<String, Integer, String, Unit> onFeedback = chatAdapter.getOnFeedback();
            if (onFeedback != null) {
                String id2 = aiMessage.getId();
                Integer numValueOf = Integer.valueOf(aiMessage.getMessageIndex());
                if (str == null) {
                    str = "remove_dislike";
                }
                onFeedback.invoke(id2, numValueOf, str);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void updateActionsRow$lambda$12(ChatAdapter chatAdapter, ChatItem.AiMessage aiMessage, View view) {
            Function1<String, Unit> onCopy = chatAdapter.getOnCopy();
            if (onCopy != null) {
                onCopy.invoke(aiMessage.getContent());
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void updateActionsRow$lambda$13(ChatAdapter chatAdapter, View view) {
            Function0<Unit> onRegenerate = chatAdapter.getOnRegenerate();
            if (onRegenerate != null) {
                onRegenerate.invoke();
            }
        }

        public static /* synthetic */ void updateText$default(AiMessageViewHolder aiMessageViewHolder, ChatItem.AiMessage aiMessage, boolean z11, int i5, Object obj) {
            if ((i5 & 2) != 0) {
                z11 = false;
            }
            aiMessageViewHolder.updateText(aiMessage, z11);
        }

        private final void updateThinkingState(ChatItem.AiMessage item) {
            String thinkingText;
            if (!r70.k.U0(item.getContent()) || (thinkingText = item.getThinkingText()) == null || r70.k.U0(thinkingText)) {
                hideThinking();
                showContentView();
                startCursorAnimation();
                return;
            }
            String thinkingText2 = item.getThinkingText();
            if (thinkingText2 == null) {
                return;
            }
            setThinkingTextWithCrossfade(thinkingText2);
            this.thinkingContainer.setVisibility(0);
            startShimmerAnimation(this.thinkingText);
            startPulseAnimation();
            hideContentView();
            stopCursorAnimation();
        }

        public final void bind(@NotNull ChatItem.AiMessage item, boolean isLast) {
            Integer aiTextColor;
            Intrinsics.g(item, "item");
            PreparedMarkdown preparedMarkdownPrepareMarkdown = prepareMarkdown(item);
            renderMarkdownSafely(item, preparedMarkdownPrepareMarkdown);
            ChatTheme theme = this.this$0.getTheme();
            if (theme != null && (aiTextColor = theme.getAiTextColor()) != null) {
                this.contentText.setTextColor(aiTextColor.intValue());
            }
            if (item.isStreaming()) {
                updateThinkingState(item);
                this.suggestionsScrollView.setVisibility(8);
                stopSuggestionShimmerAnimations();
                this.sourcesContainer.setVisibility(8);
                this.sourcesExpandedList.setVisibility(8);
                this.actionsRow.setVisibility(8);
                this.actionAndSourcesRow.setVisibility(8);
            } else {
                hideThinking();
                stopCursorAnimation();
                if (r70.k.U0(item.getContent())) {
                    hideContentView();
                } else {
                    showContentView();
                }
                this.suggestionsScrollView.setVisibility(8);
                stopSuggestionShimmerAnimations();
                showSources(preparedMarkdownPrepareMarkdown.getNormalizedSources());
                updateActionsRow(item, isLast);
                syncActionAndSourcesRowVisibility();
            }
            showToolStatus(item);
        }

        public final void dismissAnswerActionsMenu() {
            PopupMenu popupMenu = this.answerActionsMenu;
            if (popupMenu == null) {
                return;
            }
            this.answerActionsMenu = null;
            popupMenu.dismiss();
        }

        @NotNull
        public final TextView getContentText() {
            return this.contentText;
        }

        public final void stopCursorAnimation() {
            ObjectAnimator objectAnimator = this.cursorAnimator;
            if (objectAnimator != null) {
                objectAnimator.cancel();
            }
            this.cursorAnimator = null;
            this.typingCursor.setVisibility(8);
        }

        public final void stopPulseAnimation() {
            ValueAnimator valueAnimator = this.pulseAnimator;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            this.pulseAnimator = null;
            this.thinkingPulseIndicator.setAlpha(1.0f);
            this.thinkingPulseIndicator.setScaleX(1.0f);
            this.thinkingPulseIndicator.setScaleY(1.0f);
        }

        public final void stopShimmerAnimation() {
            ValueAnimator valueAnimator = this.shimmerAnimator;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            this.shimmerAnimator = null;
            this.thinkingText.getPaint().setShader(null);
        }

        public final void stopSuggestionShimmerAnimations() {
            Iterator<ValueAnimator> it = this.suggestionAnimators.iterator();
            while (it.hasNext()) {
                it.next().cancel();
            }
            this.suggestionAnimators.clear();
            int childCount = this.suggestionsContainer.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = this.suggestionsContainer.getChildAt(i5);
                TextView textView = childAt instanceof TextView ? (TextView) childAt : null;
                if (textView != null) {
                    textView.getPaint().setShader(null);
                    textView.invalidate();
                }
            }
        }

        public final void updateText(@NotNull ChatItem.AiMessage item, boolean isLast) {
            Intrinsics.g(item, "item");
            PreparedMarkdown preparedMarkdownPrepareMarkdown = prepareMarkdown(item);
            renderMarkdownSafely(item, preparedMarkdownPrepareMarkdown);
            if (item.isStreaming()) {
                updateThinkingState(item);
                this.sourcesContainer.setVisibility(8);
                this.sourcesExpandedList.setVisibility(8);
                this.actionsRow.setVisibility(8);
                this.actionAndSourcesRow.setVisibility(8);
                this.suggestionsScrollView.setVisibility(8);
                stopSuggestionShimmerAnimations();
            } else {
                hideThinking();
                stopCursorAnimation();
                if (r70.k.U0(item.getContent())) {
                    hideContentView();
                } else {
                    showContentView();
                }
                this.suggestionsScrollView.setVisibility(8);
                stopSuggestionShimmerAnimations();
                showSources(preparedMarkdownPrepareMarkdown.getNormalizedSources());
                updateActionsRow(item, isLast);
                syncActionAndSourcesRowVisibility();
            }
            showToolStatus(item);
        }
    }

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\b\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\n\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\tJ!\u0010\f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$ChatDiffCallback;", "Landroidx/recyclerview/widget/t;", "Lcom/instabridge/ai/chat/model/ChatItem;", "<init>", "()V", "oldItem", "newItem", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "areItemsTheSame", "(Lcom/instabridge/ai/chat/model/ChatItem;Lcom/instabridge/ai/chat/model/ChatItem;)Z", "areContentsTheSame", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getChangePayload", "(Lcom/instabridge/ai/chat/model/ChatItem;Lcom/instabridge/ai/chat/model/ChatItem;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ChatDiffCallback extends androidx.recyclerview.widget.t {
        @Override // androidx.recyclerview.widget.t
        public boolean areContentsTheSame(@NotNull ChatItem oldItem, @NotNull ChatItem newItem) {
            Intrinsics.g(oldItem, "oldItem");
            Intrinsics.g(newItem, "newItem");
            return oldItem.equals(newItem);
        }

        @Override // androidx.recyclerview.widget.t
        public boolean areItemsTheSame(@NotNull ChatItem oldItem, @NotNull ChatItem newItem) {
            Intrinsics.g(oldItem, "oldItem");
            Intrinsics.g(newItem, "newItem");
            return Intrinsics.b(oldItem.getId(), newItem.getId());
        }

        @Override // androidx.recyclerview.widget.t
        @Nullable
        public Object getChangePayload(@NotNull ChatItem oldItem, @NotNull ChatItem newItem) {
            Intrinsics.g(oldItem, "oldItem");
            Intrinsics.g(newItem, "newItem");
            if ((oldItem instanceof ChatItem.AiMessage) && (newItem instanceof ChatItem.AiMessage)) {
                ChatItem.AiMessage aiMessage = (ChatItem.AiMessage) oldItem;
                ChatItem.AiMessage aiMessage2 = (ChatItem.AiMessage) newItem;
                if (!Intrinsics.b(aiMessage.getContent(), aiMessage2.getContent()) || aiMessage.isStreaming() != aiMessage2.isStreaming() || !Intrinsics.b(aiMessage.getActiveToolCalls(), aiMessage2.getActiveToolCalls()) || aiMessage.getFeedbackState() != aiMessage2.getFeedbackState() || !Intrinsics.b(aiMessage.getThinkingText(), aiMessage2.getThinkingText())) {
                    return ChatAdapter.PAYLOAD_TEXT_UPDATE;
                }
            }
            if (!(oldItem instanceof ChatItem.ToolCallCard) || !(newItem instanceof ChatItem.ToolCallCard)) {
                return null;
            }
            ChatItem.ToolCallCard toolCallCard = (ChatItem.ToolCallCard) oldItem;
            ChatItem.ToolCallCard toolCallCard2 = (ChatItem.ToolCallCard) newItem;
            if (toolCallCard.isCompleted() == toolCallCard2.isCompleted() && Intrinsics.b(toolCallCard.getSelectedLabel(), toolCallCard2.getSelectedLabel())) {
                return null;
            }
            return ChatAdapter.PAYLOAD_TOOL_CARD_UPDATE;
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0082\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00030\b¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u0015\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00030\bHÆ\u0003J9\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0014\b\u0002\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00030\bHÆ\u0001J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\tHÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u001d\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00030\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001b"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$PreparedMarkdown;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "markdown", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "normalizedSources", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "codeBlocks", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)V", "getMarkdown", "()Ljava/lang/String;", "getNormalizedSources", "()Ljava/util/List;", "getCodeBlocks", "()Ljava/util/Map;", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PreparedMarkdown {

        @NotNull
        private final Map<Integer, String> codeBlocks;

        @NotNull
        private final String markdown;

        @NotNull
        private final List<ChatMessage.Source> normalizedSources;

        public PreparedMarkdown(@NotNull String markdown, @NotNull List<ChatMessage.Source> normalizedSources, @NotNull Map<Integer, String> codeBlocks) {
            Intrinsics.g(markdown, "markdown");
            Intrinsics.g(normalizedSources, "normalizedSources");
            Intrinsics.g(codeBlocks, "codeBlocks");
            this.markdown = markdown;
            this.normalizedSources = normalizedSources;
            this.codeBlocks = codeBlocks;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PreparedMarkdown copy$default(PreparedMarkdown preparedMarkdown, String str, List list, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = preparedMarkdown.markdown;
            }
            if ((i5 & 2) != 0) {
                list = preparedMarkdown.normalizedSources;
            }
            if ((i5 & 4) != 0) {
                map = preparedMarkdown.codeBlocks;
            }
            return preparedMarkdown.copy(str, list, map);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMarkdown() {
            return this.markdown;
        }

        @NotNull
        public final List<ChatMessage.Source> component2() {
            return this.normalizedSources;
        }

        @NotNull
        public final Map<Integer, String> component3() {
            return this.codeBlocks;
        }

        @NotNull
        public final PreparedMarkdown copy(@NotNull String markdown, @NotNull List<ChatMessage.Source> normalizedSources, @NotNull Map<Integer, String> codeBlocks) {
            Intrinsics.g(markdown, "markdown");
            Intrinsics.g(normalizedSources, "normalizedSources");
            Intrinsics.g(codeBlocks, "codeBlocks");
            return new PreparedMarkdown(markdown, normalizedSources, codeBlocks);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreparedMarkdown)) {
                return false;
            }
            PreparedMarkdown preparedMarkdown = (PreparedMarkdown) other;
            return Intrinsics.b(this.markdown, preparedMarkdown.markdown) && Intrinsics.b(this.normalizedSources, preparedMarkdown.normalizedSources) && Intrinsics.b(this.codeBlocks, preparedMarkdown.codeBlocks);
        }

        @NotNull
        public final Map<Integer, String> getCodeBlocks() {
            return this.codeBlocks;
        }

        @NotNull
        public final String getMarkdown() {
            return this.markdown;
        }

        @NotNull
        public final List<ChatMessage.Source> getNormalizedSources() {
            return this.normalizedSources;
        }

        public int hashCode() {
            return this.codeBlocks.hashCode() + u4.c(this.markdown.hashCode() * 31, 31, this.normalizedSources);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("PreparedMarkdown(markdown=");
            sb2.append(this.markdown);
            sb2.append(", normalizedSources=");
            sb2.append(this.normalizedSources);
            sb2.append(", codeBlocks=");
            return c9.l(sb2, this.codeBlocks, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$SystemMessageViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "view", "<init>", "(Lcom/instabridge/ai/chat/ui/ChatAdapter;Landroid/view/View;)V", "Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;)V", "Landroid/widget/TextView;", "messageText", "Landroid/widget/TextView;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public final class SystemMessageViewHolder extends s2 {

        @NotNull
        private final TextView messageText;
        final /* synthetic */ ChatAdapter this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SystemMessageViewHolder(@NotNull ChatAdapter chatAdapter, View view) {
            super(view);
            Intrinsics.g(view, "view");
            this.this$0 = chatAdapter;
            View viewFindViewById = view.findViewById(2131428961);
            Intrinsics.f(viewFindViewById, "findViewById(...)");
            this.messageText = (TextView) viewFindViewById;
        }

        public final void bind(@NotNull ChatItem.SystemMessage item) {
            Integer timestampColor;
            Intrinsics.g(item, "item");
            this.messageText.setText(item.getText());
            ChatTheme theme = this.this$0.getTheme();
            if (theme == null || (timestampColor = theme.getTimestampColor()) == null) {
                return;
            }
            this.messageText.setTextColor(timestampColor.intValue());
        }
    }

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u001f\u0010\r\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\r\u0010\fJ\u001f\u0010\u000e\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u000e\u0010\fJ\u001f\u0010\u000f\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u000f\u0010\fJ\u0017\u0010\u0010\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\u0012\u0010\u0011J\u0015\u0010\u0013\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0013\u0010\u0011R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0014R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$ToolCallCardViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/widget/FrameLayout;", "container", "<init>", "(Lcom/instabridge/ai/chat/ui/ChatAdapter;Landroid/widget/FrameLayout;)V", "Landroid/view/LayoutInflater;", "inflater", "Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bindAskClarification", "(Landroid/view/LayoutInflater;Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;)V", "bindConfirmAction", "bindInputForm", "bindShowChart", "bindGenericToolCall", "(Lcom/instabridge/ai/chat/model/ChatItem$ToolCallCard;)V", "updateCompletedState", "bind", "Landroid/widget/FrameLayout;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "boundCallId", "Ljava/lang/String;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public final class ToolCallCardViewHolder extends s2 {

        @Nullable
        private String boundCallId;

        @NotNull
        private final FrameLayout container;
        final /* synthetic */ ChatAdapter this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ToolCallCardViewHolder(@NotNull ChatAdapter chatAdapter, FrameLayout container) {
            super(container);
            Intrinsics.g(container, "container");
            this.this$0 = chatAdapter;
            this.container = container;
        }

        private final void bindAskClarification(LayoutInflater inflater, final ChatItem.ToolCallCard item) {
            ArrayList<Map> arrayList;
            View viewInflate = inflater.inflate(2131624012, (ViewGroup) this.container, false);
            this.container.addView(viewInflate);
            TextView textView = (TextView) viewInflate.findViewById(2131428662);
            FlexboxLayout flexboxLayout = (FlexboxLayout) viewInflate.findViewById(2131427672);
            View viewFindViewById = viewInflate.findViewById(2131427800);
            final EditText editText = (EditText) viewInflate.findViewById(2131427799);
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
            Context context = this.container.getContext();
            float f11 = context.getResources().getDisplayMetrics().density;
            int color = context.getColor(2131099741);
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
                        ChatAdapter chatAdapter = this.this$0;
                        textView4.setText(str2);
                        textView4.setTextSize(14.0f);
                        textView4.setTextColor(color);
                        textView4.setBackground(context.getDrawable(2131231054));
                        int i5 = (int) (14 * f11);
                        int i11 = (int) (8 * f11);
                        textView4.setPadding(i5, i11, i5, i11);
                        textView4.setClickable(true);
                        textView4.setFocusable(true);
                        textView4.setOnClickListener(new h0(chatAdapter, item, str3));
                        FlexboxLayout.LayoutParams layoutParams = new FlexboxLayout.LayoutParams();
                        int i12 = (int) (4 * f11);
                        layoutParams.setMargins(0, i12, (int) (6 * f11), i12);
                        flexboxLayout.addView(textView4, layoutParams);
                    }
                }
            }
            final ChatAdapter chatAdapter2 = this.this$0;
            Function0 function0 = new Function0() { // from class: com.instabridge.ai.chat.ui.j0
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return ChatAdapter.ToolCallCardViewHolder.bindAskClarification$lambda$3(editText, chatAdapter2, item);
                }
            };
            imageButton.setOnClickListener(new b(function0, 3));
            editText.setOnEditorActionListener(new k0(function0, 0));
            textView2.setOnClickListener(new i0(this.this$0, item, 2));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void bindAskClarification$lambda$1$lambda$0(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, String str, View view) {
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult = chatAdapter.getOnToolResult();
            if (onToolResult != null) {
                onToolResult.invoke(toolCallCard.getCallId(), b70.k.e0(new Pair("answer", str)), null);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit bindAskClarification$lambda$3(EditText editText, ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard) {
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult;
            String string = r70.k.u1(editText.getText().toString()).toString();
            if (string.length() > 0 && (onToolResult = chatAdapter.getOnToolResult()) != null) {
                onToolResult.invoke(toolCallCard.getCallId(), b70.k.e0(new Pair("answer", string)), null);
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
        public static final void bindAskClarification$lambda$6(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, View view) {
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult = chatAdapter.getOnToolResult();
            if (onToolResult != null) {
                onToolResult.invoke(toolCallCard.getCallId(), MapsKt.j0(new Pair("answer", "skip"), new Pair("skipped", Boolean.TRUE)), null);
            }
        }

        private final void bindConfirmAction(LayoutInflater inflater, ChatItem.ToolCallCard item) {
            View viewInflate = inflater.inflate(2131624013, (ViewGroup) this.container, false);
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
                button.setOnClickListener(new i0(this.this$0, item, 0));
                button2.setOnClickListener(new i0(this.this$0, item, 1));
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
        public static final void bindConfirmAction$lambda$8(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, View view) {
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult = chatAdapter.getOnToolResult();
            if (onToolResult != null) {
                onToolResult.invoke(toolCallCard.getCallId(), b70.k.e0(new Pair("confirmed", Boolean.TRUE)), null);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void bindConfirmAction$lambda$9(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, View view) {
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult = chatAdapter.getOnToolResult();
            if (onToolResult != null) {
                onToolResult.invoke(toolCallCard.getCallId(), MapsKt.j0(new Pair("confirmed", Boolean.FALSE), new Pair("cancelled", Boolean.TRUE)), null);
            }
        }

        private final void bindGenericToolCall(ChatItem.ToolCallCard item) {
            String selectedLabel;
            Context context = this.container.getContext();
            float f11 = context.getResources().getDisplayMetrics().density;
            int i5 = (int) (14 * f11);
            int i11 = (int) (12 * f11);
            LinearLayout linearLayout = new LinearLayout(context);
            linearLayout.setOrientation(1);
            linearLayout.setBackground(context.getDrawable(2131231120));
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
            interactiveChatTextView.setTextColor(context.getColor(2131099711));
            interactiveChatTextView.setHighlightColor(context.getColor(2131099740));
            interactiveChatTextView.setLinkTextColor(context.getColor(2131099718));
            linearLayout.addView(interactiveChatTextView);
            String string = (!item.isCompleted() || (selectedLabel = item.getSelectedLabel()) == null || r70.k.U0(selectedLabel)) ? item.isCompleted() ? context.getString(2132017407) : ThinkingMessages.INSTANCE.getToolThinkingMessage(item.getToolName(), item.getArguments()) : item.getSelectedLabel();
            InteractiveChatTextView interactiveChatTextView2 = new InteractiveChatTextView(context, null, 0, 6, null);
            interactiveChatTextView2.setText(string);
            interactiveChatTextView2.setTextIsSelectable(true);
            interactiveChatTextView2.setTextSize(13.0f);
            interactiveChatTextView2.setTextColor(context.getColor(2131099730));
            interactiveChatTextView2.setHighlightColor(context.getColor(2131099740));
            interactiveChatTextView2.setLinkTextColor(context.getColor(2131099718));
            interactiveChatTextView2.setPadding(0, (int) (6 * f11), 0, 0);
            linearLayout.addView(interactiveChatTextView2);
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:99:0x0220  */
        /* JADX WARN: Type inference failed for: r2v22, types: [java.util.ArrayList] */
        /* JADX WARN: Type inference failed for: r2v8, types: [kotlin.collections.EmptyList] */
        /* JADX WARN: Type inference failed for: r2v9, types: [java.util.List] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        private final void bindInputForm(LayoutInflater inflater, ChatItem.ToolCallCard item) {
            ?? arrayList;
            ArrayList arrayList2;
            int i5;
            boolean z11;
            View viewInflate = inflater.inflate(2131624014, (ViewGroup) this.container, false);
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
            Context context = this.container.getContext();
            float f11 = context.getResources().getDisplayMetrics().density;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
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
                    String str7 = str6 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str6;
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
                    String str8 = str5;
                    String str9 = str3;
                    float f12 = f11;
                    Iterator it2 = it;
                    InteractiveChatTextView interactiveChatTextView = new InteractiveChatTextView(context, null, 0, 6, null);
                    interactiveChatTextView.setText(str4);
                    interactiveChatTextView.setTextIsSelectable(true);
                    interactiveChatTextView.setTextSize(12.0f);
                    interactiveChatTextView.setTextColor(context.getColor(2131099730));
                    interactiveChatTextView.setHighlightColor(context.getColor(2131099740));
                    interactiveChatTextView.setLinkTextColor(context.getColor(2131099718));
                    interactiveChatTextView.setPadding(0, (int) (8 * f12), 0, (int) (4 * f12));
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
                        final EditText editText = new EditText(context);
                        editText.setHint(str7);
                        editText.setHintTextColor(context.getColor(2131099720));
                        editText.setTextColor(context.getColor(2131099711));
                        editText.setInputType(i5);
                        editText.setBackground(context.getDrawable(2131231051));
                        editText.setTextSize(14.0f);
                        int i11 = (int) (10 * f12);
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
                        final int i12 = 1;
                        linkedHashMap.put(str9, new Function0() { // from class: com.instabridge.ai.chat.ui.g0
                            @Override // kotlin.jvm.functions.Function0
                            public final Object invoke() {
                                switch (i12) {
                                    case 0:
                                        return ChatAdapter.ToolCallCardViewHolder.bindInputForm$lambda$12((Spinner) editText);
                                    default:
                                        return ChatAdapter.ToolCallCardViewHolder.bindInputForm$lambda$14((EditText) editText);
                                }
                            }
                        });
                        f11 = f12;
                        it = it2;
                    } else {
                        final Spinner spinner = new Spinner(context);
                        spinner.setAdapter((SpinnerAdapter) new ArrayAdapter(context, 17367049, arrayList2));
                        linearLayout.addView(spinner);
                        final int i13 = 0;
                        linkedHashMap.put(str9, new Function0() { // from class: com.instabridge.ai.chat.ui.g0
                            @Override // kotlin.jvm.functions.Function0
                            public final Object invoke() {
                                switch (i13) {
                                    case 0:
                                        return ChatAdapter.ToolCallCardViewHolder.bindInputForm$lambda$12((Spinner) spinner);
                                    default:
                                        return ChatAdapter.ToolCallCardViewHolder.bindInputForm$lambda$14((EditText) spinner);
                                }
                            }
                        });
                        f11 = f12;
                        it = it2;
                    }
                }
            }
            button.setOnClickListener(new h0(0, linkedHashMap, this.this$0, item));
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
        public static final void bindInputForm$lambda$16(Map map, ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, View view) {
            LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
            for (Map.Entry entry : map.entrySet()) {
                linkedHashMap.put(entry.getKey(), (String) ((Function0) entry.getValue()).invoke());
            }
            Function3<String, Map<String, ? extends Object>, String, Unit> onToolResult = chatAdapter.getOnToolResult();
            if (onToolResult != null) {
                onToolResult.invoke(toolCallCard.getCallId(), linkedHashMap, null);
            }
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
            View viewInflate = inflater.inflate(2131624015, (ViewGroup) this.container, false);
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
            int color = context.getColor(2131099693);
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
                interactiveChatTextView.setTextColor(context.getColor(2131099730));
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
                interactiveChatTextView2.setTextColor(context.getColor(2131099711));
                interactiveChatTextView2.setHighlightColor(context.getColor(2131099740));
                interactiveChatTextView2.setLinkTextColor(context.getColor(2131099718));
                linearLayout.addView(interactiveChatTextView2);
                r12.addView(linearLayout);
                color = i12;
                dDoubleValue2 = d5;
                i5 = 0;
            }
        }

        private final void updateCompletedState(ChatItem.ToolCallCard item) {
            if (item.isCompleted()) {
                this.boundCallId = null;
                bind(item);
            }
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

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\rR\u0014\u0010\u000e\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\rR\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatAdapter$UserMessageViewHolder;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "view", "<init>", "(Lcom/instabridge/ai/chat/ui/ChatAdapter;Landroid/view/View;)V", "Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;)V", "Landroid/widget/TextView;", "messageText", "Landroid/widget/TextView;", "timestamp", "Ljava/text/SimpleDateFormat;", "timeFormat", "Ljava/text/SimpleDateFormat;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public final class UserMessageViewHolder extends s2 {

        @NotNull
        private final TextView messageText;
        final /* synthetic */ ChatAdapter this$0;

        @NotNull
        private final SimpleDateFormat timeFormat;

        @NotNull
        private final TextView timestamp;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public UserMessageViewHolder(@NotNull ChatAdapter chatAdapter, View view) {
            super(view);
            Intrinsics.g(view, "view");
            this.this$0 = chatAdapter;
            View viewFindViewById = view.findViewById(2131429107);
            Intrinsics.f(viewFindViewById, "findViewById(...)");
            this.messageText = (TextView) viewFindViewById;
            View viewFindViewById2 = view.findViewById(2131429108);
            Intrinsics.f(viewFindViewById2, "findViewById(...)");
            this.timestamp = (TextView) viewFindViewById2;
            this.timeFormat = new SimpleDateFormat("h:mm a", Locale.getDefault());
        }

        public final void bind(@NotNull ChatItem.UserMessage item) {
            Intrinsics.g(item, "item");
            this.messageText.setText(item.getContent());
            this.timestamp.setText(this.timeFormat.format(new Date(item.getTimestamp())));
            ChatTheme theme = this.this$0.getTheme();
            if (theme != null) {
                Integer userBubbleBackground = theme.getUserBubbleBackground();
                if (userBubbleBackground != null) {
                    int iIntValue = userBubbleBackground.intValue();
                    Drawable background = this.messageText.getBackground();
                    Drawable drawableMutate = background != null ? background.mutate() : null;
                    if (drawableMutate instanceof GradientDrawable) {
                        ((GradientDrawable) drawableMutate).setColor(iIntValue);
                    } else if (drawableMutate != null) {
                        drawableMutate.setColorFilter(new PorterDuffColorFilter(iIntValue, PorterDuff.Mode.SRC_IN));
                    }
                    this.messageText.setBackground(drawableMutate);
                }
                Integer userBubbleTextColor = theme.getUserBubbleTextColor();
                if (userBubbleTextColor != null) {
                    this.messageText.setTextColor(userBubbleTextColor.intValue());
                }
                Integer timestampColor = theme.getTimestampColor();
                if (timestampColor != null) {
                    this.timestamp.setTextColor(timestampColor.intValue());
                }
            }
        }
    }

    public ChatAdapter() {
        super(new ChatDiffCallback());
        this.showRegenerateAction = true;
        this.answerActions = EmptyList.f71733a;
    }

    @NotNull
    public final List<AnswerAction> getAnswerActions$instabridge_ai_sdk_release() {
        return this.answerActions;
    }

    @Nullable
    public final Function1<ChatItem.AiMessage, AnswerRef> getAnswerRefFor$instabridge_ai_sdk_release() {
        return this.answerRefFor;
    }

    @Override // androidx.recyclerview.widget.m1
    public int getItemViewType(int position) {
        ChatItem chatItem = (ChatItem) getItem(position);
        if (chatItem instanceof ChatItem.UserMessage) {
            return 0;
        }
        if (chatItem instanceof ChatItem.AiMessage) {
            return 1;
        }
        if (chatItem instanceof ChatItem.SystemMessage) {
            return 2;
        }
        if (chatItem instanceof ChatItem.ToolCallCard) {
            return 3;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Nullable
    public final Function1<String, Unit> getOnCopy() {
        return this.onCopy;
    }

    @Nullable
    public final Function3<String, Integer, String, Unit> getOnFeedback() {
        return this.onFeedback;
    }

    @Nullable
    public final Function0<Unit> getOnRegenerate() {
        return this.onRegenerate;
    }

    @Nullable
    public final Function1<Suggestion, Unit> getOnSuggestionClick() {
        return this.onSuggestionClick;
    }

    @Nullable
    public final Function3<String, Map<String, ? extends Object>, String, Unit> getOnToolResult() {
        return this.onToolResult;
    }

    public final boolean getShowRegenerateAction() {
        return this.showRegenerateAction;
    }

    @Nullable
    public final ChatTheme getTheme() {
        return this.theme;
    }

    @Override // androidx.recyclerview.widget.m1
    public void onBindViewHolder(@NotNull s2 holder, int position) {
        Intrinsics.g(holder, "holder");
        boolean z11 = position == getItemCount() - 1;
        ChatItem chatItem = (ChatItem) getItem(position);
        if (chatItem instanceof ChatItem.UserMessage) {
            ((UserMessageViewHolder) holder).bind((ChatItem.UserMessage) chatItem);
            return;
        }
        if (chatItem instanceof ChatItem.AiMessage) {
            ((AiMessageViewHolder) holder).bind((ChatItem.AiMessage) chatItem, z11);
        } else if (chatItem instanceof ChatItem.SystemMessage) {
            ((SystemMessageViewHolder) holder).bind((ChatItem.SystemMessage) chatItem);
        } else {
            if (!(chatItem instanceof ChatItem.ToolCallCard)) {
                throw new NoWhenBranchMatchedException();
            }
            ((ToolCallCardViewHolder) holder).bind((ChatItem.ToolCallCard) chatItem);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    @NotNull
    public s2 onCreateViewHolder(@NotNull ViewGroup parent, int viewType) {
        Intrinsics.g(parent, "parent");
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(parent.getContext());
        if (viewType == 0) {
            View viewInflate = layoutInflaterFrom.inflate(2131623985, parent, false);
            Intrinsics.f(viewInflate, "inflate(...)");
            return new UserMessageViewHolder(this, viewInflate);
        }
        if (viewType == 1) {
            View viewInflate2 = layoutInflaterFrom.inflate(2131623983, parent, false);
            Intrinsics.f(viewInflate2, "inflate(...)");
            return new AiMessageViewHolder(this, viewInflate2);
        }
        if (viewType == 2) {
            View viewInflate3 = layoutInflaterFrom.inflate(2131623984, parent, false);
            Intrinsics.f(viewInflate3, "inflate(...)");
            return new SystemMessageViewHolder(this, viewInflate3);
        }
        if (viewType != 3) {
            throw new IllegalArgumentException(b.c0.h(viewType, "Unknown view type: "));
        }
        FrameLayout frameLayout = new FrameLayout(parent.getContext());
        frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        return new ToolCallCardViewHolder(this, frameLayout);
    }

    @Override // androidx.recyclerview.widget.m1
    public void onViewRecycled(@NotNull s2 holder) {
        Intrinsics.g(holder, "holder");
        super.onViewRecycled(holder);
        if (holder instanceof AiMessageViewHolder) {
            AiMessageViewHolder aiMessageViewHolder = (AiMessageViewHolder) holder;
            aiMessageViewHolder.dismissAnswerActionsMenu();
            aiMessageViewHolder.stopCursorAnimation();
            aiMessageViewHolder.stopShimmerAnimation();
            aiMessageViewHolder.stopPulseAnimation();
            aiMessageViewHolder.stopSuggestionShimmerAnimations();
        }
    }

    public final void setAnswerActions$instabridge_ai_sdk_release(@NotNull List<AnswerAction> list) {
        Intrinsics.g(list, "<set-?>");
        this.answerActions = list;
    }

    public final void setAnswerRefFor$instabridge_ai_sdk_release(@Nullable Function1<? super ChatItem.AiMessage, AnswerRef> function1) {
        this.answerRefFor = function1;
    }

    public final void setOnCopy(@Nullable Function1<? super String, Unit> function1) {
        this.onCopy = function1;
    }

    public final void setOnFeedback(@Nullable Function3<? super String, ? super Integer, ? super String, Unit> function3) {
        this.onFeedback = function3;
    }

    public final void setOnRegenerate(@Nullable Function0<Unit> function0) {
        this.onRegenerate = function0;
    }

    public final void setOnSuggestionClick(@Nullable Function1<? super Suggestion, Unit> function1) {
        this.onSuggestionClick = function1;
    }

    public final void setOnToolResult(@Nullable Function3<? super String, ? super Map<String, ? extends Object>, ? super String, Unit> function3) {
        this.onToolResult = function3;
    }

    public final void setShowRegenerateAction(boolean z11) {
        this.showRegenerateAction = z11;
    }

    public final void setTheme(@Nullable ChatTheme chatTheme) {
        this.theme = chatTheme;
    }

    @Override // androidx.recyclerview.widget.m1
    public void onBindViewHolder(@NotNull s2 holder, int position, @NotNull List<Object> payloads) {
        Intrinsics.g(holder, "holder");
        Intrinsics.g(payloads, "payloads");
        if (payloads.isEmpty()) {
            onBindViewHolder(holder, position);
            return;
        }
        ChatItem chatItem = (ChatItem) getItem(position);
        boolean z11 = position == getItemCount() - 1;
        if ((chatItem instanceof ChatItem.AiMessage) && (holder instanceof AiMessageViewHolder)) {
            ((AiMessageViewHolder) holder).updateText((ChatItem.AiMessage) chatItem, z11);
        } else if ((chatItem instanceof ChatItem.ToolCallCard) && (holder instanceof ToolCallCardViewHolder)) {
            ((ToolCallCardViewHolder) holder).bind((ChatItem.ToolCallCard) chatItem);
        }
    }
}
