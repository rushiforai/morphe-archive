.class public Ll/f0x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/f0x$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/c0x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VFrame;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public h:Ll/c0x;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

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
    iput-object p1, p0, Ll/f0x;->i:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/f0x;->j:Z

    .line 13
    .line 14
    const/4 p1, -0x1

    .line 15
    iput p1, p0, Ll/f0x;->k:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic j(Ll/f0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f0x;->w(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic k(Ll/f0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f0x;->x(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static bridge synthetic l(Ll/f0x;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->c:Lv/VText;

    return-void
.end method

.method public static bridge synthetic m(Ll/f0x;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->d:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic n(Ll/f0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic p(Ll/f0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic q(Ll/f0x;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "-"

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

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
    iget-object v0, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "-"

    .line 32
    .line 33
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const-string v4, ""

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    move-object v0, v4

    .line 42
    :cond_0
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    move-object v1, v4

    .line 49
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v5, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    sget v7, Lcom/p1/mobile/putong/core/profile/R$string;->m2:I

    .line 69
    .line 70
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-static {v6, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-nez v6, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    sget v7, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 85
    .line 86
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-static {v6, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_2

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 102
    .line 103
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_3

    .line 112
    .line 113
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 127
    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 129
    .line 130
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 131
    .line 132
    iput-object v5, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 133
    .line 134
    :cond_3
    return-void

    .line 135
    :cond_4
    :goto_0
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 149
    .line 150
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 151
    .line 152
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 153
    .line 154
    iput-object v5, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 155
    .line 156
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/f0x;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/f0x;->c:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 52
    .line 53
    iget-object v2, p0, Ll/f0x;->i:Ljava/util/List;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    iget-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 62
    .line 63
    new-instance v0, Ll/d0x;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/d0x;-><init>(Ll/f0x;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 72
    .line 73
    new-instance v0, Ll/e0x;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/e0x;-><init>(Ll/f0x;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->n2:I

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/f0x;->d:Lv/VFrame;

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 118
    .line 119
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 129
    .line 130
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    const/4 v2, 0x0

    .line 135
    if-nez v0, :cond_7

    .line 136
    .line 137
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/lang/CharSequence;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_7

    .line 158
    .line 159
    iget-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/f0x;->i:Ljava/util/List;

    .line 165
    .line 166
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iget-object v0, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 171
    .line 172
    if-eqz p1, :cond_1

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_1
    iget-object p1, p0, Ll/f0x;->i:Ljava/util/List;

    .line 184
    .line 185
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 189
    .line 190
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 195
    .line 196
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_2

    .line 201
    .line 202
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Ljava/lang/CharSequence;

    .line 207
    .line 208
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_2

    .line 213
    .line 214
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    check-cast p1, Ljava/lang/String;

    .line 219
    .line 220
    iget-object v0, p0, Ll/f0x;->i:Ljava/util/List;

    .line 221
    .line 222
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    goto :goto_1

    .line 227
    :cond_2
    const-string p1, ""

    .line 228
    .line 229
    move v0, v2

    .line 230
    :goto_1
    iget-object v1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 231
    .line 232
    const/4 v3, -0x1

    .line 233
    if-ne v0, v3, :cond_3

    .line 234
    .line 235
    move v0, v2

    .line 236
    :cond_3
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0, p1}, Ll/f0x;->v(Ljava/lang/String;)Ljava/util/List;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    iget-object v1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 248
    .line 249
    if-nez v0, :cond_6

    .line 250
    .line 251
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 252
    .line 253
    .line 254
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 255
    .line 256
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 257
    .line 258
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 259
    .line 260
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 261
    .line 262
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-nez v0, :cond_5

    .line 267
    .line 268
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    check-cast p2, Ljava/lang/CharSequence;

    .line 273
    .line 274
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 275
    .line 276
    .line 277
    move-result p2

    .line 278
    if-nez p2, :cond_5

    .line 279
    .line 280
    iget-object p2, p0, Ll/f0x;->i:Ljava/util/List;

    .line 281
    .line 282
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 287
    .line 288
    .line 289
    move-result p1

    .line 290
    iget-object p0, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 291
    .line 292
    if-ne p1, v3, :cond_4

    .line 293
    .line 294
    goto :goto_2

    .line 295
    :cond_4
    move v2, p1

    .line 296
    :goto_2
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_5
    iget-object p0, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 301
    .line 302
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 303
    .line 304
    .line 305
    return-void

    .line 306
    :cond_6
    invoke-virtual {p0, v1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    :cond_7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 311
    .line 312
    .line 313
    move-result p2

    .line 314
    if-nez p2, :cond_8

    .line 315
    .line 316
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    check-cast p1, Ljava/lang/CharSequence;

    .line 321
    .line 322
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 323
    .line 324
    .line 325
    move-result-object p2

    .line 326
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 327
    .line 328
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-eqz p1, :cond_8

    .line 337
    .line 338
    iget-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 339
    .line 340
    const/4 p2, 0x2

    .line 341
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 345
    .line 346
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 350
    .line 351
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 352
    .line 353
    .line 354
    return-void

    .line 355
    :cond_8
    iget-object p1, p0, Ll/f0x;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 356
    .line 357
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 358
    .line 359
    .line 360
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 361
    .line 362
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 363
    .line 364
    .line 365
    iget-object p1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 366
    .line 367
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 368
    .line 369
    .line 370
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c0x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f0x;->u(Ll/c0x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f0x;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f0x$a;->a(Ll/f0x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Ll/c0x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0x;->h:Ll/c0x;

    .line 2
    .line 3
    return-void
.end method

.method public final v(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_2
    return-object v0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/f0x;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/f0x;->z(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f0x;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 26
    .line 27
    iget-object v0, p0, Ll/f0x;->i:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/f0x;->i:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/f0x;->v(Ljava/lang/String;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget-object v2, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 55
    .line 56
    if-nez v1, :cond_0

    .line 57
    .line 58
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-virtual {p0, v2}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget-object p1, p0, Ll/f0x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/f0x;->v(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/f0x;->g:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, v1}, Ll/f0x;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
