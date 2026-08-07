.class public final synthetic Ll/zcq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/OperationTopicInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;Lcom/p1/mobile/putong/core/data/OperationTopicInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;

    iput-object p2, p0, Ll/zcq;->b:Lcom/p1/mobile/putong/core/data/OperationTopicInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;

    iget-object p0, p0, Ll/zcq;->b:Lcom/p1/mobile/putong/core/data/OperationTopicInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemOperationTopic;Lcom/p1/mobile/putong/core/data/OperationTopicInfo;Landroid/view/View;)V

    return-void
.end method
