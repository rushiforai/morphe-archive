.class public final enum Lcom/google/ads/interactivemedia/v3/impl/data/zzay;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field private static final synthetic $VALUES:[Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

.field public static final enum Html:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

.field public static final enum IFrame:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

.field public static final enum Static:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    const-string v1, "Html"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->Html:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    new-instance v1, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    const-string v2, "Static"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->Static:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    new-instance v2, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    const-string v3, "IFrame"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->IFrame:Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    filled-new-array {v0, v1, v2}, [Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    move-result-object v0

    sput-object v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->$VALUES:[Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzay;
    .registers 2

    const-class v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    return-object p0
.end method

.method public static values()[Lcom/google/ads/interactivemedia/v3/impl/data/zzay;
    .registers 1

    sget-object v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->$VALUES:[Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    invoke-virtual {v0}, [Lcom/google/ads/interactivemedia/v3/impl/data/zzay;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/ads/interactivemedia/v3/impl/data/zzay;

    return-object v0
.end method
