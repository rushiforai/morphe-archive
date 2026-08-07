.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/AutoVDraweeView;

.field public d:Lv/VImage;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/FrameLayout;

.field public o:I

.field public p:Ll/t3m;

.field public q:Lcom/p1/mobile/putong/core/data/Literatures;

.field public r:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

.field public s:Ll/q320;

.field public t:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 16
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->o:I

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    invoke-static {p1, p1, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->t:Ll/bkj0;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;ZLjava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->f(ZLjava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/util/List;)V

    return-void
.end method

.method public static d(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_2

    .line 21
    .line 22
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/lit8 v2, v2, -0x1

    .line 36
    .line 37
    if-eq v1, v2, :cond_1

    .line 38
    .line 39
    const-string v2, "/"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fza0;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p3, p1, p2}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->g(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->t:Ll/bkj0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 p3, 0x1

    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h:Lv/VText;

    .line 25
    .line 26
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h:Lv/VText;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->t:Ll/bkj0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p0, Ljava/lang/CharSequence;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h:Lv/VText;

    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->setWatchType(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h:Lv/VText;

    .line 69
    .line 70
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic f(ZLjava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "[profile progress]"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j(ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "add myrecent from list"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    const-string p1, "delete"

    .line 28
    .line 29
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j(ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->r:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->s:Ll/q320;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ll/q320;->I(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j(ZLjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    const-string p0, "delete myrecent from list"

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method public g(Ll/t3m;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;ILl/q320;ZLjava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t3m;",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            "I",
            "Ll/q320;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p7

    .line 5
    if-nez p7, :cond_0

    .line 6
    .line 7
    goto/16 :goto_6

    .line 8
    .line 9
    :cond_0
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->o:I

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->s:Ll/q320;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->q:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->r:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 18
    .line 19
    invoke-interface {p1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p7

    .line 23
    invoke-static {p7}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    iget-object p7, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->c:Lv/AutoVDraweeView;

    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p7, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p7, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p7}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->setTypeIcon(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p7, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p7

    .line 51
    if-eqz p7, :cond_1

    .line 52
    .line 53
    iget-object p7, p3, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, p7}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->setWatchType(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p7, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j:Lv/VText;

    .line 59
    .line 60
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p7, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->k:Lv/VText;

    .line 66
    .line 67
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 68
    .line 69
    const-string v1, "book"

    .line 70
    .line 71
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->authors:Ljava/util/List;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->kinds:Ljava/util/List;

    .line 81
    .line 82
    :goto_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d(Ljava/util/List;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object p7, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->n:Landroid/widget/FrameLayout;

    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    const/4 v1, 0x1

    .line 93
    if-eqz p6, :cond_3

    .line 94
    .line 95
    invoke-virtual {p5}, Ll/q320;->C()I

    .line 96
    .line 97
    .line 98
    move-result p5

    .line 99
    sub-int/2addr p5, v1

    .line 100
    if-ne p4, p5, :cond_3

    .line 101
    .line 102
    move p4, v1

    .line 103
    goto :goto_1

    .line 104
    :cond_3
    move p4, v0

    .line 105
    :goto_1
    invoke-static {p7, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d:Lv/VImage;

    .line 109
    .line 110
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 111
    .line 112
    .line 113
    move-result p5

    .line 114
    if-eqz p5, :cond_4

    .line 115
    .line 116
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p5

    .line 120
    if-nez p5, :cond_4

    .line 121
    .line 122
    move p5, v1

    .line 123
    goto :goto_2

    .line 124
    :cond_4
    move p5, v0

    .line 125
    :goto_2
    invoke-static {p4, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->n:Landroid/widget/FrameLayout;

    .line 129
    .line 130
    invoke-static {p4, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 137
    .line 138
    .line 139
    move-result p4

    .line 140
    if-eqz p4, :cond_6

    .line 141
    .line 142
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {p4}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object p4

    .line 148
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 149
    .line 150
    .line 151
    move-result p5

    .line 152
    if-nez p5, :cond_5

    .line 153
    .line 154
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p4

    .line 158
    check-cast p4, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 159
    .line 160
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {p0, v1, p4}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j(ZLjava/lang/String;)V

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_5
    const-string p4, ""

    .line 167
    .line 168
    invoke-virtual {p0, v0, p4}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->j(ZLjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_6
    :goto_3
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 172
    .line 173
    .line 174
    move-result p4

    .line 175
    if-nez p4, :cond_7

    .line 176
    .line 177
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 178
    .line 179
    .line 180
    move-result p4

    .line 181
    if-nez p4, :cond_7

    .line 182
    .line 183
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h(Ll/t3m;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 184
    .line 185
    .line 186
    :cond_7
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 187
    .line 188
    .line 189
    move-result p4

    .line 190
    const-string p5, "tv_show"

    .line 191
    .line 192
    const-string p6, "teleplay"

    .line 193
    .line 194
    const-string p7, "artwork_type"

    .line 195
    .line 196
    const-string v0, "artwork_title"

    .line 197
    .line 198
    if-nez p4, :cond_9

    .line 199
    .line 200
    new-instance p1, Ll/pf60;

    .line 201
    .line 202
    const-string p3, "is_artwork_interactive"

    .line 203
    .line 204
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 205
    .line 206
    invoke-direct {p1, p3, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    new-instance p3, Ll/pf60;

    .line 210
    .line 211
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 212
    .line 213
    invoke-direct {p3, v0, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    new-instance p4, Ll/pf60;

    .line 217
    .line 218
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {v0, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p6

    .line 224
    if-eqz p6, :cond_8

    .line 225
    .line 226
    goto :goto_4

    .line 227
    :cond_8
    iget-object p5, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 228
    .line 229
    :goto_4
    invoke-direct {p4, p7, p5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    new-instance p2, Ll/pf60;

    .line 233
    .line 234
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->t:Ll/bkj0;

    .line 235
    .line 236
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 237
    .line 238
    check-cast p0, Ljava/lang/String;

    .line 239
    .line 240
    const-string p5, "artwork_status"

    .line 241
    .line 242
    invoke-direct {p2, p5, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    filled-new-array {p1, p3, p4, p2}, [Ll/pf60;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    const-string p1, "e_profile_artwork_info"

    .line 250
    .line 251
    const-string p2, "p_suggest_user_profile_info_view"

    .line 252
    .line 253
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_9
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-eqz p0, :cond_b

    .line 262
    .line 263
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-nez p0, :cond_b

    .line 268
    .line 269
    new-instance p0, Ll/pf60;

    .line 270
    .line 271
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 272
    .line 273
    invoke-direct {p0, p7, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    new-instance p1, Ll/pf60;

    .line 277
    .line 278
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 279
    .line 280
    invoke-static {p3, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 281
    .line 282
    .line 283
    move-result p3

    .line 284
    if-eqz p3, :cond_a

    .line 285
    .line 286
    goto :goto_5

    .line 287
    :cond_a
    iget-object p5, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 288
    .line 289
    :goto_5
    invoke-direct {p1, v0, p5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    const-string p1, "e_artwork_guess_you_like"

    .line 297
    .line 298
    const-string p2, "p_edit_profile_view"

    .line 299
    .line 300
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 301
    .line 302
    .line 303
    :cond_b
    :goto_6
    return-void
.end method

.method public final h(Ll/t3m;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/eza0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2, p3}, Ll/eza0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public i(Ll/t3m;ZLcom/p1/mobile/putong/core/data/Literatures;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ll/dza0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p2}, Ll/dza0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0, p3, v1}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final j(ZLjava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d:Lv/VImage;

    .line 11
    .line 12
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->setWatchType(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d:Lv/VImage;

    .line 23
    .line 24
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->n:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-ne p1, v0, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 20
    .line 21
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->s:Ll/q320;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/q320;->H()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->p3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->q3()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 45
    .line 46
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 51
    .line 52
    invoke-interface {v1}, Ll/t3m;->from()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "0"

    .line 57
    .line 58
    filled-new-array {v0, v2, v1}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 67
    .line 68
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 75
    .line 76
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v1, ""

    .line 81
    .line 82
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    if-ne p1, p0, :cond_4

    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 93
    .line 94
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    new-instance p1, Ll/pf60;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->q:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 105
    .line 106
    const-string v1, "artwork_type"

    .line 107
    .line 108
    invoke-direct {p1, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/pf60;

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->q:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 116
    .line 117
    const-string v2, "teleplay"

    .line 118
    .line 119
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_3

    .line 124
    .line 125
    const-string v1, "tv_show"

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->q:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 131
    .line 132
    :goto_1
    const-string v2, "artwork_title"

    .line 133
    .line 134
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v0, "e_artwork_guess_you_like"

    .line 142
    .line 143
    const-string v1, "p_edit_profile_view"

    .line 144
    .line 145
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->p:Ll/t3m;

    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d:Lv/VImage;

    .line 151
    .line 152
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->q:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 157
    .line 158
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->i(Ll/t3m;ZLcom/p1/mobile/putong/core/data/Literatures;)V

    .line 159
    .line 160
    .line 161
    :cond_4
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->d:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->h:Lv/VText;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setTypeIcon(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "movie"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x2

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "book"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "teleplay"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x0

    .line 45
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    goto :goto_1

    .line 50
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget v0, Ll/dbc0;->xn:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_1

    .line 61
    :pswitch_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget v0, Ll/dbc0;->wn:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    goto :goto_1

    .line 72
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget v0, Ll/dbc0;->yn:I

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->i:Lv/VImage;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    nop

    .line 89
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setWatchType(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "watched"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x2

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "watching"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "to_watch"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x0

    .line 45
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    move-object v0, p1

    .line 50
    goto :goto_1

    .line 51
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget v0, Ll/dbc0;->On:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "\u770b\u8fc7"

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :pswitch_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget v0, Ll/dbc0;->Pn:I

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, "\u5728\u770b"

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v0, Ll/dbc0;->Nn:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "\u60f3\u770b"

    .line 88
    .line 89
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->f:Lv/VImage;

    .line 90
    .line 91
    invoke-virtual {v1, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->g:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    nop

    .line 101
    :sswitch_data_0
    .sparse-switch
        -0x554cd1f5 -> :sswitch_2
        0x207e6cb3 -> :sswitch_1
        0x431cd9ae -> :sswitch_0
    .end sparse-switch

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
