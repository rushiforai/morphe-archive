.class public Ll/fme0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/Media;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic E(Ll/fme0;Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fme0;->I(Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Media;->isSameOrigin(Lcom/p1/mobile/putong/data/Media;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fme0;->G(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/jec0;->n:I

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

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PickerSelectedItem;

    .line 2
    .line 3
    iget-object p3, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 4
    .line 5
    iget-object p4, p3, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 8
    .line 9
    invoke-virtual {p3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    iget-object p4, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 20
    .line 21
    iget-object p4, p4, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 22
    .line 23
    iget-object p4, p4, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 24
    .line 25
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->c(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/data/Media;->isSameOrigin(Lcom/p1/mobile/putong/data/Media;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    invoke-virtual {p1, p4, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PickerSelectedItem;->b(Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    new-instance p3, Ll/dme0;

    .line 39
    .line 40
    invoke-direct {p3, p0, p2}, Ll/dme0;-><init>(Ll/fme0;Lcom/p1/mobile/putong/data/Media;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/data/Media;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/eme0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/eme0;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/fme0;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->c:Lv/VPager;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p2, p0, p1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fme0;->H(I)Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
