.class public final enum Lrpl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lrpl;

.field public static final synthetic c:[Lrpl;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lrpl;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lrpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lrpl;->b:Lrpl;

    new-instance v1, Lrpl;

    const/4 v2, 0x1

    const-string v3, "first_purchase_time"

    const-string v4, "FIRST_PURCHASE_TIME"

    invoke-direct {v1, v4, v2, v3}, Lrpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lrpl;

    const/4 v3, 0x2

    const-string v4, "latest_purchase_time"

    const-string v5, "LATEST_PURCHASE_TIME"

    invoke-direct {v2, v5, v3, v4}, Lrpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lrpl;

    const/4 v4, 0x3

    const-string v5, "latest_free_offer_claim_time"

    const-string v6, "LATEST_FREE_OFFER_CLAIM_TIME"

    invoke-direct {v3, v6, v4, v5}, Lrpl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3}, [Lrpl;

    move-result-object v0

    sput-object v0, Lrpl;->c:[Lrpl;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lrpl;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrpl;
    .registers 2

    const-class v0, Lrpl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrpl;

    return-object p0
.end method

.method public static values()[Lrpl;
    .registers 1

    sget-object v0, Lrpl;->c:[Lrpl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrpl;

    return-object v0
.end method
