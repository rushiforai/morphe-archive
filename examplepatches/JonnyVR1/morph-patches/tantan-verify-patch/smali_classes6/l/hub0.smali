.class public final synthetic Ll/hub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

.field public final synthetic b:Ll/l1i;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Ll/l1i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    iput-object p2, p0, Ll/hub0;->b:Ll/l1i;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    iget-object p0, p0, Ll/hub0;->b:Ll/l1i;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Ll/l1i;)V

    return-void
.end method
