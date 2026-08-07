.class public Ll/xl80;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/y0m;

.field public d:Lcom/p1/mobile/putong/app/PutongAct;

.field public e:Z

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;ZLcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    iput-object p2, p0, Ll/xl80;->c:Ll/y0m;

    .line 14
    .line 15
    iput-boolean p3, p0, Ll/xl80;->e:Z

    .line 16
    .line 17
    iput-object p4, p0, Ll/xl80;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->isFromShoot()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 8

    .line 1
    const/4 v1, 0x1

    .line 2
    if-ne p3, v1, :cond_0

    .line 3
    .line 4
    move-object v0, p1

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;

    .line 6
    .line 7
    iget-object v1, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    iget-object v2, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v3, p0, Ll/xl80;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->b(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    new-array v0, v0, [Ll/tfj0$a;

    .line 18
    .line 19
    const-string v1, "e_add_new_photo"

    .line 20
    .line 21
    const-string v2, "p_moment_post"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v1, 0x2

    .line 28
    if-ne p3, v1, :cond_1

    .line 29
    .line 30
    move-object v0, p1

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

    .line 32
    .line 33
    iget-object v1, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    iget-object v2, p0, Ll/xl80;->c:Ll/y0m;

    .line 36
    .line 37
    iget-object v3, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 38
    .line 39
    move-object v4, p2

    .line 40
    check-cast v4, Lcom/p1/mobile/putong/data/Video;

    .line 41
    .line 42
    move-object v5, p0

    .line 43
    move v6, p4

    .line 44
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->P(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    move-object v0, p1

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;

    .line 50
    .line 51
    iget-object v1, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 52
    .line 53
    iget-object v2, p0, Ll/xl80;->c:Ll/y0m;

    .line 54
    .line 55
    iget-object v3, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 56
    .line 57
    iget-boolean v7, p0, Ll/xl80;->e:Z

    .line 58
    .line 59
    move-object v5, p0

    .line 60
    move-object v4, p2

    .line 61
    move v6, p4

    .line 62
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->F(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;Ljava/util/ArrayList;Ljava/lang/Object;Ll/xl80;IZ)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x9

    .line 8
    .line 9
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/xl80;->e:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 16
    .line 17
    new-instance v1, Ll/vl80;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/vl80;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance v1, Ll/wl80;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/wl80;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    add-int/lit8 p0, p0, 0x1

    .line 49
    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/tec0;->d5:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/xl80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/tec0;->f5:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget p2, Ll/tec0;->e5:I

    .line 39
    .line 40
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public G()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "add image"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/xl80;->f:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/xl80;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "add image"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Ll/xl80;->getItem(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method
