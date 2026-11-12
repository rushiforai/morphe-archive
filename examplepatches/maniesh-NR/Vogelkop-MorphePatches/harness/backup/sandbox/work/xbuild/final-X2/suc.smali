.class public final enum Lsuc;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lxeb;


# static fields
.field public static final enum b:Lsuc;

.field public static final enum c:Lsuc;

.field public static final enum d:Lsuc;

.field public static final enum e:Lsuc;

.field public static final enum f:Lsuc;

.field public static final synthetic g:[Lsuc;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lsuc;

    const-string v1, "LOCAL_FREE_ESIM_ELIGIBILITY_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lsuc;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lsuc;->b:Lsuc;

    new-instance v1, Lsuc;

    const-string v2, "LOCAL_FREE_ESIM_ELIGIBILITY_NOT_COVERED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lsuc;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lsuc;->c:Lsuc;

    new-instance v2, Lsuc;

    const-string v3, "LOCAL_FREE_ESIM_ELIGIBILITY_ELIGIBLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lsuc;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lsuc;->d:Lsuc;

    new-instance v3, Lsuc;

    const-string v4, "LOCAL_FREE_ESIM_ELIGIBILITY_ALREADY_CLAIMED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lsuc;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lsuc;->e:Lsuc;

    new-instance v4, Lsuc;

    const/4 v5, 0x4

    const/4 v6, -0x1

    const-string v7, "UNRECOGNIZED"

    invoke-direct {v4, v7, v5, v6}, Lsuc;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lsuc;->f:Lsuc;

    filled-new-array {v0, v1, v2, v3, v4}, [Lsuc;

    move-result-object v0

    sput-object v0, Lsuc;->g:[Lsuc;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lsuc;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsuc;
    .registers 2

    const-class v0, Lsuc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsuc;

    return-object p0
.end method

.method public static values()[Lsuc;
    .registers 1

    sget-object v0, Lsuc;->g:[Lsuc;

    invoke-virtual {v0}, [Lsuc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsuc;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .registers 2

    sget-object v0, Lsuc;->f:Lsuc;

    if-eq p0, v0, :cond_7

    iget p0, p0, Lsuc;->a:I

    return p0

    :cond_7
    const-string p0, "Can\'t get the number of an unknown enum value."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
