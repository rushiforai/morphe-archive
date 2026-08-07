.class public Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->b:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/i46;->f()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->b:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;->P(Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "p_chat_view"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 26
    .line 27
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/i46;->d(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ll/i46;->b()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 47
    .line 48
    iget-object v0, v0, Ll/clz;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {}, Ll/i46;->c()Ll/i46;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 69
    .line 70
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/i46;->h(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 76
    .line 77
    const/16 v1, 0x1d

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-static {v0, p1, v2, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->finish()V

    .line 92
    .line 93
    .line 94
    return-void
.end method
