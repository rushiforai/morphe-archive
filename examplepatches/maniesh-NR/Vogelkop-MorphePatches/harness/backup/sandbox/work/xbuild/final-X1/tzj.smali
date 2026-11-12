.class public final enum Ltzj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Ltzj;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ltzj;

    const-string v1, "LARGE_ICONS"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ltzj;-><init>(Ljava/lang/String;II)V

    new-instance v1, Ltzj;

    const-string v2, "ADD_TO_SPEED_DIAL"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Ltzj;-><init>(Ljava/lang/String;II)V

    new-instance v2, Ltzj;

    const-string v3, "SHAPE"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Ltzj;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2}, [Ltzj;

    move-result-object v0

    sput-object v0, Ltzj;->a:[Ltzj;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltzj;
    .registers 2

    const-class v0, Ltzj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltzj;

    return-object p0
.end method

.method public static values()[Ltzj;
    .registers 1

    sget-object v0, Ltzj;->a:[Ltzj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltzj;

    return-object v0
.end method
