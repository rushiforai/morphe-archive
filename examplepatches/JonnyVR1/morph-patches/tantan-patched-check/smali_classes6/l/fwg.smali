.class public Ll/fwg;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fwg$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/fwg$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final d:[I


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    sget v0, Ll/lbc0;->x0:I

    .line 2
    .line 3
    sget v1, Ll/lbc0;->t0:I

    .line 4
    .line 5
    sget v2, Ll/lbc0;->u0:I

    .line 6
    .line 7
    sget v3, Ll/lbc0;->v0:I

    .line 8
    .line 9
    sget v4, Ll/lbc0;->w0:I

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/fwg;->d:[I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fwg;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/fwg;->b:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic y(Ll/fwg;Lcom/p1/mobile/putong/feed/data/CameraCategory;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fwg;->A(Lcom/p1/mobile/putong/feed/data/CameraCategory;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/feed/data/CameraCategory;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwg;->c:Ll/z20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public C(Ll/fwg$a;I)V
    .locals 3

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;->b:Landroid/widget/ImageView;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/fwg;->z(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;->b:Landroid/widget/ImageView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fwg;->b:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 35
    .line 36
    new-instance v1, Ll/ewg;

    .line 37
    .line 38
    invoke-direct {v1, p0, v0, p2}, Ll/ewg;-><init>(Ll/fwg;Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Ll/fwg$a;
    .locals 0

    .line 1
    new-instance p1, Ll/fwg$a;

    .line 2
    .line 3
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;

    .line 4
    .line 5
    iget-object p0, p0, Ll/fwg;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p1, p2}, Ll/fwg$a;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceCategoryView;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public E(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fwg;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/fwg;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fwg;->b:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public F(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fwg;->c:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwg;->b:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fwg$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fwg;->C(Ll/fwg$a;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fwg;->D(Landroid/view/ViewGroup;I)Ll/fwg$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final z(I)I
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/fwg;->d:[I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    aget p0, p0, p1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Ll/fwg;->d:[I

    .line 10
    .line 11
    rem-int/lit8 p1, p1, 0x5

    .line 12
    .line 13
    aget p0, p0, p1

    .line 14
    .line 15
    return p0
.end method
