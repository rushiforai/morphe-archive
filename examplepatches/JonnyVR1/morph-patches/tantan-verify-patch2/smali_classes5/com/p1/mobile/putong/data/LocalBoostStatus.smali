.class public Lcom/p1/mobile/putong/data/LocalBoostStatus;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static instance:Lcom/p1/mobile/putong/data/LocalBoostStatus;


# instance fields
.field public active:Z

.field public left:J

.field public past:J

.field public progress:I

.field public totalExposure:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static obtain()Lcom/p1/mobile/putong/data/LocalBoostStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LocalBoostStatus;->instance:Lcom/p1/mobile/putong/data/LocalBoostStatus;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/LocalBoostStatus;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LocalBoostStatus;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/data/LocalBoostStatus;->instance:Lcom/p1/mobile/putong/data/LocalBoostStatus;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/data/LocalBoostStatus;->instance:Lcom/p1/mobile/putong/data/LocalBoostStatus;

    .line 13
    .line 14
    return-object v0
.end method
