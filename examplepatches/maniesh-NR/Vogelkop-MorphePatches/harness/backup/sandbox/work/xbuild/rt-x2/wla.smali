.class public final enum Lwla;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lwla;

.field public static final enum c:Lwla;

.field public static final enum d:Lwla;

.field public static final synthetic e:[Lwla;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lwla;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lwla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lwla;->b:Lwla;

    new-instance v1, Lwla;

    const/4 v2, 0x1

    const-string v3, "celsius"

    const-string v4, "CELSIUS"

    invoke-direct {v1, v4, v2, v3}, Lwla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lwla;->c:Lwla;

    new-instance v2, Lwla;

    const/4 v3, 0x2

    const-string v4, "fahrenheit"

    const-string v5, "FAHRENHEIT"

    invoke-direct {v2, v5, v3, v4}, Lwla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lwla;->d:Lwla;

    filled-new-array {v0, v1, v2}, [Lwla;

    move-result-object v0

    sput-object v0, Lwla;->e:[Lwla;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lwla;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwla;
    .registers 2

    const-class v0, Lwla;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwla;

    return-object p0
.end method

.method public static values()[Lwla;
    .registers 1

    sget-object v0, Lwla;->e:[Lwla;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwla;

    return-object v0
.end method
