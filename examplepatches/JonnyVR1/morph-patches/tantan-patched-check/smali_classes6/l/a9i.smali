.class public final synthetic Ll/a9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r4h$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a9i;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;

    iput-object p2, p0, Ll/a9i;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/a9i;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/a9i;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Ljava/lang/Object;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/a9i;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;

    iget-object v1, p0, Ll/a9i;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/a9i;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/a9i;->d:Ljava/lang/String;

    move-object v5, p2

    check-cast v5, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    move-object v4, p1

    move v6, p3

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    return-void
.end method
