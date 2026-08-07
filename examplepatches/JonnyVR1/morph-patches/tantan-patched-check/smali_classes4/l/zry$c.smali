.class public Ll/zry$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jzl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


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
.method public a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p4}, Ll/zry;->g(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v6

    .line 5
    new-instance p0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v8, 0x0

    .line 11
    move v2, v8

    .line 12
    :goto_0
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ge v2, v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v4, v0

    .line 23
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 24
    .line 25
    new-instance v9, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    invoke-direct {v9}, Lcom/p1/mobile/putong/core/ui/purchase/d;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v10, 0x1

    .line 35
    sub-int/2addr v0, v10

    .line 36
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v5, v0

    .line 41
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    move-object v0, p1

    .line 45
    move-object v1, p2

    .line 46
    move-object v3, p3

    .line 47
    invoke-static/range {v0 .. v7}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_0

    .line 56
    .line 57
    invoke-virtual {v9, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    invoke-virtual {v9, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 62
    .line 63
    .line 64
    :goto_1
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    int-to-float p1, p1

    .line 69
    const/high16 p2, 0x40000000    # 2.0f

    .line 70
    .line 71
    div-float/2addr p1, p2

    .line 72
    float-to-double p1, p1

    .line 73
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    .line 74
    .line 75
    .line 76
    move-result-wide p1

    .line 77
    double-to-int p1, p1

    .line 78
    if-ne p1, v2, :cond_1

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_1
    move v10, v8

    .line 82
    :goto_2
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/ui/purchase/d;->e()V

    .line 92
    .line 93
    .line 94
    invoke-interface {p0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    move-object p1, v0

    .line 100
    move-object p2, v1

    .line 101
    move-object p3, v3

    .line 102
    goto :goto_0

    .line 103
    :cond_2
    return-object p0
.end method
