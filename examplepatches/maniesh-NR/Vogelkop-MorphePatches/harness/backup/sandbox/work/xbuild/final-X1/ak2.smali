.class public final enum Lak2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lak2;

.field public static final enum c:Lak2;

.field public static final enum d:Lak2;

.field public static final enum e:Lak2;

.field public static final enum f:Lak2;

.field public static final synthetic g:[Lak2;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lak2;

    const/4 v1, 0x0

    const-string v2, "relatedOrigins"

    const-string v3, "CAPABILITY_RELATED_ORIGINS"

    invoke-direct {v0, v3, v1, v2}, Lak2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lak2;->b:Lak2;

    new-instance v1, Lak2;

    const/4 v2, 0x1

    const-string v3, "hybridTransport"

    const-string v4, "CAPABILITY_HYBRID_TRANSPORT"

    invoke-direct {v1, v4, v2, v3}, Lak2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lak2;->c:Lak2;

    new-instance v2, Lak2;

    const/4 v3, 0x2

    const-string v4, "passkeyPlatformAuthenticator"

    const-string v5, "CAPABILITY_PPAA"

    invoke-direct {v2, v5, v3, v4}, Lak2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lak2;->d:Lak2;

    new-instance v3, Lak2;

    const/4 v4, 0x3

    const-string v5, "userVerifyingPlatformAuthenticator"

    const-string v6, "CAPABILITY_UVPAA"

    invoke-direct {v3, v6, v4, v5}, Lak2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lak2;->e:Lak2;

    new-instance v4, Lak2;

    const/4 v5, 0x4

    const-string v6, "conditionalGet"

    const-string v7, "CAPABILITY_CONDITIONAL_GET"

    invoke-direct {v4, v7, v5, v6}, Lak2;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lak2;->f:Lak2;

    filled-new-array {v0, v1, v2, v3, v4}, [Lak2;

    move-result-object v0

    sput-object v0, Lak2;->g:[Lak2;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lak2;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lak2;
    .registers 2

    const-class v0, Lak2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lak2;

    return-object p0
.end method

.method public static values()[Lak2;
    .registers 1

    sget-object v0, Lak2;->g:[Lak2;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lak2;

    return-object v0
.end method
