.class public Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager$a;
.super Landroid/widget/Scroller;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;Landroid/content/Context;Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager$a;->b:Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager$a;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public startScroll(IIII)V
    .locals 6

    .line 1
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager$a;->a:I

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    invoke-super/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public startScroll(IIIII)V
    .locals 0

    .line 12
    iget p5, p0, Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager$a;->a:I

    invoke-super/range {p0 .. p5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method
