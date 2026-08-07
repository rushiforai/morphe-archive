.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00a2\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u001b\n\u0002\u0018\u0002\n\u0002\u0008\u001e\n\u0002\u0018\u0002\n\u0002\u0008\u001a\n\u0002\u0008\u0005*\u0002\u008f\u0001\u0018\u00002\u00020\u00012\u00020\u0002B\u0011\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006B\u001b\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\tB#\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0005\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0019\u0010\u0012\u001a\u00020\r2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0013JA\u0010\u001f\u001a\u00020\r2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\u001dH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 J?\u0010\'\u001a\u00020\r2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!2\u000e\u0010%\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010$2\u000e\u0010&\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010$H\u0002\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010+\u001a\u00020\r2\u0006\u0010*\u001a\u00020)H\u0003\u00a2\u0006\u0004\u0008+\u0010,J\u000f\u0010-\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008-\u0010.J\u001f\u00103\u001a\u00020!2\u0006\u00100\u001a\u00020/2\u0008\u00102\u001a\u0004\u0018\u000101\u00a2\u0006\u0004\u00083\u00104JG\u00107\u001a\u00020\r2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u00152\u0006\u00106\u001a\u0002052\u0006\u0010\u0018\u001a\u00020\u00172\u000e\u0010%\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010$2\u000e\u0010&\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010$\u00a2\u0006\u0004\u00087\u00108J\u0015\u0010;\u001a\u00020\r2\u0006\u0010:\u001a\u000209\u00a2\u0006\u0004\u0008;\u0010<J\r\u0010=\u001a\u00020\r\u00a2\u0006\u0004\u0008=\u0010\u000fJ9\u0010C\u001a\u00020\r2\u0008\u0010>\u001a\u0004\u0018\u00010\u00102\u0006\u0010?\u001a\u00020)2\u0006\u0010@\u001a\u00020)2\u0006\u0010A\u001a\u00020)2\u0006\u0010B\u001a\u00020)H\u0016\u00a2\u0006\u0004\u0008C\u0010DJ\u000f\u0010E\u001a\u00020\rH\u0015\u00a2\u0006\u0004\u0008E\u0010\u000fJ\u000f\u0010F\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008F\u0010\u000fR\"\u0010M\u001a\u00020\u001b8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008G\u0010H\u001a\u0004\u0008I\u0010J\"\u0004\u0008K\u0010LR\"\u0010T\u001a\u00020\u001d8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008N\u0010O\u001a\u0004\u0008P\u0010Q\"\u0004\u0008R\u0010SR\"\u0010\\\u001a\u00020U8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008V\u0010W\u001a\u0004\u0008X\u0010Y\"\u0004\u0008Z\u0010[R\"\u0010c\u001a\u00020\u00198\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008]\u0010^\u001a\u0004\u0008_\u0010`\"\u0004\u0008a\u0010bR\"\u0010g\u001a\u00020\u001b8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008d\u0010H\u001a\u0004\u0008e\u0010J\"\u0004\u0008f\u0010LR\"\u0010k\u001a\u00020\u00198\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008h\u0010^\u001a\u0004\u0008i\u0010`\"\u0004\u0008j\u0010bR\"\u0010o\u001a\u00020\u00198\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008l\u0010^\u001a\u0004\u0008m\u0010`\"\u0004\u0008n\u0010bR\"\u0010s\u001a\u00020\u00198\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008p\u0010^\u001a\u0004\u0008q\u0010`\"\u0004\u0008r\u0010bR\"\u0010{\u001a\u00020t8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008u\u0010v\u001a\u0004\u0008w\u0010x\"\u0004\u0008y\u0010zR%\u0010\u0082\u0001\u001a\u00020!8\u0006@\u0006X\u0086.\u00a2\u0006\u0014\n\u0004\u0008|\u0010}\u001a\u0004\u0008~\u0010\u007f\"\u0006\u0008\u0080\u0001\u0010\u0081\u0001R\u0017\u0010\u0085\u0001\u001a\u00020\u00108\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0083\u0001\u0010\u0084\u0001R\u0019\u0010\u0088\u0001\u001a\u0002098\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0086\u0001\u0010\u0087\u0001R\'\u0010\u0011\u001a\u00020\u00108\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0006\u0008\u0089\u0001\u0010\u0084\u0001\u001a\u0006\u0008\u008a\u0001\u0010\u008b\u0001\"\u0005\u0008\u008c\u0001\u0010\u0013R\u001b\u0010\u008e\u0001\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008d\u0001\u0010\u0084\u0001R\u0018\u0010\u0092\u0001\u001a\u00030\u008f\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0090\u0001\u0010\u0091\u0001\u00a8\u0006\u0093\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Lcom/p1/mobile/putong/core/api/c0$c;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Landroid/util/AttributeSet;",
        "attrs",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "defStyleAttr",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "p0",
        "()V",
        "",
        "type",
        "t0",
        "(Ljava/lang/String;)V",
        "s0",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "Lv/VText;",
        "info",
        "Lv/VImage;",
        "region",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "avatar",
        "u0",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lv/VText;Lv/VImage;Lcom/tantan/library/svga/SVGAnimationView;)V",
        "Landroid/view/View;",
        "start",
        "close",
        "Lkotlin/Function0;",
        "onAccept",
        "onRefuse",
        "m0",
        "(Landroid/view/View;Landroid/view/View;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V",
        "",
        "lastTime",
        "r0",
        "(J)V",
        "q0",
        "()I",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "j0",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;",
        "data",
        "v0",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V",
        "",
        "enable",
        "n0",
        "(Z)V",
        "o0",
        "key",
        "currentTime",
        "beginTime",
        "endTime",
        "registerTime",
        "u",
        "(Ljava/lang/String;JJJJ)V",
        "onDetachedFromWindow",
        "clearAnimation",
        "d",
        "Lv/VImage;",
        "get_front_bg",
        "()Lv/VImage;",
        "set_front_bg",
        "(Lv/VImage;)V",
        "_front_bg",
        "e",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "get_peer_avatar_anim",
        "()Lcom/tantan/library/svga/SVGAnimationView;",
        "set_peer_avatar_anim",
        "(Lcom/tantan/library/svga/SVGAnimationView;)V",
        "_peer_avatar_anim",
        "Lv/VLinear;",
        "f",
        "Lv/VLinear;",
        "get_peer_info_ll",
        "()Lv/VLinear;",
        "set_peer_info_ll",
        "(Lv/VLinear;)V",
        "_peer_info_ll",
        "g",
        "Lv/VText;",
        "get_peer_info_ll_peer_info",
        "()Lv/VText;",
        "set_peer_info_ll_peer_info",
        "(Lv/VText;)V",
        "_peer_info_ll_peer_info",
        "h",
        "get_peer_info_ll_peer_region",
        "set_peer_info_ll_peer_region",
        "_peer_info_ll_peer_region",
        "i",
        "get_peer_info_ll_buzz_desc",
        "set_peer_info_ll_buzz_desc",
        "_peer_info_ll_buzz_desc",
        "j",
        "get_refuse_buzz",
        "set_refuse_buzz",
        "_refuse_buzz",
        "k",
        "get_accept_buzz",
        "set_accept_buzz",
        "_accept_buzz",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;",
        "l",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;",
        "get_buzz_progress_bar",
        "()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;",
        "set_buzz_progress_bar",
        "(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;)V",
        "_buzz_progress_bar",
        "m",
        "Landroid/view/View;",
        "get_close_buzz",
        "()Landroid/view/View;",
        "set_close_buzz",
        "(Landroid/view/View;)V",
        "_close_buzz",
        "n",
        "Ljava/lang/String;",
        "MEDIA_BUZZ_ACCEPT_KEY",
        "o",
        "Z",
        "buzzHandled",
        "p",
        "getType$buzz_intlGmsRelease",
        "()Ljava/lang/String;",
        "setType$buzz_intlGmsRelease",
        "q",
        "mediaAcceptStr",
        "com/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a",
        "r",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;",
        "animatorListenerAdapter",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public d:Lv/VImage;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

.field public m:Landroid/view/View;

.field public final n:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public o:Z

.field public p:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public q:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final r:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    new-instance p3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "media_buzz_accept_key"

    .line 14
    .line 15
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->j0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p0()V

    .line 42
    .line 43
    .line 44
    const-string p1, "UNKNOWN"

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 47
    .line 48
    new-instance p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->r:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;

    .line 54
    .line 55
    return-void
.end method

.method public static h0(Lkotlin/jvm/functions/Function0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static i0(Lkotlin/jvm/functions/Function0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static final synthetic k0(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic l0(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private final r0(J)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->q:Ljava/lang/String;

    .line 6
    .line 7
    const-wide/16 v1, 0x3e8

    .line 8
    .line 9
    div-long/2addr p1, v1

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p0, " ("

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "s)"

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public clearAnimation()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;->g()V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/view/View;->clearAnimation()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final getType$buzz_intlGmsRelease()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final get_accept_buzz()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->k:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_accept_buzz"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->l:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_buzz_progress_bar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_close_buzz()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->m:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_close_buzz"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_front_bg()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->d:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_front_bg"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_peer_avatar_anim()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_peer_avatar_anim"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_peer_info_ll()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->f:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_peer_info_ll"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_peer_info_ll_buzz_desc()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->i:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_peer_info_ll_buzz_desc"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_peer_info_ll_peer_info()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->g:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_peer_info_ll_peer_info"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_peer_info_ll_peer_region()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->h:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_peer_info_ll_peer_region"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_refuse_buzz()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->j:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_refuse_buzz"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final j0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/zf2;->b(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final m0(Landroid/view/View;Landroid/view/View;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/xf2;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Ll/xf2;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ll/yf2;

    .line 10
    .line 11
    invoke-direct {p0, p4}, Ll/yf2;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final n0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final o0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->o:Z

    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, -0x2

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sget v1, Ll/qa00;->q:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/qa00;->h:I

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setElevation(F)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    sget v1, Ll/qa00;->o:I

    .line 27
    .line 28
    invoke-virtual {p0, v0, v0, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final q0()I
    .locals 2

    .line 1
    new-instance p0, Lkotlin/ranges/IntRange;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x5

    .line 5
    invoke-direct {p0, v0, v1}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    .line 9
    .line 10
    invoke-static {p0, v0}, Lkotlin/ranges/a;->k(Lkotlin/ranges/IntRange;Lkotlin/random/Random;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    if-eq p0, v0, :cond_3

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-eq p0, v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x3

    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    if-eq p0, v0, :cond_0

    .line 27
    .line 28
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->s0:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->r0:I

    .line 32
    .line 33
    return p0

    .line 34
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->q0:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->p0:I

    .line 38
    .line 39
    return p0

    .line 40
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->o0:I

    .line 41
    .line 42
    return p0

    .line 43
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->n0:I

    .line 44
    .line 45
    return p0
.end method

.method public final s0(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, -0x3cc540db

    .line 6
    .line 7
    .line 8
    if-eq v0, v1, :cond_4

    .line 9
    .line 10
    const v1, 0x4f6b25ee    # 3.9451315E9f

    .line 11
    .line 12
    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    const v1, 0x67c1de6c

    .line 16
    .line 17
    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v0, "memojiBuzz"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sget p1, Ll/d9c0;->l:I

    .line 31
    .line 32
    sget v0, Ll/ebc0;->k:I

    .line 33
    .line 34
    sget v1, Ll/ebc0;->h0:I

    .line 35
    .line 36
    sget v2, Ll/ebc0;->g0:I

    .line 37
    .line 38
    sget v3, Ll/ebc0;->l:I

    .line 39
    .line 40
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    const-string v0, "videoBuzz"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    sget p1, Ll/d9c0;->h:I

    .line 55
    .line 56
    sget v0, Ll/ebc0;->v:I

    .line 57
    .line 58
    sget v1, Ll/ebc0;->r0:I

    .line 59
    .line 60
    sget v2, Ll/ebc0;->o0:I

    .line 61
    .line 62
    sget v3, Ll/ebc0;->w:I

    .line 63
    .line 64
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    const-string v0, "voiceBuzz"

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_5

    .line 76
    .line 77
    sget p1, Ll/d9c0;->g:I

    .line 78
    .line 79
    sget v0, Ll/ebc0;->x:I

    .line 80
    .line 81
    sget v1, Ll/ebc0;->w0:I

    .line 82
    .line 83
    sget v2, Ll/ebc0;->t0:I

    .line 84
    .line 85
    sget v3, Ll/ebc0;->y:I

    .line 86
    .line 87
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    goto :goto_1

    .line 92
    :cond_5
    :goto_0
    sget p1, Ll/d9c0;->k:I

    .line 93
    .line 94
    sget v0, Ll/ebc0;->t:I

    .line 95
    .line 96
    sget v1, Ll/ebc0;->n0:I

    .line 97
    .line 98
    sget v2, Ll/ebc0;->m0:I

    .line 99
    .line 100
    sget v3, Ll/ebc0;->u:I

    .line 101
    .line 102
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    :goto_1
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    .line 107
    .line 108
    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 109
    .line 110
    .line 111
    const/4 v5, 0x0

    .line 112
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1}, Ll/k3d0;->a(I)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    const/4 v5, -0x1

    .line 123
    filled-new-array {p1, v5}, [I

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {v4, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 128
    .line 129
    .line 130
    sget p1, Ll/qa00;->o:I

    .line 131
    .line 132
    int-to-float p1, p1

    .line 133
    invoke-virtual {v4, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_front_bg()Lv/VImage;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_refuse_buzz()Lv/VText;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p1}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public final setType$buzz_intlGmsRelease(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final set_accept_buzz(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->k:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_buzz_progress_bar(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->l:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 5
    .line 6
    return-void
.end method

.method public final set_close_buzz(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->m:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method public final set_front_bg(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->d:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_peer_avatar_anim(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_peer_info_ll(Lv/VLinear;)V
    .locals 0
    .param p1    # Lv/VLinear;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->f:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_peer_info_ll_buzz_desc(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->i:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_peer_info_ll_peer_info(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->g:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_peer_info_ll_peer_region(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->h:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_refuse_buzz(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->j:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final t0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "bundle"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->T:I

    .line 10
    .line 11
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->W:I

    .line 17
    .line 18
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->q:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sub-long/2addr p6, p2

    .line 2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p6, p7}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->r0(J)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const-wide/16 p1, 0x0

    .line 14
    .line 15
    cmp-long p1, p6, p1

    .line 16
    .line 17
    if-gtz p1, :cond_2

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->o:Z

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/nbw;->W(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/haw;->G0()Lrx/subjects/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "intl.text.lovebuzz.close.notify"

    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public final u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lv/VText;Lv/VImage;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "memojiBuzz"

    .line 7
    .line 8
    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    sget-object v2, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 15
    .line 16
    invoke-virtual {v2, p3}, Ll/sbw;->j(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    const-string v4, "user1_avatar"

    .line 32
    .line 33
    invoke-virtual {v2, p1, v0, v3, v4}, Ll/sbw;->s(Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p6}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v2, 0x1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p6, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    sget-object p1, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 47
    .line 48
    invoke-virtual {p1, p3, p5}, Ll/sbw;->p(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 52
    .line 53
    const-string p5, "female"

    .line 54
    .line 55
    invoke-static {p1, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    sget p5, Ll/ebc0;->F:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget p5, Ll/ebc0;->N:I

    .line 65
    .line 66
    :goto_0
    invoke-static {p5}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p5

    .line 70
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    sget v3, Ll/qa00;->n:I

    .line 74
    .line 75
    const/4 v4, 0x0

    .line 76
    invoke-virtual {p5, v4, v4, v3, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-static {p4, p5}, Ll/bnl0;->l(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    const p4, -0x3cc540db

    .line 92
    .line 93
    .line 94
    if-eq p3, p4, :cond_8

    .line 95
    .line 96
    const p4, 0x4f6b25ee    # 3.9451315E9f

    .line 97
    .line 98
    .line 99
    if-eq p3, p4, :cond_6

    .line 100
    .line 101
    const p4, 0x67c1de6c

    .line 102
    .line 103
    .line 104
    if-eq p3, p4, :cond_3

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_4

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_buzz_desc()Lv/VText;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    sget p3, Lcom/p1/mobile/putong/core/buzz/R$string;->y:I

    .line 119
    .line 120
    invoke-static {p3}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    if-eqz p1, :cond_5

    .line 128
    .line 129
    sget-object p1, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/kq3;->e()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    goto :goto_2

    .line 136
    :cond_5
    sget-object p1, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 137
    .line 138
    invoke-virtual {p1}, Ll/kq3;->f()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    goto :goto_2

    .line 143
    :cond_6
    const-string p1, "videoBuzz"

    .line 144
    .line 145
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-nez p1, :cond_7

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_buzz_desc()Lv/VText;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    sget p2, Lcom/p1/mobile/putong/core/buzz/R$string;->x0:I

    .line 157
    .line 158
    invoke-static {p2}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    sget-object p1, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 166
    .line 167
    invoke-virtual {p1}, Ll/kq3;->j()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    goto :goto_2

    .line 172
    :cond_8
    const-string p1, "voiceBuzz"

    .line 173
    .line 174
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_9

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_buzz_desc()Lv/VText;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    sget p2, Lcom/p1/mobile/putong/core/buzz/R$string;->X0:I

    .line 185
    .line 186
    invoke-static {p2}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    sget-object p1, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 194
    .line 195
    invoke-virtual {p1}, Ll/kq3;->k()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    goto :goto_2

    .line 200
    :cond_9
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_buzz_desc()Lv/VText;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->q0()I

    .line 209
    .line 210
    .line 211
    move-result p3

    .line 212
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    sget-object p1, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 220
    .line 221
    invoke-virtual {p1}, Ll/kq3;->i()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 230
    .line 231
    .line 232
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-virtual {p0, p6}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public final v0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 10
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->biz:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->o:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->n0(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->s0(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_peer_info()Lv/VText;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_info_ll_peer_region()Lv/VImage;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_peer_avatar_anim()Lcom/tantan/library/svga/SVGAnimationView;

    .line 37
    .line 38
    .line 39
    move-result-object v9

    .line 40
    move-object v3, p0

    .line 41
    move-object v4, p1

    .line 42
    move-object v6, p3

    .line 43
    invoke-virtual/range {v3 .. v9}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lv/VText;Lv/VImage;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->subType:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->t0(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object p0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_close_buzz()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const/4 p3, 0x2

    .line 62
    new-array v2, p3, [Landroid/view/View;

    .line 63
    .line 64
    aput-object p1, v2, v0

    .line 65
    .line 66
    aput-object p2, v2, v1

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Ll/k8w;->l([Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_refuse_buzz()Lv/VText;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-array p3, p3, [Landroid/view/View;

    .line 80
    .line 81
    aput-object p1, p3, v0

    .line 82
    .line 83
    aput-object p2, p3, v1

    .line 84
    .line 85
    invoke-virtual {p0, p3}, Ll/k8w;->j([Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_close_buzz()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v3, p0, p1, p4, p5}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->m0(Landroid/view/View;Landroid/view/View;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_accept_buzz()Lv/VText;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_refuse_buzz()Lv/VText;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v3, p0, p1, p4, p5}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->m0(Landroid/view/View;Landroid/view/View;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p1, v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->r:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop$a;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;->setAnimatorListenerAdapter(Landroid/animation/AnimatorListenerAdapter;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->get_buzz_progress_bar()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iget-object p1, v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->p:Ljava/lang/String;

    .line 124
    .line 125
    iget-object p2, v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->q:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
