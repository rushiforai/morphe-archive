.class public Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;
    }
.end annotation


# instance fields
.field private _sessionInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public add(Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;JLandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->find(J)Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p4, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;

    .line 9
    .line 10
    invoke-direct {p4, p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;-><init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;)V

    .line 11
    .line 12
    .line 13
    iput-wide p2, p4, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;->sessionId:J

    .line 14
    .line 15
    iput-object p1, p4, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;->_traeAs:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public find(J)Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;

    .line 22
    .line 23
    iget-wide v2, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;->sessionId:J

    .line 24
    .line 25
    cmp-long v2, v2, p1

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x0

    .line 34
    :goto_1
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return-object v1
.end method

.method public remove(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;

    .line 22
    .line 23
    iget-wide v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;->sessionId:J

    .line 24
    .line 25
    cmp-long v1, v1, p1

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public sendToAudioSessionMessage(Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->_sessionInfoList:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost$SessionInfo;->_traeAs:Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioSession;->onReceiveCallback(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioSessionHost;->mLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
