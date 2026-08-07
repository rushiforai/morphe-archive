.class public Ll/uyf$c;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uyf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic e:Ll/uyf;


# direct methods
.method public constructor <init>(Ll/uyf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uyf$c;->e:Ll/uyf;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/uyf$c;->e:Ll/uyf;

    .line 16
    .line 17
    invoke-static {p0, p2}, Ll/uyf;->o(Ll/uyf;I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-static {p2}, Ll/rsf0;->i(I)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const/high16 v1, 0x44160000    # 600.0f

    .line 30
    .line 31
    cmpl-float p2, p2, v1

    .line 32
    .line 33
    if-ltz p2, :cond_0

    .line 34
    .line 35
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;->picBig:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;->picSmall:I

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 49
    .line 50
    const/4 p2, -0x1

    .line 51
    invoke-direct {p0, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method
