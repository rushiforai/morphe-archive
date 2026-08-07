.class public Ll/dy90;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VText;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Lv/VText;

.field public L:Lv/VText;

.field public M:Lv/VText;

.field public N:Lv/VText;

.field public O:Lv/VText;

.field public P:Lv/VText;

.field public Q:Lv/VText;

.field public R:Z

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/dy90;->R:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic R(Ll/dy90;Lv/VText;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dy90;->c0(Lv/VText;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic S(Ll/dy90;Lv/VText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dy90;->d0(Lv/VText;)V

    return-void
.end method

.method public static V(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    move-object v2, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    const-string v4, "\u4e2d\u56fd"

    .line 49
    .line 50
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    move-object v2, v1

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/lang/String;

    .line 84
    .line 85
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    const-string v5, "\u00b7"

    .line 90
    .line 91
    if-nez v4, :cond_5

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_4

    .line 102
    .line 103
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eqz v2, :cond_6

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    move-object v1, p0

    .line 133
    check-cast v1, Ljava/lang/String;

    .line 134
    .line 135
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_7

    .line 140
    .line 141
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method private W(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static X(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/t3m;

    .line 6
    .line 7
    return-object p0
.end method

.method public T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ey90;->b(Ll/dy90;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final U()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/dy90;->B:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dy90;->D:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Ll/dy90;->G:Lv/VText;

    .line 6
    .line 7
    iget-object v3, p0, Ll/dy90;->I:Lv/VText;

    .line 8
    .line 9
    iget-object v4, p0, Ll/dy90;->C:Lv/VText;

    .line 10
    .line 11
    iget-object v5, p0, Ll/dy90;->K:Lv/VText;

    .line 12
    .line 13
    iget-object v6, p0, Ll/dy90;->J:Lv/VText;

    .line 14
    .line 15
    iget-object v7, p0, Ll/dy90;->H:Lv/VText;

    .line 16
    .line 17
    iget-object v9, p0, Ll/dy90;->N:Lv/VText;

    .line 18
    .line 19
    iget-object v10, p0, Ll/dy90;->O:Lv/VText;

    .line 20
    .line 21
    iget-object v11, p0, Ll/dy90;->P:Lv/VText;

    .line 22
    .line 23
    iget-object v12, p0, Ll/dy90;->Q:Lv/VText;

    .line 24
    .line 25
    move-object v8, v5

    .line 26
    filled-new-array/range {v0 .. v12}, [Lv/VText;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/by90;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/by90;-><init>(Ll/dy90;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "DOCTOR"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x4

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "HIGH_SCHOOL"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x3

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "unknown_"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x2

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v0, "BACHELOR"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v1, 0x1

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v0, "MASTER"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v1, 0x0

    .line 71
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Kb:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :pswitch_0
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Lb:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :pswitch_1
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ib:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0

    .line 107
    :pswitch_2
    const-string p0, ""

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_3
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Hb:I

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0

    .line 121
    :pswitch_4
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Jb:I

    .line 126
    .line 127
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    nop

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x78dfe19e -> :sswitch_4
        -0x53119052 -> :sswitch_3
        -0xe5022ab -> :sswitch_2
        0x12773cb1 -> :sswitch_1
        0x7882851f -> :sswitch_0
    .end sparse-switch

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public Z()Landroid/content/res/Resources;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public a0(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public b0()Z
    .locals 3

    .line 1
    new-instance v0, Ll/gy90;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gy90;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ll/dy90;->Y(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, v1, p0}, Ll/gy90;->a(Ll/t3m;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public final synthetic c0(Lv/VText;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    instance-of p2, p2, Landroid/text/Spanned;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/text/Spanned;

    .line 14
    .line 15
    invoke-static {p1}, Ll/e1b;->U0(Landroid/text/Spanned;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public final synthetic d0(Lv/VText;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Ll/cy90;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/cy90;-><init>(Ll/dy90;Lv/VText;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/dy90;->B:Lv/VText;

    .line 13
    .line 14
    sget v4, Lcom/p1/mobile/putong/core/R$string;->tl:I

    .line 15
    .line 16
    invoke-virtual {p0, v4}, Ll/dy90;->a0(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/dy90;->C:Lv/VText;

    .line 24
    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 26
    .line 27
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ml:I

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/dy90;->g0(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/dy90;->D:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0, v1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v1, p0, Ll/dy90;->D:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0, v1, v3}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/dy90;->B:Lv/VText;

    .line 49
    .line 50
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 51
    .line 52
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/dy90;->C:Lv/VText;

    .line 58
    .line 59
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/dy90;->D:Lv/VText;

    .line 67
    .line 68
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/R$string;->gl:I

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/dy90;->f0(I)V

    .line 78
    .line 79
    .line 80
    sget v1, Lcom/p1/mobile/putong/core/R$string;->il:I

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ll/dy90;->g0(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 90
    .line 91
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    const-string v5, ")"

    .line 96
    .line 97
    const-string v6, "("

    .line 98
    .line 99
    if-eqz v4, :cond_1

    .line 100
    .line 101
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 102
    .line 103
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-eqz v4, :cond_1

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-interface {v4}, Ll/t3m;->P1()Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-eqz v4, :cond_1

    .line 118
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 125
    .line 126
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    sget v4, Lcom/p1/mobile/putong/core/R$string;->C0:I

    .line 135
    .line 136
    invoke-virtual {p0, v4}, Ll/dy90;->a0(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    :cond_1
    iget-object v4, p0, Ll/dy90;->G:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 164
    .line 165
    if-eqz v1, :cond_3

    .line 166
    .line 167
    iget-boolean v1, v4, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 168
    .line 169
    iget-object v4, p0, Ll/dy90;->G:Lv/VText;

    .line 170
    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    invoke-virtual {p0, v4, v3}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 174
    .line 175
    .line 176
    sget v1, Lcom/p1/mobile/putong/core/R$string;->sl:I

    .line 177
    .line 178
    invoke-virtual {p0, v1}, Ll/dy90;->h0(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_2
    invoke-virtual {p0, v4, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_3
    iget-boolean v1, v4, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 187
    .line 188
    iget-object v4, p0, Ll/dy90;->G:Lv/VText;

    .line 189
    .line 190
    if-eqz v1, :cond_4

    .line 191
    .line 192
    invoke-virtual {p0, v4}, Ll/dy90;->i0(Lv/VText;)V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_4
    invoke-virtual {p0, v4, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 197
    .line 198
    .line 199
    :goto_1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    const-string v4, "unknown_"

    .line 208
    .line 209
    if-nez v1, :cond_7

    .line 210
    .line 211
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 212
    .line 213
    if-eqz v1, :cond_5

    .line 214
    .line 215
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 216
    .line 217
    if-eqz v1, :cond_5

    .line 218
    .line 219
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_7

    .line 224
    .line 225
    :cond_5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-nez v1, :cond_6

    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_6
    iget-object p1, p0, Ll/dy90;->z:Lv/VText;

    .line 235
    .line 236
    invoke-virtual {p0, p1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Ll/dy90;->A:Lv/VText;

    .line 240
    .line 241
    invoke-virtual {p0, p1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 242
    .line 243
    .line 244
    iget-object p1, p0, Ll/dy90;->E:Lv/VText;

    .line 245
    .line 246
    invoke-virtual {p0, p1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Ll/dy90;->F:Lv/VText;

    .line 250
    .line 251
    invoke-virtual {p0, p1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 252
    .line 253
    .line 254
    goto/16 :goto_8

    .line 255
    .line 256
    :cond_7
    :goto_2
    iget-object v1, p0, Ll/dy90;->A:Lv/VText;

    .line 257
    .line 258
    invoke-virtual {p0, v1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 259
    .line 260
    .line 261
    iget-object v1, p0, Ll/dy90;->G:Lv/VText;

    .line 262
    .line 263
    invoke-virtual {p0, v1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 264
    .line 265
    .line 266
    iget-object v1, p0, Ll/dy90;->E:Lv/VText;

    .line 267
    .line 268
    iget-object v7, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 269
    .line 270
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 271
    .line 272
    invoke-virtual {p0, v7}, Ll/dy90;->Y(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v7

    .line 276
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    iget-object v1, p0, Ll/dy90;->E:Lv/VText;

    .line 280
    .line 281
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 282
    .line 283
    .line 284
    move-result-object v7

    .line 285
    invoke-interface {v7}, Ll/t3m;->m0()Z

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    if-eqz v7, :cond_8

    .line 290
    .line 291
    :goto_3
    move v7, v3

    .line 292
    goto :goto_4

    .line 293
    :cond_8
    iget-object v7, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 294
    .line 295
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 296
    .line 297
    invoke-static {v7, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 298
    .line 299
    .line 300
    move-result v7

    .line 301
    if-nez v7, :cond_9

    .line 302
    .line 303
    goto :goto_3

    .line 304
    :cond_9
    move v7, v2

    .line 305
    :goto_4
    invoke-virtual {p0, v1, v7}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 306
    .line 307
    .line 308
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 309
    .line 310
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 311
    .line 312
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 313
    .line 314
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    if-eqz v7, :cond_a

    .line 319
    .line 320
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 321
    .line 322
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 323
    .line 324
    .line 325
    move-result p1

    .line 326
    if-eqz p1, :cond_a

    .line 327
    .line 328
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-eqz p1, :cond_a

    .line 337
    .line 338
    new-instance p1, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 341
    .line 342
    .line 343
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 344
    .line 345
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    sget v1, Lcom/p1/mobile/putong/core/R$string;->C0:I

    .line 354
    .line 355
    invoke-virtual {p0, v1}, Ll/dy90;->a0(I)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    :cond_a
    iget-object p1, p0, Ll/dy90;->F:Lv/VText;

    .line 370
    .line 371
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 372
    .line 373
    .line 374
    iget-object p1, p0, Ll/dy90;->F:Lv/VText;

    .line 375
    .line 376
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 381
    .line 382
    .line 383
    move-result v1

    .line 384
    if-eqz v1, :cond_b

    .line 385
    .line 386
    :goto_5
    move v1, v3

    .line 387
    goto :goto_6

    .line 388
    :cond_b
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 389
    .line 390
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 391
    .line 392
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    if-nez v1, :cond_c

    .line 397
    .line 398
    goto :goto_5

    .line 399
    :cond_c
    move v1, v2

    .line 400
    :goto_6
    invoke-virtual {p0, p1, v1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 401
    .line 402
    .line 403
    iget-object p1, p0, Ll/dy90;->D:Lv/VText;

    .line 404
    .line 405
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 406
    .line 407
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 408
    .line 409
    if-eqz v1, :cond_d

    .line 410
    .line 411
    goto :goto_7

    .line 412
    :cond_d
    move v2, v3

    .line 413
    :goto_7
    invoke-virtual {p0, p1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 414
    .line 415
    .line 416
    :goto_8
    invoke-static {}, Ll/r43;->b()Z

    .line 417
    .line 418
    .line 419
    move-result p1

    .line 420
    const/4 v1, 0x1

    .line 421
    if-eqz p1, :cond_f

    .line 422
    .line 423
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 424
    .line 425
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 426
    .line 427
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 428
    .line 429
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 430
    .line 431
    .line 432
    move-result p1

    .line 433
    if-nez p1, :cond_e

    .line 434
    .line 435
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 436
    .line 437
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 438
    .line 439
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 440
    .line 441
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 446
    .line 447
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 448
    .line 449
    .line 450
    move-result p1

    .line 451
    if-nez p1, :cond_e

    .line 452
    .line 453
    iget-object p1, p0, Ll/dy90;->y:Lv/VText;

    .line 454
    .line 455
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 456
    .line 457
    .line 458
    iget-object p1, p0, Ll/dy90;->y:Lv/VText;

    .line 459
    .line 460
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 461
    .line 462
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 463
    .line 464
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 465
    .line 466
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    check-cast v2, Lcom/p1/mobile/putong/data/BloodType;

    .line 471
    .line 472
    invoke-static {v2}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v2

    .line 476
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 477
    .line 478
    .line 479
    goto :goto_9

    .line 480
    :cond_e
    iget-object p1, p0, Ll/dy90;->y:Lv/VText;

    .line 481
    .line 482
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 483
    .line 484
    .line 485
    goto :goto_9

    .line 486
    :cond_f
    iget-object p1, p0, Ll/dy90;->y:Lv/VText;

    .line 487
    .line 488
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 489
    .line 490
    .line 491
    :goto_9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-eqz p1, :cond_14

    .line 496
    .line 497
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 502
    .line 503
    .line 504
    move-result p1

    .line 505
    if-nez p1, :cond_11

    .line 506
    .line 507
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 508
    .line 509
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 510
    .line 511
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 512
    .line 513
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 514
    .line 515
    .line 516
    move-result p1

    .line 517
    if-nez p1, :cond_10

    .line 518
    .line 519
    goto :goto_a

    .line 520
    :cond_10
    iget-object p1, p0, Ll/dy90;->w:Lv/VText;

    .line 521
    .line 522
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 523
    .line 524
    .line 525
    goto :goto_b

    .line 526
    :cond_11
    :goto_a
    iget-object p1, p0, Ll/dy90;->w:Lv/VText;

    .line 527
    .line 528
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 529
    .line 530
    .line 531
    iget-object p1, p0, Ll/dy90;->w:Lv/VText;

    .line 532
    .line 533
    sget-object v2, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 534
    .line 535
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 536
    .line 537
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 538
    .line 539
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 540
    .line 541
    invoke-virtual {v2, v5}, Ll/rpa0;->d(Ljava/util/List;)Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v2

    .line 545
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 546
    .line 547
    .line 548
    :goto_b
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 549
    .line 550
    .line 551
    move-result-object p1

    .line 552
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 553
    .line 554
    .line 555
    move-result p1

    .line 556
    if-nez p1, :cond_13

    .line 557
    .line 558
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 559
    .line 560
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 561
    .line 562
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 563
    .line 564
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 565
    .line 566
    .line 567
    move-result p1

    .line 568
    if-nez p1, :cond_12

    .line 569
    .line 570
    goto :goto_c

    .line 571
    :cond_12
    iget-object p1, p0, Ll/dy90;->x:Lv/VText;

    .line 572
    .line 573
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 574
    .line 575
    .line 576
    goto :goto_d

    .line 577
    :cond_13
    :goto_c
    iget-object p1, p0, Ll/dy90;->x:Lv/VText;

    .line 578
    .line 579
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 580
    .line 581
    .line 582
    iget-object p1, p0, Ll/dy90;->x:Lv/VText;

    .line 583
    .line 584
    sget-object v2, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 585
    .line 586
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 587
    .line 588
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 589
    .line 590
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 591
    .line 592
    invoke-virtual {v2, v5}, Ll/rpa0;->e(Ljava/util/List;)Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v2

    .line 596
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    .line 598
    .line 599
    :cond_14
    :goto_d
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 600
    .line 601
    .line 602
    move-result-object p1

    .line 603
    sget v2, Ll/c9c0;->O1:I

    .line 604
    .line 605
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 606
    .line 607
    .line 608
    move-result p1

    .line 609
    iget-object v2, p0, Ll/dy90;->D:Lv/VText;

    .line 610
    .line 611
    invoke-virtual {p0, p1, v2}, Ll/ep90;->C(ILandroid/widget/TextView;)V

    .line 612
    .line 613
    .line 614
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 615
    .line 616
    .line 617
    move-result-object p1

    .line 618
    sget v2, Ll/c9c0;->O1:I

    .line 619
    .line 620
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    iget-object v2, p0, Ll/dy90;->C:Lv/VText;

    .line 625
    .line 626
    invoke-virtual {p0, p1, v2}, Ll/ep90;->C(ILandroid/widget/TextView;)V

    .line 627
    .line 628
    .line 629
    iget-object p1, p0, Ll/dy90;->I:Lv/VText;

    .line 630
    .line 631
    invoke-direct {p0, v0}, Ll/dy90;->W(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v2

    .line 635
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 636
    .line 637
    .line 638
    iget-object p1, p0, Ll/dy90;->K:Lv/VText;

    .line 639
    .line 640
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 641
    .line 642
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 646
    .line 647
    .line 648
    move-result-object p1

    .line 649
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 650
    .line 651
    .line 652
    move-result p1

    .line 653
    if-nez p1, :cond_19

    .line 654
    .line 655
    iget-object p1, p0, Ll/dy90;->B:Lv/VText;

    .line 656
    .line 657
    invoke-virtual {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 658
    .line 659
    .line 660
    iget-object p1, p0, Ll/dy90;->C:Lv/VText;

    .line 661
    .line 662
    invoke-virtual {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 663
    .line 664
    .line 665
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 666
    .line 667
    .line 668
    move-result p1

    .line 669
    if-eqz p1, :cond_15

    .line 670
    .line 671
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 672
    .line 673
    .line 674
    move-result-object p1

    .line 675
    invoke-interface {p1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 676
    .line 677
    .line 678
    move-result-object p1

    .line 679
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 680
    .line 681
    .line 682
    move-result p1

    .line 683
    if-nez p1, :cond_15

    .line 684
    .line 685
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 686
    .line 687
    .line 688
    move-result-object p1

    .line 689
    invoke-interface {p1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 690
    .line 691
    .line 692
    move-result-object p1

    .line 693
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 694
    .line 695
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 696
    .line 697
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 698
    .line 699
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 700
    .line 701
    .line 702
    move-result p1

    .line 703
    if-eqz p1, :cond_16

    .line 704
    .line 705
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 706
    .line 707
    .line 708
    move-result-object p1

    .line 709
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 710
    .line 711
    .line 712
    move-result p1

    .line 713
    if-eqz p1, :cond_15

    .line 714
    .line 715
    goto :goto_e

    .line 716
    :cond_15
    iget-object p1, p0, Ll/dy90;->D:Lv/VText;

    .line 717
    .line 718
    invoke-virtual {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 719
    .line 720
    .line 721
    :cond_16
    :goto_e
    iget-object p1, p0, Ll/dy90;->I:Lv/VText;

    .line 722
    .line 723
    invoke-virtual {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 724
    .line 725
    .line 726
    iget-object p1, p0, Ll/dy90;->K:Lv/VText;

    .line 727
    .line 728
    invoke-virtual {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 729
    .line 730
    .line 731
    iget-boolean p1, p0, Ll/dy90;->R:Z

    .line 732
    .line 733
    iget-object v0, p0, Ll/dy90;->B:Lv/VText;

    .line 734
    .line 735
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 736
    .line 737
    .line 738
    move-result v0

    .line 739
    if-eqz v0, :cond_18

    .line 740
    .line 741
    iget-object v0, p0, Ll/dy90;->D:Lv/VText;

    .line 742
    .line 743
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 744
    .line 745
    .line 746
    move-result v0

    .line 747
    if-eqz v0, :cond_18

    .line 748
    .line 749
    iget-object v0, p0, Ll/dy90;->G:Lv/VText;

    .line 750
    .line 751
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 752
    .line 753
    .line 754
    move-result v0

    .line 755
    if-eqz v0, :cond_18

    .line 756
    .line 757
    iget-object v0, p0, Ll/dy90;->C:Lv/VText;

    .line 758
    .line 759
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 760
    .line 761
    .line 762
    move-result v0

    .line 763
    if-eqz v0, :cond_18

    .line 764
    .line 765
    iget-object v0, p0, Ll/dy90;->I:Lv/VText;

    .line 766
    .line 767
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    if-eqz v0, :cond_18

    .line 772
    .line 773
    iget-object v0, p0, Ll/dy90;->K:Lv/VText;

    .line 774
    .line 775
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 776
    .line 777
    .line 778
    move-result v0

    .line 779
    if-eqz v0, :cond_18

    .line 780
    .line 781
    iget-object v0, p0, Ll/dy90;->z:Lv/VText;

    .line 782
    .line 783
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 784
    .line 785
    .line 786
    move-result v0

    .line 787
    if-eqz v0, :cond_18

    .line 788
    .line 789
    iget-object v0, p0, Ll/dy90;->y:Lv/VText;

    .line 790
    .line 791
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 792
    .line 793
    .line 794
    move-result v0

    .line 795
    if-nez v0, :cond_17

    .line 796
    .line 797
    goto :goto_f

    .line 798
    :cond_17
    iput-boolean v3, p0, Ll/dy90;->R:Z

    .line 799
    .line 800
    goto :goto_10

    .line 801
    :cond_18
    :goto_f
    iput-boolean v1, p0, Ll/dy90;->R:Z

    .line 802
    .line 803
    :goto_10
    iget-boolean v0, p0, Ll/dy90;->R:Z

    .line 804
    .line 805
    if-eq p1, v0, :cond_19

    .line 806
    .line 807
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 808
    .line 809
    .line 810
    move-result-object p0

    .line 811
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 812
    .line 813
    .line 814
    :cond_19
    return-void
.end method

.method public f0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy90;->D:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/dy90;->G:Lv/VText;

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy90;->C:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy90;->G:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/dy90;->D:Lv/VText;

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i0(Lv/VText;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bnl0;->N0(Landroid/widget/TextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dy90;->U()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dy90;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/dy90;->R:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dy90;->b0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/dy90;->T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/dy90;->e0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
