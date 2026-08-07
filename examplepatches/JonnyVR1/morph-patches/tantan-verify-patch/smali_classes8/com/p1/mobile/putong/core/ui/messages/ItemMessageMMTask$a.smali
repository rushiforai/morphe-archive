.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->W(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->c:Ljava/util/Map;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->d:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->P(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p1, "p_chat_view"

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->c:Ljava/util/Map;

    .line 15
    .line 16
    const-string v1, "e_spark_level_up"

    .line 17
    .line 18
    invoke-static {v1, p1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->d:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->Z1(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;->d:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;->a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
