.class public final enum Lxja;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lxja;

.field public static final enum c:Lxja;

.field public static final enum d:Lxja;

.field public static final synthetic e:[Lxja;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lxja;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lxja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lxja;->b:Lxja;

    new-instance v1, Lxja;

    const/4 v2, 0x1

    const-string v3, "NotInvited"

    const-string v4, "NOTINVITED"

    invoke-direct {v1, v4, v2, v3}, Lxja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lxja;

    const/4 v3, 0x2

    const-string v4, "NotSignedIn"

    const-string v5, "NOTSIGNEDIN"

    invoke-direct {v2, v5, v3, v4}, Lxja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lxja;->c:Lxja;

    new-instance v3, Lxja;

    const/4 v4, 0x3

    const-string v5, "Unknown"

    const-string v6, "UNKNOWN"

    invoke-direct {v3, v6, v4, v5}, Lxja;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lxja;->d:Lxja;

    filled-new-array {v0, v1, v2, v3}, [Lxja;

    move-result-object v0

    sput-object v0, Lxja;->e:[Lxja;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lxja;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxja;
    .registers 2

    const-class v0, Lxja;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxja;

    return-object p0
.end method

.method public static values()[Lxja;
    .registers 1

    sget-object v0, Lxja;->e:[Lxja;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxja;

    return-object v0
.end method
