.class public Ll/nt00$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nt00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lv/VListCell$a;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:I

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic g:Ll/nt00;


# direct methods
.method public constructor <init>(Ll/nt00;Ljava/util/List;Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nt00$a;->g:Ll/nt00;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/nt00$a;->c:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Ll/nt00$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iput p4, p0, Ll/nt00$a;->e:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/nt00$a;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic E(Ll/nt00$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nt00$a;->K(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic F(Ll/nt00$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nt00$a;->c:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic G(Ll/nt00$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/nt00$a;->e:I

    return p0
.end method

.method private synthetic K(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nt00$a;->J(I)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/nt00$a;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->n2:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->A1:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iput p1, p0, Ll/nt00$a;->e:I

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lv/VListCell$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/nt00$a;->H(Landroid/view/View;Lv/VListCell$a;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nt00$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nt00$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->y1:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public H(Landroid/view/View;Lv/VListCell$a;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMomentVisibleRangeItemView;

    .line 2
    .line 3
    iget p3, p0, Ll/nt00$a;->e:I

    .line 4
    .line 5
    if-ne p4, p3, :cond_0

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p3, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, p4}, Ll/nt00$a;->J(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMomentVisibleRangeItemView;->q(Lv/VListCell$a;ZZ)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ll/mt00;

    .line 18
    .line 19
    invoke-direct {p2, p0, p4}, Ll/mt00;-><init>(Ll/nt00$a;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public I(I)Lv/VListCell$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nt00$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/nt00$a;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lv/VListCell$a;

    .line 18
    .line 19
    return-object p0
.end method

.method public final J(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nt00$a;->g:Ll/nt00;

    .line 2
    .line 3
    invoke-static {v0}, Ll/nt00;->f(Ll/nt00;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/nt00$a;->g:Ll/nt00;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/nt00;->o(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "everyone"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/nt00$a;->g:Ll/nt00;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/nt00;->o(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "stranger"

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nt00$a;->I(I)Lv/VListCell$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nt00$a;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
