.class public Ll/r1i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Ll/x0m;

.field public b:J

.field public c:Ll/jxd0;

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            ">;"
        }
    .end annotation
.end field

.field public e:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/r1i0;->b:J

    .line 7
    .line 8
    new-instance v0, Ll/jxd0;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "first_left_slide_"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/r1i0;->c:Ll/jxd0;

    .line 38
    .line 39
    new-instance v0, Ll/q1i0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/q1i0;-><init>(Ll/r1i0;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/r1i0;->d:Ll/y20;

    .line 45
    .line 46
    new-instance v0, Ll/r1i0$a;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/r1i0$a;-><init>(Ll/r1i0;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/r1i0;->e:Landroid/view/View$OnClickListener;

    .line 52
    .line 53
    iput-object p1, p0, Ll/r1i0;->a:Ll/x0m;

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic h(Ll/r1i0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r1i0;->j(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/r1i0;)Ll/x0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r1i0;->a:Ll/x0m;

    return-object p0
.end method

.method private synthetic j(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r1i0;->a:Ll/x0m;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 5

    .line 1
    sget p3, Ll/nec0;->c:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Landroid/graphics/drawable/GradientDrawable;

    .line 9
    .line 10
    invoke-direct {p2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 14
    .line 15
    .line 16
    sget p3, Ll/qa00;->i:I

    .line 17
    .line 18
    int-to-float p3, p3

    .line 19
    invoke-virtual {p2, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 20
    .line 21
    .line 22
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    sget v1, Ll/e9c0;->m:I

    .line 29
    .line 30
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    invoke-virtual {p2, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 35
    .line 36
    .line 37
    sget p3, Ll/cdc0;->w:I

    .line 38
    .line 39
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    check-cast p3, Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p3, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 49
    .line 50
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 51
    .line 52
    .line 53
    sget p2, Ll/cdc0;->K:I

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lv/VDraweeView;

    .line 60
    .line 61
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    sget v1, Ll/fbc0;->u:I

    .line 64
    .line 65
    invoke-virtual {p3, p2, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 66
    .line 67
    .line 68
    sget p2, Ll/cdc0;->J:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    check-cast p2, Landroid/widget/ImageView;

    .line 75
    .line 76
    iget-object p0, p0, Ll/r1i0;->a:Ll/x0m;

    .line 77
    .line 78
    invoke-interface {p0}, Ll/x0m;->p0()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    int-to-double v1, p0

    .line 83
    const-wide v3, 0x3fdd205bc01a36e3L    # 0.4551

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    mul-double/2addr v1, v3

    .line 89
    const-wide v3, 0x3ff115b573eab368L    # 1.0678

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    mul-double/2addr v3, v1

    .line 95
    double-to-int p0, v3

    .line 96
    const/4 p3, 0x1

    .line 97
    new-array p3, p3, [Landroid/view/View;

    .line 98
    .line 99
    aput-object p2, p3, v0

    .line 100
    .line 101
    invoke-static {p0, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    double-to-int p0, v1

    .line 105
    invoke-static {p2, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 106
    .line 107
    .line 108
    return-object p1
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    iget-object p4, p0, Ll/r1i0;->a:Ll/x0m;

    .line 22
    .line 23
    invoke-interface {p4}, Ll/x0m;->O3()V

    .line 24
    .line 25
    .line 26
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 41
    .line 42
    instance-of p3, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 43
    .line 44
    if-eqz p3, :cond_0

    .line 45
    .line 46
    check-cast p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 47
    .line 48
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p3}, Ll/pk50;->f()Ll/rj50;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    iget-object p4, p2, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p3, p4, v0, v0}, Ll/rj50;->Z(Ljava/lang/String;IZ)Z

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Ll/fb0;->k(Lcom/p1/mobile/putong/data/OMSAdCardInfo;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide p2

    .line 69
    iget-wide v0, p0, Ll/r1i0;->b:J

    .line 70
    .line 71
    sub-long/2addr p2, v0

    .line 72
    const-wide/16 v0, 0x1f4

    .line 73
    .line 74
    cmp-long p2, p2, v0

    .line 75
    .line 76
    if-lez p2, :cond_0

    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide p2

    .line 82
    iput-wide p2, p0, Ll/r1i0;->b:J

    .line 83
    .line 84
    const-string p2, "e_card_add_tag"

    .line 85
    .line 86
    const-string p3, "p_suggest_users_home_view"

    .line 87
    .line 88
    invoke-static {p2, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    sget p2, Ll/cdc0;->w:I

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object p0, p0, Ll/r1i0;->e:Landroid/view/View$OnClickListener;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d2:Ljava/util/HashSet;

    .line 6
    .line 7
    const-string v0, "tagCardGuide"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string v1, "e_card_add_tag"

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d2:Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    sget-object p2, Ll/r1i0$b;->a:[I

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    aget p2, p2, v0

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eq p2, v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x2

    .line 50
    if-eq p2, v0, :cond_2

    .line 51
    .line 52
    const/4 v0, 0x3

    .line 53
    if-eq p2, v0, :cond_1

    .line 54
    .line 55
    const-string p2, ""

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const-string p2, "right"

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const-string p2, "left"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const-string p2, "up"

    .line 65
    .line 66
    :goto_0
    const-string v0, "swipe_directions"

    .line 67
    .line 68
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    filled-new-array {p2}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string v0, "p_suggest_users_home_view"

    .line 77
    .line 78
    invoke-static {v1, v0, p2}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 86
    .line 87
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-ne p1, p2, :cond_5

    .line 92
    .line 93
    iget-object p1, p0, Ll/r1i0;->c:Ll/jxd0;

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    iget-object p1, p0, Ll/r1i0;->a:Ll/x0m;

    .line 108
    .line 109
    invoke-interface {p1}, Ll/x0m;->T2()V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/r1i0;->c:Ll/jxd0;

    .line 113
    .line 114
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hp()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object p0, p0, Ll/r1i0;->a:Ll/x0m;

    .line 138
    .line 139
    invoke-interface {p0, p1}, Ll/x0m;->s3(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 143
    .line 144
    return-object p0
.end method
