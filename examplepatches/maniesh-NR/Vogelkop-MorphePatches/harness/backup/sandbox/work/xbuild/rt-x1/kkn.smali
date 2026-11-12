.class public final enum Lkkn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lkkn;

.field public static final enum b:Lkkn;

.field public static final enum c:Lkkn;

.field public static final synthetic d:[Lkkn;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkkn;

    const-string v1, "HOME_SCREEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkkn;->a:Lkkn;

    new-instance v1, Lkkn;

    const-string v2, "LOCK_SCREEN"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkkn;->b:Lkkn;

    new-instance v2, Lkkn;

    const-string v3, "HOME_AND_LOCK_SCREEN"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lkkn;->c:Lkkn;

    filled-new-array {v0, v1, v2}, [Lkkn;

    move-result-object v0

    sput-object v0, Lkkn;->d:[Lkkn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkkn;
    .registers 2

    const-class v0, Lkkn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkkn;

    return-object p0
.end method

.method public static values()[Lkkn;
    .registers 1

    sget-object v0, Lkkn;->d:[Lkkn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkkn;

    return-object v0
.end method
