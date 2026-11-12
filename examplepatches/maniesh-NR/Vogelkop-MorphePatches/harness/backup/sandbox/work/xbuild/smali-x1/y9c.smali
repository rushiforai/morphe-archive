.class public final enum Ly9c;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Lhr5;

.field public static final enum b:Ly9c;

.field public static final enum c:Ly9c;

.field public static final enum d:Ly9c;

.field public static final enum e:Ly9c;

.field public static final enum f:Ly9c;

.field public static final enum g:Ly9c;

.field public static final synthetic h:[Ly9c;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ly9c;

    const-string v1, "PRODUCT_AND_SERVICE_NEWS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ly9c;->b:Ly9c;

    new-instance v1, Ly9c;

    const-string v2, "WEATHER_FORECAST"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ly9c;->c:Ly9c;

    new-instance v2, Ly9c;

    const-string v3, "LIVE_SCORE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ly9c;->d:Ly9c;

    new-instance v3, Ly9c;

    const-string v4, "REWARDS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ly9c;->e:Ly9c;

    new-instance v4, Ly9c;

    const-string v5, "WEATHER_ALERT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Ly9c;->f:Ly9c;

    new-instance v5, Ly9c;

    const-string v6, "ESIM"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Ly9c;->g:Ly9c;

    filled-new-array/range {v0 .. v5}, [Ly9c;

    move-result-object v0

    sput-object v0, Ly9c;->h:[Ly9c;

    new-instance v0, Lh58;

    new-instance v0, Lhr5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly9c;->a:Lhr5;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ly9c;
    .registers 2

    const-class v0, Ly9c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ly9c;

    return-object p0
.end method

.method public static values()[Ly9c;
    .registers 1

    sget-object v0, Ly9c;->h:[Ly9c;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ly9c;

    return-object v0
.end method
