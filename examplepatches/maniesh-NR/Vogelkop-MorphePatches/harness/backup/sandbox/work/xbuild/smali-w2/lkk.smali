.class public final enum Llkk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Llkk;

.field public static final enum c:Llkk;

.field public static final enum d:Llkk;

.field public static final enum e:Llkk;

.field public static final enum f:Llkk;

.field public static final synthetic g:[Llkk;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Llkk;

    const-string v1, "ANALYTICS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Llkk;-><init>(Ljava/lang/String;II)V

    sput-object v0, Llkk;->b:Llkk;

    new-instance v1, Llkk;

    const-string v2, "REQUESTS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Llkk;-><init>(Ljava/lang/String;II)V

    sput-object v1, Llkk;->c:Llkk;

    new-instance v2, Llkk;

    const-string v3, "BEHAVIOR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Llkk;-><init>(Ljava/lang/String;II)V

    sput-object v2, Llkk;->d:Llkk;

    new-instance v3, Llkk;

    const-string v4, "ONBOARDING"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Llkk;-><init>(Ljava/lang/String;II)V

    sput-object v3, Llkk;->e:Llkk;

    new-instance v4, Llkk;

    const-string v5, "DOMAINS"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v6}, Llkk;-><init>(Ljava/lang/String;II)V

    sput-object v4, Llkk;->f:Llkk;

    filled-new-array {v0, v1, v2, v3, v4}, [Llkk;

    move-result-object v0

    sput-object v0, Llkk;->g:[Llkk;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Llkk;->a:B

    return-void
.end method

.method public static d(I)Llkk;
    .registers 6

    invoke-static {}, Llkk;->values()[Llkk;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    iget-byte v4, v3, Llkk;->a:B

    if-ne p0, v4, :cond_f

    return-object v3

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Llkk;
    .registers 2

    const-class v0, Llkk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llkk;

    return-object p0
.end method

.method public static values()[Llkk;
    .registers 1

    sget-object v0, Llkk;->g:[Llkk;

    invoke-virtual {v0}, [Llkk;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llkk;

    return-object v0
.end method
