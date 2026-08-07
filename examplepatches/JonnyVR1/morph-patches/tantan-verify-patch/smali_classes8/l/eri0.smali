.class public final Ll/eri0;
.super Ll/kg2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/eri0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001fB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\nJ+\u0010\u0011\u001a\u00020\u00082\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\r0\u000c2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\nJ\u000f\u0010\u0014\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\nJ\u000f\u0010\u0016\u001a\u00020\u0015H\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001c\u00a8\u0006 "
    }
    d2 = {
        "Ll/eri0;",
        "Ll/kg2;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "pageType",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V",
        "",
        "r",
        "()V",
        "q",
        "Ll/pf60;",
        "",
        "pair",
        "",
        "bundle",
        "j0",
        "(Ll/pf60;Z)V",
        "B",
        "destroy",
        "",
        "M",
        "()I",
        "I",
        "()Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;",
        "A",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;",
        "marquee",
        "Companion",
        "a",
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


# static fields
.field public static final Companion:Ll/eri0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/eri0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/eri0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/eri0;->Companion:Ll/eri0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/android/app/Act;
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
    const/4 v4, 0x4

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    invoke-direct/range {v0 .. v5}, Ll/kg2;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public B()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/kg2;->B()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_text_connecting"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget v2, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/kg2;->L()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-ne v2, p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    invoke-static {v2, p0}, Lkotlin/ranges/a;->b(II)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    iput p0, v1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/haw;->A0()Lrx/subjects/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public I()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kq3;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public M()I
    .locals 0

    .line 1
    sget p0, Ll/ebc0;->k0:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eri0;->A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Ll/kg2;->destroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j0(Ll/pf60;Z)V
    .locals 0
    .param p1    # Ll/pf60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/kg2;->j0(Ll/pf60;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/eri0;->A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;->f()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->q()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_text_searching"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->r()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_text_searching"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/eri0;->A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/kg2;->R()Landroid/view/ViewStub;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 22
    .line 23
    iput-object v0, p0, Ll/eri0;->A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/eri0;->A:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/marquee/BuzzMarqueeRecyclerView;->e()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
