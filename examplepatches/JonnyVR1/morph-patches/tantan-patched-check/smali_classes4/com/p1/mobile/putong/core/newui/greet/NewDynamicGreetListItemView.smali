.class public Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public b:Landroid/view/View;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VFrame;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;Ll/bie;Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;ILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i(Ll/bie;Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;ILl/pf60;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic c(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wu20;->a(Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 9
    .line 10
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 11
    .line 12
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 13
    .line 14
    const-string v3, "\u5176\u5b83"

    .line 15
    .line 16
    const-string v4, "\u5176\u4ed6"

    .line 17
    .line 18
    const-string v5, "\u5b66\u751f"

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    move-object v0, v5

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 75
    .line 76
    :cond_1
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_4

    .line 114
    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_4

    .line 126
    .line 127
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_3

    .line 132
    .line 133
    const-string v0, "\u00b7"

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :cond_4
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v2, 0x0

    .line 20
    const-string v3, " \u00b7 "

    .line 21
    .line 22
    if-eqz p1, :cond_6

    .line 23
    .line 24
    new-instance p0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 32
    .line 33
    new-instance v1, Ll/su20;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/su20;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    const/4 v1, 0x3

    .line 56
    if-ge p1, v1, :cond_2

    .line 57
    .line 58
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 61
    .line 62
    new-instance p2, Ll/tu20;

    .line 63
    .line 64
    invoke-direct {p2}, Ll/tu20;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    :cond_2
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :cond_3
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-ge v2, p1, :cond_5

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_4

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    :cond_4
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVipWithOutMe()Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_7

    .line 132
    .line 133
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string p1, "\u5c81"

    .line 139
    .line 140
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    :cond_7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_a

    .line 148
    .line 149
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 150
    .line 151
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 152
    .line 153
    const/16 v4, 0x3e8

    .line 154
    .line 155
    if-ge p1, v4, :cond_8

    .line 156
    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    sget-object v4, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 163
    .line 164
    iget-object v5, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 165
    .line 166
    iget v5, v5, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 167
    .line 168
    int-to-long v5, v5

    .line 169
    invoke-virtual {v4, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 177
    .line 178
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->U4:I

    .line 179
    .line 180
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    goto :goto_1

    .line 192
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    sget-object v4, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 198
    .line 199
    iget-object v5, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 200
    .line 201
    iget v5, v5, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 202
    .line 203
    int-to-float v5, v5

    .line 204
    const/high16 v6, 0x447a0000    # 1000.0f

    .line 205
    .line 206
    div-float/2addr v5, v6

    .line 207
    float-to-double v5, v5

    .line 208
    invoke-virtual {v4, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 216
    .line 217
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->i4:I

    .line 218
    .line 219
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result v4

    .line 238
    if-eqz v4, :cond_9

    .line 239
    .line 240
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_9
    const-string v4, "("

    .line 245
    .line 246
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string p1, ")"

    .line 253
    .line 254
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    :cond_a
    :goto_2
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-nez p1, :cond_c

    .line 264
    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 270
    .line 271
    .line 272
    move-result p0

    .line 273
    if-nez p0, :cond_b

    .line 274
    .line 275
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    :cond_b
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    goto/16 :goto_3

    .line 284
    .line 285
    :cond_c
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 286
    .line 287
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 288
    .line 289
    const-string v4, "unknown_"

    .line 290
    .line 291
    invoke-static {v4}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-nez p1, :cond_d

    .line 300
    .line 301
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 302
    .line 303
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 304
    .line 305
    invoke-static {p1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    :cond_d
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_f

    .line 314
    .line 315
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-nez p1, :cond_e

    .line 324
    .line 325
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    :cond_e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    :cond_f
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 332
    .line 333
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 334
    .line 335
    new-instance v1, Ll/uu20;

    .line 336
    .line 337
    invoke-direct {v1}, Ll/uu20;-><init>()V

    .line 338
    .line 339
    .line 340
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    if-nez v1, :cond_11

    .line 349
    .line 350
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    if-nez p0, :cond_10

    .line 359
    .line 360
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    :cond_10
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    check-cast p0, Lcom/p1/mobile/putong/data/Tag;

    .line 368
    .line 369
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    return-object p0

    .line 379
    :cond_11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 384
    .line 385
    .line 386
    move-result p1

    .line 387
    if-nez p1, :cond_13

    .line 388
    .line 389
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-nez p1, :cond_12

    .line 398
    .line 399
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    :cond_12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    return-object p0

    .line 410
    :cond_13
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 411
    .line 412
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 413
    .line 414
    new-instance p1, Ll/vu20;

    .line 415
    .line 416
    invoke-direct {p1}, Ll/vu20;-><init>()V

    .line 417
    .line 418
    .line 419
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 424
    .line 425
    .line 426
    move-result p1

    .line 427
    if-nez p1, :cond_15

    .line 428
    .line 429
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 434
    .line 435
    .line 436
    move-result p1

    .line 437
    if-nez p1, :cond_14

    .line 438
    .line 439
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    :cond_14
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    check-cast p0, Lcom/p1/mobile/putong/data/Tag;

    .line 447
    .line 448
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 451
    .line 452
    .line 453
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    return-object p0

    .line 458
    :cond_15
    :goto_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    return-object p0
.end method

.method public final synthetic i(Ll/bie;Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;ILl/pf60;)V
    .locals 8

    .line 1
    iget-object v0, p5, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p5, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/bie;->F(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p5, Ll/pf60;->a:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->o:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->a:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p2}, Ll/fzq;->j()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->o:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {p2}, Ll/fzq;->j()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->a:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const-wide/16 v2, 0x0

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-eqz v4, :cond_3

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    iget-wide v4, v0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->frozenTime:J

    .line 116
    .line 117
    const-wide/16 v6, 0x0

    .line 118
    .line 119
    cmp-long v0, v4, v6

    .line 120
    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    long-to-double v4, v4

    .line 124
    goto :goto_1

    .line 125
    :cond_3
    move-wide v4, v2

    .line 126
    :goto_1
    cmpl-double v0, v4, v2

    .line 127
    .line 128
    if-nez v0, :cond_4

    .line 129
    .line 130
    iget-object p5, p5, Ll/pf60;->a:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p5, Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    iget-object p5, p5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 135
    .line 136
    iget-wide v4, p5, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 137
    .line 138
    :cond_4
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p5

    .line 142
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->u6:I

    .line 143
    .line 144
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-nez v0, :cond_6

    .line 153
    .line 154
    invoke-static {}, Ll/pzi0;->o()J

    .line 155
    .line 156
    .line 157
    move-result-wide v2

    .line 158
    long-to-double v2, v2

    .line 159
    sub-double/2addr v2, v4

    .line 160
    const-wide v4, 0x41124f8000000000L    # 300000.0

    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    cmpg-double v0, v2, v4

    .line 166
    .line 167
    if-gez v0, :cond_5

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_5
    const-string v0, "%s\u6d3b\u8dc3"

    .line 171
    .line 172
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p5

    .line 176
    invoke-static {v0, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p5

    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->b:Landroid/view/View;

    .line 181
    .line 182
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_6
    :goto_2
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->b:Landroid/view/View;

    .line 187
    .line 188
    const/4 v0, 0x1

    .line 189
    invoke-static {p5, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 190
    .line 191
    .line 192
    const-string p5, "\u5f53\u524d\u5728\u7ebf"

    .line 193
    .line 194
    :goto_3
    const/16 v0, 0x14

    .line 195
    .line 196
    if-ne p4, v0, :cond_a

    .line 197
    .line 198
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->d:Lv/VText;

    .line 203
    .line 204
    if-eqz p2, :cond_7

    .line 205
    .line 206
    const-string p2, "\u6765\u81ea\u804a\u5929\u5ba4 \u00b7 "

    .line 207
    .line 208
    invoke-virtual {p2, p5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_7
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    :goto_4
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->h(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 220
    .line 221
    .line 222
    move-result-object p2

    .line 223
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result p3

    .line 227
    if-eqz p3, :cond_9

    .line 228
    .line 229
    new-instance p2, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    const-string p3, "\u548c"

    .line 232
    .line 233
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_8

    .line 241
    .line 242
    const-string p1, "\u5979"

    .line 243
    .line 244
    goto :goto_5

    .line 245
    :cond_8
    const-string p1, "\u4ed6"

    .line 246
    .line 247
    :goto_5
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    const-string p1, "\u804a\u804a\u5427"

    .line 251
    .line 252
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->j:Lv/VText;

    .line 260
    .line 261
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->d:Lv/VText;

    .line 266
    .line 267
    invoke-virtual {p2}, Ll/fzq;->n()D

    .line 268
    .line 269
    .line 270
    move-result-wide p1

    .line 271
    invoke-static {p1, p2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    .line 277
    .line 278
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/bie;Ll/fzq;ILandroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Landroid/view/View$OnClickListener;)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/16 v2, 0x14

    .line 4
    .line 5
    if-ne p4, v2, :cond_0

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->j:Lv/VText;

    .line 8
    .line 9
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->n:Lv/VText;

    .line 13
    .line 14
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3}, Ll/fzq;->i()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->l:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->k:Lv/VLinear;

    .line 27
    .line 28
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    xor-int/2addr v3, v0

    .line 33
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->m:Lv/VText;

    .line 37
    .line 38
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 39
    .line 40
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-interface {v4}, Ll/r97;->G0()Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->m:Lv/VText;

    .line 52
    .line 53
    const/4 v4, 0x3

    .line 54
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v3, v4, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->m:Lv/VText;

    .line 62
    .line 63
    invoke-static {v3, p7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const/16 p7, 0x1e

    .line 68
    .line 69
    if-ne p4, p7, :cond_1

    .line 70
    .line 71
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->j:Lv/VText;

    .line 72
    .line 73
    invoke-static {p7, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->k:Lv/VLinear;

    .line 77
    .line 78
    invoke-static {p7, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->n:Lv/VText;

    .line 82
    .line 83
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->n:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {p3}, Ll/fzq;->i()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {p7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    :goto_0
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p3}, Ll/fzq;->q()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {p7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 105
    .line 106
    invoke-virtual {p7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 107
    .line 108
    .line 109
    move-result-object p7

    .line 110
    invoke-virtual {p7, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p3}, Ll/fzq;->o()I

    .line 114
    .line 115
    .line 116
    move-result p7

    .line 117
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->c:Lv/VText;

    .line 118
    .line 119
    if-lez p7, :cond_3

    .line 120
    .line 121
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 122
    .line 123
    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->c:Lv/VText;

    .line 125
    .line 126
    const/16 v4, 0x63

    .line 127
    .line 128
    if-le p7, v4, :cond_2

    .line 129
    .line 130
    const-string p7, "99+"

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p7, ""

    .line 142
    .line 143
    invoke-virtual {v4, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p7

    .line 150
    :goto_1
    invoke-virtual {v3, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_3
    const/16 p7, 0x8

    .line 155
    .line 156
    invoke-virtual {v3, p7}, Landroid/view/View;->setVisibility(I)V

    .line 157
    .line 158
    .line 159
    :goto_2
    invoke-static {}, Ll/nrb0;->b()Z

    .line 160
    .line 161
    .line 162
    move-result p7

    .line 163
    if-eqz p7, :cond_4

    .line 164
    .line 165
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 166
    .line 167
    invoke-virtual {p7, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 168
    .line 169
    .line 170
    sget-object p7, Ll/uqb0;->b0:Ll/sre0;

    .line 171
    .line 172
    iget-object p7, p7, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 181
    .line 182
    invoke-virtual {p3}, Ll/fzq;->p()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    invoke-virtual {v4, v5}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->h:Lv/VImage;

    .line 191
    .line 192
    invoke-interface {p7, v3, v4, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_4
    invoke-virtual {p3}, Ll/fzq;->r()Z

    .line 197
    .line 198
    .line 199
    move-result p7

    .line 200
    const/4 v3, 0x0

    .line 201
    if-eqz p7, :cond_5

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 204
    .line 205
    .line 206
    move-result-object p7

    .line 207
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-interface {v4}, Ll/r97;->j2()I

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    invoke-virtual {p7, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 220
    .line 221
    .line 222
    move-result-object p7

    .line 223
    invoke-virtual {p7}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    invoke-virtual {p7}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-virtual {p7, v1, v1, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 232
    .line 233
    .line 234
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 235
    .line 236
    invoke-virtual {v4, v3, v3, p7, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 237
    .line 238
    .line 239
    goto :goto_3

    .line 240
    :cond_5
    invoke-virtual {p3}, Ll/fzq;->t()Z

    .line 241
    .line 242
    .line 243
    move-result p7

    .line 244
    if-eqz p7, :cond_6

    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object p7

    .line 250
    sget v4, Ll/ibc0;->K5:I

    .line 251
    .line 252
    invoke-virtual {p7, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 253
    .line 254
    .line 255
    move-result-object p7

    .line 256
    invoke-virtual {p7}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    invoke-virtual {p7}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    invoke-virtual {p7, v1, v1, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 265
    .line 266
    .line 267
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {v4, v3, v3, p7, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 270
    .line 271
    .line 272
    goto :goto_3

    .line 273
    :cond_6
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->g:Lv/VText;

    .line 274
    .line 275
    invoke-virtual {p7, v3, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 276
    .line 277
    .line 278
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 279
    .line 280
    .line 281
    move-result-object p7

    .line 282
    invoke-virtual {p7}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 283
    .line 284
    .line 285
    move-result-object p7

    .line 286
    invoke-interface {p7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->e()Z

    .line 287
    .line 288
    .line 289
    move-result p7

    .line 290
    if-eqz p7, :cond_7

    .line 291
    .line 292
    invoke-virtual {p3}, Ll/fzq;->v()Z

    .line 293
    .line 294
    .line 295
    move-result p7

    .line 296
    if-eqz p7, :cond_7

    .line 297
    .line 298
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 299
    .line 300
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 304
    .line 305
    invoke-virtual {p7}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->n0()V

    .line 306
    .line 307
    .line 308
    goto :goto_4

    .line 309
    :cond_7
    invoke-virtual {p3}, Ll/fzq;->s()Z

    .line 310
    .line 311
    .line 312
    move-result p7

    .line 313
    if-eqz p7, :cond_8

    .line 314
    .line 315
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 316
    .line 317
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 321
    .line 322
    invoke-virtual {p7}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->p0()V

    .line 323
    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 327
    .line 328
    .line 329
    move-result-object p7

    .line 330
    invoke-virtual {p7}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 331
    .line 332
    .line 333
    move-result-object p7

    .line 334
    invoke-interface {p7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 335
    .line 336
    .line 337
    move-result p7

    .line 338
    if-eqz p7, :cond_9

    .line 339
    .line 340
    invoke-virtual {p3}, Ll/fzq;->u()Z

    .line 341
    .line 342
    .line 343
    move-result p7

    .line 344
    if-eqz p7, :cond_9

    .line 345
    .line 346
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 347
    .line 348
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 349
    .line 350
    .line 351
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 352
    .line 353
    invoke-virtual {p7}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->m0()V

    .line 354
    .line 355
    .line 356
    goto :goto_4

    .line 357
    :cond_9
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->i:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 358
    .line 359
    invoke-static {p7, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 360
    .line 361
    .line 362
    :goto_4
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->e:Lv/VText;

    .line 363
    .line 364
    invoke-virtual {p3}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v3

    .line 372
    if-eqz v3, :cond_a

    .line 373
    .line 374
    invoke-virtual {p3}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 379
    .line 380
    const-string v4, "city_c"

    .line 381
    .line 382
    invoke-static {v4}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 387
    .line 388
    .line 389
    move-result v3

    .line 390
    if-eqz v3, :cond_a

    .line 391
    .line 392
    if-ne p4, v2, :cond_a

    .line 393
    .line 394
    goto :goto_5

    .line 395
    :cond_a
    move v0, v1

    .line 396
    :goto_5
    invoke-static {p7, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 397
    .line 398
    .line 399
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 400
    .line 401
    .line 402
    move-result-object p7

    .line 403
    invoke-virtual {p7}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 404
    .line 405
    .line 406
    move-result-object p7

    .line 407
    invoke-interface {p7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->e()Z

    .line 408
    .line 409
    .line 410
    move-result p7

    .line 411
    if-eqz p7, :cond_b

    .line 412
    .line 413
    iget-object p7, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->e:Lv/VText;

    .line 414
    .line 415
    const-string v0, "\u6765\u81ea\u57ce\u5e02\u7f6e\u9876"

    .line 416
    .line 417
    invoke-virtual {p7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 418
    .line 419
    .line 420
    :cond_b
    invoke-static {p0, p5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {p0, p6}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 424
    .line 425
    .line 426
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 427
    .line 428
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 429
    .line 430
    invoke-virtual {p3}, Ll/fzq;->p()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object p6

    .line 434
    invoke-virtual {p5, p6}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 435
    .line 436
    .line 437
    move-result-object p5

    .line 438
    sget-object p6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 439
    .line 440
    iget-object p6, p6, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 441
    .line 442
    invoke-virtual {p3}, Ll/fzq;->p()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p7

    .line 446
    invoke-virtual {p6, p7}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 447
    .line 448
    .line 449
    move-result-object p6

    .line 450
    new-instance p7, Ll/qu20;

    .line 451
    .line 452
    invoke-direct {p7}, Ll/qu20;-><init>()V

    .line 453
    .line 454
    .line 455
    invoke-static {p5, p6, p7}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 456
    .line 457
    .line 458
    move-result-object p5

    .line 459
    invoke-virtual {p2, p1, p5}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 460
    .line 461
    .line 462
    move-result-object p5

    .line 463
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 464
    .line 465
    .line 466
    move-result-object p6

    .line 467
    invoke-virtual {p5, p6}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 468
    .line 469
    .line 470
    move-result-object p5

    .line 471
    new-instance v0, Ll/ru20;

    .line 472
    .line 473
    move-object v1, p0

    .line 474
    move-object v4, p1

    .line 475
    move-object v2, p2

    .line 476
    move-object v3, p3

    .line 477
    move v5, p4

    .line 478
    invoke-direct/range {v0 .. v5}, Ll/ru20;-><init>(Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;Ll/bie;Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;I)V

    .line 479
    .line 480
    .line 481
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 482
    .line 483
    .line 484
    move-result-object p0

    .line 485
    invoke-virtual {p5, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 486
    .line 487
    .line 488
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->a:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->o:Lv/VDraweeView;

    .line 14
    .line 15
    return-void
.end method
