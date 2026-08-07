.class public Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;Ll/ovb0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic d:Ll/fwy;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/fwy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->e:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->b:Ljava/util/Map;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->d:Ll/fwy;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 38
    .line 39
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    const-string p1, "p_chat_view"

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->b:Ljava/util/Map;

    .line 46
    .line 47
    const-string v1, "e_spark"

    .line 48
    .line 49
    invoke-static {v1, p1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 55
    .line 56
    iget-object p1, p1, Ll/clz;->c:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0, p1}, Ll/cvf0;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->d:Ll/fwy;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->e:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->e(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
