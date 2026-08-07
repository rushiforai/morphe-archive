.class public abstract Ll/fo00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final e:I


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public c:Z

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/fo00;->e:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/eo00;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/eo00;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VLinear;",
            "Landroid/content/Context;",
            "TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    new-array v1, v1, [Landroid/view/View;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aput-object p0, v1, v2

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    aput-object v0, v1, p0

    .line 19
    .line 20
    const/4 p0, 0x2

    .line 21
    aput-object p1, v1, p0

    .line 22
    .line 23
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/do00;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/do00;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public e(ZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fo00;->c:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/fo00;->d:Z

    .line 4
    .line 5
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fo00;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fo00;->b:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    return-void
.end method
