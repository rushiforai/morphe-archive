.class public Ll/mp90;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VFrame_Shadow;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VText;

.field public e:Lv/VFrame_Shadow;

.field public f:Lv/VFrame_FlipContainer;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VFrame_Shadow;

.field public j:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/np90;->a(Ll/mp90;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x42400000    # 48.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Ll/mp90;->c:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    new-array v4, v3, [Landroid/view/View;

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    aput-object v2, v4, v5

    .line 20
    .line 21
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Ll/mp90;->j:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    new-array v2, v3, [Landroid/view/View;

    .line 31
    .line 32
    aput-object v1, v2, v5

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    const/high16 v0, 0x42880000    # 68.0f

    .line 38
    .line 39
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v2, p0, Ll/mp90;->b:Lv/VFrame_Shadow;

    .line 44
    .line 45
    new-array v4, v3, [Landroid/view/View;

    .line 46
    .line 47
    aput-object v2, v4, v5

    .line 48
    .line 49
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object p0, p0, Ll/mp90;->i:Lv/VFrame_Shadow;

    .line 57
    .line 58
    new-array v1, v3, [Landroid/view/View;

    .line 59
    .line 60
    aput-object p0, v1, v5

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method
