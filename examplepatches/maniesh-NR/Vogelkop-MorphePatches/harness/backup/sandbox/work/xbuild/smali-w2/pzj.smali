.class public final enum Lpzj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lpzj;

.field public static final enum b:Lpzj;

.field public static final synthetic c:[Lpzj;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lpzj;

    const-string v1, "FOLLOW_SPEED_DIAL_SHAPE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lpzj;->a:Lpzj;

    new-instance v1, Lpzj;

    const-string v2, "OVERLAPPING_CIRCLES"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lpzj;->b:Lpzj;

    filled-new-array {v0, v1}, [Lpzj;

    move-result-object v0

    sput-object v0, Lpzj;->c:[Lpzj;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpzj;
    .registers 2

    const-class v0, Lpzj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpzj;

    return-object p0
.end method

.method public static values()[Lpzj;
    .registers 1

    sget-object v0, Lpzj;->c:[Lpzj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpzj;

    return-object v0
.end method
