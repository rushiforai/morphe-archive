.class public final enum Lsdb;
.super Ljava/lang/Enum;


# static fields
.field public static final enum b:Lsdb;

.field public static final synthetic c:[Lsdb;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lsdb;

    const/4 v1, 0x0

    const-string v2, "click"

    const-string v3, "CLICK"

    invoke-direct {v0, v3, v1, v2}, Lsdb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lsdb;->b:Lsdb;

    new-instance v1, Lsdb;

    const/4 v2, 0x1

    const-string v3, "invitationAccept"

    const-string v4, "INVITATION_ACCEPTED"

    invoke-direct {v1, v4, v2, v3}, Lsdb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1}, [Lsdb;

    move-result-object v0

    sput-object v0, Lsdb;->c:[Lsdb;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lsdb;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsdb;
    .registers 2

    const-class v0, Lsdb;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsdb;

    return-object p0
.end method

.method public static values()[Lsdb;
    .registers 1

    sget-object v0, Lsdb;->c:[Lsdb;

    invoke-virtual {v0}, [Lsdb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsdb;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lsdb;->a:Ljava/lang/String;

    return-object p0
.end method
