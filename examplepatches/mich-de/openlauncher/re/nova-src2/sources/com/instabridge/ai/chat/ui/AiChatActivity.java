package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import androidx.activity.result.contract.ActivityResultContracts$RequestPermission;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.h1;
import com.instabridge.ai.chat.model.BubbleContext;
import com.instabridge.ai.chat.ui.AiChatView;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.i2;
import t70.y0;

@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b\u0017\u0018\u0000 )2\u00020\u0001:\u0001)B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0014¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\n\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0004H\u0014¢\u0006\u0004\b\n\u0010\bJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u0017\u0010\u0013\u001a\u00020\r2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0006H\u0014¢\u0006\u0004\b\u0015\u0010\u0003R\u0016\u0010\u0017\u001a\u00020\u00168\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018R\u0014\u0010\u001a\u001a\u00020\u00198\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010\u001bR\u001e\u0010\u001d\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u001c8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\"\u0010\"\u001a\u0010\u0012\f\u0012\n !*\u0004\u0018\u00010 0 0\u001f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\"\u0010#R4\u0010'\u001a \b\u0001\u0012\u0004\u0012\u00020 \u0012\n\u0012\b\u0012\u0004\u0012\u00020\r0%\u0012\u0006\u0012\u0004\u0018\u00010&\u0018\u00010$8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b'\u0010(¨\u0006*"}, d2 = {"Lcom/instabridge/ai/chat/ui/AiChatActivity;", "Lm/m;", "<init>", "()V", "Landroid/os/Bundle;", "savedInstanceState", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onCreate", "(Landroid/os/Bundle;)V", "outState", "onSaveInstanceState", "Landroid/view/Menu;", "menu", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onCreateOptionsMenu", "(Landroid/view/Menu;)Z", "onPrepareOptionsMenu", "Landroid/view/MenuItem;", "item", "onOptionsItemSelected", "(Landroid/view/MenuItem;)Z", "onDestroy", "Lcom/instabridge/ai/chat/ui/AiChatView;", "chatView", "Lcom/instabridge/ai/chat/ui/AiChatView;", "Lt70/j0;", "scope", "Lt70/j0;", "Lt70/l;", "permissionContinuation", "Lt70/l;", "Lj/c;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin.jvm.PlatformType", "permissionLauncher", "Lj/c;", "Lkotlin/Function2;", "Lkotlin/coroutines/Continuation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "myPermissionRequester", "Lkotlin/jvm/functions/Function2;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public class AiChatActivity extends m.m {

    @NotNull
    public static final String EXTRA_BUBBLE_CONTEXT = "com.instabridge.ai.chat.EXTRA_BUBBLE_CONTEXT";

    @NotNull
    public static final String EXTRA_CONVERSATION_ID = "com.instabridge.ai.chat.EXTRA_CONVERSATION_ID";

    @NotNull
    public static final String EXTRA_QUERY = "com.instabridge.ai.chat.EXTRA_QUERY";

    @NotNull
    private static final String STATE_CONVERSATION_ID = "ai_chat_conversation_id";

    @NotNull
    private static final String STATE_TITLE = "ai_chat_title";
    private AiChatView chatView;

    @Nullable
    private Function2<? super String, ? super Continuation<? super Boolean>, ? extends Object> myPermissionRequester;

    @Nullable
    private t70.l permissionContinuation;

    @NotNull
    private final j.c permissionLauncher;

    @NotNull
    private final t70.j0 scope;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0007J\u0018\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0005H\u0007J\u0018\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0005H\u0007J\u0018\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0013\u001a\u00020\u0014H\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/chat/ui/AiChatActivity$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "STATE_CONVERSATION_ID", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "STATE_TITLE", "EXTRA_QUERY", "EXTRA_CONVERSATION_ID", "EXTRA_BUBBLE_CONTEXT", "open", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "openWithQuery", "query", "resume", "conversationId", "continueFromBubble", "bubbleContext", "Lcom/instabridge/ai/chat/model/BubbleContext;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        public final void continueFromBubble(@NotNull Context context, @NotNull BubbleContext bubbleContext) {
            Intrinsics.g(context, "context");
            Intrinsics.g(bubbleContext, "bubbleContext");
            Intent intent = new Intent(context, (Class<?>) AiChatActivity.class);
            intent.putExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT, bubbleContext);
            context.startActivity(intent);
        }

        @JvmStatic
        public final void open(@NotNull Context context) {
            Intrinsics.g(context, "context");
            context.startActivity(new Intent(context, (Class<?>) AiChatActivity.class));
        }

        @JvmStatic
        public final void openWithQuery(@NotNull Context context, @NotNull String query) {
            Intrinsics.g(context, "context");
            Intrinsics.g(query, "query");
            Intent intent = new Intent(context, (Class<?>) AiChatActivity.class);
            intent.putExtra(AiChatActivity.EXTRA_QUERY, query);
            context.startActivity(intent);
        }

        @JvmStatic
        public final void resume(@NotNull Context context, @NotNull String conversationId) {
            Intrinsics.g(context, "context");
            Intrinsics.g(conversationId, "conversationId");
            Intent intent = new Intent(context, (Class<?>) AiChatActivity.class);
            intent.putExtra(AiChatActivity.EXTRA_CONVERSATION_ID, conversationId);
            context.startActivity(intent);
        }

        private Companion() {
        }
    }

    public AiChatActivity() {
        i2 i2VarD = t70.m0.d();
        a80.e eVar = y0.f88884a;
        this.scope = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, y70.o.f96819a));
        j.c cVarRegisterForActivityResult = registerForActivityResult(new ActivityResultContracts$RequestPermission(), new j.a() { // from class: com.instabridge.ai.chat.ui.a
            @Override // j.a
            public final void onActivityResult(Object obj) {
                AiChatActivity.permissionLauncher$lambda$1(this.f35322a, (Boolean) obj);
            }
        });
        Intrinsics.f(cVarRegisterForActivityResult, "registerForActivityResult(...)");
        this.permissionLauncher = cVarRegisterForActivityResult;
    }

    @JvmStatic
    public static final void continueFromBubble(@NotNull Context context, @NotNull BubbleContext bubbleContext) {
        INSTANCE.continueFromBubble(context, bubbleContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit onCreate$lambda$3(AiChatActivity aiChatActivity, AiChatView.ConversationState state) {
        m.b supportActionBar;
        Intrinsics.g(state, "state");
        String title = state.getTitle();
        if (title != null && !r70.k.U0(title) && (supportActionBar = aiChatActivity.getSupportActionBar()) != null) {
            supportActionBar.x(state.getTitle());
        }
        aiChatActivity.invalidateOptionsMenu();
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void onOptionsItemSelected$lambda$4(AiChatActivity aiChatActivity, String str, DialogInterface dialogInterface, int i5) {
        t70.m0.t(aiChatActivity.scope, null, null, new AiChatActivity$onOptionsItemSelected$1$1(str, aiChatActivity, null), 3);
    }

    @JvmStatic
    public static final void open(@NotNull Context context) {
        INSTANCE.open(context);
    }

    @JvmStatic
    public static final void openWithQuery(@NotNull Context context, @NotNull String str) {
        INSTANCE.openWithQuery(context, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void permissionLauncher$lambda$1(AiChatActivity aiChatActivity, Boolean bool) {
        t70.l lVar = aiChatActivity.permissionContinuation;
        if (lVar != null && lVar.b()) {
            int i5 = Result.f71687b;
            lVar.resumeWith(bool);
        }
        aiChatActivity.permissionContinuation = null;
    }

    @JvmStatic
    public static final void resume(@NotNull Context context, @NotNull String str) {
        INSTANCE.resume(context, str);
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AiChatActivity$onCreate$requester$1 aiChatActivity$onCreate$requester$1 = new AiChatActivity$onCreate$requester$1(this, null);
        this.myPermissionRequester = aiChatActivity$onCreate$requester$1;
        fo.d.f55484x = aiChatActivity$onCreate$requester$1;
        setContentView(2131623981);
        Toolbar toolbar = (Toolbar) findViewById(2131427662);
        setSupportActionBar(toolbar);
        m.b supportActionBar = getSupportActionBar();
        if (supportActionBar != null) {
            supportActionBar.q(true);
        }
        m.b supportActionBar2 = getSupportActionBar();
        if (supportActionBar2 != null) {
            supportActionBar2.x(getString(2132017296));
        }
        toolbar.y(new b(this, 0));
        AiChatView aiChatView = (AiChatView) findViewById(2131427663);
        this.chatView = aiChatView;
        if (aiChatView == null) {
            Intrinsics.m("chatView");
            throw null;
        }
        aiChatView.setOnConversationUpdate(new r(this, 1));
        if (savedInstanceState != null) {
            String string = savedInstanceState.getString(STATE_CONVERSATION_ID);
            if (string != null) {
                AiChatView aiChatView2 = this.chatView;
                if (aiChatView2 == null) {
                    Intrinsics.m("chatView");
                    throw null;
                }
                aiChatView2.loadConversation(string);
            }
            m.b supportActionBar3 = getSupportActionBar();
            if (supportActionBar3 != null) {
                CharSequence charSequence = savedInstanceState.getCharSequence(STATE_TITLE);
                if (charSequence == null) {
                    charSequence = getString(2132017296);
                    Intrinsics.f(charSequence, "getString(...)");
                }
                supportActionBar3.x(charSequence);
            }
            h1 supportFragmentManager = getSupportFragmentManager();
            Intrinsics.f(supportFragmentManager, "getSupportFragmentManager(...)");
            br.a.y(supportFragmentManager, false, false, "https://instabridge.com/privacy-policy/", null, null, null);
            return;
        }
        BubbleContext bubbleContext = (BubbleContext) ex.i.z(getIntent(), EXTRA_BUBBLE_CONTEXT, BubbleContext.class);
        if (bubbleContext != null) {
            AiChatView aiChatView3 = this.chatView;
            if (aiChatView3 != null) {
                aiChatView3.continueFromBubble(bubbleContext);
                return;
            } else {
                Intrinsics.m("chatView");
                throw null;
            }
        }
        String stringExtra = getIntent().getStringExtra(EXTRA_CONVERSATION_ID);
        if (stringExtra != null) {
            AiChatView aiChatView4 = this.chatView;
            if (aiChatView4 == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            aiChatView4.loadConversation(stringExtra);
        }
        String stringExtra2 = getIntent().getStringExtra(EXTRA_QUERY);
        if (stringExtra2 != null) {
            AiChatView aiChatView5 = this.chatView;
            if (aiChatView5 == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            aiChatView5.sendMessage(stringExtra2);
        }
        h1 supportFragmentManager2 = getSupportFragmentManager();
        Intrinsics.f(supportFragmentManager2, "getSupportFragmentManager(...)");
        br.a.y(supportFragmentManager2, false, false, "https://instabridge.com/privacy-policy/", null, null, null);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(@NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        getMenuInflater().inflate(2131755008, menu);
        return true;
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public void onDestroy() {
        if (fo.d.f55484x == this.myPermissionRequester) {
            fo.d.f55484x = null;
        }
        super.onDestroy();
        t70.k0.c(this.scope, null);
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(@NotNull MenuItem item) {
        Intrinsics.g(item, "item");
        int itemId = item.getItemId();
        if (itemId == 2131427434) {
            AiChatView aiChatView = this.chatView;
            if (aiChatView == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            String currentConversationId = aiChatView.getCurrentConversationId();
            if (currentConversationId != null) {
                ShareConversationDialog.INSTANCE.show(this, currentConversationId);
                return true;
            }
        } else if (itemId == 2131427426) {
            AiChatView aiChatView2 = this.chatView;
            if (aiChatView2 == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            aiChatView2.newConversation();
            m.b supportActionBar = getSupportActionBar();
            if (supportActionBar != null) {
                supportActionBar.x(getString(2132017296));
                return true;
            }
        } else {
            if (itemId == 2131427438) {
                ConversationListActivity.INSTANCE.open(this);
                return true;
            }
            if (itemId != 2131427411) {
                return super.onOptionsItemSelected(item);
            }
            AiChatView aiChatView3 = this.chatView;
            if (aiChatView3 == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            String currentConversationId2 = aiChatView3.getCurrentConversationId();
            if (currentConversationId2 != null) {
                m.j jVar = new m.j(this);
                m.g gVar = jVar.f75297a;
                gVar.f75249f = gVar.f75244a.getText(2132017289);
                jVar.setPositiveButton(17039370, new c(this, currentConversationId2, 0)).setNegativeButton(17039360, null).c();
            }
        }
        return true;
    }

    @Override // android.app.Activity
    public boolean onPrepareOptionsMenu(@NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        MenuItem menuItemFindItem = menu.findItem(2131427434);
        if (menuItemFindItem != null) {
            AiChatView aiChatView = this.chatView;
            if (aiChatView == null) {
                Intrinsics.m("chatView");
                throw null;
            }
            menuItemFindItem.setVisible(aiChatView.getCurrentConversationId() != null);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override // g.o, n4.i, android.app.Activity
    public void onSaveInstanceState(@NotNull Bundle outState) {
        Intrinsics.g(outState, "outState");
        AiChatView aiChatView = this.chatView;
        if (aiChatView == null) {
            Intrinsics.m("chatView");
            throw null;
        }
        outState.putString(STATE_CONVERSATION_ID, aiChatView.getCurrentConversationId());
        m.b supportActionBar = getSupportActionBar();
        outState.putCharSequence(STATE_TITLE, supportActionBar != null ? supportActionBar.f() : null);
        super.onSaveInstanceState(outState);
    }
}
