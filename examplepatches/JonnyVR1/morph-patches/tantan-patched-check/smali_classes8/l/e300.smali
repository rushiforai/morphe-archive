.class public final synthetic Ll/e300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e300;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

    iput-object p2, p0, Ll/e300;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iput-object p3, p0, Ll/e300;->c:Lcom/p1/mobile/putong/data/Media;

    iput-object p4, p0, Ll/e300;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e300;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;

    iget-object v1, p0, Ll/e300;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iget-object v2, p0, Ll/e300;->c:Lcom/p1/mobile/putong/data/Media;

    iget-object p0, p0, Ll/e300;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;->T(Lcom/p1/mobile/putong/core/ui/messages/MessagePicLikeGuideLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
