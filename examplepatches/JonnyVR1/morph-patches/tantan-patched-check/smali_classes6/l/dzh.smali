.class public final synthetic Ll/dzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fzh;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dzh;->a:Ll/fzh;

    iput-object p2, p0, Ll/dzh;->b:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

    iput-object p3, p0, Ll/dzh;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dzh;->a:Ll/fzh;

    iget-object v1, p0, Ll/dzh;->b:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

    iget-object p0, p0, Ll/dzh;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/fzh;->h(Ll/fzh;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
