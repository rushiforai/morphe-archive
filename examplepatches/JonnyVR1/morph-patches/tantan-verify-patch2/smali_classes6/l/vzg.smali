.class public Ll/vzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rzg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/rzg<",
        "Ll/pf60<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
        ">;",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(Ll/a0h$a;)Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 2
    .line 3
    iget-object p1, p1, Ll/a0h$a;->f:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/vzg;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ll/a0h$a;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/vzg;->b(Ll/pf60;Ll/a0h$a;Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/pf60;Ll/a0h$a;Landroid/app/Dialog;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Ll/a0h$a;",
            "Landroid/app/Dialog;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/vzg;->c(Ll/a0h$a;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    iget v3, p2, Ll/a0h$a;->c:I

    .line 9
    .line 10
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, v0, v1}, Landroid/app/Dialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3}, Ll/vzg;->d(Ll/pf60;Ll/a0h$a;Landroid/app/Dialog;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final d(Ll/pf60;Ll/a0h$a;Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Ll/a0h$a;",
            "Landroid/app/Dialog;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vzg;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 2
    .line 3
    iget-object p2, p2, Ll/a0h$a;->e:Ll/y20;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->E(Ll/pf60;Landroid/app/Dialog;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
