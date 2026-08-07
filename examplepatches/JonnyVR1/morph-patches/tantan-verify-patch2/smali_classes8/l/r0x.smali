.class public Ll/r0x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/n0x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public h:Ll/n0x;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/r0x;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0x;->q(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/r0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r0x;->s(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic l(Ll/r0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/r0x;->u(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r0x;->h:Ll/n0x;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n0x;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/l5x;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/r0x;->h:Ll/n0x;

    .line 10
    .line 11
    iget-object p0, p0, Ll/n0x;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/l5x;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 26
    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 34
    .line 35
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 39
    .line 40
    if-ne p1, v0, :cond_1

    .line 41
    .line 42
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 47
    .line 48
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/r0x;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/r0x;->d:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    sget-object p2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 22
    .line 23
    if-ne p1, p2, :cond_0

    .line 24
    .line 25
    const/16 p2, 0x12

    .line 26
    .line 27
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p2, v0}, Ll/l5x;->n(Ljava/lang/String;Z)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object v0, p0, Ll/r0x;->h:Ll/n0x;

    .line 37
    .line 38
    iget-object v0, v0, Ll/n0x;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/l5x;->n(Ljava/lang/String;Z)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_HEIGHT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 46
    .line 47
    if-ne p1, p2, :cond_1

    .line 48
    .line 49
    const/16 p2, 0x8c

    .line 50
    .line 51
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {p2, v1}, Ll/l5x;->p(Ljava/lang/String;Z)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object v0, p0, Ll/r0x;->h:Ll/n0x;

    .line 60
    .line 61
    iget-object v0, v0, Ll/n0x;->a:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/l5x;->p(Ljava/lang/String;Z)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 p2, 0x0

    .line 69
    move-object v0, p2

    .line 70
    :goto_0
    iget-object v1, p0, Ll/r0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 71
    .line 72
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/r0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/r0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 81
    .line 82
    iget-object v2, p0, Ll/r0x;->h:Ll/n0x;

    .line 83
    .line 84
    iget-object v2, v2, Ll/n0x;->a:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {p2, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Ll/r0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 94
    .line 95
    iget-object v1, p0, Ll/r0x;->h:Ll/n0x;

    .line 96
    .line 97
    iget-object v1, v1, Ll/n0x;->b:Ljava/lang/String;

    .line 98
    .line 99
    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/r0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 107
    .line 108
    new-instance v0, Ll/o0x;

    .line 109
    .line 110
    invoke-direct {v0, p0, p1}, Ll/o0x;-><init>(Ll/r0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/r0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 117
    .line 118
    new-instance p2, Ll/p0x;

    .line 119
    .line 120
    invoke-direct {p2, p0}, Ll/p0x;-><init>(Ll/r0x;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r0x;->n(Ll/n0x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r0x;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/s0x;->b(Ll/r0x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/n0x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r0x;->h:Ll/n0x;

    .line 2
    .line 3
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Ljava/lang/String;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/r0x$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-static {p2, p3}, Ll/l5x;->p(Ljava/lang/String;Z)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-static {p2, p3}, Ll/l5x;->n(Ljava/lang/String;Z)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic q(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0x;->h:Ll/n0x;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n0x;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/r0x;->h:Ll/n0x;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p2, Ll/n0x;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    :try_start_0
    invoke-virtual {p0, p1, p3, p2}, Ll/r0x;->p(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Ljava/lang/String;Z)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Ll/r0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/r0x;->h:Ll/n0x;

    .line 24
    .line 25
    iget-object p2, p2, Ll/n0x;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget-object p3, p0, Ll/r0x;->h:Ll/n0x;

    .line 32
    .line 33
    iget-object p3, p3, Ll/n0x;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    const/4 p4, 0x0

    .line 40
    if-gt p2, p3, :cond_0

    .line 41
    .line 42
    new-instance p2, Ll/q0x;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/q0x;-><init>(Ll/r0x;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move p2, p4

    .line 53
    :goto_0
    iget-object p3, p0, Ll/r0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 54
    .line 55
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->m(IZ)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/r0x;->h:Ll/n0x;

    .line 59
    .line 60
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/lang/String;

    .line 65
    .line 66
    iput-object p1, p0, Ll/n0x;->b:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    :catch_0
    :cond_1
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0x;->h:Ll/n0x;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Ll/n0x;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
