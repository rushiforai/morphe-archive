.class public final enum Lc7j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lc7j;

.field public static final synthetic c:[Lc7j;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lc7j;

    const/4 v1, 0x0

    const v2, 0x7f14050e

    const-string v3, "DEFAULT"

    invoke-direct {v0, v3, v1, v2}, Lc7j;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lc7j;

    const/4 v2, 0x1

    const v3, 0x7f14050f

    const-string v4, "FOLLOW_SYSTEM"

    invoke-direct {v1, v4, v2, v3}, Lc7j;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lc7j;->b:Lc7j;

    filled-new-array {v0, v1}, [Lc7j;

    move-result-object v0

    sput-object v0, Lc7j;->c:[Lc7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lc7j;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc7j;
    .registers 2

    const-class v0, Lc7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc7j;

    return-object p0
.end method

.method public static values()[Lc7j;
    .registers 1

    sget-object v0, Lc7j;->c:[Lc7j;

    invoke-virtual {v0}, [Lc7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc7j;

    return-object v0
.end method
