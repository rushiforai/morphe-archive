.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 5
    .line 6
    return-void
.end method
