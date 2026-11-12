.class public final enum Lpv0;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lpv0;

.field public static final enum b:Lpv0;

.field public static final synthetic c:[Lpv0;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lpv0;

    const-string v1, "ENABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lpv0;->a:Lpv0;

    new-instance v1, Lpv0;

    const-string v2, "DISABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lpv0;->b:Lpv0;

    filled-new-array {v0, v1}, [Lpv0;

    move-result-object v0

    sput-object v0, Lpv0;->c:[Lpv0;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpv0;
    .registers 2

    const-class v0, Lpv0;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpv0;

    return-object p0
.end method

.method public static values()[Lpv0;
    .registers 1

    sget-object v0, Lpv0;->c:[Lpv0;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpv0;

    return-object v0
.end method
