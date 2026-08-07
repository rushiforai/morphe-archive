.class public Ll/mhy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mhy;->L()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mhy;


# direct methods
.method public constructor <init>(Ll/mhy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mhy$a;->a:Ll/mhy;

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
    return-void
.end method

.method public onPageSelected(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mhy$a;->a:Ll/mhy;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mhy;->I(Ll/mhy;)Ll/y8s;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lly;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/lly;->g4(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/mhy$a;->a:Ll/mhy;

    .line 13
    .line 14
    iget-object v0, v0, Ll/mhy;->n:Landroid/widget/ImageView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ll/p6s;->u0()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Ll/p6s;->s0()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Ll/vwt;->b7()Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_0

    .line 49
    .line 50
    move v3, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v3, v1

    .line 53
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/mhy$a;->a:Ll/mhy;

    .line 57
    .line 58
    const/4 v0, 0x2

    .line 59
    if-ne p1, v0, :cond_1

    .line 60
    .line 61
    move v1, v2

    .line 62
    :cond_1
    invoke-static {p0, v1}, Ll/mhy;->G(Ll/mhy;Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
