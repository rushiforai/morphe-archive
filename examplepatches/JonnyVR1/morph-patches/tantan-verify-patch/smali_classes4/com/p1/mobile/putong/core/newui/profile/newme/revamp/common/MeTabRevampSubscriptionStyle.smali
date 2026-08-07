.class public final Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0002\u0016\u0014B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ-\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;",
        "b",
        "(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;",
        "tier",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;",
        "c",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;",
        "Landroid/view/View;",
        "container",
        "Lv/VImage;",
        "iconView",
        "Lv/VText_NoTopPadding;",
        "textView",
        "",
        "a",
        "(Landroid/view/View;Lv/VImage;Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/data/User;)V",
        "Tier",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lv/VImage;Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lv/VText_NoTopPadding;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->c(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;->a()I

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    invoke-virtual {p1, p4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;->c()I

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    invoke-virtual {p2, p4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    sget-object p4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 40
    .line 41
    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 42
    .line 43
    .line 44
    const/high16 p4, 0x41a00000    # 20.0f

    .line 45
    .line 46
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;->d()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    int-to-float v0, v0

    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    sub-int v0, p4, v0

    .line 60
    .line 61
    div-int/lit8 v0, v0, 0x2

    .line 62
    .line 63
    invoke-static {v0, p1}, Lkotlin/ranges/a;->b(II)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput p4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 72
    .line 73
    iput p4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 79
    .line 80
    .line 81
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 82
    .line 83
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Za:I

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;->e()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    const/high16 p1, 0x41300000    # 11.0f

    .line 100
    .line 101
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;->b()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    const/4 p1, 0x4

    .line 109
    if-lt p0, p1, :cond_0

    .line 110
    .line 111
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 115
    .line 116
    :goto_0
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/d79;->W(Lcom/p1/mobile/putong/data/User;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/joa;->k4()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;->ULTRA:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Ll/joa;->f4()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;->PREMIUM:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    invoke-static {}, Ll/joa;->n4()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;->VIP:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;->NON_MEMBER:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 70
    .line 71
    return-object p0
.end method

.method public final c(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;
    .locals 8
    .param p1    # Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$b;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    aget p0, p0, v0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;

    .line 25
    .line 26
    sget v3, Ll/dbc0;->Ge:I

    .line 27
    .line 28
    sget v4, Ll/dbc0;->Ce:I

    .line 29
    .line 30
    const-string p0, "#FFE7F7"

    .line 31
    .line 32
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const/4 v7, 0x3

    .line 37
    const/16 v5, 0x14

    .line 38
    .line 39
    move-object v2, p1

    .line 40
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;IIIII)V

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :cond_1
    move-object v1, p1

    .line 50
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;

    .line 51
    .line 52
    sget v2, Ll/dbc0;->Fe:I

    .line 53
    .line 54
    sget v3, Ll/dbc0;->Be:I

    .line 55
    .line 56
    const-string p0, "#FFE59D"

    .line 57
    .line 58
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    const/4 v6, 0x3

    .line 63
    const/16 v4, 0x14

    .line 64
    .line 65
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;IIIII)V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_2
    move-object v1, p1

    .line 70
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;

    .line 71
    .line 72
    sget v2, Ll/dbc0;->He:I

    .line 73
    .line 74
    sget v3, Ll/dbc0;->De:I

    .line 75
    .line 76
    const-string p0, "#9E5701"

    .line 77
    .line 78
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    const/4 v6, 0x3

    .line 83
    const/16 v4, 0x14

    .line 84
    .line 85
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;IIIII)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_3
    move-object v1, p1

    .line 90
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;

    .line 91
    .line 92
    sget v2, Ll/dbc0;->Ee:I

    .line 93
    .line 94
    sget v3, Ll/dbc0;->Ae:I

    .line 95
    .line 96
    const-string p0, "#F1BF00"

    .line 97
    .line 98
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    const/4 v6, 0x4

    .line 103
    const/16 v4, 0x14

    .line 104
    .line 105
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;IIIII)V

    .line 106
    .line 107
    .line 108
    return-object v0
.end method
