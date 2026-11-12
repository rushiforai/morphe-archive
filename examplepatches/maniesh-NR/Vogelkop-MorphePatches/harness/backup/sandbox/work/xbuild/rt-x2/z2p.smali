.class public final enum Lz2p;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lz2p;

.field public static final enum b:Lz2p;

.field public static final enum c:Lz2p;

.field public static final synthetic d:[Lz2p;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lz2p;

    const-string v1, "DOWNLOADED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lz2p;->a:Lz2p;

    new-instance v1, Lz2p;

    const-string v2, "ALREADY_DOWNLOADED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lz2p;

    const-string v3, "UPDATE_SUCCESS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lz2p;->b:Lz2p;

    new-instance v3, Lz2p;

    const-string v4, "UPDATE_FAILED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lz2p;->c:Lz2p;

    filled-new-array {v0, v1, v2, v3}, [Lz2p;

    move-result-object v0

    sput-object v0, Lz2p;->d:[Lz2p;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lz2p;
    .registers 2

    const-class v0, Lz2p;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lz2p;

    return-object p0
.end method

.method public static values()[Lz2p;
    .registers 1

    sget-object v0, Lz2p;->d:[Lz2p;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lz2p;

    return-object v0
.end method
