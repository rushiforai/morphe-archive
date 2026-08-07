.class public abstract Lcom/p1/mobile/putong/core/ui/messages/MessageBar;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Ll/bm50;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Landroid/view/View;
.end method

.method public abstract c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z
.end method

.method public abstract d(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)Z
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getOnDispatchTouchEventListener()Ll/bm50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getOnDispatchTouchEventListener()Ll/bm50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ll/bm50;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public abstract f()V
.end method

.method public abstract g(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$MessageBarState;)V
.end method

.method public abstract getActionLayout()Landroid/view/View;
.end method

.method public abstract getAiChatview()Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;
.end method

.method public abstract getBarWrapper()Landroid/widget/FrameLayout;
.end method

.method public abstract getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
.end method

.method public abstract getBar_center_text_layout()Lv/VLinear;
.end method

.method public abstract getBar_send()Landroid/view/View;
.end method

.method public abstract getBlockText()Lv/VText;
.end method

.method public abstract getGiftView()Landroid/view/View;
.end method

.method public abstract getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;
.end method

.method public abstract getInputAiView()Landroid/view/View;
.end method

.method public abstract getInputContent()Landroid/view/View;
.end method

.method public abstract getInputRoot()Landroid/view/View;
.end method

.method public abstract getMessageBarRoot()Landroid/view/View;
.end method

.method public getOnDispatchTouchEventListener()Ll/bm50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->a:Ll/bm50;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;
.end method

.method public abstract getRecoverMatchView()Lv/VButton;
.end method

.method public abstract getReferenceView()Landroid/widget/LinearLayout;
.end method

.method public abstract h(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;Z)V
.end method

.method public abstract i(ZZ)V
.end method

.method public j(ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    return-void
.end method

.method public l(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract setGroupStyle(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public setOnDispatchTouchEventListener(Ll/bm50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->a:Ll/bm50;

    .line 2
    .line 3
    return-void
.end method
