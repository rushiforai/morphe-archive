.class public final Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;",
        "Landroid/widget/FrameLayout;",
        "nlc",
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
.field public final a:Lzyk;

.field public final b:Lzyk;

.field public final c:Lzyk;

.field public final d:Lkf;

.field public e:Lnlc;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    new-instance p2, Lvg4;

    const/16 v0, 0x9

    invoke-direct {p2, p1, v0}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->a:Lzyk;

    new-instance p2, Lvg4;

    const/16 v0, 0xa

    invoke-direct {p2, p1, v0}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->b:Lzyk;

    new-instance p2, Lvg4;

    const/16 v0, 0xb

    invoke-direct {p2, p1, v0}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->c:Lzyk;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d023e

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p2, 0x7f0a0422

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_62

    new-instance p2, Lkf;

    const/16 v1, 0x11

    invoke-direct {p2, v1, p0, v0}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    new-instance v1, Le73;

    const/16 v2, 0x8

    invoke-direct {v1, p2, p1, v2}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_57

    invoke-static {p1, v0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_57
    iput-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->d:Lkf;

    sget-object p1, Lnlc;->b:Lnlc;

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->a(Lnlc;Z)V

    iput-object p1, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->e:Lnlc;

    return-void

    :cond_62
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a(Lnlc;Z)V
    .registers 10

    iget-object v0, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->e:Lnlc;

    if-ne v0, p1, :cond_7

    if-nez p2, :cond_7

    return-void

    :cond_7
    iput-object p1, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->e:Lnlc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz p2, :cond_1e

    if-eq p2, v2, :cond_1a

    if-eq p2, v1, :cond_21

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1a
    invoke-virtual {p0, v0}, Landroid/view/View;->setActivated(Z)V

    goto :goto_21

    :cond_1e
    invoke-virtual {p0, v2}, Landroid/view/View;->setActivated(Z)V

    :cond_21
    :goto_21
    iget-object p2, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->d:Lkf;

    iget-object p2, p2, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_84

    if-eq v3, v2, :cond_84

    if-ne v3, v1, :cond_80

    new-instance v3, Lx05;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lx05;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lx05;->d(I)V

    iget-object v4, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->b:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    iget-object v5, v3, Lx05;->a:Lu05;

    iput v4, v5, Lu05;->q:F

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iget-object v4, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->c:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    iput v4, v5, Lu05;->h:F

    iget-object v5, v5, Lu05;->b:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0402d7

    const v6, 0x7f06063b

    invoke-static {v5, v4, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v4

    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {v3, v4}, Lx05;->b([I)V

    invoke-static {v3}, Lal2;->c(Lx05;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_8c

    :cond_80
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_84
    iget-object v3, p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;->a:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    :goto_8c
    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_a3

    if-eq p1, v2, :cond_9f

    if-ne p1, v1, :cond_9b

    move p1, v0

    goto :goto_a6

    :cond_9b
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_9f
    const p1, 0x7f140956

    goto :goto_a6

    :cond_a3
    const p1, 0x7f140938

    :goto_a6
    invoke-static {p0, p1, v0}, Ln1h;->n(Landroid/view/View;II)V

    return-void
.end method
