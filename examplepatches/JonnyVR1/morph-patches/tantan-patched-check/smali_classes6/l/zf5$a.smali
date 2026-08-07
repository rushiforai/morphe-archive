.class public Ll/zf5$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zf5;->f(Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;

.field public final synthetic b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zf5$a;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/zf5$a;->b:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/zf5$a;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/zf5$a;->b:Z

    .line 6
    .line 7
    invoke-static {p1, p2, p0}, Ll/zf5;->a(Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
