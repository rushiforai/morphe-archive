.class public final synthetic Ll/e5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    iput-object p2, p0, Ll/e5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    iget-object p0, p0, Ll/e5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->d(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method
