.class public abstract Ll/cry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/hzl<",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010\u0006\n\u0002\u0008\u0012\n\u0002\u0010\u000b\n\u0002\u0008\u0008\u0008&\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\u0012\u001a\u00020\r8\u0004X\u0084\u0004\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011R$\u0010\u0019\u001a\u0004\u0018\u00010\u00138\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0014\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\"\u0010 \u001a\u00020\u001a8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0010\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001d\"\u0004\u0008\u001e\u0010\u001fR\"\u0010#\u001a\u00020\u001a8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001c\u0010\u001b\u001a\u0004\u0008!\u0010\u001d\"\u0004\u0008\"\u0010\u001fR\"\u0010\'\u001a\u00020\u001a8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008$\u0010\u001b\u001a\u0004\u0008%\u0010\u001d\"\u0004\u0008&\u0010\u001fR\"\u0010*\u001a\u00020\u001a8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008!\u0010\u001b\u001a\u0004\u0008(\u0010\u001d\"\u0004\u0008)\u0010\u001fR\"\u0010,\u001a\u00020\u001a8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u001b\u001a\u0004\u0008$\u0010\u001d\"\u0004\u0008+\u0010\u001fR\"\u00104\u001a\u00020-8\u0004@\u0004X\u0084\u000e\u00a2\u0006\u0012\n\u0004\u0008.\u0010/\u001a\u0004\u00080\u00101\"\u0004\u00082\u00103\u00a8\u00065"
    }
    d2 = {
        "Ll/cry;",
        "Ll/hzl;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "detail",
        "",
        "g",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V",
        "Ljava/text/NumberFormat;",
        "a",
        "Ljava/text/NumberFormat;",
        "c",
        "()Ljava/text/NumberFormat;",
        "numberFormat",
        "",
        "b",
        "Ljava/lang/String;",
        "()Ljava/lang/String;",
        "setCurrencySymbol",
        "(Ljava/lang/String;)V",
        "currencySymbol",
        "",
        "D",
        "d",
        "()D",
        "setPrice",
        "(D)V",
        "price",
        "f",
        "setUnitPrice",
        "unitPrice",
        "e",
        "getOriginalPrice",
        "setOriginalPrice",
        "originalPrice",
        "getOriginalUnitPrice",
        "setOriginalUnitPrice",
        "originalUnitPrice",
        "setPromotionPrice",
        "promotionPrice",
        "",
        "h",
        "Z",
        "getInPromotion",
        "()Z",
        "setInPromotion",
        "(Z)V",
        "inPromotion",
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


# instance fields
.field public final a:Ljava/text/NumberFormat;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:D

.field public d:D

.field public e:D

.field public f:D

.field public g:D

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/cry;->g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cry;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/text/NumberFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cry;->c:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final e()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cry;->g:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final f()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cry;->d:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/d$a;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    invoke-virtual {p1, p2}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 23
    .line 24
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Ll/cry;->b:Ljava/lang/String;

    .line 27
    .line 28
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 29
    .line 30
    iput-wide v0, p0, Ll/cry;->c:D

    .line 31
    .line 32
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 33
    .line 34
    iput-wide v0, p0, Ll/cry;->d:D

    .line 35
    .line 36
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 37
    .line 38
    iput-wide v0, p0, Ll/cry;->e:D

    .line 39
    .line 40
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 41
    .line 42
    iput-wide v0, p0, Ll/cry;->f:D

    .line 43
    .line 44
    invoke-static {p1}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iput-boolean p2, p0, Ll/cry;->h:Z

    .line 49
    .line 50
    iget p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 51
    .line 52
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i0(I)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/cry;->b:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->R(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 61
    .line 62
    iget-wide v0, p0, Ll/cry;->c:D

    .line 63
    .line 64
    invoke-virtual {p2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->W(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-wide v0, p0, Ll/cry;->d:D

    .line 72
    .line 73
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 74
    .line 75
    cmpl-double p2, v0, v2

    .line 76
    .line 77
    iget-object v2, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 78
    .line 79
    if-ltz p2, :cond_0

    .line 80
    .line 81
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    invoke-virtual {v2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->X(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-virtual {v2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->X(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object p2, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 101
    .line 102
    iget-wide v0, p0, Ll/cry;->e:D

    .line 103
    .line 104
    invoke-virtual {p2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->U(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 112
    .line 113
    iget-wide v0, p0, Ll/cry;->f:D

    .line 114
    .line 115
    invoke-virtual {p2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->V(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-boolean p2, p0, Ll/cry;->h:Z

    .line 123
    .line 124
    if-eqz p2, :cond_1

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 127
    .line 128
    .line 129
    move-result-wide p1

    .line 130
    iput-wide p1, p0, Ll/cry;->g:D

    .line 131
    .line 132
    iget-object v0, p0, Ll/cry;->a:Ljava/text/NumberFormat;

    .line 133
    .line 134
    invoke-virtual {v0, p1, p2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g0(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    const/4 p1, 0x1

    .line 142
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->d0(Z)V

    .line 143
    .line 144
    .line 145
    iget-wide p1, p0, Ll/cry;->g:D

    .line 146
    .line 147
    invoke-virtual {p3, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h0(D)V

    .line 148
    .line 149
    .line 150
    :cond_1
    iget-wide p0, p0, Ll/cry;->c:D

    .line 151
    .line 152
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f0(D)V

    .line 153
    .line 154
    .line 155
    return-void
.end method
