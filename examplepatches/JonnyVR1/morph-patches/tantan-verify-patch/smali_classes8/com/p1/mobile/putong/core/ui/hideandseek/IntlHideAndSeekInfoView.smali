.class public final Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0017\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0004\u0010\u0008B#\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0004\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u0017\u0010\u0012\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J#\u0010\u001b\u001a\u00020\u000c2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u00172\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u001f\u0010\u001f\u001a\u00020\u000c2\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u001dH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 J\'\u0010%\u001a\u00020$2\u0006\u0010!\u001a\u00020\u00102\u0006\u0010\"\u001a\u00020\t2\u0006\u0010#\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008%\u0010&J\'\u0010)\u001a\u00020\u000c2\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00142\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\'H\u0002\u00a2\u0006\u0004\u0008)\u0010*J\u0017\u0010+\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008+\u0010,J\u001f\u00102\u001a\u0002012\u0006\u0010.\u001a\u00020-2\u0008\u00100\u001a\u0004\u0018\u00010/\u00a2\u0006\u0004\u00082\u00103J\u0019\u00105\u001a\u00020\u000c2\u0008\u00104\u001a\u0004\u0018\u000101H\u0014\u00a2\u0006\u0004\u00085\u00106J\u0017\u00107\u001a\u00020\u000c2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u00a2\u0006\u0004\u00087\u00108J\r\u00109\u001a\u00020\u000c\u00a2\u0006\u0004\u00089\u0010\u000eR\"\u0010@\u001a\u00020$8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008:\u0010;\u001a\u0004\u0008<\u0010=\"\u0004\u0008>\u0010?R\"\u0010H\u001a\u00020A8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008B\u0010C\u001a\u0004\u0008D\u0010E\"\u0004\u0008F\u0010GR\"\u0010P\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008J\u0010K\u001a\u0004\u0008L\u0010M\"\u0004\u0008N\u0010OR\"\u0010T\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008Q\u0010K\u001a\u0004\u0008R\u0010M\"\u0004\u0008S\u0010OR\"\u0010X\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008U\u0010K\u001a\u0004\u0008V\u0010M\"\u0004\u0008W\u0010OR\"\u0010\\\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008Y\u0010K\u001a\u0004\u0008Z\u0010M\"\u0004\u0008[\u0010OR\"\u0010`\u001a\u00020A8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008]\u0010C\u001a\u0004\u0008^\u0010E\"\u0004\u0008_\u0010GR\"\u0010h\u001a\u00020a8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008b\u0010c\u001a\u0004\u0008d\u0010e\"\u0004\u0008f\u0010gR\"\u0010l\u001a\u00020a8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008i\u0010c\u001a\u0004\u0008j\u0010e\"\u0004\u0008k\u0010gR\u0014\u0010o\u001a\u00020\u00108\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008m\u0010nR\u0018\u0010r\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008p\u0010qR\u0018\u0010v\u001a\u0004\u0018\u00010s8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008t\u0010u\u00a8\u0006w"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;",
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
        "r0",
        "",
        "operate",
        "z0",
        "(Ljava/lang/String;)V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "()Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;",
        "info",
        "",
        "updateData",
        "t0",
        "(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Z)V",
        "",
        "gamePlayerIcons",
        "p0",
        "(Ljava/util/List;)V",
        "url",
        "pos",
        "count",
        "Lv/VDraweeView;",
        "q0",
        "(Ljava/lang/String;II)Lv/VDraweeView;",
        "Lkotlin/Function0;",
        "onConfirm",
        "w0",
        "(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V",
        "y0",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "o0",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "child",
        "detachViewFromParent",
        "(Landroid/view/View;)V",
        "v0",
        "(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;)V",
        "s0",
        "d",
        "Lv/VDraweeView;",
        "get_info_icon",
        "()Lv/VDraweeView;",
        "set_info_icon",
        "(Lv/VDraweeView;)V",
        "_info_icon",
        "Lv/VLinear;",
        "e",
        "Lv/VLinear;",
        "get_game_content",
        "()Lv/VLinear;",
        "set_game_content",
        "(Lv/VLinear;)V",
        "_game_content",
        "Lv/VText;",
        "f",
        "Lv/VText;",
        "get_game_content_title",
        "()Lv/VText;",
        "set_game_content_title",
        "(Lv/VText;)V",
        "_game_content_title",
        "g",
        "get_game_content_subtitle",
        "set_game_content_subtitle",
        "_game_content_subtitle",
        "h",
        "get_game_time",
        "set_game_time",
        "_game_time",
        "i",
        "get_game_location",
        "set_game_location",
        "_game_location",
        "j",
        "get_game_member",
        "set_game_member",
        "_game_member",
        "Lv/VButton;",
        "k",
        "Lv/VButton;",
        "get_positive",
        "()Lv/VButton;",
        "set_positive",
        "(Lv/VButton;)V",
        "_positive",
        "l",
        "get_negative",
        "set_negative",
        "_negative",
        "m",
        "Ljava/lang/String;",
        "TAG",
        "n",
        "Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;",
        "gameInfo",
        "Ll/l4g0;",
        "o",
        "Ll/l4g0;",
        "pageHelper",
        "b_core_intlGmsRelease"
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
.field public d:Lv/VDraweeView;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VLinear;

.field public k:Lv/VButton;

.field public l:Lv/VButton;

.field public final m:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public o:Ll/l4g0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .line 33
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 32
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const-string p1, "IntlHideAndSeekInfoView"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->m:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->o0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->r()V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->r0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private final act()Lcom/p1/mobile/android/app/Act;
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
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-object p0
.end method

.method public static h0(Lkotlin/jvm/functions/Function0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->t0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static j0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_7

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 6
    .line 7
    const-string v0, "show"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move-object p1, v0

    .line 25
    :goto_0
    const-string v1, "player"

    .line 26
    .line 27
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 32
    .line 33
    if-nez p1, :cond_4

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 38
    .line 39
    :cond_2
    const-string p1, "queuing"

    .line 40
    .line 41
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    const-string p1, "quitQueue"

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    const-string p1, "queue"

    .line 51
    .line 52
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->z0(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    if-eqz v1, :cond_5

    .line 57
    .line 58
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 59
    .line 60
    :cond_5
    const-string p1, "register"

    .line 61
    .line 62
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_6

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_6
    const-string p1, "quit"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->z0(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_7
    :goto_2
    return-void
.end method

.method public static k0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 6
    .line 7
    const-string v0, "show"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move-object p1, v0

    .line 25
    :goto_0
    const-string v1, "player"

    .line 26
    .line 27
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 39
    .line 40
    :cond_3
    const-string p1, "registered"

    .line 41
    .line 42
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_4

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_4
    const-string p1, "add"

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->z0(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_5
    :goto_1
    return-void
.end method

.method public static l0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static m0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->y0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0
.end method

.method private final r()V
    .locals 1

    .line 1
    sget v0, Ll/dbc0;->K9:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    sget v0, Ll/qa00;->o:I

    .line 7
    .line 8
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final r0()V
    .locals 2

    .line 1
    new-instance v0, Ll/von;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/von;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/won;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/won;-><init>(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/xon;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/xon;-><init>(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->t0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
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
    return-void
.end method

.method public final get_game_content()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->e:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_content"

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

.method public final get_game_content_subtitle()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->g:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_content_subtitle"

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

.method public final get_game_content_title()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->f:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_content_title"

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

.method public final get_game_location()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->i:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_location"

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

.method public final get_game_member()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->j:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_member"

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

.method public final get_game_time()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->h:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_game_time"

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

.method public final get_info_icon()Lv/VDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_info_icon"

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

.method public final get_negative()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->l:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_negative"

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

.method public final get_positive()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->k:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_positive"

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

.method public final o0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-static {p0, p1, p2}, Ll/cpn;->b(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public final p0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_member()Lv/VLinear;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_member()Lv/VLinear;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 23
    .line 24
    .line 25
    move-object v0, p1

    .line 26
    check-cast v0, Ljava/lang/Iterable;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    add-int/lit8 v2, v1, 0x1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_member()Lv/VLinear;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    sub-int/2addr v5, v1

    .line 56
    invoke-virtual {p0, v3, v1, v5}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->q0(Ljava/lang/String;II)Lv/VDraweeView;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    const/4 v3, 0x5

    .line 64
    if-ne v1, v3, :cond_1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    move v1, v2

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    :goto_1
    return-void
.end method

.method public final q0(Ljava/lang/String;II)Lv/VDraweeView;
    .locals 10

    .line 1
    new-instance v1, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v1, p0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/qa00;->d:I

    .line 11
    .line 12
    invoke-virtual {v1, p0, p0, p0, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 16
    .line 17
    sget v0, Ll/qa00;->A:I

    .line 18
    .line 19
    invoke-direct {p0, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 20
    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v2, Ll/qa00;->m:I

    .line 27
    .line 28
    neg-int v2, v2

    .line 29
    :goto_0
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/am2;->l()Ll/xlj;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 42
    .line 43
    invoke-direct {v2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xlj;->a()Ll/wlj;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v1, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 p1, 0x5

    .line 71
    if-ge p2, p1, :cond_1

    .line 72
    .line 73
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, v1, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    new-instance v2, Ll/pri0;

    .line 84
    .line 85
    new-instance p1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p2, "+"

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    sget v4, Ll/qa00;->y:I

    .line 103
    .line 104
    sget v5, Ll/qa00;->m:I

    .line 105
    .line 106
    const/4 p1, 0x3

    .line 107
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    sget p1, Ll/c9c0;->c2:I

    .line 112
    .line 113
    invoke-static {p1}, Ll/k3d0;->a(I)I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    sget v8, Ll/pri0;->i:I

    .line 118
    .line 119
    sget p1, Ll/c9c0;->V1:I

    .line 120
    .line 121
    invoke-static {p1}, Ll/k3d0;->a(I)I

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    invoke-direct/range {v2 .. v9}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v2}, Lv/VDraweeView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    const/16 v4, 0xc

    .line 138
    .line 139
    sget v5, Ll/c9c0;->g0:I

    .line 140
    .line 141
    const/4 v3, 0x2

    .line 142
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->P(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;III)V

    .line 143
    .line 144
    .line 145
    :goto_1
    sget p0, Ll/dbc0;->Rb:I

    .line 146
    .line 147
    invoke-static {p0}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    return-object v1
.end method

.method public final s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->o:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final set_game_content(Lv/VLinear;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->e:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_game_content_subtitle(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->g:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_game_content_title(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->f:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_game_location(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->i:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_game_member(Lv/VLinear;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->j:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_game_time(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->h:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_info_icon(Lv/VDraweeView;)V
    .locals 0
    .param p1    # Lv/VDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->d:Lv/VDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_negative(Lv/VButton;)V
    .locals 0
    .param p1    # Lv/VButton;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->l:Lv/VButton;

    .line 5
    .line 6
    return-void
.end method

.method public final set_positive(Lv/VButton;)V
    .locals 0
    .param p1    # Lv/VButton;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->k:Lv/VButton;

    .line 5
    .line 6
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    if-eqz p2, :cond_2

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 11
    .line 12
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 13
    .line 14
    :cond_1
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 17
    .line 18
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 19
    .line 20
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_3
    move-object p1, p2

    .line 29
    :goto_0
    const-string v0, "end"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 v0, 0x0

    .line 36
    if-eqz p1, :cond_4

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget p1, Lcom/p1/mobile/putong/core/R$string;->sb:I

    .line 50
    .line 51
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 60
    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_5
    move-object p1, p2

    .line 67
    :goto_1
    const-string v1, "start"

    .line 68
    .line 69
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_6

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ub:I

    .line 87
    .line 88
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 97
    .line 98
    if-eqz p1, :cond_7

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_7
    move-object p1, p2

    .line 104
    :goto_2
    const-string v0, "player"

    .line 105
    .line 106
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_c

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    sget v0, Ll/dbc0;->Hq:I

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 126
    .line 127
    if-eqz v0, :cond_8

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_8
    move-object v0, p2

    .line 133
    :goto_3
    const-string v1, "queuing"

    .line 134
    .line 135
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_9

    .line 140
    .line 141
    sget v0, Lcom/p1/mobile/putong/core/R$string;->wb:I

    .line 142
    .line 143
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    goto :goto_4

    .line 148
    :cond_9
    sget v0, Lcom/p1/mobile/putong/core/R$string;->pb:I

    .line 149
    .line 150
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :goto_4
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 162
    .line 163
    if-eqz p0, :cond_a

    .line 164
    .line 165
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 166
    .line 167
    :cond_a
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_b

    .line 172
    .line 173
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ob:I

    .line 174
    .line 175
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    goto :goto_5

    .line 180
    :cond_b
    sget p0, Lcom/p1/mobile/putong/core/R$string;->vb:I

    .line 181
    .line 182
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    :goto_5
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 191
    .line 192
    if-eqz p1, :cond_d

    .line 193
    .line 194
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 195
    .line 196
    :cond_d
    const-string p1, "registered"

    .line 197
    .line 198
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    if-eqz p1, :cond_e

    .line 207
    .line 208
    sget v0, Ll/dbc0;->Hq:I

    .line 209
    .line 210
    goto :goto_6

    .line 211
    :cond_e
    sget v0, Ll/dbc0;->U1:I

    .line 212
    .line 213
    :goto_6
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_positive()Lv/VButton;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    if-eqz p1, :cond_f

    .line 221
    .line 222
    sget v0, Lcom/p1/mobile/putong/core/R$string;->rb:I

    .line 223
    .line 224
    goto :goto_7

    .line 225
    :cond_f
    sget v0, Lcom/p1/mobile/putong/core/R$string;->qb:I

    .line 226
    .line 227
    :goto_7
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_negative()Lv/VButton;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    sget p1, Lcom/p1/mobile/putong/core/R$string;->tb:I

    .line 246
    .line 247
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.method public final v0(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    sget v1, Ll/qa00;->S:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_info_icon()Lv/VDraweeView;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_content_title()Lv/VText;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_content_subtitle()Lv/VText;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_time()Lv/VText;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->get_game_location()Lv/VText;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->p0(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    const/4 v1, 0x2

    .line 80
    const/4 v2, 0x0

    .line 81
    invoke-static {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->u0(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;ZILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 85
    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move-object p1, v2

    .line 92
    :goto_0
    const-string v0, "guest"

    .line 93
    .line 94
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->n:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 101
    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 105
    .line 106
    :cond_2
    const-string p1, "queue"

    .line 107
    .line 108
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->o:Ll/l4g0;

    .line 115
    .line 116
    if-nez p1, :cond_3

    .line 117
    .line 118
    const-class p1, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekRoleView;

    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const-string v0, "p_intl_mkt_catnmouse_full"

    .line 125
    .line 126
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->o:Ll/l4g0;

    .line 131
    .line 132
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 133
    .line 134
    .line 135
    :cond_3
    return-void
.end method

.method public final w0(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Db:I

    .line 7
    .line 8
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Eb:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/bpn;

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ll/bpn;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Cb:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final y0(Lcom/p1/mobile/android/app/Act;)V
    .locals 16

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "pending"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/core/R$string;->fs:I

    .line 18
    .line 19
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v0, Lcom/p1/mobile/putong/core/R$string;->es:I

    .line 24
    .line 25
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget v3, Ll/dbc0;->jk:I

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 32
    .line 33
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const/4 v14, 0x0

    .line 38
    const/4 v15, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    const/4 v7, 0x0

    .line 42
    const/4 v8, 0x0

    .line 43
    const/4 v9, 0x0

    .line 44
    const/4 v10, 0x0

    .line 45
    const/4 v11, 0x1

    .line 46
    const/4 v12, 0x0

    .line 47
    const/4 v13, 0x0

    .line 48
    move-object/from16 v0, p1

    .line 49
    .line 50
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    move-object/from16 v0, p1

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final z0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "queue"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "e_intl_mkt_catnmouse_wait_btn"

    .line 10
    .line 11
    const-string v2, "p_intl_mkt_catnmouse_full"

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const-string v0, "add"

    .line 23
    .line 24
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/yon;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/yon;-><init>(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->w0(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->d2:Ll/a39;

    .line 76
    .line 77
    invoke-virtual {v1, p1}, Ll/a39;->o3(Ljava/lang/String;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v0, Ll/zon;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/zon;-><init>(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)V

    .line 88
    .line 89
    .line 90
    new-instance v1, Ll/apn;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/apn;-><init>(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    return-void
.end method
