.class public Ll/l030$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l030;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/l030;


# direct methods
.method public constructor <init>(Ll/l030;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l030$b;->b:Ll/l030;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/l030$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l030$b;->b:Ll/l030;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/l030$b;->b:Ll/l030;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ll/l030;->z(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/widget/TextView;

    .line 19
    .line 20
    sget v1, Ll/cgc0;->m:I

    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 31
    .line 32
    .line 33
    iget-boolean p1, p0, Ll/l030$b;->a:Z

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/l030$b;->b:Ll/l030;

    .line 38
    .line 39
    invoke-static {p1}, Ll/l030;->i(Ll/l030;)Ll/b030;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/pz20;->L()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v1, p0, Ll/l030$b;->b:Ll/l030;

    .line 52
    .line 53
    invoke-static {v1}, Ll/l030;->f(Ll/l030;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->panel:Lcom/p1/mobile/putong/core/data/CoreGiftPanel;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->name:Ljava/lang/String;

    .line 66
    .line 67
    const-string v1, "gift_tab_type"

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {v0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "e_chat_gift_bar_tab"

    .line 78
    .line 79
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    const/4 p1, 0x1

    .line 83
    iput-boolean p1, p0, Ll/l030$b;->a:Z

    .line 84
    .line 85
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l030$b;->b:Ll/l030;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l030;->z(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/widget/TextView;

    .line 11
    .line 12
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/widget/TextView;

    .line 22
    .line 23
    sget p1, Ll/cgc0;->n:I

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
