.class public Ll/nbz$l;
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
    iput-object p1, p0, Ll/nbz$l;->a:Ll/clz;

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
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "local_normal_tips"

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
    iget-object p0, p0, Ll/nbz$l;->a:Ll/clz;

    .line 14
    .line 15
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 18
    .line 19
    const-string p0, "\u5979\u4e0a\u6b21\u6d3b\u8dc3\u572812\u5c0f\u65f6\u524d\uff0c\u53ef\u80fd\u4e0d\u4f1a\u7acb\u5373\u56de\u590d\uff0c\u8bf7\u7a0d\u5019"

    .line 20
    .line 21
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 39
    .line 40
    long-to-double v3, v1

    .line 41
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 44
    .line 45
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-static {p0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Zg(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 94
    .line 95
    .line 96
    return-void
.end method
