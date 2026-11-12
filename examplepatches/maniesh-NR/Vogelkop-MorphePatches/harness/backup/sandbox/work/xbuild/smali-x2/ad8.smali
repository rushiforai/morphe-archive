.class public final enum Lad8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lad8;

.field public static final synthetic c:[Lad8;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lad8;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lad8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lad8;->b:Lad8;

    new-instance v1, Lad8;

    const/4 v2, 0x1

    const-string v3, "my_plans_current"

    const-string v4, "MY_PLANS_CURRENT"

    invoke-direct {v1, v4, v2, v3}, Lad8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lad8;

    const/4 v3, 0x2

    const-string v4, "my_plans_expired"

    const-string v5, "MY_PLANS_EXPIRED"

    invoke-direct {v2, v5, v3, v4}, Lad8;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2}, [Lad8;

    move-result-object v0

    sput-object v0, Lad8;->c:[Lad8;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lad8;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lad8;
    .registers 2

    const-class v0, Lad8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lad8;

    return-object p0
.end method

.method public static values()[Lad8;
    .registers 1

    sget-object v0, Lad8;->c:[Lad8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lad8;

    return-object v0
.end method
