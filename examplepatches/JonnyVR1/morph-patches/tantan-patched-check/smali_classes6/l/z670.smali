.class public Ll/z670;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ll/y670;Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->A1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VFrame;

    .line 8
    .line 9
    iput-object v0, p0, Ll/y670;->a:Lv/VFrame;

    .line 10
    .line 11
    sget v0, Ll/hdc0;->a1:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 18
    .line 19
    iput-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 20
    .line 21
    return-void
.end method

.method public static b(Ll/y670;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->Z1:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/z670;->a(Ll/y670;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public static c(Ll/y670;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/y670;->a:Lv/VFrame;

    .line 3
    .line 4
    iput-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 5
    .line 6
    return-void
.end method
