.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O5([B[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:[B

.field final synthetic c:J

.field final synthetic d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;[B[BJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->a:[B

    .line 4
    .line 5
    iput-object p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->b:[B

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->c:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->a:[B

    .line 23
    .line 24
    iget-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->b:[B

    .line 25
    .line 26
    iget-wide v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;->c:J

    .line 27
    .line 28
    const/4 v5, 0x4

    .line 29
    invoke-interface/range {v2 .. v7}, Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;->OnRealLayoutChange([B[BIJ)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit v1

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method
