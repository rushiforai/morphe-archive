.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;
.super Ll/ep90;
.source "SourceFile"


# static fields
.field public static final z:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public u:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public v:Lv/VLinear;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

.field public y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder$1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->z:Ljava/util/Map;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tu90;->b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final S(Ljava/lang/String;I)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/kec0;->A9:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->u:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget v0, Ll/adc0;->w5:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VDraweeView;

    .line 29
    .line 30
    sget v1, Ll/adc0;->je:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method

.method public final T()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {v0}, Ll/td8;->u0(Ljava/util/List;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_0

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 116
    .line 117
    invoke-static {v0}, Ll/td8;->u0(Ljava/util/List;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_0

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 132
    .line 133
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 138
    .line 139
    invoke-static {v0}, Ll/td8;->u0(Ljava/util/List;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_0

    .line 144
    .line 145
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 158
    .line 159
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 160
    .line 161
    invoke-static {v0}, Ll/td8;->u0(Ljava/util/List;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_0

    .line 166
    .line 167
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 176
    .line 177
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 182
    .line 183
    invoke-static {p0}, Ll/td8;->u0(Ljava/util/List;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_1

    .line 188
    .line 189
    :cond_0
    const/4 p0, 0x1

    .line 190
    return p0

    .line 191
    :cond_1
    const/4 p0, 0x0

    .line 192
    return p0
.end method

.method public j(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 v0, 0x42600000    # 56.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sub-int/2addr p1, v0

    .line 15
    const/4 v0, 0x3

    .line 16
    div-int/2addr p1, v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 22
    .line 23
    new-array v0, v0, [Landroid/view/View;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    aput-object v1, v0, v4

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    aput-object v2, v0, v1

    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    aput-object v3, v0, v1

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 43
    .line 44
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->T()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/ExtensionGame;->nullCheck()V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Ljava/lang/String;

    .line 92
    .line 93
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->z:Ljava/util/Map;

    .line 94
    .line 95
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_1

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->S(Ljava/lang/String;I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_1

    .line 120
    .line 121
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 134
    .line 135
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 140
    .line 141
    invoke-static {v1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-nez v2, :cond_3

    .line 150
    .line 151
    const-string v2, "\u00b7"

    .line 152
    .line 153
    invoke-static {v2, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    sget v2, Ll/dbc0;->Xm:I

    .line 158
    .line 159
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->S(Ljava/lang/String;I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_3

    .line 168
    .line 169
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    :cond_3
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 183
    .line 184
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 185
    .line 186
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->level:Ljava/util/List;

    .line 187
    .line 188
    invoke-static {v1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    const/4 v3, 0x0

    .line 197
    if-nez v2, :cond_4

    .line 198
    .line 199
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Ljava/lang/String;

    .line 204
    .line 205
    sget v2, Ll/dbc0;->Rm:I

    .line 206
    .line 207
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->S(Ljava/lang/String;I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-eqz v2, :cond_4

    .line 216
    .line 217
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    :cond_4
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 229
    .line 230
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 231
    .line 232
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 233
    .line 234
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->voice:Ljava/util/List;

    .line 235
    .line 236
    invoke-static {v1}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    if-nez v2, :cond_5

    .line 245
    .line 246
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Ljava/lang/String;

    .line 251
    .line 252
    sget v2, Ll/dbc0;->Tm:I

    .line 253
    .line 254
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->S(Ljava/lang/String;I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-eqz v2, :cond_5

    .line 263
    .line 264
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->u:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 268
    .line 269
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 270
    .line 271
    .line 272
    invoke-static {}, Ll/bnl0;->y0()I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    const/high16 v1, 0x42600000    # 56.0f

    .line 277
    .line 278
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    sub-int/2addr v0, v1

    .line 283
    const/4 v1, 0x3

    .line 284
    div-int/2addr v0, v1

    .line 285
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 286
    .line 287
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 288
    .line 289
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 290
    .line 291
    new-array v6, v1, [Landroid/view/View;

    .line 292
    .line 293
    aput-object v2, v6, v3

    .line 294
    .line 295
    const/4 v2, 0x1

    .line 296
    aput-object v4, v6, v2

    .line 297
    .line 298
    const/4 v4, 0x2

    .line 299
    aput-object v5, v6, v4

    .line 300
    .line 301
    invoke-static {v0, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 302
    .line 303
    .line 304
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 305
    .line 306
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 307
    .line 308
    .line 309
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 310
    .line 311
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 312
    .line 313
    .line 314
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 315
    .line 316
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 328
    .line 329
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 330
    .line 331
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 332
    .line 333
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 334
    .line 335
    invoke-static {v0}, Ll/td8;->q0(Ljava/util/List;)Ljava/util/List;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 340
    .line 341
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 342
    .line 343
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 344
    .line 345
    filled-new-array {v4, v5, v6}, [Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 346
    .line 347
    .line 348
    move-result-object v4

    .line 349
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 354
    .line 355
    .line 356
    move-result v5

    .line 357
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 358
    .line 359
    .line 360
    move-result v5

    .line 361
    if-ge v3, v5, :cond_7

    .line 362
    .line 363
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v5

    .line 367
    check-cast v5, Ljava/lang/String;

    .line 368
    .line 369
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 370
    .line 371
    .line 372
    move-result v6

    .line 373
    if-nez v6, :cond_6

    .line 374
    .line 375
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v6

    .line 379
    check-cast v6, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 380
    .line 381
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 382
    .line 383
    .line 384
    move-result-object v7

    .line 385
    invoke-interface {v7}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 386
    .line 387
    .line 388
    move-result-object v7

    .line 389
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {v6, v7, v5}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object v5

    .line 398
    check-cast v5, Landroid/view/View;

    .line 399
    .line 400
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 401
    .line 402
    .line 403
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->v:Lv/VLinear;

    .line 404
    .line 405
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 406
    .line 407
    .line 408
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 409
    .line 410
    goto :goto_1

    .line 411
    :cond_7
    return-void
.end method
