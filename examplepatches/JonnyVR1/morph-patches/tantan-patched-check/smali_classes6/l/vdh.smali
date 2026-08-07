.class public final synthetic Ll/vdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cb50;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vdh;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    iput-object p2, p0, Ll/vdh;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vdh;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    iget-object p0, p0, Ll/vdh;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->F(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;Ll/bkj0;)V

    return-void
.end method
