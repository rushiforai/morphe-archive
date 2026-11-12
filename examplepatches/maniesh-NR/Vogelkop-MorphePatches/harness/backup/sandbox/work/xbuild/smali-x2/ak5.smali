.class public final enum Lak5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lak5;

.field public static final enum b:Lak5;

.field public static final enum c:Lak5;

.field public static final enum d:Lak5;

.field public static final synthetic e:[Lak5;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lak5;

    const-string v1, "IDLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lak5;->a:Lak5;

    new-instance v1, Lak5;

    const-string v2, "LOADING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lak5;->b:Lak5;

    new-instance v2, Lak5;

    const-string v3, "VALIDATING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lak5;->c:Lak5;

    new-instance v3, Lak5;

    const-string v4, "APPLYING"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lak5;->d:Lak5;

    filled-new-array {v0, v1, v2, v3}, [Lak5;

    move-result-object v0

    sput-object v0, Lak5;->e:[Lak5;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lak5;
    .registers 2

    const-class v0, Lak5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lak5;

    return-object p0
.end method

.method public static values()[Lak5;
    .registers 1

    sget-object v0, Lak5;->e:[Lak5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lak5;

    return-object v0
.end method
