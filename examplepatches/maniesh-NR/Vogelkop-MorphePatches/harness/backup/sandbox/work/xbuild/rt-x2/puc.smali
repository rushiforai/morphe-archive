.class public final enum Lpuc;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lxeb;


# static fields
.field public static final enum b:Lpuc;

.field public static final enum c:Lpuc;

.field public static final enum d:Lpuc;

.field public static final enum e:Lpuc;

.field public static final synthetic f:[Lpuc;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lpuc;

    const-string v1, "LOCAL_ESIM_USER_PLAN_STATE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lpuc;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lpuc;->b:Lpuc;

    new-instance v1, Lpuc;

    const-string v2, "LOCAL_ESIM_USER_PLAN_STATE_HAS_PLANS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lpuc;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lpuc;->c:Lpuc;

    new-instance v2, Lpuc;

    const-string v3, "LOCAL_ESIM_USER_PLAN_STATE_NO_PLANS"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lpuc;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lpuc;->d:Lpuc;

    new-instance v3, Lpuc;

    const/4 v4, 0x3

    const/4 v5, -0x1

    const-string v6, "UNRECOGNIZED"

    invoke-direct {v3, v6, v4, v5}, Lpuc;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lpuc;->e:Lpuc;

    filled-new-array {v0, v1, v2, v3}, [Lpuc;

    move-result-object v0

    sput-object v0, Lpuc;->f:[Lpuc;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lpuc;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpuc;
    .registers 2

    const-class v0, Lpuc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpuc;

    return-object p0
.end method

.method public static values()[Lpuc;
    .registers 1

    sget-object v0, Lpuc;->f:[Lpuc;

    invoke-virtual {v0}, [Lpuc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpuc;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .registers 2

    sget-object v0, Lpuc;->e:Lpuc;

    if-eq p0, v0, :cond_7

    iget p0, p0, Lpuc;->a:I

    return p0

    :cond_7
    const-string p0, "Can\'t get the number of an unknown enum value."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
