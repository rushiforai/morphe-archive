.class public Ll/nbz$p;
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
    iput-object p1, p0, Ll/nbz$p;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/clz;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "chat_assistant_question"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 19
    .line 20
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 33
    .line 34
    long-to-double v3, v1

    .line 35
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 36
    .line 37
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 38
    .line 39
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-static {p0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageExtData;->new_()Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 88
    .line 89
    const-string v1, "user"

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 92
    .line 93
    const-string p0, "\u5982\u679c\u53ef\u4ee5\u7528\u4e00\u534a\u667a\u5546\u636210cm\u7684\u8eab\u9ad8\uff0c\u4f60\u613f\u610f\u5417\uff1f"

    .line 94
    .line 95
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 102
    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nbz$p;->a:Ll/clz;

    .line 2
    .line 3
    new-instance v0, Ll/vbz;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/vbz;-><init>(Ll/clz;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
