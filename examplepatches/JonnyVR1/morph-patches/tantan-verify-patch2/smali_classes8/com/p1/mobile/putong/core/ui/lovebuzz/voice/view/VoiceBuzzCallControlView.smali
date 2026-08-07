.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u001a\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0004\u0010\u0008B#\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0004\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u0017\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0014J\u000f\u0010\u0018\u001a\u00020\u0017H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u001f\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u001b\u001a\u00020\u001a2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u00a2\u0006\u0004\u0008\u001f\u0010 J\u000f\u0010!\u001a\u00020\u000cH\u0007\u00a2\u0006\u0004\u0008!\u0010\u000eJ\r\u0010\"\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\"\u0010\u000eJ\u0017\u0010%\u001a\u00020\u000c2\u0008\u0010$\u001a\u0004\u0018\u00010#\u00a2\u0006\u0004\u0008%\u0010&J\u0019\u0010(\u001a\u00020\u000c2\u0008\u0010\'\u001a\u0004\u0018\u00010\u001eH\u0014\u00a2\u0006\u0004\u0008(\u0010)J\r\u0010*\u001a\u00020\u000c\u00a2\u0006\u0004\u0008*\u0010\u000eR\"\u00102\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008,\u0010-\u001a\u0004\u0008.\u0010/\"\u0004\u00080\u00101R\"\u0010:\u001a\u0002038\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u00109R\"\u0010>\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008;\u0010-\u001a\u0004\u0008<\u0010/\"\u0004\u0008=\u00101R\"\u0010B\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008?\u0010-\u001a\u0004\u0008@\u0010/\"\u0004\u0008A\u00101R\"\u0010F\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008C\u0010-\u001a\u0004\u0008D\u0010/\"\u0004\u0008E\u00101R\"\u0010J\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008G\u0010-\u001a\u0004\u0008H\u0010/\"\u0004\u0008I\u00101R\u0018\u0010M\u001a\u0004\u0018\u00010#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008K\u0010LR\u0016\u0010Q\u001a\u00020N8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008O\u0010P\u00a8\u0006R"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
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
        "r",
        "()V",
        "B0",
        "u0",
        "",
        "speak",
        "H0",
        "(Z)V",
        "mute",
        "G0",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;",
        "s0",
        "()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "r0",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "E0",
        "D0",
        "Ll/vm50;",
        "listener",
        "setControlVBListener",
        "(Ll/vm50;)V",
        "child",
        "detachViewFromParent",
        "(Landroid/view/View;)V",
        "t0",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;",
        "d",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;",
        "get_add_time",
        "()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;",
        "set_add_time",
        "(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V",
        "_add_time",
        "Lv/VText;",
        "e",
        "Lv/VText;",
        "get_add_time_count",
        "()Lv/VText;",
        "set_add_time_count",
        "(Lv/VText;)V",
        "_add_time_count",
        "f",
        "get_mic",
        "set_mic",
        "_mic",
        "g",
        "get_quit",
        "set_quit",
        "_quit",
        "h",
        "get_speaker",
        "set_speaker",
        "_speaker",
        "i",
        "get_like",
        "set_like",
        "_like",
        "j",
        "Ll/vm50;",
        "controlListener",
        "Ljava/lang/Runnable;",
        "k",
        "Ljava/lang/Runnable;",
        "quitRunnable",
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


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

.field public g:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

.field public h:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

.field public i:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

.field public j:Ll/vm50;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public k:Ljava/lang/Runnable;
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

    .line 36
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 35
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->r0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/qtm0;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/qtm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->k:Ljava/lang/Runnable;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->r()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->u0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic h0()Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->w0()Lkotlin/Unit;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic i0()Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->y0()Lkotlin/Unit;

    move-result-object v0

    return-object v0
.end method

.method public static j0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->w()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->f0(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->G0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static k0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p1, v0, v1, v0}, Ll/nbw;->V(Ll/nbw;Ljava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->s0()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v3, Ll/ytm0;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Ll/ytm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 21
    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-static/range {v0 .. v5}, Ll/haw;->N0(Ll/haw;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->z0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->v0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static n0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V
    .locals 2

    .line 1
    sget-object v0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->s0()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/k8w;->a(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget v0, Ll/ebc0;->M:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public static o0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/View;)V
    .locals 7

    .line 1
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p1, v0, v1, v0}, Ll/nbw;->j(Ll/nbw;Ljava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->s0()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ll/wtm0;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/wtm0;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ll/xtm0;

    .line 24
    .line 25
    invoke-direct {v3}, Ll/xtm0;-><init>()V

    .line 26
    .line 27
    .line 28
    const/16 v5, 0x8

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-static/range {v0 .. v6}, Ll/haw;->X0(Ll/haw;Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static p0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/View;)V
    .locals 11

    .line 1
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/haw;->B0()Ll/eqx;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/eqx;->j()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p1}, Ll/eqx;->d()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    mul-int/lit16 p1, p1, 0x3e8

    .line 20
    .line 21
    int-to-long v2, p1

    .line 22
    add-long/2addr v0, v2

    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sub-long/2addr v0, v2

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long p1, v0, v2

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    const/4 v3, 0x2

    .line 34
    const/4 v4, 0x0

    .line 35
    if-lez p1, :cond_0

    .line 36
    .line 37
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-static {p0, p1, v4, v3, v4}, Ll/nbw;->C(Ll/nbw;ZLjava/lang/String;ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 44
    .line 45
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->E0:I

    .line 46
    .line 47
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    const-wide/16 v3, 0x3e8

    .line 55
    .line 56
    div-long/2addr v0, v3

    .line 57
    const-wide/16 v3, 0x1

    .line 58
    .line 59
    invoke-static {v0, v1, v3, v4}, Lkotlin/ranges/a;->c(JJ)J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    sget-object p1, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 84
    .line 85
    invoke-static {p1, v2, v4, v3, v4}, Ll/nbw;->C(Ll/nbw;ZLjava/lang/String;ILjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    sget-object v5, Ll/d8w;->INSTANCE:Ll/d8w;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->s0()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    new-instance v7, Ll/ztm0;

    .line 95
    .line 96
    invoke-direct {v7, p0}, Ll/ztm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 97
    .line 98
    .line 99
    const/4 v9, 0x4

    .line 100
    const/4 v10, 0x0

    .line 101
    const/4 v8, 0x0

    .line 102
    invoke-static/range {v5 .. v10}, Ll/d8w;->U(Ll/d8w;Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Ljava/lang/String;ILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static q0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->d0(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->H0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final r()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->E0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/haw;->B0()Ll/eqx;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/eqx;->j()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {v0}, Ll/eqx;->d()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    mul-int/lit16 v0, v0, 0x3e8

    .line 23
    .line 24
    int-to-long v3, v0

    .line 25
    add-long/2addr v1, v3

    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    sub-long/2addr v1, v3

    .line 31
    const-wide/16 v3, 0x0

    .line 32
    .line 33
    cmp-long v0, v1, v3

    .line 34
    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v3, Ll/ebc0;->L:I

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->k:Ljava/lang/Runnable;

    .line 51
    .line 52
    invoke-virtual {v0, v3, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Ll/ebc0;->M:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->B0()V

    .line 66
    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->w()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->G0(Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->H()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->H0(Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->D0()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private final u0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rtm0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/rtm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/stm0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/stm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/ttm0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/ttm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/utm0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/utm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/vtm0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/vtm0;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static final v0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->j:Ll/vm50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/vm50;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0
.end method

.method public static final w0()Lkotlin/Unit;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/buzz/R$string;->e:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object v0
.end method

.method public static final y0()Lkotlin/Unit;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/buzz/R$string;->d:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object v0
.end method

.method public static final z0(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;)Lkotlin/Unit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->j:Ll/vm50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/vm50;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public final B0()V
    .locals 3

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    const-string v1, "Earphone "

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/vnb;->o1(ILjava/lang/String;)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-int v0, v0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->get_control_desc()Lv/VText;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->get_control_desc()Lv/VText;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->get_control_desc()Lv/VText;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->get_control_desc()Lv/VText;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final D0()V
    .locals 4

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/haw;->B0()Ll/eqx;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/eqx;->f()Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView$a;->a:[I

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    aget v0, v1, v0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    if-eq v0, v3, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget v0, Ll/ebc0;->O:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget v0, Ll/ebc0;->D:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v2, Ll/ebc0;->P:I

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v2, Ll/ebc0;->A:I

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final E0()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/haw;->B0()Ll/eqx;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/eqx;->f()Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;->MATCHED:Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/ebc0;->A:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {v0}, Ll/eqx;->i()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-gtz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget v1, Ll/ebc0;->J:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sget v2, Ll/ebc0;->z:I

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const/4 v2, 0x1

    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0}, Ll/eqx;->i()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    const-string v4, "x "

    .line 102
    .line 103
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final G0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget v1, Ll/ebc0;->Q:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v1, Ll/ebc0;->R:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->H0:I

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->I0:I

    .line 25
    .line 26
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->c(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final H0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget v1, Ll/ebc0;->X:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v1, Ll/ebc0;->W:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->d(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->T0:I

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->S0:I

    .line 25
    .line 26
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;->c(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public detachViewFromParent(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->detachViewFromParent(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->k:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->d:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_add_time"

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

.method public final get_add_time_count()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_add_time_count"

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

.method public final get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->i:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_like"

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

.method public final get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->f:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_mic"

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

.method public final get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->g:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_quit"

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

.method public final get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->h:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_speaker"

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

.method public final r0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-static {p0, p1, p2}, Ll/aum0;->b(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public final s0()Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 9
    .line 10
    return-object p0
.end method

.method public final setControlVBListener(Ll/vm50;)V
    .locals 0
    .param p1    # Ll/vm50;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->j:Ll/vm50;

    .line 2
    .line 3
    return-void
.end method

.method public final set_add_time(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->d:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_add_time_count(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->e:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_like(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->i:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_mic(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->f:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_quit(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->g:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_speaker(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->h:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 5
    .line 6
    return-void
.end method

.method public final t0()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->k:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_add_time_count()Lv/VText;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_mic()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_like()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_speaker()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;->get_quit()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzControlView;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v6, 0x6

    .line 37
    new-array v6, v6, [Landroid/view/View;

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    aput-object v1, v6, v7

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    aput-object v2, v6, v1

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    aput-object v3, v6, v1

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    aput-object v4, v6, v1

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    aput-object v5, v6, v1

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    aput-object p0, v6, v1

    .line 56
    .line 57
    invoke-virtual {v0, v6}, Ll/k8w;->d([Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
