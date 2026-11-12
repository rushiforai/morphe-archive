.class public final enum Laja;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Laja;

.field public static final synthetic c:[Laja;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Laja;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Laja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Laja;->b:Laja;

    new-instance v1, Laja;

    const/4 v2, 0x1

    const-string v3, "OperaLogin"

    const-string v4, "OPERALOGIN"

    invoke-direct {v1, v4, v2, v3}, Laja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Laja;

    const/4 v3, 0x2

    const-string v4, "SandboxedLogin"

    const-string v5, "SANDBOXEDLOGIN"

    invoke-direct {v2, v5, v3, v4}, Laja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Laja;

    const/4 v4, 0x3

    const-string v5, "GoogleLogin"

    const-string v6, "GOOGLELOGIN"

    invoke-direct {v3, v6, v4, v5}, Laja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3}, [Laja;

    move-result-object v0

    sput-object v0, Laja;->c:[Laja;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Laja;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Laja;
    .registers 2

    const-class v0, Laja;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Laja;

    return-object p0
.end method

.method public static values()[Laja;
    .registers 1

    sget-object v0, Laja;->c:[Laja;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Laja;

    return-object v0
.end method
