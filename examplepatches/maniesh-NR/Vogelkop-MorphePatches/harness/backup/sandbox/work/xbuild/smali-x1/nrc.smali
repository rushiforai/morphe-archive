.class public final enum Lnrc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnrc;

.field public static final enum b:Lnrc;

.field public static final enum c:Lnrc;

.field public static final synthetic d:[Lnrc;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnrc;

    const-string v1, "LOADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnrc;->a:Lnrc;

    new-instance v1, Lnrc;

    const-string v2, "LIVESCORE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnrc;->b:Lnrc;

    new-instance v2, Lnrc;

    const-string v3, "ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnrc;->c:Lnrc;

    filled-new-array {v0, v1, v2}, [Lnrc;

    move-result-object v0

    sput-object v0, Lnrc;->d:[Lnrc;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnrc;
    .registers 2

    const-class v0, Lnrc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnrc;

    return-object p0
.end method

.method public static values()[Lnrc;
    .registers 1

    sget-object v0, Lnrc;->d:[Lnrc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnrc;

    return-object v0
.end method
