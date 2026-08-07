.class public final synthetic Ll/rsg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rsg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    iput-boolean p2, p0, Ll/rsg;->b:Z

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rsg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    iget-boolean p0, p0, Ll/rsg;->b:Z

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;ZIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
