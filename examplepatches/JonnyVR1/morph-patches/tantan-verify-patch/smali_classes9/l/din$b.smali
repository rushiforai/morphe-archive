.class public Ll/din$b;
.super Ll/pow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/din;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public final f:Ljava/lang/String;

.field public final g:Lcom/p1/mobile/putong/core/data/Merchandise;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;Ll/y3m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p5}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y3m;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/din$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 5
    .line 6
    iput-object p4, p0, Ll/din$b;->f:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    if-eqz v3, :cond_5

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_5

    .line 33
    .line 34
    invoke-static {}, Ll/t7a;->i()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    iget-object v4, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 39
    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v2, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p0, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_3

    .line 99
    .line 100
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    iget-object v0, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 123
    .line 124
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    iget-object p0, p0, Ll/din$b;->g:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_5

    .line 135
    .line 136
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    iget-object p0, p0, Ll/ijj;->b:Lrx/subjects/a;

    .line 141
    .line 142
    invoke-virtual {p0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    :cond_5
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/din$b;->A()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/pow;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/din$b;->A()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/pow;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public x()[Ljava/lang/Object;
    .locals 9

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/din$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/din$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 24
    .line 25
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 26
    .line 27
    move-wide v3, v0

    .line 28
    const-string v1, "currency"

    .line 29
    .line 30
    move-wide v4, v3

    .line 31
    const-string v3, "value"

    .line 32
    .line 33
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string v5, "skuID"

    .line 38
    .line 39
    iget-object v6, p0, Ll/din$b;->f:Ljava/lang/String;

    .line 40
    .line 41
    const-string v7, "platform"

    .line 42
    .line 43
    const-string v8, "android"

    .line 44
    .line 45
    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    return-object p0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string v1, "Failed to generate payment params"

    .line 55
    .line 56
    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    sget-object p0, Ll/pow;->d:[Ljava/lang/Object;

    .line 63
    .line 64
    return-object p0
.end method
