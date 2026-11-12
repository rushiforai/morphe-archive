.class public final enum Lxej;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lxej;

.field public static final synthetic c:[Lxej;

.field public static final synthetic d:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lxej;

    const/4 v1, 0x0

    const-string v2, "File too large."

    const-string v3, "TOO_LONG"

    invoke-direct {v0, v3, v1, v2}, Lxej;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lxej;

    const/4 v2, 0x1

    const-string v3, "Invalid mimetype"

    const-string v4, "INVALID_MIMETYPE"

    invoke-direct {v1, v4, v2, v3}, Lxej;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lxej;

    const/4 v3, 0x2

    const-string v4, "Unrecognized image format"

    const-string v5, "UNKNOWN_IMAGE_FORMAT"

    invoke-direct {v2, v5, v3, v4}, Lxej;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lxej;

    const/4 v4, 0x3

    const-string v5, "User limit reached"

    const-string v6, "USER_LIMIT_REACHED"

    invoke-direct {v3, v6, v4, v5}, Lxej;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lxej;->b:Lxej;

    filled-new-array {v0, v1, v2, v3}, [Lxej;

    move-result-object v0

    sput-object v0, Lxej;->c:[Lxej;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lxej;->d:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lxej;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxej;
    .registers 2

    const-class v0, Lxej;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxej;

    return-object p0
.end method

.method public static values()[Lxej;
    .registers 1

    sget-object v0, Lxej;->c:[Lxej;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxej;

    return-object v0
.end method
