.class public final enum Lika;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lika;

.field public static final enum c:Lika;

.field public static final synthetic d:[Lika;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lika;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lika;->b:Lika;

    new-instance v1, Lika;

    const/4 v2, 0x1

    const-string v3, "OfADev"

    const-string v4, "OFADEV"

    invoke-direct {v1, v4, v2, v3}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lika;

    const/4 v3, 0x2

    const-string v4, "OfABeta"

    const-string v5, "OFABETA"

    invoke-direct {v2, v5, v3, v4}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lika;->c:Lika;

    new-instance v3, Lika;

    const/4 v4, 0x3

    const-string v5, "OfAFinal"

    const-string v6, "OFAFINAL"

    invoke-direct {v3, v6, v4, v5}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lika;

    const/4 v5, 0x4

    const-string v6, "MiniBeta"

    const-string v7, "MINIBETA"

    invoke-direct {v4, v7, v5, v6}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lika;

    const/4 v6, 0x5

    const-string v7, "MiniDev"

    const-string v8, "MINIDEV"

    invoke-direct {v5, v8, v6, v7}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lika;

    const/4 v7, 0x6

    const-string v8, "MiniFinal"

    const-string v9, "MINIFINAL"

    invoke-direct {v6, v9, v7, v8}, Lika;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v6}, [Lika;

    move-result-object v0

    sput-object v0, Lika;->d:[Lika;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lika;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lika;
    .registers 2

    const-class v0, Lika;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lika;

    return-object p0
.end method

.method public static values()[Lika;
    .registers 1

    sget-object v0, Lika;->d:[Lika;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lika;

    return-object v0
.end method
