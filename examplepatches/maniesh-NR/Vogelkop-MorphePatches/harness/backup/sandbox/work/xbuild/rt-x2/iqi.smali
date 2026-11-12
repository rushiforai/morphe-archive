.class public final enum Liqi;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Liqi;

.field public static final enum c:Liqi;

.field public static final enum d:Liqi;

.field public static final enum e:Liqi;

.field public static final synthetic f:[Liqi;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Liqi;

    const-string v1, "EMPTY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Liqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Liqi;->b:Liqi;

    new-instance v1, Liqi;

    const-string v2, "EXPIRED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v2}, Liqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Liqi;->c:Liqi;

    new-instance v2, Liqi;

    const/4 v3, 0x2

    const-string v4, "PTR"

    const-string v5, "PULL_TO_REFRESH"

    invoke-direct {v2, v5, v3, v4}, Liqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Liqi;->d:Liqi;

    new-instance v3, Liqi;

    const-string v4, "DEBUG"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v4}, Liqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Liqi;->e:Liqi;

    filled-new-array {v0, v1, v2, v3}, [Liqi;

    move-result-object v0

    sput-object v0, Liqi;->f:[Liqi;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Liqi;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Liqi;
    .registers 2

    const-class v0, Liqi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Liqi;

    return-object p0
.end method

.method public static values()[Liqi;
    .registers 1

    sget-object v0, Liqi;->f:[Liqi;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Liqi;

    return-object v0
.end method
