.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    new-array v0, v0, [Ll/sfj0$a;

    .line 15
    .line 16
    const-string v1, "e_chat_message_convert_to_text_initial_button"

    .line 17
    .line 18
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)Lcom/p1/mobile/putong/core/data/Message;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p1, p0, v0}, Ll/clz;->p7(Lcom/p1/mobile/putong/core/data/Message;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
