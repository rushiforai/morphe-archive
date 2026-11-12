.class public final enum Lixl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lixl;

.field public static final enum b:Lixl;

.field public static final enum c:Lixl;

.field public static final synthetic d:[Lixl;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lixl;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lixl;->a:Lixl;

    new-instance v1, Lixl;

    const-string v2, "FAILED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lixl;->b:Lixl;

    new-instance v2, Lixl;

    const-string v3, "FAILED_INVALID_GROUP"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lixl;->c:Lixl;

    filled-new-array {v0, v1, v2}, [Lixl;

    move-result-object v0

    sput-object v0, Lixl;->d:[Lixl;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lixl;
    .registers 2

    const-class v0, Lixl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lixl;

    return-object p0
.end method

.method public static values()[Lixl;
    .registers 1

    sget-object v0, Lixl;->d:[Lixl;

    invoke-virtual {v0}, [Lixl;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lixl;

    return-object v0
.end method
