.class public final enum Lzha;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lzha;

.field public static final enum c:Lzha;

.field public static final enum d:Lzha;

.field public static final enum e:Lzha;

.field public static final synthetic f:[Lzha;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lzha;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lzha;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lzha;->b:Lzha;

    new-instance v1, Lzha;

    const/4 v2, 0x1

    const-string v3, "false"

    const-string v4, "FALSE"

    invoke-direct {v1, v4, v2, v3}, Lzha;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lzha;->c:Lzha;

    new-instance v2, Lzha;

    const/4 v3, 0x2

    const-string v4, "harmful"

    const-string v5, "HARMFUL"

    invoke-direct {v2, v5, v3, v4}, Lzha;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lzha;->d:Lzha;

    new-instance v3, Lzha;

    const/4 v4, 0x3

    const-string v5, "not_helpful"

    const-string v6, "NOT_HELPFUL"

    invoke-direct {v3, v6, v4, v5}, Lzha;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lzha;->e:Lzha;

    filled-new-array {v0, v1, v2, v3}, [Lzha;

    move-result-object v0

    sput-object v0, Lzha;->f:[Lzha;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lzha;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzha;
    .registers 2

    const-class v0, Lzha;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzha;

    return-object p0
.end method

.method public static values()[Lzha;
    .registers 1

    sget-object v0, Lzha;->f:[Lzha;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzha;

    return-object v0
.end method
