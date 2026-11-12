.class public final enum Lnsn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnsn;

.field public static final enum b:Lnsn;

.field public static final enum c:Lnsn;

.field public static final enum d:Lnsn;

.field public static final enum e:Lnsn;

.field public static final enum f:Lnsn;

.field public static final synthetic g:[Lnsn;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lnsn;

    const-string v1, "CHAT_LOADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnsn;->a:Lnsn;

    new-instance v1, Lnsn;

    const-string v2, "CHAT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnsn;->b:Lnsn;

    new-instance v2, Lnsn;

    const-string v3, "NEW_CHAT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnsn;->c:Lnsn;

    new-instance v3, Lnsn;

    const-string v4, "NEEDS_UPDATE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lnsn;->d:Lnsn;

    new-instance v4, Lnsn;

    const-string v5, "INITIALIZING"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lnsn;->e:Lnsn;

    new-instance v5, Lnsn;

    const-string v6, "ERROR"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lnsn;->f:Lnsn;

    filled-new-array/range {v0 .. v5}, [Lnsn;

    move-result-object v0

    sput-object v0, Lnsn;->g:[Lnsn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnsn;
    .registers 2

    const-class v0, Lnsn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnsn;

    return-object p0
.end method

.method public static values()[Lnsn;
    .registers 1

    sget-object v0, Lnsn;->g:[Lnsn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnsn;

    return-object v0
.end method
