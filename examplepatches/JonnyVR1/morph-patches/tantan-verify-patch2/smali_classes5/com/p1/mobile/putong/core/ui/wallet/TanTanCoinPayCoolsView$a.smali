.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView$a;->b(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/view/View;)V
    .locals 3

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lv/AutoVDraweeView;

    .line 9
    .line 10
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->c(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Lv/AutoVDraweeView;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/widget/TextView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lv/VText;

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->b(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Lv/VText;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->d(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/widget/TextView;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
