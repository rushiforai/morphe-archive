.class public final enum Lujh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lujh;

.field public static final enum b:Lujh;

.field public static final enum c:Lujh;

.field public static final synthetic d:[Lujh;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lujh;

    const-string v1, "OPEN_FEEDBACK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lujh;->a:Lujh;

    new-instance v1, Lujh;

    const-string v2, "OPEN_SYSTEM_RATE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lujh;->b:Lujh;

    new-instance v2, Lujh;

    const-string v3, "DISMISSED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lujh;->c:Lujh;

    filled-new-array {v0, v1, v2}, [Lujh;

    move-result-object v0

    sput-object v0, Lujh;->d:[Lujh;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lujh;
    .registers 2

    const-class v0, Lujh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lujh;

    return-object p0
.end method

.method public static values()[Lujh;
    .registers 1

    sget-object v0, Lujh;->d:[Lujh;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lujh;

    return-object v0
.end method
