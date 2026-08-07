.class public final synthetic Ll/suh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/suh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    iput-object p2, p0, Ll/suh;->b:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    iput-object p3, p0, Ll/suh;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/suh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;

    iget-object v1, p0, Ll/suh;->b:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    iget-object p0, p0, Ll/suh;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->P(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
