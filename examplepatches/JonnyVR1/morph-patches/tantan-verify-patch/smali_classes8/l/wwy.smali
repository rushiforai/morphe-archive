.class public Ll/wwy;
.super Ll/jic0;
.source "SourceFile"


# annotations
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

.field public final d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/wwy;->e:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/wwy;->f:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/wwy;->c:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic E(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwy;->U(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic F(Ll/wwy;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/wwy;->T(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/wwy;IIILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/wwy;->S(IIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic H(Ll/wwy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wwy;->Z()V

    return-void
.end method

.method public static synthetic I(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wwy;->V(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/wwy;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wwy;->Y(Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/wwy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wwy;->X()V

    return-void
.end method

.method public static synthetic L(Ll/wwy;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wwy;->a0(Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/wwy;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wwy;->W(Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wwy;->b0(Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic S(IIILandroid/content/Intent;)Z
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
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/wwy;->d0(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private synthetic T(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "e_gif_search"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

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
    iget p1, p0, Ll/wwy;->e:I

    .line 26
    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ll/qzz;->l0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->n:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/qzz;->l0()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->m:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object p1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    new-instance v0, Ll/nwy;

    .line 68
    .line 69
    const/16 v1, 0x2713

    .line 70
    .line 71
    invoke-direct {v0, p0, v1}, Ll/nwy;-><init>(Ll/wwy;I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 78
    .line 79
    sget p1, Ll/y7c0;->e:I

    .line 80
    .line 81
    sget p2, Ll/y7c0;->a:I

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/wwy;->P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwy;->c:Ljava/util/List;

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
    iget-object v0, p0, Ll/wwy;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-boolean p0, p0, Ll/wwy;->f:Z

    .line 18
    .line 19
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    if-nez p2, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->m:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 23
    .line 24
    invoke-static {}, Ll/h39;->G()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    sget v0, Ll/qa00;->G:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget v0, Ll/qa00;->J:I

    .line 34
    .line 35
    :goto_0
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    sget v0, Ll/qa00;->G:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    sget v0, Ll/qa00;->J:I

    .line 43
    .line 44
    :goto_1
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 45
    .line 46
    sget p1, Ll/edc0;->o1:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lv/VImage;

    .line 53
    .line 54
    const/high16 v0, 0x41300000    # 11.0f

    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    const/high16 v1, 0x41880000    # 17.0f

    .line 67
    .line 68
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    :goto_2
    sget p1, Ll/edc0;->C2:I

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 89
    .line 90
    .line 91
    if-eqz p2, :cond_3

    .line 92
    .line 93
    const/high16 p2, 0x41000000    # 8.0f

    .line 94
    .line 95
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_3
    const/high16 p2, 0x41200000    # 10.0f

    .line 104
    .line 105
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    invoke-static {p1, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_4
    invoke-virtual {p0, p2}, Ll/wwy;->Q(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method

.method public P(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p2, Ll/lwy;

    .line 4
    .line 5
    invoke-direct {p2, p0, p1}, Ll/lwy;-><init>(Ll/wwy;Landroid/view/View;)V

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
    const/4 p4, 0x2

    .line 13
    if-ne p3, p4, :cond_1

    .line 14
    .line 15
    instance-of p4, p1, Lv/VText;

    .line 16
    .line 17
    if-eqz p4, :cond_1

    .line 18
    .line 19
    check-cast p1, Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/wwy;->f0(Lv/VText;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 p4, 0x1

    .line 26
    if-ne p3, p4, :cond_2

    .line 27
    .line 28
    instance-of p3, p1, Lv/VDraweeView;

    .line 29
    .line 30
    if-eqz p3, :cond_2

    .line 31
    .line 32
    check-cast p1, Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Ll/wwy;->e0(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public final Q(I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Lv/VText;

    .line 6
    .line 7
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    const/4 v0, -0x2

    .line 15
    sget v2, Ll/qa00;->w:I

    .line 16
    .line 17
    invoke-direct {p0, v0, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    sget p0, Ll/qa00;->h:I

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    sget p0, Ll/qa00;->i:I

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    sget p0, Ll/ibc0;->l:I

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    const-string p0, "#CC000000"

    .line 39
    .line 40
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v1}, Lv/VText;->setEmojiEnable(Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Lv/VText;->setLargeEmojiEnable(Z)V

    .line 51
    .line 52
    .line 53
    const/high16 p0, 0x41600000    # 14.0f

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x10

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 61
    .line 62
    .line 63
    return-object p1

    .line 64
    :cond_0
    new-instance p1, Lv/VDraweeView;

    .line 65
    .line 66
    iget-object v0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 67
    .line 68
    invoke-direct {p1, v0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    iget p0, p0, Ll/wwy;->e:I

    .line 72
    .line 73
    if-ne p0, v1, :cond_2

    .line 74
    .line 75
    invoke-static {}, Ll/h39;->G()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_1

    .line 80
    .line 81
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 82
    .line 83
    sget v0, Ll/qa00;->G:I

    .line 84
    .line 85
    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    return-object p1

    .line 92
    :cond_1
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 93
    .line 94
    sget v0, Ll/qa00;->J:I

    .line 95
    .line 96
    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    return-object p1

    .line 103
    :cond_2
    invoke-static {}, Ll/h39;->a()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_3

    .line 108
    .line 109
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 110
    .line 111
    sget v0, Ll/hxy;->j:I

    .line 112
    .line 113
    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    .line 118
    .line 119
    return-object p1

    .line 120
    :cond_3
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 121
    .line 122
    sget v0, Ll/hxy;->i:I

    .line 123
    .line 124
    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    .line 129
    .line 130
    return-object p1
.end method

.method public R(I)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwy;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/wwy;->c:Ljava/util/List;

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

.method public final synthetic U(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ll/clz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "other_user_id"

    .line 12
    .line 13
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "gift_url"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v1, p0, Ll/wwy;->e:I

    .line 35
    .line 36
    invoke-static {v1}, Ll/hxy;->l(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "chat_source"

    .line 41
    .line 42
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-string v0, "e_chat_icebreak_gif"

    .line 51
    .line 52
    const-string v1, "p_chat_view"

    .line 53
    .line 54
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/wwy;->d0(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic W(Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    instance-of p2, p2, Ll/yxz;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->E2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p2, "show_tag"

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p1}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "e_shortcut"

    .line 46
    .line 47
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final synthetic X()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    check-cast p0, Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tvz;->Kg()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Y(Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    instance-of p2, p2, Ll/yxz;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance v0, Ll/mwy;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/mwy;-><init>(Ll/wwy;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {p2, v1, v0}, Ll/qzz;->Q1(ZLjava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p2, "show_tag"

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    filled-new-array {p1}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string p2, "e_shortcut"

    .line 47
    .line 48
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final synthetic Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    check-cast v0, Ll/tvz;

    .line 6
    .line 7
    const-class v1, Ll/o6c0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/tvz;->uc(Ljava/lang/Class;)Ll/cbm;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/o6c0;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/o6c0;->d()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/yxz;

    .line 28
    .line 29
    const-string v1, "click_entrance"

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1}, Ll/yxz;->l5(Ljava/util/List;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic a0(Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    instance-of p2, p2, Ll/yxz;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance v0, Ll/vwy;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/vwy;-><init>(Ll/wwy;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {p2, v1, v0}, Ll/qzz;->Q1(ZLjava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p2, "show_tag"

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    filled-new-array {p1}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string p2, "e_shortcut"

    .line 47
    .line 48
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p3, p1}, Ll/clz;->S6(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "show_tag"

    .line 17
    .line 18
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string p2, "e_shortcut"

    .line 31
    .line 32
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public c0(Ljava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput p2, p0, Ll/wwy;->e:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/wwy;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/wwy;->f:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne p2, v1, :cond_2

    .line 13
    .line 14
    invoke-static {}, Ll/h39;->G()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 v2, 0x5

    .line 25
    if-le p2, v2, :cond_2

    .line 26
    .line 27
    :goto_0
    if-ge v0, v2, :cond_0

    .line 28
    .line 29
    iget-object p2, p0, Ll/wwy;->c:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 36
    .line 37
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iput-boolean v1, p0, Ll/wwy;->f:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iput-boolean v1, p0, Ll/wwy;->f:Z

    .line 50
    .line 51
    :cond_2
    iget-object p2, p0, Ll/wwy;->c:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final d0(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 9
    .line 10
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Ll/mzl;->B0()Ll/u1z;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ll/j3z;->g0()Ll/iam;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/d3z;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, ""

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Sticker;->cloneSticker()Lcom/p1/mobile/putong/data/StickerInfo;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 42
    .line 43
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 46
    .line 47
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 48
    .line 49
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/api/z$c;->Q(Lcom/p1/mobile/putong/data/StickerInfo;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v3, Ll/vo7;

    .line 54
    .line 55
    invoke-direct {v3}, Ll/vo7;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 v3, 0x1

    .line 63
    invoke-virtual {p1, v3}, Lrx/c;->take(I)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v2, Ll/twy;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Ll/twy;-><init>(Ll/wwy;)V

    .line 74
    .line 75
    .line 76
    new-instance v3, Ll/uwy;

    .line 77
    .line 78
    invoke-direct {v3}, Ll/uwy;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {p1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    iget p1, p0, Ll/wwy;->e:I

    .line 89
    .line 90
    const/4 v2, 0x4

    .line 91
    if-ne p1, v2, :cond_0

    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->N0:Ll/vxd0;

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->M0:Ll/byd0;

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_0
    const/4 v2, 0x5

    .line 121
    if-ne p1, v2, :cond_1

    .line 122
    .line 123
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->P0:Ll/vxd0;

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->O0:Ll/byd0;

    .line 137
    .line 138
    invoke-static {}, Ll/pzi0;->o()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_1
    const/16 v1, 0x9

    .line 151
    .line 152
    if-ne p1, v1, :cond_2

    .line 153
    .line 154
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->iceBreakLastMessageShowCountLimit:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 155
    .line 156
    iget-object p0, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 159
    .line 160
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 163
    .line 164
    .line 165
    :cond_2
    return-void
.end method

.method public final e0(Lv/VDraweeView;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x41200000    # 10.0f

    .line 6
    .line 7
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 19
    .line 20
    const-string v1, "shanmeng"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, p1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ll/wwy;->g0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, p1, v1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    new-instance v0, Ll/swy;

    .line 79
    .line 80
    invoke-direct {v0, p0, p2}, Ll/swy;-><init>(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final f0(Lv/VText;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    sget v1, Ll/qa00;->c:I

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "phrase"

    .line 13
    .line 14
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_6

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "exchange"

    .line 23
    .line 24
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Ll/ibc0;->u7:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-static {}, Ll/h39;->J()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget-object v2, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sget v2, Ll/ibc0;->v7:I

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Ll/ibc0;->t7:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    :goto_0
    new-instance v2, Ll/owy;

    .line 87
    .line 88
    invoke-direct {v2, p0, p1}, Ll/owy;-><init>(Ll/wwy;Lv/VText;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_2
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 96
    .line 97
    const-string v2, "prologue"

    .line 98
    .line 99
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    iget-object v1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    sget v2, Ll/ibc0;->q7:I

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    sget v2, Ll/ibc0;->p7:I

    .line 129
    .line 130
    :goto_1
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    new-instance v2, Ll/pwy;

    .line 135
    .line 136
    invoke-direct {v2, p0, p1}, Ll/pwy;-><init>(Ll/wwy;Lv/VText;)V

    .line 137
    .line 138
    .line 139
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 144
    .line 145
    const-string v2, "chatPrologue"

    .line 146
    .line 147
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_5

    .line 152
    .line 153
    iget-object v1, p0, Ll/wwy;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    sget v2, Ll/ibc0;->r7:I

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    new-instance v2, Ll/qwy;

    .line 166
    .line 167
    invoke-direct {v2, p0, p1}, Ll/qwy;-><init>(Ll/wwy;Lv/VText;)V

    .line 168
    .line 169
    .line 170
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_5
    move-object v1, v0

    .line 175
    :goto_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    if-eqz p0, :cond_7

    .line 180
    .line 181
    const/high16 p0, 0x41a00000    # 20.0f

    .line 182
    .line 183
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    const/4 v3, 0x0

    .line 192
    invoke-virtual {v1, v3, v3, v2, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, v1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 196
    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_6
    new-instance v0, Ll/rwy;

    .line 200
    .line 201
    invoke-direct {v0, p0, p2, p1}, Ll/rwy;-><init>(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;)V

    .line 202
    .line 203
    .line 204
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 205
    .line 206
    .line 207
    :cond_7
    :goto_3
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
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
    invoke-virtual {p0, p1}, Ll/wwy;->R(I)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget v0, p0, Ll/wwy;->e:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/wwy;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ne p1, p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0
.end method
