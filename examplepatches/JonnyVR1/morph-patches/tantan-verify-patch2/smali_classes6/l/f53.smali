.class public final synthetic Ll/f53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/FeedLiterature;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Lcom/p1/mobile/putong/feed/data/FeedLiterature;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f53;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

    iput-object p2, p0, Ll/f53;->b:Lcom/p1/mobile/putong/feed/data/FeedLiterature;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f53;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;

    iget-object p0, p0, Ll/f53;->b:Lcom/p1/mobile/putong/feed/data/FeedLiterature;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;->q(Lcom/p1/mobile/putong/feed/newui/photoalbum/bookmovie/BookMovieTopicHeaderView;Lcom/p1/mobile/putong/feed/data/FeedLiterature;Landroid/view/View;)V

    return-void
.end method
