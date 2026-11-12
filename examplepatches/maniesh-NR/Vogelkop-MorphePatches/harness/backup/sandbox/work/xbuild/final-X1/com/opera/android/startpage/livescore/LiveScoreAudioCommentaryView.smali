.class public final Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;",
        "Landroid/widget/FrameLayout;",
        "ukc",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic f:I


# instance fields
.field public final a:Lov0;

.field public final b:Lkze;

.field public final c:Lnak;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d0231

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p2, 0x7f0a0521

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_71

    const p2, 0x7f0a0848

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v2, :cond_71

    new-instance p2, Lov0;

    const/16 v3, 0x14

    invoke-direct {p2, p0, v0, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->a:Lov0;

    new-instance p2, Lz61;

    invoke-direct {p2, p0}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p2, p2, Lz61;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->b:Lkze;

    invoke-static {v1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->c:Lnak;

    new-instance p0, Ldvb;

    const-string p2, "fill color"

    const-string v0, "**"

    filled-new-array {v0, p2, v0}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object p2, Lk3d;->a:Landroid/graphics/PointF;

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance v0, Lkw0;

    invoke-direct {v0, p1}, Lkw0;-><init>(Landroid/content/Context;)V

    new-instance p1, Lqll;

    invoke-direct {p1, v0}, Lqll;-><init>(Lrll;)V

    iget-object v0, v2, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcrk;

    const/16 v1, 0xc

    invoke-direct {v0, p1, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, p0, p2, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    return-void

    :cond_71
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final a(Lukc;)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->a:Lov0;

    iget-object v1, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    sget-object v2, Lukc;->b:Lukc;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-ne p1, v2, :cond_12

    move v2, v4

    goto :goto_13

    :cond_12
    move v2, v3

    :goto_13
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v1, Lukc;->c:Lukc;

    if-ne p1, v1, :cond_20

    const/4 v1, 0x1

    goto :goto_21

    :cond_20
    move v1, v4

    :goto_21
    if-eqz v1, :cond_25

    move v2, v4

    goto :goto_26

    :cond_25
    move v2, v3

    :goto_26
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    goto :goto_32

    :cond_2f
    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :goto_32
    sget-object v0, Lukc;->a:Lukc;

    if-eq p1, v0, :cond_37

    move v3, v4

    :cond_37
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final b(Lrlh;Lfwf;)V
    .registers 13

    iget-boolean v0, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->d:Z

    new-instance v1, Lvkc;

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v2, 0x3

    const-class v4, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    const-string v5, "makeViewState"

    const-string v6, "makeViewState(Lcom/opera/android/live_score/LiveCommentaryStatus;Lcom/opera/android/live_score/data/LiveScoreEvent;)Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView$State;"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lvkc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v6, Lya9;

    iget-object p0, v3, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->c:Lnak;

    const/4 v0, 0x0

    invoke-direct {v6, p1, p0, v1, v0}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v7

    new-instance v8, Lfb9;

    const/4 p0, 0x0

    const/16 p1, 0xa

    invoke-direct {v8, p1, p0, v3}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v5, Lpqh;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v4, Lrg;

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lug;

    invoke-direct {p0, v4, v0}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p1, v3, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->b:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method
