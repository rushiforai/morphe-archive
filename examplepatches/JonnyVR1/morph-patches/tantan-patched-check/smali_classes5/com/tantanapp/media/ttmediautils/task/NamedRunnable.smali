.class public abstract Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/task/INamedRunnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "TTMedia"


# instance fields
.field private final mName:Ljava/lang/String;

.field private mTimeAddToPool:J

.field private mTimeBeginToRun:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "TTMedia"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mName:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getAddedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mTimeAddToPool:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getBeginTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mTimeBeginToRun:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAddedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mTimeAddToPool:J

    .line 2
    .line 3
    return-void
.end method

.method public setBeginTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;->mTimeBeginToRun:J

    .line 2
    .line 3
    return-void
.end method
