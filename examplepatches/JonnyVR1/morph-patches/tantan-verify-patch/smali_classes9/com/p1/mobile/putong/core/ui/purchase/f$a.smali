.class public Lcom/p1/mobile/putong/core/ui/purchase/f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/f;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/f;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

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

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f(IF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ge p1, v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 v0, 0x0

    .line 57
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h(Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-ge p1, v0, :cond_2

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->h(Lcom/p1/mobile/putong/core/ui/purchase/f;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 113
    .line 114
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f;->k:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->i(Z)V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method
