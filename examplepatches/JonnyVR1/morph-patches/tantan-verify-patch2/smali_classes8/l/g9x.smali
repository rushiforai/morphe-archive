.class public Ll/g9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qyl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qyl<",
        "Ll/v8x;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

.field public c:Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;

.field public d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

.field public e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;

.field public j:Lv/VText;

.field public k:Landroid/widget/EditText;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/FrameLayout;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lv/VImage;

.field public q:Lv/VImage;

.field public r:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

.field public s:Ll/v8x;

.field public t:Ll/f0r;

.field public u:Z

.field public v:Ll/zgx;

.field public w:I

.field public x:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/g9x;->u:Z

    .line 6
    .line 7
    iput v0, p0, Ll/g9x;->w:I

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/g9x;->x:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/g9x;->r:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 12
    .line 13
    return-void
.end method

.method private J(Lv/VText;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/e9x;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/e9x;-><init>(Ll/g9x;Lv/VText;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/g9x;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9x;->B([I)V

    return-void
.end method

.method public static synthetic b(Ll/g9x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9x;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/g9x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9x;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_matched_text_box"

    .line 2
    .line 3
    const-string v0, "p_successful_match_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/g9x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g9x;->C()V

    return-void
.end method

.method public static synthetic f(Ll/g9x;I[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9x;->x(I[I)V

    return-void
.end method

.method public static synthetic i(Ll/g9x;Lv/VText;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9x;->E(Lv/VText;I)V

    return-void
.end method

.method public static synthetic j(Ll/g9x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g9x;->A()V

    return-void
.end method

.method public static bridge synthetic k(Ll/g9x;)Ll/v8x;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9x;->s:Ll/v8x;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/g9x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g9x;->G()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9x;->t:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B([I)V
    .locals 1

    .line 1
    new-instance p1, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/g9x;->g:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 9
    .line 10
    .line 11
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/g9x;->q(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic C()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9x;->r:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(Lv/VText;I)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p2, "%s"

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    add-int/2addr p2, v1

    .line 40
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    add-int/lit8 p2, v0, -0x3

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr p2, v1

    .line 55
    const-string v1, "..."

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    if-gez p2, :cond_2

    .line 59
    .line 60
    new-instance p2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    add-int/lit8 v0, v0, -0x1

    .line 74
    .line 75
    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    :goto_1
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9x;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final G()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g9x;->s:Ll/v8x;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v8x;->S0()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/v8x$b;

    .line 18
    .line 19
    iget v1, v1, Ll/v8x$b;->b:I

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    if-le v2, v3, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/v8x$b;

    .line 48
    .line 49
    iget v0, v0, Ll/v8x$b;->b:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const v0, -0x232324

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object v2, p0, Ll/g9x;->v:Ll/zgx;

    .line 56
    .line 57
    invoke-virtual {v2, v1, v0}, Ll/zgx;->d(II)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/g9x;->c:Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;

    .line 61
    .line 62
    iget-object p0, p0, Ll/g9x;->v:Ll/zgx;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/zgx;->c()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->setRenderColor(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/g9x;->g:Lv/VText;

    .line 6
    .line 7
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R1:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p2, :cond_5

    .line 14
    .line 15
    const/16 v0, 0xc

    .line 16
    .line 17
    if-eq p2, v0, :cond_5

    .line 18
    .line 19
    const/16 v0, 0xb

    .line 20
    .line 21
    if-eq p2, v0, :cond_5

    .line 22
    .line 23
    const/16 v0, 0xd

    .line 24
    .line 25
    if-eq p2, v0, :cond_5

    .line 26
    .line 27
    const/16 v0, 0x27

    .line 28
    .line 29
    if-eq p2, v0, :cond_5

    .line 30
    .line 31
    const/16 v0, 0x25

    .line 32
    .line 33
    if-eq p2, v0, :cond_5

    .line 34
    .line 35
    const/16 v0, 0x26

    .line 36
    .line 37
    if-eq p2, v0, :cond_5

    .line 38
    .line 39
    const/16 v0, 0xa

    .line 40
    .line 41
    if-eq p2, v0, :cond_5

    .line 42
    .line 43
    const/16 v0, 0x23

    .line 44
    .line 45
    if-eq p2, v0, :cond_5

    .line 46
    .line 47
    const/16 v0, 0x24

    .line 48
    .line 49
    if-ne p2, v0, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const/4 v0, 0x1

    .line 53
    if-ne p2, v0, :cond_3

    .line 54
    .line 55
    iget-object p2, p0, Ll/g9x;->g:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Qm:I

    .line 62
    .line 63
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-lez v2, :cond_2

    .line 68
    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, " ("

    .line 80
    .line 81
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p1, ")"

    .line 95
    .line 96
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 105
    .line 106
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/g9x;->g:Lv/VText;

    .line 118
    .line 119
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Qm:I

    .line 120
    .line 121
    invoke-direct {p0, p1, p2}, Ll/g9x;->J(Lv/VText;I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_3
    const/16 p3, 0x1a

    .line 126
    .line 127
    if-ne p2, p3, :cond_4

    .line 128
    .line 129
    iget-object p2, p0, Ll/g9x;->g:Lv/VText;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 138
    .line 139
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p3, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Ll/g9x;->g:Lv/VText;

    .line 151
    .line 152
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 153
    .line 154
    invoke-direct {p0, p1, p2}, Ll/g9x;->J(Lv/VText;I)V

    .line 155
    .line 156
    .line 157
    :cond_4
    return-void

    .line 158
    :cond_5
    :goto_1
    iget-object p2, p0, Ll/g9x;->g:Lv/VText;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 167
    .line 168
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p3, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ll/g9x;->g:Lv/VText;

    .line 180
    .line 181
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 182
    .line 183
    invoke-direct {p0, p1, p2}, Ll/g9x;->J(Lv/VText;I)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public I(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g9x;->s:Ll/v8x;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v8x;->S0()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/v8x$b;

    .line 12
    .line 13
    iget v1, v1, Ll/v8x$b;->b:I

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    if-le v2, p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/v8x$b;

    .line 28
    .line 29
    iget p1, p1, Ll/v8x$b;->b:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const p1, -0x232324

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object v0, p0, Ll/g9x;->v:Ll/zgx;

    .line 36
    .line 37
    invoke-virtual {v0, p2, v1, p1}, Ll/zgx;->e(III)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/g9x;->c:Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;

    .line 41
    .line 42
    iget-object p0, p0, Ll/g9x;->v:Ll/zgx;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/zgx;->c()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->setRenderColor(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public K(I)V
    .locals 11

    .line 1
    const/16 v0, 0xc8

    .line 2
    .line 3
    const/high16 v1, 0x43480000    # 200.0f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/high16 v3, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/high16 v4, 0x41800000    # 16.0f

    .line 9
    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    div-float/2addr p1, v1

    .line 14
    move v0, v2

    .line 15
    move v5, v0

    .line 16
    move v1, v3

    .line 17
    goto :goto_3

    .line 18
    :cond_0
    int-to-float v0, p1

    .line 19
    sub-float v1, v0, v1

    .line 20
    .line 21
    const/high16 v5, 0x43fa0000    # 500.0f

    .line 22
    .line 23
    div-float v6, v1, v5

    .line 24
    .line 25
    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    const v8, 0x3ecccccd    # 0.4f

    .line 30
    .line 31
    .line 32
    mul-float/2addr v1, v8

    .line 33
    div-float/2addr v1, v5

    .line 34
    invoke-static {v8, v1}, Ljava/lang/Math;->min(FF)F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    sub-float v1, v3, v1

    .line 39
    .line 40
    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    const/16 v8, 0x1c2

    .line 45
    .line 46
    const/16 v9, 0x2bc

    .line 47
    .line 48
    if-ge p1, v9, :cond_1

    .line 49
    .line 50
    const/high16 v9, 0x41700000    # 15.0f

    .line 51
    .line 52
    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    mul-float/2addr v6, v9

    .line 57
    sub-float/2addr v4, v6

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    add-int/lit16 v4, p1, -0x2bc

    .line 60
    .line 61
    const/high16 v6, 0x43610000    # 225.0f

    .line 62
    .line 63
    const/16 v9, 0xe1

    .line 64
    .line 65
    const v10, 0x3e19999a    # 0.15f

    .line 66
    .line 67
    .line 68
    if-ge v4, v9, :cond_2

    .line 69
    .line 70
    :goto_0
    int-to-float v4, v4

    .line 71
    mul-float/2addr v4, v10

    .line 72
    div-float/2addr v4, v6

    .line 73
    sub-float v4, v3, v4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    rsub-int v4, v4, 0x1c2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :goto_1
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    :goto_2
    if-le p1, v8, :cond_3

    .line 84
    .line 85
    const/high16 p1, 0x43e10000    # 450.0f

    .line 86
    .line 87
    sub-float/2addr v0, p1

    .line 88
    const/high16 p1, 0x437a0000    # 250.0f

    .line 89
    .line 90
    div-float/2addr v0, p1

    .line 91
    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    :cond_3
    move v0, v2

    .line 96
    move p1, v3

    .line 97
    move v2, v7

    .line 98
    :goto_3
    iget-object v6, p0, Ll/g9x;->q:Lv/VImage;

    .line 99
    .line 100
    invoke-virtual {v6, v2}, Landroid/view/View;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Ll/g9x;->p:Lv/VImage;

    .line 104
    .line 105
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/g9x;->p:Lv/VImage;

    .line 109
    .line 110
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleY(F)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/g9x;->p:Lv/VImage;

    .line 114
    .line 115
    invoke-virtual {v1, v5}, Landroid/view/View;->setScaleX(F)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/g9x;->q:Lv/VImage;

    .line 119
    .line 120
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleY(F)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/g9x;->q:Lv/VImage;

    .line 124
    .line 125
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/g9x;->f:Landroid/widget/LinearLayout;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/g9x;->c:Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;

    .line 139
    .line 140
    const/high16 v1, 0x40400000    # 3.0f

    .line 141
    .line 142
    mul-float/2addr v1, p1

    .line 143
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ll/g9x;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

    .line 151
    .line 152
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final L(ZI)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x42b40000    # 90.0f

    .line 6
    .line 7
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    sub-int/2addr p2, p1

    .line 12
    neg-int p1, p2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    iget-object p0, p0, Ll/g9x;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    int-to-float p1, p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-wide/16 p1, 0xb4

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Ll/g9x;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Ll/g9x;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object p0, p0, Ll/g9x;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 8

    .line 1
    new-instance v6, Landroid/view/animation/AnticipateInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/g9x;->a:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    const/4 p0, 0x2

    .line 9
    new-array v7, p0, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    const-string v1, "alpha"

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    const-wide/16 v4, 0x15e

    .line 19
    .line 20
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public h(II)V
    .locals 4

    .line 1
    iget p2, p0, Ll/g9x;->w:I

    .line 2
    .line 3
    sub-int v0, p1, p2

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-gtz v0, :cond_2

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sub-int p2, p1, p2

    .line 14
    .line 15
    if-gez p2, :cond_4

    .line 16
    .line 17
    iget-boolean p2, p0, Ll/g9x;->x:Z

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    iget-object p2, p0, Ll/g9x;->n:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/g9x;->h:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v2, p1}, Ll/g9x;->L(ZI)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iput-boolean v2, p0, Ll/g9x;->x:Z

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    :goto_0
    iget-boolean p2, p0, Ll/g9x;->x:Z

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    if-nez p2, :cond_3

    .line 41
    .line 42
    iget-object p2, p0, Ll/g9x;->n:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/g9x;->h:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/g9x;->n:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const/high16 v1, 0x42b40000    # 90.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    sub-int v1, p1, v1

    .line 65
    .line 66
    iput v1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    iget-object v1, p0, Ll/g9x;->n:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-virtual {v1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0, p1}, Ll/g9x;->L(ZI)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/g9x;->v()V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 80
    .line 81
    invoke-virtual {p2}, Landroid/view/View;->requestFocus()Z

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object p2, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 85
    .line 86
    new-instance v1, Ll/y8x;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/y8x;-><init>(Ll/g9x;)V

    .line 89
    .line 90
    .line 91
    const-wide/16 v2, 0xb4

    .line 92
    .line 93
    invoke-virtual {p2, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 94
    .line 95
    .line 96
    iput-boolean v0, p0, Ll/g9x;->x:Z

    .line 97
    .line 98
    :cond_4
    :goto_1
    iput p1, p0, Ll/g9x;->w:I

    .line 99
    .line 100
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v8x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g9x;->p(Ll/v8x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9x;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initAnimationState()V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h9x;->b(Ll/g9x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9x;->r:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ll/v8x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9x;->s:Ll/v8x;

    .line 2
    .line 3
    return-void
.end method

.method public final q(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g9x;->o:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/f9x;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/f9x;-><init>(Ll/g9x;I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g9x;->c:Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;

    .line 2
    .line 3
    new-instance v1, Ll/g9x$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g9x$c;-><init>(Ll/g9x;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public v()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/g9x;->u:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/g9x;->u:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/g9x;->o:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-wide/16 v0, 0xb4

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/data/User;Ll/cf60;ILjava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/cf60;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Ll/zgx;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/zgx;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/g9x;->v:Ll/zgx;

    .line 17
    .line 18
    iget-object v0, p0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 19
    .line 20
    invoke-static {}, Ll/bnl0;->F0()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/cf60;->getCount()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/cf60;->getCount()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x1

    .line 43
    const/4 v3, 0x0

    .line 44
    if-le v1, v2, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move v2, v3

    .line 48
    :goto_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 52
    .line 53
    invoke-virtual {v0, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 57
    .line 58
    new-instance v0, Ll/g9x$a;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/g9x$a;-><init>(Ll/g9x;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Ll/g9x;->m:Landroid/widget/TextView;

    .line 67
    .line 68
    new-instance v0, Ll/z8x;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/z8x;-><init>(Ll/g9x;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Ll/g9x;->l:Landroid/widget/TextView;

    .line 77
    .line 78
    new-instance v0, Ll/a9x;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/a9x;-><init>(Ll/g9x;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 87
    .line 88
    new-instance v0, Ll/b9x;

    .line 89
    .line 90
    invoke-direct {v0}, Ll/b9x;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 97
    .line 98
    new-instance v0, Ll/g9x$b;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/g9x$b;-><init>(Ll/g9x;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/g9x;->l:Landroid/widget/TextView;

    .line 107
    .line 108
    const/high16 v0, 0x3f000000    # 0.5f

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 111
    .line 112
    .line 113
    iget-object p2, p0, Ll/g9x;->l:Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-virtual {p2, v3}, Landroid/view/View;->setClickable(Z)V

    .line 116
    .line 117
    .line 118
    new-instance p2, Landroid/animation/LayoutTransition;

    .line 119
    .line 120
    invoke-direct {p2}, Landroid/animation/LayoutTransition;-><init>()V

    .line 121
    .line 122
    .line 123
    const-wide/16 v0, 0xb4

    .line 124
    .line 125
    invoke-virtual {p2, v0, v1}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/g9x;->f:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Ll/g9x;->t:Ll/f0r;

    .line 134
    .line 135
    if-nez p2, :cond_2

    .line 136
    .line 137
    new-instance p2, Ll/f0r;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-direct {p2, v0}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 144
    .line 145
    .line 146
    iput-object p2, p0, Ll/g9x;->t:Ll/f0r;

    .line 147
    .line 148
    :cond_2
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    new-instance v0, Ll/c9x;

    .line 161
    .line 162
    invoke-direct {v0, p0}, Ll/c9x;-><init>(Ll/g9x;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0, p1, p3, p4}, Ll/g9x;->H(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    if-eqz p2, :cond_3

    .line 178
    .line 179
    iget-object p1, p0, Ll/g9x;->i:Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;

    .line 180
    .line 181
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_3
    iget-object p2, p0, Ll/g9x;->j:Lv/VText;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {p1}, Ll/phk0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    :goto_1
    iget-object p1, p0, Ll/g9x;->g:Lv/VText;

    .line 197
    .line 198
    new-instance p2, Ll/d9x;

    .line 199
    .line 200
    invoke-direct {p2, p0}, Ll/d9x;-><init>(Ll/g9x;)V

    .line 201
    .line 202
    .line 203
    invoke-static {p1, p2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public final synthetic x(I[I)V
    .locals 1

    .line 1
    new-instance p2, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/g9x;->o:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 9
    .line 10
    .line 11
    const/high16 v0, 0x41a00000    # 20.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int/2addr p1, v0

    .line 18
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    sub-int/2addr p1, p2

    .line 21
    iget-object p0, p0, Ll/g9x;->h:Landroid/view/View;

    .line 22
    .line 23
    const/high16 p2, 0x42c80000    # 100.0f

    .line 24
    .line 25
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    add-int/2addr p2, p1

    .line 30
    invoke-static {p0, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/g9x;->s:Ll/v8x;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/k8x;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "match_source"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "e_matched_later"

    .line 32
    .line 33
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/g9x;->s:Ll/v8x;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/v8x;->e1()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/g9x;->k:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/g9x;->s:Ll/v8x;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/g9x;->x:Z

    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Ll/v8x;->k1(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
