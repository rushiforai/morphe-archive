.class public final enum Ljla;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ljla;

.field public static final enum c:Ljla;

.field public static final synthetic d:[Ljla;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ljla;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Ljla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Ljla;->b:Ljla;

    new-instance v1, Ljla;

    const/4 v2, 0x1

    const-string v3, "ofa"

    const-string v4, "OFA"

    invoke-direct {v1, v4, v2, v3}, Ljla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Ljla;->c:Ljla;

    new-instance v2, Ljla;

    const/4 v3, 0x2

    const-string v4, "ofi"

    const-string v5, "OFI"

    invoke-direct {v2, v5, v3, v4}, Ljla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Ljla;

    const/4 v4, 0x3

    const-string v5, "mini"

    const-string v6, "MINI"

    invoke-direct {v3, v6, v4, v5}, Ljla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Ljla;

    const/4 v5, 0x4

    const-string v6, "standalone"

    const-string v7, "STANDALONE"

    invoke-direct {v4, v7, v5, v6}, Ljla;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1, v2, v3, v4}, [Ljla;

    move-result-object v0

    sput-object v0, Ljla;->d:[Ljla;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ljla;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljla;
    .registers 2

    const-class v0, Ljla;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljla;

    return-object p0
.end method

.method public static values()[Ljla;
    .registers 1

    sget-object v0, Ljla;->d:[Ljla;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljla;

    return-object v0
.end method
