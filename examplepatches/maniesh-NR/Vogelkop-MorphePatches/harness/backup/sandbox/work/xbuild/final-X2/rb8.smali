.class public final enum Lrb8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lrb8;

.field public static final synthetic c:[Lrb8;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lrb8;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lrb8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lrb8;->b:Lrb8;

    new-instance v1, Lrb8;

    const/4 v2, 0x1

    const-string v3, "install_esim_network_error"

    const-string v4, "INSTALL_ESIM_NETWORK_ERROR"

    invoke-direct {v1, v4, v2, v3}, Lrb8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lrb8;

    const/4 v3, 0x2

    const-string v4, "install_esim_installation_error"

    const-string v5, "INSTALL_ESIM_INSTALLATION_ERROR"

    invoke-direct {v2, v5, v3, v4}, Lrb8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lrb8;

    const/4 v4, 0x3

    const-string v5, "install_esim_in_progress"

    const-string v6, "INSTALL_ESIM_IN_PROGRESS"

    invoke-direct {v3, v6, v4, v5}, Lrb8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3}, [Lrb8;

    move-result-object v0

    sput-object v0, Lrb8;->c:[Lrb8;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lrb8;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrb8;
    .registers 2

    const-class v0, Lrb8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrb8;

    return-object p0
.end method

.method public static values()[Lrb8;
    .registers 1

    sget-object v0, Lrb8;->c:[Lrb8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrb8;

    return-object v0
.end method
