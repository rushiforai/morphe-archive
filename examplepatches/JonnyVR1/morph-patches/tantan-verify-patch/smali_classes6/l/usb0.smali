.class public final synthetic Ll/usb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

.field public final synthetic b:Ll/l1i;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/usb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iput-object p2, p0, Ll/usb0;->b:Ll/l1i;

    iput-object p3, p0, Ll/usb0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/usb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iget-object v1, p0, Ll/usb0;->b:Ll/l1i;

    iget-object p0, p0, Ll/usb0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->R(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    return-void
.end method
