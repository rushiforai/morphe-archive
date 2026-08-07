.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Sticker;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->d:Ll/y20;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->K(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;IIILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->J(IIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->L(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    xor-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    add-int/2addr v0, p0

    .line 26
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    new-instance p0, Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/gra;->z()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget p1, Ll/dbc0;->e8:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget p1, Ll/dbc0;->d8:I

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 27
    .line 28
    const/high16 p2, 0x42600000    # 56.0f

    .line 29
    .line 30
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-direct {p1, v0, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    const/high16 p2, 0x42c80000    # 100.0f

    .line 42
    .line 43
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iput p2, p1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget p1, Ll/qec0;->E0:I

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V
    .locals 3

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p2, Ll/yo7;

    .line 4
    .line 5
    invoke-direct {p2, p0, p1}, Ll/yo7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    check-cast p1, Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget p3, Ll/edc0;->C1:I

    .line 15
    .line 16
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/high16 v1, 0x41200000    # 10.0f

    .line 27
    .line 28
    invoke-interface {v0, p3, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 49
    .line 50
    const-string v1, "shanmeng"

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, p3, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    check-cast p3, Lcom/p1/mobile/putong/data/Picture;

    .line 81
    .line 82
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p3}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    iput-object p3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 92
    .line 93
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->O(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, p3, v1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 106
    .line 107
    .line 108
    :goto_0
    new-instance p3, Ll/zo7;

    .line 109
    .line 110
    invoke-direct {p3, p0, p2, p4}, Ll/zo7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Lcom/p1/mobile/putong/core/data/Sticker;I)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, p3}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 118
    .line 119
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 18
    .line 19
    return-object p0
.end method

.method public final synthetic J(IIILandroid/content/Intent;)Z
    .locals 0

    .line 1
    if-ne p2, p1, :cond_1

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    if-ne p3, p1, :cond_1

    .line 5
    .line 6
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->o:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p4, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->d:Ll/y20;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->d:Ll/y20;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final synthetic K(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->k(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "e_gif_search"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Landroid/content/Intent;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 19
    .line 20
    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->j:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    new-instance v0, Ll/ap7;

    .line 32
    .line 33
    const/16 v1, 0x2713

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/ap7;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    sget p1, Ll/y7c0;->e:I

    .line 44
    .line 45
    sget p2, Ll/y7c0;->a:I

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 3

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->k(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const-string v0, "search_word"

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "gif_recommend_scene"

    .line 16
    .line 17
    const-string v2, "comment"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_gif_recommend"

    .line 28
    .line 29
    invoke-static {v1, p3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->d:Ll/y20;

    .line 33
    .line 34
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->d:Ll/y20;

    .line 41
    .line 42
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->j(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->g:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;->l(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView;ZI)V

    .line 57
    .line 58
    .line 59
    :cond_1
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

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

.method public N(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->I(I)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method
