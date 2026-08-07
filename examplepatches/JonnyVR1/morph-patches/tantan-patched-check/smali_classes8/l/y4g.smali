.class public Ll/y4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/r4g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VText;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public j:Ll/r4g;

.field public k:Lcom/p1/mobile/putong/data/User;

.field public final l:Ll/t4m;

.field public m:Landroid/text/style/ClickableSpan;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/y4g$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/y4g$a;-><init>(Ll/y4g;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/y4g;->l:Ll/t4m;

    .line 10
    .line 11
    new-instance v0, Ll/y4g$b;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/y4g$b;-><init>(Ll/y4g;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/y4g;->m:Landroid/text/style/ClickableSpan;

    .line 17
    .line 18
    iput-object p1, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/y4g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y4g;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/y4g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y4g;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/y4g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y4g;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/y4g;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/y4g;->u(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Ll/y4g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y4g;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/y4g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y4g;->w(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/y4g;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/y4g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y4g;->z()V

    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y4g;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "e_confirm_upload_done"

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x6

    .line 4
    if-ge v0, v2, :cond_2

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget-object v3, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    if-ge v0, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 37
    .line 38
    .line 39
    :goto_1
    iget-object v1, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 46
    .line 47
    new-instance v2, Ll/v4g;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/v4g;-><init>(Ll/y4g;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-ne v0, v1, :cond_1

    .line 60
    .line 61
    iget-object v1, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 70
    .line 71
    .line 72
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-ge p1, v2, :cond_3

    .line 80
    .line 81
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 82
    .line 83
    invoke-virtual {p0, p1, v1, v0}, Ll/y4g;->G(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public final B()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->kr:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/core/R$string;->P1:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    invoke-direct {v2, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 30
    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    const/16 v6, 0x21

    .line 34
    .line 35
    invoke-virtual {v2, v3, v5, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 36
    .line 37
    .line 38
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 39
    .line 40
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-virtual {v7}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    sget v8, Ll/c9c0;->Q0:I

    .line 49
    .line 50
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    invoke-direct {v5, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    invoke-virtual {v2, v5, v1, v7, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    invoke-virtual {v2, v3, v1, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Ll/y4g;->m:Landroid/text/style/ClickableSpan;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {v2, v3, v1, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/y4g;->e:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/y4g;->e:Lv/VText;

    .line 86
    .line 87
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/y4g;->e:Lv/VText;

    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    invoke-virtual {p0, v0, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public C()V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bl:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Zq:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Yq:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/t4g;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/t4g;-><init>(Ll/y4g;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xq:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/u4g;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/u4g;-><init>(Ll/y4g;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-lez p1, :cond_0

    .line 3
    .line 4
    new-instance p1, Ll/th0$a;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p1, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bl:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Dl:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget v0, Lcom/p1/mobile/putong/core/R$string;->T:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/s4g;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/s4g;-><init>(Ll/y4g;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_0
    return v0
.end method

.method public F()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance v0, Ljava/lang/NullPointerException;

    .line 25
    .line 26
    const-string v2, "The first pic cannot be empty\uff01"

    .line 27
    .line 28
    invoke-direct {v0, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    move v2, v1

    .line 40
    :goto_0
    const/4 v3, 0x6

    .line 41
    if-ge v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 44
    .line 45
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-nez v4, :cond_2

    .line 56
    .line 57
    iget-object v3, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 58
    .line 59
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object v3, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 71
    .line 72
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 81
    .line 82
    const-string v4, "normal"

    .line 83
    .line 84
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-nez v3, :cond_1

    .line 89
    .line 90
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-gt v0, v3, :cond_3

    .line 100
    .line 101
    const/4 v1, 0x0

    .line 102
    iget-object v3, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 103
    .line 104
    invoke-virtual {p0, v0, v1, v3}, Ll/y4g;->G(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    return v2

    .line 108
    :cond_4
    return v1
.end method

.method public final G(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;)V
    .locals 2

    .line 1
    const/4 p0, 0x6

    .line 2
    const/4 v0, 0x5

    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    if-ge p1, v0, :cond_1

    .line 26
    .line 27
    add-int/lit8 p0, p1, 0x1

    .line 28
    .line 29
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    if-lez p1, :cond_2

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->S1(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/r4g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y4g;->m(Ll/r4g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y4g;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z4g;->b(Ll/y4g;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/y4g;->F()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/y4g;->E(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    move v2, v0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    const/4 v4, 0x6

    .line 17
    if-ge v2, v4, :cond_3

    .line 18
    .line 19
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    :cond_1
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 34
    .line 35
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K0()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/y4g;->C()V

    .line 48
    .line 49
    .line 50
    return v1

    .line 51
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v2, p0, Ll/y4g;->k:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-le v2, v3, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/y4g;->C()V

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_4
    return v0
.end method

.method public m(Ll/r4g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y4g;->j:Ll/r4g;

    .line 2
    .line 3
    return-void
.end method

.method public n()V
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    const/4 v4, 0x6

    .line 14
    if-ge v2, v4, :cond_2

    .line 15
    .line 16
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 17
    .line 18
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 23
    .line 24
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_2

    .line 29
    .line 30
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 31
    .line 32
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 37
    .line 38
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 39
    .line 40
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 41
    .line 42
    const-string v5, "normal"

    .line 43
    .line 44
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_0

    .line 49
    .line 50
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 51
    .line 52
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 57
    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v4, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 64
    .line 65
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 70
    .line 71
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->K0()Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_1

    .line 76
    .line 77
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 83
    .line 84
    iget-object p0, p0, Ll/y4g;->j:Ll/r4g;

    .line 85
    .line 86
    invoke-virtual {p0, v0, v3}, Ll/r4g;->n0(Lcom/p1/mobile/putong/data/User;I)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    new-instance v0, Ll/tr90;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, v2}, Ll/tr90;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/y4g;->l:Ll/t4m;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/tr90;->z(Ll/t4m;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/y4g;->d:Lv/VLinear;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/tr90;->u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/y4g;->h:Landroid/util/Pair;

    .line 24
    .line 25
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 28
    .line 29
    iput-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    const-string v1, "p_upload_photos"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    :goto_0
    const/4 v1, 0x6

    .line 43
    if-ge v0, v1, :cond_1

    .line 44
    .line 45
    invoke-static {}, Ll/gra;->A2()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iget-object v1, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 58
    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->DIALOG:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCardDataType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object v1, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 73
    .line 74
    .line 75
    add-int/lit8 v0, v0, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/y4g;->k:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, p0, Ll/y4g;->c:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/y4g;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    new-instance v1, Ll/w4g;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/w4g;-><init>(Ll/y4g;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/y4g;->f:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ll/x4g;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/x4g;-><init>(Ll/y4g;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/y4g;->p()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/y4g;->B()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y4g;->F()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y4g;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y4g;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y4g;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 30
    .line 31
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/y4g;->F()I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final z()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/y4g;->i:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method
