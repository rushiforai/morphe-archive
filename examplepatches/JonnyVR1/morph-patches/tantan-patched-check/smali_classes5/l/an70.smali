.class public final Ll/an70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/an70$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/sm70;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ#\u0010\u0014\u001a\u00020\u00132\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u000bJ\u000f\u0010\u0017\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\r\u0010\u001c\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\r\u0010\u001e\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u001b\u0010#\u001a\u00020\t2\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020!0 \u00a2\u0006\u0004\u0008#\u0010$J\r\u0010%\u001a\u00020\t\u00a2\u0006\u0004\u0008%\u0010\u000bJ\r\u0010\'\u001a\u00020&\u00a2\u0006\u0004\u0008\'\u0010(J\u001d\u0010)\u001a\u00020\t2\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020!0 H\u0002\u00a2\u0006\u0004\u0008)\u0010$J\u001d\u0010*\u001a\u00020\t2\u000c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020!0 H\u0002\u00a2\u0006\u0004\u0008*\u0010$R\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010,R\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008-\u0010.\u001a\u0004\u0008/\u0010\u0018R\u0016\u0010\u000c\u001a\u00020\u00028\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u001b\u00107\u001a\u0002028BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00083\u00104\u001a\u0004\u00085\u00106R\u001b\u0010<\u001a\u0002088BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00089\u00104\u001a\u0004\u0008:\u0010;R\u001c\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020!0 8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008=\u0010>R\u001b\u0010C\u001a\u00020?8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008@\u00104\u001a\u0004\u0008A\u0010B\u00a8\u0006D"
    }
    d2 = {
        "Ll/an70;",
        "Ll/iam;",
        "Ll/sm70;",
        "Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;",
        "headerView",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;Landroid/content/Context;)V",
        "",
        "v",
        "()V",
        "presenter",
        "j",
        "(Ll/sm70;)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "inflateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "destroy",
        "C0",
        "()Landroid/content/Context;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "()Lcom/p1/mobile/android/app/Act;",
        "q",
        "()Landroid/view/View;",
        "n",
        "()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;",
        "",
        "Lcom/p1/mobile/putong/core/data/PicksUser;",
        "list",
        "u",
        "(Ljava/util/List;)V",
        "k",
        "Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;",
        "s",
        "()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;",
        "x",
        "w",
        "a",
        "Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;",
        "b",
        "Landroid/content/Context;",
        "getContext",
        "c",
        "Ll/sm70;",
        "Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;",
        "d",
        "Lkotlin/Lazy;",
        "m",
        "()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;",
        "expandView",
        "Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;",
        "e",
        "p",
        "()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;",
        "hideView",
        "f",
        "Ljava/util/List;",
        "Ll/eo70;",
        "g",
        "l",
        "()Ll/eo70;",
        "adapter",
        "member_intlGmsRelease"
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
.field public final a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Ll/sm70;

.field public final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;Landroid/content/Context;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 11
    .line 12
    iput-object p2, p0, Ll/an70;->b:Landroid/content/Context;

    .line 13
    .line 14
    new-instance p1, Ll/wm70;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/wm70;-><init>(Ll/an70;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/an70;->d:Lkotlin/Lazy;

    .line 24
    .line 25
    new-instance p1, Ll/xm70;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/xm70;-><init>(Ll/an70;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll/an70;->e:Lkotlin/Lazy;

    .line 35
    .line 36
    new-instance p1, Ll/ym70;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Ll/ym70;-><init>(Ll/an70;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/an70;->g:Lkotlin/Lazy;

    .line 46
    .line 47
    return-void
.end method

.method public static a(Ll/an70;)Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->get_state_expand()Landroid/view/ViewStub;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 15
    .line 16
    return-object p0
.end method

.method public static b(Ll/an70;)Ll/eo70;
    .locals 1

    .line 1
    new-instance v0, Ll/eo70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/an70;->c:Ll/sm70;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "presenter"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-direct {v0, p0}, Ll/eo70;-><init>(Ll/sm70;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static c(Ll/an70;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/an70;->f:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "list"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0, v0}, Ll/an70;->x(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/an70;->p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/high16 v0, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static d(Ll/an70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/an70;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Ll/an70;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    float-to-int p1, p1

    .line 24
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 25
    .line 26
    iget-object p1, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static f(Ll/an70;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->f()Ll/byd0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static i(Ll/an70;)Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->get_state_hide()Landroid/view/ViewStub;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 15
    .line 16
    return-object p0
.end method

.method private final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->HIDE:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->setType(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/an70;->p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;->l0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/an70;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/an70;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/sm70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/an70;->j(Ll/sm70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/an70;->q()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/sm70;)V
    .locals 0
    .param p1    # Ll/sm70;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/an70;->c:Ll/sm70;

    .line 5
    .line 6
    return-void
.end method

.method public final k()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x428e0000    # 71.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v2, v2, [F

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput v0, v2, v3

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    aput v1, v2, v0

    .line 23
    .line 24
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    new-instance v1, Ll/tm70;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tm70;-><init>(Ll/an70;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    new-array v12, v0, [F

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    aput v1, v12, v3

    .line 44
    .line 45
    const-string v6, "alpha"

    .line 46
    .line 47
    const-wide/16 v7, 0x0

    .line 48
    .line 49
    const-wide/16 v9, 0x1f4

    .line 50
    .line 51
    const/4 v11, 0x0

    .line 52
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0}, Ll/an70;->p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    new-array v12, v0, [F

    .line 61
    .line 62
    const/high16 v0, 0x3f800000    # 1.0f

    .line 63
    .line 64
    aput v0, v12, v3

    .line 65
    .line 66
    const-string v6, "alpha"

    .line 67
    .line 68
    const-wide/16 v7, 0xc8

    .line 69
    .line 70
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-wide/16 v6, 0xc8

    .line 75
    .line 76
    const-wide/16 v8, 0x1f4

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    invoke-static/range {v4 .. v9}, Ll/gt0;->k(Landroid/animation/Animator;Landroid/view/animation/Interpolator;JJ)Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const/16 v3, 0xa

    .line 84
    .line 85
    invoke-static {v3}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    filled-new-array {v1, v0, v2, v3}, [Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/um70;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/um70;-><init>(Ll/an70;)V

    .line 100
    .line 101
    .line 102
    new-instance v2, Ll/vm70;

    .line 103
    .line 104
    invoke-direct {v2, p0}, Ll/vm70;-><init>(Ll/an70;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final l()Ll/eo70;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/an70;->g:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/eo70;

    .line 8
    .line 9
    return-object p0
.end method

.method public final m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an70;->d:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 8
    .line 9
    return-object p0
.end method

.method public final n()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an70;->e:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 8
    .line 9
    return-object p0
.end method

.method public final q()Landroid/view/View;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->getType()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/an70$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    aget v0, v1, v0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/an70;->p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final s()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->getType()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final u(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/an70;->f:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/an70;->v()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->getType()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->EXPAND:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 23
    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x4

    .line 31
    if-le v0, v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/an70;->w(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0, p1}, Ll/an70;->x(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final w(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/an70;->m()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/an70;->c:Ll/sm70;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string v1, "presenter"

    .line 10
    .line 11
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/an70;->l()Ll/eo70;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Ll/zm70;

    .line 20
    .line 21
    invoke-direct {v3, p0}, Ll/zm70;-><init>(Ll/an70;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;->H(Ll/sm70;Ll/eo70;Ljava/util/List;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final x(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/an70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->HIDE:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->setType(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ll/an70;->v()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/an70;->p()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateHideView;->k0(Lcom/p1/mobile/putong/core/data/PicksUser;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
