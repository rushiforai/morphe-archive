.class public final enum Lad9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lad9;

.field public static final enum b:Lad9;

.field public static final enum c:Lad9;

.field public static final synthetic d:[Lad9;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lad9;

    const-string v1, "VERIFIED_AND_AUTHENTICATED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lad9;->a:Lad9;

    new-instance v1, Lad9;

    const-string v2, "VERIFICATION_MISSMATCH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lad9;->b:Lad9;

    new-instance v2, Lad9;

    const-string v3, "AUTHENTICATION_FAILURE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lad9;->c:Lad9;

    filled-new-array {v0, v1, v2}, [Lad9;

    move-result-object v0

    sput-object v0, Lad9;->d:[Lad9;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lad9;
    .registers 2

    const-class v0, Lad9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lad9;

    return-object p0
.end method

.method public static values()[Lad9;
    .registers 1

    sget-object v0, Lad9;->d:[Lad9;

    invoke-virtual {v0}, [Lad9;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lad9;

    return-object v0
.end method
