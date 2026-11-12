.class public final enum Lzan;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lzan;

.field public static final enum b:Lzan;

.field public static final enum c:Lzan;

.field public static final enum d:Lzan;

.field public static final enum e:Lzan;

.field public static final enum f:Lzan;

.field public static final enum g:Lzan;

.field public static final synthetic h:[Lzan;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lzan;

    const-string v1, "DID_NOT_GET_THAT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzan;->a:Lzan;

    new-instance v1, Lzan;

    const-string v2, "NOT_AVAILABLE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lzan;->b:Lzan;

    new-instance v2, Lzan;

    const-string v3, "LANGUAGE_NOT_SUPPORTED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lzan;->c:Lzan;

    new-instance v3, Lzan;

    const-string v4, "INSUFFICIENT_PERMISSIONS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lzan;->d:Lzan;

    new-instance v4, Lzan;

    const-string v5, "NETWORK"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lzan;->e:Lzan;

    new-instance v5, Lzan;

    const-string v6, "SERVER"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lzan;->f:Lzan;

    new-instance v6, Lzan;

    const-string v7, "UNKNOWN"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lzan;->g:Lzan;

    filled-new-array/range {v0 .. v6}, [Lzan;

    move-result-object v0

    sput-object v0, Lzan;->h:[Lzan;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzan;
    .registers 2

    const-class v0, Lzan;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzan;

    return-object p0
.end method

.method public static values()[Lzan;
    .registers 1

    sget-object v0, Lzan;->h:[Lzan;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzan;

    return-object v0
.end method
