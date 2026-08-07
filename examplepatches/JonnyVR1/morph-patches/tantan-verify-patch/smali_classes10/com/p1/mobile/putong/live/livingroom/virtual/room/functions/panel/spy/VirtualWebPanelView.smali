.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings<",
        "Ll/wrp0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u0015\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001d\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u000bJ\r\u0010\u0017\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0017\u0010\u000bJ\r\u0010\u0018\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0018\u0010\u000bR\u0016\u0010\u001c\u001a\u00020\u00198\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0016\u0010 \u001a\u00020\u001d8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\u001b\u0010&\u001a\u00020!8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\"\u0010#\u001a\u0004\u0008$\u0010%R\u001b\u0010)\u001a\u00020!8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\'\u0010#\u001a\u0004\u0008(\u0010%\u00a8\u0006*"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;",
        "Ll/wrp0;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "n0",
        "()V",
        "r",
        "",
        "isCollapse",
        "m0",
        "(Z)V",
        "",
        "accessToken",
        "url",
        "o0",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "destroy",
        "q0",
        "p0",
        "Ll/w0c;",
        "h",
        "Ll/w0c;",
        "helper",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "i",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "_webView",
        "Landroid/animation/Animator;",
        "j",
        "Lkotlin/Lazy;",
        "getExpandAnim",
        "()Landroid/animation/Animator;",
        "expandAnim",
        "k",
        "getCollapseAnim",
        "collapseAnim",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public h:Ll/w0c;

.field public i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public final j:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final k:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/qem0;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/qem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->j:Lkotlin/Lazy;

    .line 20
    .line 21
    new-instance p1, Ll/rem0;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/rem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->k:Lkotlin/Lazy;

    .line 31
    .line 32
    return-void
.end method

.method private final getCollapseAnim()Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->k:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Landroid/animation/Animator;

    .line 11
    .line 12
    return-object p0
.end method

.method private final getExpandAnim()Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->j:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Landroid/animation/Animator;

    .line 11
    .line 12
    return-object p0
.end method

.method public static i0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)Landroid/animation/Animator;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 10
    .line 11
    invoke-static {p0, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 v0, 0x12c

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    nop

    .line 23
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static j0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static k0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)Landroid/animation/Animator;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/high16 v1, -0x3ee00000    # -10.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/4 v2, 0x2

    .line 11
    new-array v3, v2, [F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    aput v1, v3, v4

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v4, 0x0

    .line 18
    aput v4, v3, v1

    .line 19
    .line 20
    const-string v1, "translationY"

    .line 21
    .line 22
    invoke-static {v0, v1, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    new-array v1, v2, [F

    .line 29
    .line 30
    fill-array-data v1, :array_0

    .line 31
    .line 32
    .line 33
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 34
    .line 35
    invoke-static {p0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-wide/16 v0, 0x190

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    nop

    .line 55
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static l0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final n0()V
    .locals 6

    .line 1
    new-instance v0, Ll/w0c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->h:Ll/w0c;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->d:Ll/k3m;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    check-cast v1, Ll/wrp0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    const-string v3, "_webView"

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    move-object v2, v4

    .line 30
    :cond_0
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->h:Ll/w0c;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const-string v0, "helper"

    .line 38
    .line 39
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    move-object v0, v4

    .line 43
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    move-object v2, v4

    .line 60
    :cond_2
    const-string v5, ""

    .line 61
    .line 62
    invoke-virtual {v0, v1, v5, v2, v5}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 66
    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    move-object v0, v4

    .line 73
    :cond_3
    const/4 v1, 0x0

    .line 74
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 78
    .line 79
    if-nez p0, :cond_4

    .line 80
    .line 81
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    move-object v4, p0

    .line 86
    :goto_0
    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const/4 v0, -0x1

    .line 91
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "_webView"

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->h:Ll/w0c;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    const-string v2, "helper"

    .line 20
    .line 21
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move-object v1, v2

    .line 26
    :goto_0
    invoke-static {v0, v1}, Ll/ffv;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getExpandAnim()Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getCollapseAnim()Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final m0(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getExpandAnim()Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getCollapseAnim()Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getCollapseAnim()Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/sem0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/sem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getCollapseAnim()Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getExpandAnim()Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/tem0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/tem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->getExpandAnim()Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final o0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p2}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "H5-Authorization"

    .line 19
    .line 20
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    const-string p0, "_webView"

    .line 28
    .line 29
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    :cond_1
    invoke-virtual {p0, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final p0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->h:Ll/w0c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "helper"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->u()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->h:Ll/w0c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "helper"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->v()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final r()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 2
    .line 3
    sget v1, Ll/qa00;->y:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/bhn0;->a()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    mul-int/lit16 v1, v0, 0x159

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    const/high16 v2, 0x43810000    # 258.0f

    .line 16
    .line 17
    div-float/2addr v1, v2

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 25
    .line 26
    float-to-int v0, v1

    .line 27
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 35
    .line 36
    new-instance v3, Ll/q6s;

    .line 37
    .line 38
    sget v1, Ll/obc0;->ia:I

    .line 39
    .line 40
    new-instance v4, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v5, "res://drawable/"

    .line 43
    .line 44
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    const/16 v8, 0x9

    .line 55
    .line 56
    const/4 v9, 0x0

    .line 57
    const/4 v4, 0x0

    .line 58
    const-string v6, "\u8c01\u662f\u5367\u5e95\uff0c\u4e00\u8d77\u5934\u8111\u98ce\u66b4"

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    invoke-direct/range {v3 .. v9}, Ll/q6s;-><init>(ZLjava/lang/String;Ljava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;->c(Ll/q6s;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 81
    .line 82
    .line 83
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 84
    .line 85
    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 86
    .line 87
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 88
    .line 89
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->g:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 95
    .line 96
    if-nez v2, :cond_0

    .line 97
    .line 98
    const-string v2, "_webView"

    .line 99
    .line 100
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const/4 v2, 0x0

    .line 104
    :cond_0
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualSpyPanelViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 108
    .line 109
    sget v1, Ll/obc0;->X:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    const/high16 v0, 0x41800000    # 16.0f

    .line 115
    .line 116
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/spy/VirtualWebPanelView;->n0()V

    .line 124
    .line 125
    .line 126
    return-void
.end method
