.class public final enum Lnla;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lnla;

.field public static final enum c:Lnla;

.field public static final enum d:Lnla;

.field public static final synthetic e:[Lnla;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lnla;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lnla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnla;->b:Lnla;

    new-instance v1, Lnla;

    const/4 v2, 0x1

    const-string v3, "active"

    const-string v4, "ACTIVE"

    invoke-direct {v1, v4, v2, v3}, Lnla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lnla;

    const/4 v3, 0x2

    const-string v4, "inactive"

    const-string v5, "INACTIVE"

    invoke-direct {v2, v5, v3, v4}, Lnla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lnla;->c:Lnla;

    new-instance v3, Lnla;

    const/4 v4, 0x3

    const-string v5, "focused"

    const-string v6, "FOCUSED"

    invoke-direct {v3, v6, v4, v5}, Lnla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lnla;->d:Lnla;

    filled-new-array {v0, v1, v2, v3}, [Lnla;

    move-result-object v0

    sput-object v0, Lnla;->e:[Lnla;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnla;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnla;
    .registers 2

    const-class v0, Lnla;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnla;

    return-object p0
.end method

.method public static values()[Lnla;
    .registers 1

    sget-object v0, Lnla;->e:[Lnla;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnla;

    return-object v0
.end method
