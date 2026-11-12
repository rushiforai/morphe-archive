.class public final enum Lx52;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lx52;

.field public static final enum b:Lx52;

.field public static final enum c:Lx52;

.field public static final synthetic d:[Lx52;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lx52;

    const-string v1, "WAITING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lx52;->a:Lx52;

    new-instance v1, Lx52;

    const-string v2, "LOADED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lx52;->b:Lx52;

    new-instance v2, Lx52;

    const-string v3, "ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lx52;->c:Lx52;

    filled-new-array {v0, v1, v2}, [Lx52;

    move-result-object v0

    sput-object v0, Lx52;->d:[Lx52;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lx52;
    .registers 2

    const-class v0, Lx52;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lx52;

    return-object p0
.end method

.method public static values()[Lx52;
    .registers 1

    sget-object v0, Lx52;->d:[Lx52;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lx52;

    return-object v0
.end method
