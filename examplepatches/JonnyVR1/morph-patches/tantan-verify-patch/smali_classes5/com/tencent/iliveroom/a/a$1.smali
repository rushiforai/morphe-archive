.class Lcom/tencent/iliveroom/a/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->joinRoom(Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/OneSecAdapterParams;

.field final synthetic b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$1;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/a$1;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/b/a;->b()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$1;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 13
    .line 14
    iget-wide v1, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/tencent/iliveroom/a/b/a;->a(J)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$1;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 24
    .line 25
    iget v1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomRole:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/tencent/iliveroom/a/b/a;->a(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 31
    .line 32
    const-wide/16 v1, 0x0

    .line 33
    .line 34
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;J)J

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;J)J

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 43
    .line 44
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;J)J

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a$b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a$b;->a()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$1;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 59
    .line 60
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$1;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    iput-boolean v0, v1, Lcom/tencent/iliveroom/a/a;->l:Z

    .line 78
    .line 79
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$1;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 80
    .line 81
    iget v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->cdnVideoCodecType:I

    .line 82
    .line 83
    const/4 v2, 0x2

    .line 84
    if-ne v0, v2, :cond_0

    .line 85
    .line 86
    iget-object v0, v1, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 87
    .line 88
    iget v2, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->bizId:I

    .line 89
    .line 90
    iget-wide v3, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->sdkAppId:J

    .line 91
    .line 92
    iget-object v5, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 93
    .line 94
    iget-wide v6, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 95
    .line 96
    invoke-static/range {v1 .. v7}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;IJLjava/lang/String;J)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v1, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const-string v0, ""

    .line 105
    .line 106
    invoke-static {v1, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    :goto_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$1;->c:Lcom/tencent/iliveroom/a/a;

    .line 110
    .line 111
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
