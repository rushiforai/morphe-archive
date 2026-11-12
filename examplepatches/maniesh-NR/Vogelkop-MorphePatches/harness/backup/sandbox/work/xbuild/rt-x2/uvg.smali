.class public final enum Luvg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Luvg;

.field public static final enum c:Luvg;

.field public static final enum d:Luvg;

.field public static final enum e:Luvg;

.field public static final enum f:Luvg;

.field public static final enum g:Luvg;

.field public static final synthetic h:[Luvg;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Luvg;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v0, Luvg;->b:Luvg;

    new-instance v1, Luvg;

    const-string v2, "PENDING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v1, Luvg;->c:Luvg;

    new-instance v2, Luvg;

    const-string v3, "ACTIVE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v2, Luvg;->d:Luvg;

    new-instance v3, Luvg;

    const-string v4, "EXPIRED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v3, Luvg;->e:Luvg;

    new-instance v4, Luvg;

    const-string v5, "PAUSED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v4, Luvg;->f:Luvg;

    new-instance v5, Luvg;

    const-string v6, "LOADING"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7, v7}, Luvg;-><init>(Ljava/lang/String;II)V

    sput-object v5, Luvg;->g:Luvg;

    filled-new-array/range {v0 .. v5}, [Luvg;

    move-result-object v0

    sput-object v0, Luvg;->h:[Luvg;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Luvg;->a:B

    return-void
.end method

.method public static d(Lwvg;)Luvg;
    .registers 2

    iget p0, p0, Lwvg;->e:I

    if-eqz p0, :cond_22

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1f

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x5

    if-eq p0, v0, :cond_19

    const/4 v0, 0x6

    if-eq p0, v0, :cond_16

    sget-object p0, Luvg;->b:Luvg;

    return-object p0

    :cond_16
    sget-object p0, Luvg;->e:Luvg;

    return-object p0

    :cond_19
    sget-object p0, Luvg;->f:Luvg;

    return-object p0

    :cond_1c
    sget-object p0, Luvg;->d:Luvg;

    return-object p0

    :cond_1f
    sget-object p0, Luvg;->c:Luvg;

    return-object p0

    :cond_22
    sget-object p0, Luvg;->g:Luvg;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Luvg;
    .registers 2

    const-class v0, Luvg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Luvg;

    return-object p0
.end method

.method public static values()[Luvg;
    .registers 1

    sget-object v0, Luvg;->h:[Luvg;

    invoke-virtual {v0}, [Luvg;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Luvg;

    return-object v0
.end method
