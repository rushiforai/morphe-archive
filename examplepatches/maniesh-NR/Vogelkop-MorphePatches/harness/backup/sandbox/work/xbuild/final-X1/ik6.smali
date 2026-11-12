.class public final enum Lik6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lik6;

.field public static final enum b:Lik6;

.field public static final synthetic c:[Lik6;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lik6;

    const-string v1, "EXECUTE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lik6;->a:Lik6;

    new-instance v1, Lik6;

    const-string v2, "VALIDATE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lik6;->b:Lik6;

    filled-new-array {v0, v1}, [Lik6;

    move-result-object v0

    sput-object v0, Lik6;->c:[Lik6;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lik6;
    .registers 2

    const-class v0, Lik6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lik6;

    return-object p0
.end method

.method public static values()[Lik6;
    .registers 1

    sget-object v0, Lik6;->c:[Lik6;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lik6;

    return-object v0
.end method
