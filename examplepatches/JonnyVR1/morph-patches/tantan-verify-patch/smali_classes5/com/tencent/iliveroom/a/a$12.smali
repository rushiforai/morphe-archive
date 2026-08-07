.class Lcom/tencent/iliveroom/a/a$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setCustomVideoParam(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$12;->a:I

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
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v1, p0, Lcom/tencent/iliveroom/a/a$12;->a:I

    .line 16
    .line 17
    iput v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->e(Lcom/tencent/iliveroom/a/a;)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget v6, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoFps:I

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$12;->b:Lcom/tencent/iliveroom/a/a;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget v7, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-static/range {v2 .. v7}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;IIIII)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
