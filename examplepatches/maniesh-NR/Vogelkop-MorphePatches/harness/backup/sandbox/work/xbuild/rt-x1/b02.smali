.class public final enum Lb02;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lb02;

.field public static final enum b:Lb02;

.field public static final enum c:Lb02;

.field public static final enum d:Lb02;

.field public static final synthetic e:[Lb02;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lb02;

    const-string v1, "LOGIN_AFTER_FIRST_INTERACTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb02;->a:Lb02;

    new-instance v1, Lb02;

    const-string v2, "LOGIC_AFTER_SANDBOX_IMAGE_GENERATION_LIMIT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lb02;->b:Lb02;

    new-instance v2, Lb02;

    const-string v3, "LOGIN_AFTER_SANDBOX_UNAVAILABLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lb02;->c:Lb02;

    new-instance v3, Lb02;

    const-string v4, "LOGIN_TO_FINISH_ANONYMOUS_ACCOUNT_SETUP"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lb02;->d:Lb02;

    filled-new-array {v0, v1, v2, v3}, [Lb02;

    move-result-object v0

    sput-object v0, Lb02;->e:[Lb02;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb02;
    .registers 2

    const-class v0, Lb02;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb02;

    return-object p0
.end method

.method public static values()[Lb02;
    .registers 1

    sget-object v0, Lb02;->e:[Lb02;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb02;

    return-object v0
.end method
