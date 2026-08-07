.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Sticker;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->d:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->c:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->J(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->K(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->L(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V

    return-void
.end method

.method private synthetic K(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "e_gif_search"

    .line 2
    .line 3
    const-string v0, "p_user_moment_interactions_details_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 15
    .line 16
    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->j:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    new-instance v0, Ll/h0a;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/h0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;)V

    .line 30
    .line 31
    .line 32
    const/16 v1, 0x12

    .line 33
    .line 34
    invoke-virtual {p1, v1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    sget p1, Ll/y7c0;->e:I

    .line 40
    .line 41
    sget p2, Ll/y7c0;->a:I

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/qec0;->W3:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/bnl0;->y0()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    div-int/lit8 p2, p2, 0x4

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 34
    .line 35
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V
    .locals 2

    .line 1
    const/4 p4, -0x1

    .line 2
    const/4 v0, 0x1

    .line 3
    if-ne p3, p4, :cond_1

    .line 4
    .line 5
    sget p2, Ll/edc0;->C1:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Ll/wlj;

    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->e:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-static {}, Ll/gra;->z()Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    if-eqz p4, :cond_0

    .line 26
    .line 27
    sget p4, Ll/dbc0;->f8:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget p4, Ll/dbc0;->d8:I

    .line 31
    .line 32
    :goto_0
    invoke-virtual {p3, p4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    const/high16 p4, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {p2, p3, p4, v0}, Ll/wlj;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 39
    .line 40
    .line 41
    new-instance p2, Ll/f0a;

    .line 42
    .line 43
    invoke-direct {p2, p0, p1}, Ll/f0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    if-ne p3, v0, :cond_4

    .line 51
    .line 52
    check-cast p1, Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget p3, Ll/edc0;->C1:I

    .line 55
    .line 56
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    check-cast p3, Lv/VDraweeView;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p4

    .line 66
    if-eqz p4, :cond_3

    .line 67
    .line 68
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    if-nez p4, :cond_3

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 80
    .line 81
    const-string v0, "shanmeng"

    .line 82
    .line 83
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p4

    .line 87
    const/4 v0, 0x0

    .line 88
    if-eqz p4, :cond_2

    .line 89
    .line 90
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p4, p3, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    check-cast p3, Lcom/p1/mobile/putong/data/Picture;

    .line 112
    .line 113
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p3}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    iput-object p3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_2
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 123
    .line 124
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->N(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p4, p3, v0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 137
    .line 138
    .line 139
    :goto_1
    new-instance p3, Ll/g0a;

    .line 140
    .line 141
    invoke-direct {p3, p0, p2}, Ll/g0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p1, p3}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_3
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 149
    .line 150
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 151
    .line 152
    .line 153
    :cond_4
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/data/Sticker;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->c:Ljava/util/List;

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic J(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x12

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_1

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->d:Landroid/view/View;

    .line 33
    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-interface {p2, p0, p1, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->d:Landroid/view/View;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p2, p0, p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->I(I)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
