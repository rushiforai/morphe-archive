.class Lcom/tencent/iliveroom/a/a$45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setAudioDelegate(Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$45;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$45;->a:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$45;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$45;->a:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 4
    .line 5
    iput-object p0, v0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 6
    .line 7
    return-void
.end method
