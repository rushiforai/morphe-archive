.class public Ll/xn00$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xn00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
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


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/feed/data/Moment;)V
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
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xn00$a;->c:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xn00$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput p3, p0, Ll/xn00$a;->e:I

    .line 9
    .line 10
    iput-object p4, p0, Ll/xn00$a;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic E(Ll/xn00$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/xn00$a;->I(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic F(Ll/xn00$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xn00$a;->e:I

    return p0
.end method

.method private synthetic I(ILandroid/view/View;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xn00$a;->e:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lv/VListCell$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xn00$a;->G(Landroid/view/View;Lv/VListCell$a;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xn00$a;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/xn00$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->s1:I

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

.method public G(Landroid/view/View;Lv/VListCell$a;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMomentForwardSheetItemView;

    .line 2
    .line 3
    iget p3, p0, Ll/xn00$a;->e:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-ne p4, p3, :cond_0

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p3, v0

    .line 11
    :goto_0
    invoke-virtual {p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMomentForwardSheetItemView;->q(Lv/VListCell$a;ZZ)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/wn00;

    .line 15
    .line 16
    invoke-direct {p2, p0, p4}, Ll/wn00;-><init>(Ll/xn00$a;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public H(I)Lv/VListCell$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xn00$a;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/xn00$a;->c:Ljava/util/List;

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

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xn00$a;->H(I)Lv/VListCell$a;

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
    iget-object p0, p0, Ll/xn00$a;->c:Ljava/util/List;

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
