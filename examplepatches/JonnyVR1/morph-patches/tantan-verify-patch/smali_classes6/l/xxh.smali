.class public final synthetic Ll/xxh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

.field public final synthetic b:Ll/l1i;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Ll/l1i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xxh;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    iput-object p2, p0, Ll/xxh;->b:Ll/l1i;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xxh;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    iget-object p0, p0, Ll/xxh;->b:Ll/l1i;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->p(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Ll/l1i;)V

    return-void
.end method
