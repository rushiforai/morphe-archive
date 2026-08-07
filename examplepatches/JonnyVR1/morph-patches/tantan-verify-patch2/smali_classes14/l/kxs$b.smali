.class public Ll/kxs$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kxs;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kxs;


# direct methods
.method public constructor <init>(Ll/kxs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kxs$b;->a:Ll/kxs;

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
    iget-object p3, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 2
    .line 3
    invoke-static {p3}, Ll/kxs;->j(Ll/kxs;)Ll/bws;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3, p1}, Ll/bws;->q3(I)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 14
    .line 15
    invoke-static {p0}, Ll/kxs;->k(Ll/kxs;)Landroid/view/View;

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
    iget-object v0, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 2
    .line 3
    invoke-static {v0}, Ll/kxs;->j(Ll/kxs;)Ll/bws;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/bws;->q3(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/kxs;->J(Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {v1}, Ll/kxs;->j(Ll/kxs;)Ll/bws;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 26
    .line 27
    invoke-static {v1}, Ll/kxs;->i(Ll/kxs;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ll/bws;->q3(I)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 38
    .line 39
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/kxs;->J(Ljava/lang/Boolean;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/kxs$b;->a:Ll/kxs;

    .line 45
    .line 46
    invoke-static {p0, p1}, Ll/kxs;->l(Ll/kxs;I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
