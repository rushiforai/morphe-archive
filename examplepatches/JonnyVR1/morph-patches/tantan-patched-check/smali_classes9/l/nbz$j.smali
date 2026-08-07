.class public Ll/nbz$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->u2(Ll/clz;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public constructor <init>(Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nbz$j;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/rbz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/rbz;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/nbz$j;->a:Ll/clz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v2}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "moment_user_state"

    .line 32
    .line 33
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 38
    .line 39
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    long-to-double v2, v2

    .line 44
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 66
    .line 67
    iget-object p0, p0, Ll/nbz$j;->a:Ll/clz;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 74
    .line 75
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 78
    .line 79
    new-instance p0, Lcom/p1/mobile/putong/core/data/StateData;

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/StateData;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v1, "1"

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/StateData;->emotionId:Ljava/lang/String;

    .line 87
    .line 88
    const-string v1, "\u7b49\u7f18\u5206"

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/StateData;->emotionText:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/StateData;->emotionUrl:Ljava/lang/String;

    .line 107
    .line 108
    const-string v1, "\u6211\u6b63\u5728\u7b49\u4e00\u4e2a\u7f18\u5206\uff0c\u662f\u4f60\u5417"

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/StateData;->value:Ljava/lang/String;

    .line 111
    .line 112
    new-instance v1, Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 113
    .line 114
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/MessageExtData;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/StateData;->toJson()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 124
    .line 125
    new-instance p0, Ll/qbz;

    .line 126
    .line 127
    invoke-direct {p0, v0}, Ll/qbz;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method
