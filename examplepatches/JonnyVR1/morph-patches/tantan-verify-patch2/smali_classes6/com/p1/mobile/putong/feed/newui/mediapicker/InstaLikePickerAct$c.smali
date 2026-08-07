.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/ewi;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Ll/ewi;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->c:Ll/vg60;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ll/uwm;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/ewi;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->E(Landroid/view/View;Ll/ewi;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->j1:I

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

.method public E(Landroid/view/View;Ll/ewi;II)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    move v2, p3

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, p1

    .line 11
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 12
    .line 13
    iget-object p3, p3, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 14
    .line 15
    iget-object p3, p3, Ll/uyh0;->a:Ll/vg60;

    .line 16
    .line 17
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 26
    .line 27
    iget-object p3, p3, Ll/uyh0;->a:Ll/vg60;

    .line 28
    .line 29
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-lez p3, :cond_1

    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 38
    .line 39
    iget-object p3, p3, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 40
    .line 41
    iget-object p3, p3, Ll/uyh0;->a:Ll/vg60;

    .line 42
    .line 43
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    :goto_1
    move-object v4, p1

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    const/4 p1, 0x0

    .line 54
    goto :goto_1

    .line 55
    :goto_2
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 56
    .line 57
    move-object v1, p2

    .line 58
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/picker/FeedFolderItemView;->c(Ll/ewi;ZILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public F(I)Ll/ewi;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->c:Ll/vg60;

    .line 6
    .line 7
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/ewi;

    .line 16
    .line 17
    return-object p0
.end method

.method public G(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->c:Ll/vg60;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->F(I)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method
