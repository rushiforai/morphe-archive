.class public Ll/tvz$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tvz;->Z2()Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tvz$c;->a:Ll/tvz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/tvz$c;->a:Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "picture_text_deeplink"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 38
    .line 39
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 44
    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    long-to-double v1, v1

    .line 50
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iput p0, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 78
    .line 79
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 80
    .line 81
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 82
    .line 83
    const-string p0, ""

    .line 84
    .line 85
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->new_()Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/4 v1, 0x3

    .line 92
    iput v1, p0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->type:I

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->new_()Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->view:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;

    .line 99
    .line 100
    const-string v2, "1234"

    .line 101
    .line 102
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->title:Ljava/lang/String;

    .line 103
    .line 104
    const-string v2, "12314"

    .line 105
    .line 106
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMessageView;->subTitle:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;->toJson()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 117
    .line 118
    const/4 v1, 0x0

    .line 119
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->ah(Lcom/p1/mobile/putong/core/data/Message;Z)Lrx/c;

    .line 120
    .line 121
    .line 122
    return-void
.end method
