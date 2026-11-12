.class public final enum Lpja;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lpja;

.field public static final enum c:Lpja;

.field public static final enum d:Lpja;

.field public static final synthetic e:[Lpja;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lpja;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lpja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lpja;->b:Lpja;

    new-instance v1, Lpja;

    const/4 v2, 0x1

    const-string v3, "NotInvited"

    const-string v4, "NOTINVITED"

    invoke-direct {v1, v4, v2, v3}, Lpja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lpja;

    const/4 v3, 0x2

    const-string v4, "NotSignedIn"

    const-string v5, "NOTSIGNEDIN"

    invoke-direct {v2, v5, v3, v4}, Lpja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lpja;->c:Lpja;

    new-instance v3, Lpja;

    const/4 v4, 0x3

    const-string v5, "Unknown"

    const-string v6, "UNKNOWN"

    invoke-direct {v3, v6, v4, v5}, Lpja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lpja;->d:Lpja;

    filled-new-array {v0, v1, v2, v3}, [Lpja;

    move-result-object v0

    sput-object v0, Lpja;->e:[Lpja;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lpja;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpja;
    .registers 2

    const-class v0, Lpja;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpja;

    return-object p0
.end method

.method public static values()[Lpja;
    .registers 1

    sget-object v0, Lpja;->e:[Lpja;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpja;

    return-object v0
.end method
