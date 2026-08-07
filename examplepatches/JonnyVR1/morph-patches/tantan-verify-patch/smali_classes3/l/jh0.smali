.class public Ll/jh0;
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
.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/rn20;

.field public e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

.field public f:I

.field public g:I

.field public h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

.field public i:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

.field public final j:I

.field public k:I


# direct methods
.method public constructor <init>(Ll/kh0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/jh0;->c:Ll/vg60;

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Ll/jh0;->j:I

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/kh0;->a()Ll/rn20;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/jh0;->d:Ll/rn20;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/kh0;->d()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/kh0;->b()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/jh0;->f:I

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/kh0;->c()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/jh0;->g:I

    .line 36
    .line 37
    iget-object v0, p1, Ll/kh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 38
    .line 39
    iput-object v0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 40
    .line 41
    iget-object p1, p1, Ll/kh0;->f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 42
    .line 43
    iput-object p1, p0, Ll/jh0;->i:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 44
    .line 45
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jh0;->d:Ll/rn20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/rn20;->C()Lcom/p1/mobile/android/app/Frag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jh0;->E(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isHasPostStatusHeader:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/jh0;->c:Ll/vg60;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/jh0;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->headResource:I

    .line 16
    .line 17
    invoke-virtual {p2, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-direct {p0}, Ll/jh0;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Ll/jec0;->g:I

    .line 31
    .line 32
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;II)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, p3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isHasPostStatusHeader:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz v0, :cond_1

    .line 11
    .line 12
    add-int/lit8 p4, p4, -0x1

    .line 13
    .line 14
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;

    .line 15
    .line 16
    iget-object v0, p0, Ll/jh0;->i:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 21
    .line 22
    invoke-interface {v0, p1, p2, v1, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;->beforeItemRender(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p0, p2, p4, p1}, Ll/jh0;->F(Lcom/p1/mobile/putong/data/Media;ILcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p0, Ll/jh0;->i:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 33
    .line 34
    if-eqz p3, :cond_3

    .line 35
    .line 36
    iget-object p4, p0, Ll/jh0;->d:Ll/rn20;

    .line 37
    .line 38
    iget-object p0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 39
    .line 40
    invoke-interface {p3, p1, p2, p4, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;->afterItemRender(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Ll/rn20;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    :goto_0
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Media;ILcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/jh0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedVideoMedias:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Ll/jh0;->g:I

    .line 24
    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 31
    :goto_1
    iget-object v2, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->c(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    iget-object v8, p0, Ll/jh0;->d:Ll/rn20;

    .line 42
    .line 43
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    iget-object v11, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 52
    .line 53
    move-object v5, p1

    .line 54
    move v6, p2

    .line 55
    move-object v4, p3

    .line 56
    invoke-virtual/range {v4 .. v11}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->e(Lcom/p1/mobile/putong/data/Media;ILjava/lang/String;Ll/rn20;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isHasPostStatusHeader:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/jh0;->c:Ll/vg60;

    .line 12
    .line 13
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    iget-object p0, p0, Ll/jh0;->c:Ll/vg60;

    .line 25
    .line 26
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    return-object p0
.end method

.method public H()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedVideoMedias:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/jh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedImageMedias:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget p0, p0, Ll/jh0;->f:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public I()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/jh0;->k:I

    .line 8
    .line 9
    iput-object p1, p0, Ll/jh0;->c:Ll/vg60;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public K(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jh0;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/jh0;->k:I

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/jh0;->c:Ll/vg60;

    .line 11
    .line 12
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/jh0;->k:I

    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jh0;->G(I)Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isHasPostStatusHeader:Z

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-wide/16 p0, -0x1

    .line 10
    .line 11
    return-wide p0

    .line 12
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    int-to-long p0, p1

    .line 15
    return-wide p0

    .line 16
    :cond_1
    int-to-long p0, p1

    .line 17
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh0;->h:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isHasPostStatusHeader:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
