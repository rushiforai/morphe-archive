.class public final enum Lzia;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lzia;

.field public static final synthetic c:[Lzia;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lzia;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lzia;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lzia;->b:Lzia;

    new-instance v1, Lzia;

    const/4 v2, 0x1

    const-string v3, "login_after_sandbox_image_generation_limit_reached"

    const-string v4, "LOGIN_AFTER_SANDBOX_IMAGE_GENERATION_LIMIT_REACHED"

    invoke-direct {v1, v4, v2, v3}, Lzia;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lzia;

    const/4 v3, 0x2

    const-string v4, "login_after_sandbox_unavailable"

    const-string v5, "LOGIN_AFTER_SANDBOX_UNAVAILABLE"

    invoke-direct {v2, v5, v3, v4}, Lzia;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lzia;

    const/4 v4, 0x3

    const-string v5, "login_to_finish_anonymous_account_setup"

    const-string v6, "LOGIN_TO_FINISH_ANONYMOUS_ACCOUNT_SETUP"

    invoke-direct {v3, v6, v4, v5}, Lzia;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lzia;

    const/4 v5, 0x4

    const-string v6, "login_after_first_interaction"

    const-string v7, "LOGIN_AFTER_FIRST_INTERACTION"

    invoke-direct {v4, v7, v5, v6}, Lzia;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3, v4}, [Lzia;

    move-result-object v0

    sput-object v0, Lzia;->c:[Lzia;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lzia;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzia;
    .registers 2

    const-class v0, Lzia;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzia;

    return-object p0
.end method

.method public static values()[Lzia;
    .registers 1

    sget-object v0, Lzia;->c:[Lzia;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzia;

    return-object v0
.end method
