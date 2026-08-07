.class public final Ll/sqy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/gzl<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J#\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00020\t2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ%\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\t2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\tH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ%\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\t2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\n0\tH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\rJ\u0017\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/sqy;",
        "Ll/gzl;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "<init>",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)V",
        "",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandises",
        "a",
        "(Ljava/util/List;)Ljava/util/List;",
        "c",
        "b",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "detail",
        "",
        "d",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/sqy;->a:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/v5b0;->d(Ljava/util/List;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p1}, Ll/v5b0;->c(Ljava/util/List;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    new-instance v2, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    invoke-static {v3}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/sqy;->c(Ljava/util/List;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    return-object v3

    .line 32
    :cond_0
    iget-object v3, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-static {v3}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/sqy;->b(Ljava/util/List;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    return-object v3

    .line 47
    :cond_1
    move-object v3, p1

    .line 48
    check-cast v3, Ljava/util/Collection;

    .line 49
    .line 50
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    const/4 v4, 0x0

    .line 55
    move v5, v4

    .line 56
    :goto_0
    if-ge v5, v3, :cond_4

    .line 57
    .line 58
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    check-cast v6, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 63
    .line 64
    new-instance v7, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 65
    .line 66
    invoke-direct {v7, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v7}, Ll/sqy;->d(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v7, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Q(Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->P(Z)V

    .line 76
    .line 77
    .line 78
    new-instance v8, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 79
    .line 80
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/ui/purchase/d;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    if-eqz v6, :cond_2

    .line 88
    .line 89
    invoke-virtual {v8, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    invoke-virtual {v8, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 94
    .line 95
    .line 96
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    int-to-float v6, v6

    .line 101
    const/high16 v7, 0x40000000    # 2.0f

    .line 102
    .line 103
    div-float/2addr v6, v7

    .line 104
    float-to-double v6, v6

    .line 105
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    .line 106
    .line 107
    .line 108
    move-result-wide v6

    .line 109
    double-to-float v6, v6

    .line 110
    float-to-int v6, v6

    .line 111
    if-ne v6, v5, :cond_3

    .line 112
    .line 113
    const/4 v6, 0x1

    .line 114
    goto :goto_2

    .line 115
    :cond_3
    move v6, v4

    .line 116
    :goto_2
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/ui/purchase/d;->e()V

    .line 123
    .line 124
    .line 125
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    add-int/lit8 v5, v5, 0x1

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_4
    return-object v2
.end method

.method public final b(Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/v5b0;->d(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/v5b0;->c(Ljava/util/List;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3, v2}, Ll/tab0;->n(Lcom/p1/mobile/putong/core/data/ProductCategory;)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v4, v2}, Ll/tab0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v4, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_5

    .line 45
    .line 46
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    move-object v6, p1

    .line 60
    check-cast v6, Ljava/lang/Iterable;

    .line 61
    .line 62
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    const/4 v8, 0x0

    .line 71
    if-eqz v7, :cond_1

    .line 72
    .line 73
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    move-object v9, v7

    .line 78
    check-cast v9, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 79
    .line 80
    iget v10, v9, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 81
    .line 82
    if-ne v10, v5, :cond_0

    .line 83
    .line 84
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 85
    .line 86
    .line 87
    move-result v9

    .line 88
    if-eqz v9, :cond_0

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    move-object v7, v8

    .line 92
    :goto_1
    check-cast v7, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 93
    .line 94
    if-nez v7, :cond_2

    .line 95
    .line 96
    return-object v8

    .line 97
    :cond_2
    new-instance v6, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 98
    .line 99
    invoke-direct {v6, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v6}, Ll/sqy;->d(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Q(Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->P(Z)V

    .line 109
    .line 110
    .line 111
    new-instance v8, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 112
    .line 113
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/ui/purchase/d;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    if-eqz v7, :cond_3

    .line 121
    .line 122
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 127
    .line 128
    .line 129
    :goto_2
    if-ne v3, v5, :cond_4

    .line 130
    .line 131
    const/4 v5, 0x1

    .line 132
    goto :goto_3

    .line 133
    :cond_4
    const/4 v5, 0x0

    .line 134
    :goto_3
    invoke-virtual {v8, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v8, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 138
    .line 139
    .line 140
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_5
    return-object v4
.end method

.method public final c(Ljava/util/List;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/v5b0;->d(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/v5b0;->c(Ljava/util/List;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3, v2}, Ll/tab0;->o(Lcom/p1/mobile/putong/core/data/ProductCategory;)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v4, v2}, Ll/tab0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v4, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_4

    .line 45
    .line 46
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Ljava/lang/String;

    .line 51
    .line 52
    move-object v6, p1

    .line 53
    check-cast v6, Ljava/lang/Iterable;

    .line 54
    .line 55
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    const/4 v8, 0x0

    .line 64
    if-eqz v7, :cond_1

    .line 65
    .line 66
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    move-object v9, v7

    .line 71
    check-cast v9, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 72
    .line 73
    iget v9, v9, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 74
    .line 75
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    invoke-static {v9, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    if-eqz v9, :cond_0

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_1
    move-object v7, v8

    .line 87
    :goto_1
    check-cast v7, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 88
    .line 89
    if-nez v7, :cond_2

    .line 90
    .line 91
    return-object v8

    .line 92
    :cond_2
    new-instance v6, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 93
    .line 94
    invoke-direct {v6, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v6}, Ll/sqy;->d(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Q(Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v6, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->P(Z)V

    .line 104
    .line 105
    .line 106
    new-instance v8, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 107
    .line 108
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/ui/purchase/d;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-eqz v7, :cond_3

    .line 116
    .line 117
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_3
    invoke-virtual {v8, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 122
    .line 123
    .line 124
    :goto_2
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-static {v6, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    invoke-virtual {v8, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v8, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 136
    .line 137
    .line 138
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_4
    return-object v4
.end method

.method public final d(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/nry;->a(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/hzl;

    .line 29
    .line 30
    iget-object v2, p0, Ll/sqy;->a:Landroid/content/Context;

    .line 31
    .line 32
    iget-object v3, p0, Ll/sqy;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-interface {v1, v2, v3, p1}, Ll/hzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method
