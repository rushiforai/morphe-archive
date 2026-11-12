.class public final enum Ls4i;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ls4i;

.field public static final enum b:Ls4i;

.field public static final enum c:Ls4i;

.field public static final synthetic d:[Ls4i;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ls4i;

    const-string v1, "UNLOCK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ls4i;->a:Ls4i;

    new-instance v1, Ls4i;

    const-string v2, "DISMISS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ls4i;->b:Ls4i;

    new-instance v2, Ls4i;

    const-string v3, "GOTO_REWARDS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ls4i;->c:Ls4i;

    filled-new-array {v0, v1, v2}, [Ls4i;

    move-result-object v0

    sput-object v0, Ls4i;->d:[Ls4i;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ls4i;
    .registers 2

    const-class v0, Ls4i;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ls4i;

    return-object p0
.end method

.method public static values()[Ls4i;
    .registers 1

    sget-object v0, Ls4i;->d:[Ls4i;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ls4i;

    return-object v0
.end method
