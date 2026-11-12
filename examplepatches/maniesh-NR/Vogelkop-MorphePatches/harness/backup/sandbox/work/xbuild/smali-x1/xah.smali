.class public final enum Lxah;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lxah;

.field public static final synthetic c:[Lxah;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Lxah;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lxah;->b:Lxah;

    new-instance v1, Lxah;

    const/4 v2, 0x1

    const-string v3, "start_free_offer"

    const-string v4, "START_FREE_OFFER"

    invoke-direct {v1, v4, v2, v3}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lxah;

    const/4 v3, 0x2

    const-string v4, "start_purchase"

    const-string v5, "START_PURCHASE"

    invoke-direct {v2, v5, v3, v4}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lxah;

    const/4 v4, 0x3

    const-string v5, "payment_card"

    const-string v6, "PAYMENT_CARD"

    invoke-direct {v3, v6, v4, v5}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lxah;

    const/4 v5, 0x4

    const-string v6, "payment_google_pay"

    const-string v7, "PAYMENT_GOOGLE_PAY"

    invoke-direct {v4, v7, v5, v6}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lxah;

    const/4 v6, 0x5

    const-string v7, "payment_minipay"

    const-string v8, "PAYMENT_MINIPAY"

    invoke-direct {v5, v8, v6, v7}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lxah;

    const/4 v7, 0x6

    const-string v8, "coupon_applied"

    const-string v9, "COUPON_APPLIED"

    invoke-direct {v6, v9, v7, v8}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v7, Lxah;

    const/4 v8, 0x7

    const-string v9, "finish_success"

    const-string v10, "FINISH_SUCCESS"

    invoke-direct {v7, v10, v8, v9}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v8, Lxah;

    const/16 v9, 0x8

    const-string v10, "finish_error"

    const-string v11, "FINISH_ERROR"

    invoke-direct {v8, v11, v9, v10}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v9, Lxah;

    const/16 v10, 0x9

    const-string v11, "finish_refund"

    const-string v12, "FINISH_REFUND"

    invoke-direct {v9, v12, v10, v11}, Lxah;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v9}, [Lxah;

    move-result-object v0

    sput-object v0, Lxah;->c:[Lxah;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lxah;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxah;
    .registers 2

    const-class v0, Lxah;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxah;

    return-object p0
.end method

.method public static values()[Lxah;
    .registers 1

    sget-object v0, Lxah;->c:[Lxah;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxah;

    return-object v0
.end method
