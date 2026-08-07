.class public Lcom/cosmos/photon/push/channel/inner/ServerSWorker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;
    }
.end annotation


# static fields
.field public static final COMMAND_CHANNEL:I = 0x1

.field public static final COMMAND_DEFAULT:I = 0x0

.field public static final COMMAND_EXIT:I = 0x190

.field public static final COMMAND_REQUEST:I = 0x2


# instance fields
.field private mAddress:Ljava/lang/String;

.field private serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;


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

.method public static synthetic access$000(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->mAddress:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public start(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->end()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    const-string v1, "MoPush-Channel"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->mAddress:Ljava/lang/String;

    .line 21
    .line 22
    new-instance p1, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 23
    .line 24
    const-string v0, "Push:LocalSocket"

    .line 25
    .line 26
    invoke-direct {p1, p0, v0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;-><init>(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->end()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->serverThread:Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
