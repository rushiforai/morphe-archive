.class Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;
.super Landroid/os/ResultReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->j0()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

.field final synthetic val$act:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Landroid/os/Handler;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;->this$0:Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;->val$act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->t1()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p2, -0x1

    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick$1;->val$act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
