.class public final Ll/i9b0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/i9b0;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "currentPurchaseType",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;)V",
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


# static fields
.field public static final INSTANCE:Ll/i9b0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/i9b0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i9b0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/i9b0;->INSTANCE:Ll/i9b0;

    .line 7
    .line 8
    return-void
.end method

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
.method public final a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object p1, p0

    .line 16
    :goto_0
    if-eqz p1, :cond_6

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x2

    .line 23
    sparse-switch v0, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :sswitch_0
    const-string v0, "tttSeeWhoLikedMe"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 37
    .line 38
    const-string v0, "Subscription Page (SEE)"

    .line 39
    .line 40
    invoke-static {p1, v0, p0, v1, p0}, Ll/x95;->n(Ll/x95;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :sswitch_1
    const-string v0, "tttSvipGoogleplay"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 54
    .line 55
    const-string v0, "Subscription Page (PREMIUM)"

    .line 56
    .line 57
    invoke-static {p1, v0, p0, v1, p0}, Ll/x95;->n(Ll/x95;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :sswitch_2
    const-string v0, "tttUltraPremium"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_3

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 71
    .line 72
    const-string v0, "Subscription Page (ULTRA PREMIUM)"

    .line 73
    .line 74
    invoke-static {p1, v0, p0, v1, p0}, Ll/x95;->n(Ll/x95;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :sswitch_3
    const-string v0, "tttVip"

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 88
    .line 89
    const-string v0, "Subscription Page (VIP)"

    .line 90
    .line 91
    invoke-static {p1, v0, p0, v1, p0}, Ll/x95;->n(Ll/x95;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :sswitch_4
    const-string v0, "tttDiamond"

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 105
    .line 106
    const-string v0, "Top Up Page (TANTAN DIAMONDS)"

    .line 107
    .line 108
    invoke-static {p1, v0, p0, v1, p0}, Ll/x95;->n(Ll/x95;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    :cond_6
    :goto_1
    return-void

    .line 112
    nop

    .line 113
    :sswitch_data_0
    .sparse-switch
        -0x47cf6340 -> :sswitch_4
        -0x33752677 -> :sswitch_3
        -0x19ee22e1 -> :sswitch_2
        0xd13ae6b -> :sswitch_1
        0x1ace97a6 -> :sswitch_0
    .end sparse-switch
.end method
