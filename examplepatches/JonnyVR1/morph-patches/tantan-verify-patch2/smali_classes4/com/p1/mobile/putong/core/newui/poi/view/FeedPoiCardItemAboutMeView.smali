.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public e:Ljava/lang/String;

.field public f:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->r:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->r:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->r:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iph;->a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(ILjava/lang/String;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->Oa:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/adc0;->je:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VText;

    .line 23
    .line 24
    sget v3, Ll/dbc0;->cn:I

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-virtual {p0, v4, v4, p1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    :catch_0
    sget p0, Ll/qa00;->e:I

    .line 53
    .line 54
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 58
    .line 59
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 63
    .line 64
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 65
    .line 66
    .line 67
    const/16 p0, 0x11

    .line 68
    .line 69
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 77
    .line 78
    .line 79
    const/high16 p0, 0x41100000    # 9.0f

    .line 80
    .line 81
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    const/high16 p1, 0x41200000    # 10.0f

    .line 86
    .line 87
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    const/high16 v3, 0x41500000    # 13.0f

    .line 92
    .line 93
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-virtual {v1, p0, v2, v3, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 102
    .line 103
    .line 104
    const/high16 p0, 0x41600000    # 14.0f

    .line 105
    .line 106
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 107
    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget p1, Ll/c9c0;->n:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    return-object v0
.end method

.method public final d(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->f:Ll/pf60;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->g:Ll/pf60;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->h:Ll/pf60;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->i:Ll/pf60;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->j:Ll/pf60;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->k:Ll/pf60;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v5}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public final e(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    sget v1, Lcom/p1/mobile/putong/core/R$string;->tl:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_0
    sget v0, Ll/dbc0;->W8:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->f:Ll/pf60;

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 40
    .line 41
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    sget v0, Ll/dbc0;->Q8:I

    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->g:Ll/pf60;

    .line 62
    .line 63
    :cond_1
    sget v0, Ll/dbc0;->Y8:I

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->h:Ll/pf60;

    .line 80
    .line 81
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->b(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_2

    .line 92
    .line 93
    sget v1, Ll/dbc0;->T8:I

    .line 94
    .line 95
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 100
    .line 101
    sget v3, Lcom/p1/mobile/putong/core/R$string;->jl:I

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->i:Ll/pf60;

    .line 120
    .line 121
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_3

    .line 130
    .line 131
    sget v0, Ll/dbc0;->R8:I

    .line 132
    .line 133
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 138
    .line 139
    sget v2, Lcom/p1/mobile/putong/core/R$string;->pl:I

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 146
    .line 147
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 148
    .line 149
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->j:Ll/pf60;

    .line 162
    .line 163
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 164
    .line 165
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 166
    .line 167
    invoke-static {v0}, Ll/q8g0;->m0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->k:Ll/pf60;

    .line 172
    .line 173
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 180
    .line 181
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    const/4 v2, 0x0

    .line 186
    const/4 v3, 0x0

    .line 187
    if-nez v1, :cond_4

    .line 188
    .line 189
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {v0}, Ll/baj;->W(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    goto :goto_0

    .line 200
    :cond_4
    move-object v0, v3

    .line 201
    :goto_0
    sget v1, Ll/dbc0;->X8:I

    .line 202
    .line 203
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->l:Ll/pf60;

    .line 212
    .line 213
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 214
    .line 215
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 216
    .line 217
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 220
    .line 221
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_5

    .line 226
    .line 227
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-nez v1, :cond_5

    .line 238
    .line 239
    new-instance v1, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v0, "cm"

    .line 248
    .line 249
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    goto :goto_1

    .line 257
    :cond_5
    move-object v0, v3

    .line 258
    :goto_1
    sget v1, Ll/dbc0;->S8:I

    .line 259
    .line 260
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->m:Ll/pf60;

    .line 269
    .line 270
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 271
    .line 272
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 273
    .line 274
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 279
    .line 280
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 281
    .line 282
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 283
    .line 284
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    if-eqz v1, :cond_6

    .line 289
    .line 290
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 291
    .line 292
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 293
    .line 294
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 295
    .line 296
    iget-object v4, v1, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 297
    .line 298
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_6
    move-object v1, v3

    .line 302
    move-object v4, v1

    .line 303
    :goto_2
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 304
    .line 305
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 306
    .line 307
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 308
    .line 309
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v5

    .line 313
    if-eqz v5, :cond_8

    .line 314
    .line 315
    iget-object v5, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 316
    .line 317
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 318
    .line 319
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 320
    .line 321
    iget-object v6, v5, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 322
    .line 323
    iget-object v5, v5, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 324
    .line 325
    invoke-static {v6, v5}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v5

    .line 329
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result v5

    .line 333
    if-eqz v5, :cond_7

    .line 334
    .line 335
    goto :goto_3

    .line 336
    :cond_7
    move v5, v2

    .line 337
    goto :goto_4

    .line 338
    :cond_8
    :goto_3
    const/4 v5, 0x1

    .line 339
    :goto_4
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 340
    .line 341
    .line 342
    move-result v6

    .line 343
    if-eqz v6, :cond_9

    .line 344
    .line 345
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 346
    .line 347
    .line 348
    move-result v6

    .line 349
    if-nez v6, :cond_a

    .line 350
    .line 351
    :cond_9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 352
    .line 353
    .line 354
    move-result v6

    .line 355
    if-nez v6, :cond_b

    .line 356
    .line 357
    if-nez v5, :cond_a

    .line 358
    .line 359
    goto :goto_5

    .line 360
    :cond_a
    move-object v5, v3

    .line 361
    goto :goto_6

    .line 362
    :cond_b
    :goto_5
    invoke-static {v4, v1}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v5

    .line 366
    :goto_6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 367
    .line 368
    .line 369
    move-result v6

    .line 370
    if-eqz v6, :cond_c

    .line 371
    .line 372
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 373
    .line 374
    .line 375
    move-result v6

    .line 376
    if-nez v6, :cond_d

    .line 377
    .line 378
    :cond_c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 379
    .line 380
    .line 381
    move-result v6

    .line 382
    if-eqz v6, :cond_d

    .line 383
    .line 384
    invoke-static {v4, v1}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    goto :goto_7

    .line 389
    :cond_d
    move-object v1, v3

    .line 390
    :goto_7
    sget v4, Ll/dbc0;->V8:I

    .line 391
    .line 392
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    invoke-static {v4, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 397
    .line 398
    .line 399
    move-result-object v4

    .line 400
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->n:Ll/pf60;

    .line 401
    .line 402
    sget v4, Ll/dbc0;->V8:I

    .line 403
    .line 404
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 405
    .line 406
    .line 407
    move-result-object v4

    .line 408
    invoke-static {v4, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->o:Ll/pf60;

    .line 413
    .line 414
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 415
    .line 416
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 417
    .line 418
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 419
    .line 420
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result v1

    .line 424
    if-eqz v1, :cond_e

    .line 425
    .line 426
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 427
    .line 428
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 429
    .line 430
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 431
    .line 432
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 433
    .line 434
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-nez v1, :cond_e

    .line 439
    .line 440
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 441
    .line 442
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 443
    .line 444
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 445
    .line 446
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 447
    .line 448
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    check-cast v0, Ljava/lang/String;

    .line 453
    .line 454
    invoke-static {v0}, Ll/baj;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 463
    .line 464
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 465
    .line 466
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 467
    .line 468
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    move-result v0

    .line 472
    if-eqz v0, :cond_f

    .line 473
    .line 474
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    if-eqz v0, :cond_f

    .line 479
    .line 480
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 481
    .line 482
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 483
    .line 484
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 485
    .line 486
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 487
    .line 488
    goto :goto_8

    .line 489
    :cond_f
    move-object v0, v3

    .line 490
    :goto_8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 491
    .line 492
    .line 493
    move-result v1

    .line 494
    if-nez v1, :cond_10

    .line 495
    .line 496
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    check-cast v0, Ljava/lang/String;

    .line 501
    .line 502
    invoke-static {v0}, Ll/baj;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    goto :goto_9

    .line 507
    :cond_10
    move-object v0, v3

    .line 508
    :goto_9
    sget v1, Ll/dbc0;->P8:I

    .line 509
    .line 510
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->p:Ll/pf60;

    .line 519
    .line 520
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 521
    .line 522
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 523
    .line 524
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 525
    .line 526
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    if-eqz v0, :cond_11

    .line 531
    .line 532
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 533
    .line 534
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 535
    .line 536
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 537
    .line 538
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 539
    .line 540
    iget-object v4, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 541
    .line 542
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 543
    .line 544
    goto :goto_a

    .line 545
    :cond_11
    move-object v0, v3

    .line 546
    move-object v1, v0

    .line 547
    move-object v4, v1

    .line 548
    :goto_a
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 549
    .line 550
    .line 551
    move-result v5

    .line 552
    if-nez v5, :cond_16

    .line 553
    .line 554
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 555
    .line 556
    .line 557
    move-result p1

    .line 558
    if-eqz p1, :cond_16

    .line 559
    .line 560
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 561
    .line 562
    .line 563
    move-result p1

    .line 564
    if-nez p1, :cond_13

    .line 565
    .line 566
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 567
    .line 568
    .line 569
    move-result-object p1

    .line 570
    check-cast p1, Ljava/lang/CharSequence;

    .line 571
    .line 572
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 573
    .line 574
    .line 575
    move-result p1

    .line 576
    if-eqz p1, :cond_12

    .line 577
    .line 578
    goto :goto_b

    .line 579
    :cond_12
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    check-cast p1, Ljava/lang/String;

    .line 584
    .line 585
    goto :goto_d

    .line 586
    :cond_13
    :goto_b
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 587
    .line 588
    .line 589
    move-result p1

    .line 590
    if-nez p1, :cond_15

    .line 591
    .line 592
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    check-cast p1, Ljava/lang/CharSequence;

    .line 597
    .line 598
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 599
    .line 600
    .line 601
    move-result p1

    .line 602
    if-eqz p1, :cond_14

    .line 603
    .line 604
    goto :goto_c

    .line 605
    :cond_14
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 606
    .line 607
    .line 608
    move-result-object p1

    .line 609
    check-cast p1, Ljava/lang/String;

    .line 610
    .line 611
    goto :goto_d

    .line 612
    :cond_15
    :goto_c
    const-string p1, ""

    .line 613
    .line 614
    :goto_d
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    check-cast v0, Ljava/lang/String;

    .line 619
    .line 620
    invoke-static {v0, p1}, Ll/baj;->K(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v3

    .line 624
    :cond_16
    sget p1, Ll/dbc0;->U8:I

    .line 625
    .line 626
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 627
    .line 628
    .line 629
    move-result-object p1

    .line 630
    invoke-static {p1, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 631
    .line 632
    .line 633
    move-result-object p1

    .line 634
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->q:Ll/pf60;

    .line 635
    .line 636
    return-void
.end method

.method public final f(Ljava/util/List;ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->c(ILjava/lang/String;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->r:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 5

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 18
    .line 19
    invoke-static {p0}, Ll/q8g0;->m0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v4, 0x1

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return v4

    .line 31
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    return v4

    .line 38
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    return v4

    .line 45
    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_3

    .line 50
    .line 51
    return v4

    .line 52
    :cond_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_4

    .line 57
    .line 58
    return v4

    .line 59
    :cond_4
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast p0, Ljava/lang/CharSequence;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_5

    .line 68
    .line 69
    return v4

    .line 70
    :cond_5
    const/4 p0, 0x0

    .line 71
    return p0
.end method

.method public getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(Ll/ji80;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->e:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->c:Lv/VText;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/16 v3, 0x8

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->c:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v0, p1, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object p1, p1, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->d(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->f:Z

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->i(Ljava/util/List;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->d:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 66
    .line 67
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final i(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->r:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/pf60;

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->f(Ljava/util/List;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-object v0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->b:Lv/VText;

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
