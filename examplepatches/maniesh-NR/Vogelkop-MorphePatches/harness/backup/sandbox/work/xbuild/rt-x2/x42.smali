.class public final enum Lx42;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lx42;

.field public static final enum c:Lx42;

.field public static final synthetic d:[Lx42;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lx42;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lx42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lx42;->b:Lx42;

    new-instance v1, Lx42;

    const/4 v2, 0x1

    const-string v3, "hidden"

    const-string v4, "HIDDEN"

    invoke-direct {v1, v4, v2, v3}, Lx42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lx42;

    const/4 v3, 0x2

    const-string v4, "disabled"

    const-string v5, "DISABLED"

    invoke-direct {v2, v5, v3, v4}, Lx42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lx42;

    const/4 v4, 0x3

    const-string v5, "enabled"

    const-string v6, "ENABLED"

    invoke-direct {v3, v6, v4, v5}, Lx42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lx42;->c:Lx42;

    filled-new-array {v0, v1, v2, v3}, [Lx42;

    move-result-object v0

    sput-object v0, Lx42;->d:[Lx42;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lx42;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lx42;
    .registers 2

    const-class v0, Lx42;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lx42;

    return-object p0
.end method

.method public static values()[Lx42;
    .registers 1

    sget-object v0, Lx42;->d:[Lx42;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lx42;

    return-object v0
.end method
