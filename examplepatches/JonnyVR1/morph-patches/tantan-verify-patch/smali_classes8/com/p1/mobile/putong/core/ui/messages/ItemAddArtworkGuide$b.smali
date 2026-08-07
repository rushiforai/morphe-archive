.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Lcom/p1/mobile/putong/core/data/Literatures;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->c:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;Lcom/p1/mobile/putong/core/data/Literatures;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->y(Lcom/p1/mobile/putong/core/data/Literatures;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/Literatures;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->c:Ljava/util/List;

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

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Literatures;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->t(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Literatures;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Ll/qec0;->a:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    div-int/lit8 v0, v0, 0x3

    .line 27
    .line 28
    if-nez p2, :cond_0

    .line 29
    .line 30
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    invoke-direct {p2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->k(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-float p0, p0

    .line 42
    const/high16 v0, 0x40800000    # 4.0f

    .line 43
    .line 44
    mul-float/2addr p0, v0

    .line 45
    const/high16 v0, 0x41100000    # 9.0f

    .line 46
    .line 47
    div-float/2addr p0, v0

    .line 48
    float-to-int p0, p0

    .line 49
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method

.method public t(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Literatures;II)V
    .locals 1

    .line 1
    sget p3, Ll/edc0;->o1:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lv/VDraweeView;

    .line 8
    .line 9
    sget p4, Ll/edc0;->n5:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Lv/VImage;

    .line 16
    .line 17
    new-instance v0, Ll/o1q;

    .line 18
    .line 19
    invoke-direct {v0, p3, p2}, Ll/o1q;-><init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/Literatures;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    sget p3, Ll/edc0;->z5:I

    .line 26
    .line 27
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    check-cast p3, Lv/VText;

    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p4, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->z(Lv/VImage;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    new-instance p3, Ll/p1q;

    .line 44
    .line 45
    invoke-direct {p3, p0, p2}, Ll/p1q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;Lcom/p1/mobile/putong/core/data/Literatures;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final w(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, -0x51131622

    .line 6
    .line 7
    .line 8
    if-eq p0, v0, :cond_2

    .line 9
    .line 10
    const v0, 0x2e3ae9

    .line 11
    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const v0, 0x6343f30

    .line 16
    .line 17
    .line 18
    if-eq p0, v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const-string p0, "movie"

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string p0, "book"

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    :goto_0
    const-string p0, "watched"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    const-string p0, "teleplay"

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_1
    const-string p0, "watching"

    .line 47
    .line 48
    return-object p0
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/core/data/Literatures;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "artwork_title"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->o(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "teleplay"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "tv_show"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->o(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    const-string v1, "artwork_type"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    const-string v0, "e_chat_send_artwork"

    .line 43
    .line 44
    const-string v1, "p_chat_view"

    .line 45
    .line 46
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->l(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "local_add_artwork_guide"

    .line 60
    .line 61
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Pf(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 65
    .line 66
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->n(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 73
    .line 74
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "\u4e00\u8d77\u804a\u804a\u300a%s\u300b\u5427"

    .line 79
    .line 80
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p2, v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->p(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public z(Lv/VImage;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {v0, p0, p2}, Ll/r97;->w3(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
