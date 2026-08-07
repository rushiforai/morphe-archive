.class final enum Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type$2;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;-><init>(Ljava/lang/String;ILl/g0g0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/g0g0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type$2;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getStateType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "popup"

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
