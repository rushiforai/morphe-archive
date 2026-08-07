.class public Ll/sxs$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sxs;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sxs;


# direct methods
.method public constructor <init>(Ll/sxs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 2
    .line 3
    invoke-static {p3}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3, p1}, Ll/dxs;->v3(I)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 14
    .line 15
    invoke-static {p0}, Ll/sxs;->l(Ll/sxs;)Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    sub-float/2addr p1, p2

    .line 22
    invoke-static {}, Ll/bnl0;->y0()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    int-to-float p2, p2

    .line 27
    mul-float/2addr p1, p2

    .line 28
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/dxs;->v3(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ll/dxs;->Y3(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v1}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 29
    .line 30
    invoke-static {v1}, Ll/sxs;->j(Ll/sxs;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Ll/dxs;->v3(I)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 41
    .line 42
    invoke-static {v0}, Ll/sxs;->k(Ll/sxs;)Ll/dxs;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {v0, v1}, Ll/dxs;->Y3(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/sxs$b;->a:Ll/sxs;

    .line 51
    .line 52
    invoke-static {p0, p1}, Ll/sxs;->m(Ll/sxs;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
