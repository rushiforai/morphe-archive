.class public Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->a5(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->F:I

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->Z4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 50
    .line 51
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->F:I

    .line 52
    .line 53
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x1

    .line 58
    if-eqz v0, :cond_6

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 61
    .line 62
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->F:I

    .line 63
    .line 64
    if-eqz v2, :cond_5

    .line 65
    .line 66
    if-eq v2, v1, :cond_4

    .line 67
    .line 68
    const/4 v3, 0x2

    .line 69
    if-eq v2, v3, :cond_3

    .line 70
    .line 71
    const/4 v3, 0x3

    .line 72
    if-eq v2, v3, :cond_2

    .line 73
    .line 74
    const/4 v3, 0x4

    .line 75
    if-eq v2, v3, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const-string v2, "select"

    .line 79
    .line 80
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    const-string v2, "new"

    .line 84
    .line 85
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    const-string v2, "popular"

    .line 89
    .line 90
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    const-string v2, "online"

    .line 94
    .line 95
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_5
    const-string v2, "nearby"

    .line 99
    .line 100
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 101
    .line 102
    :cond_6
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;

    .line 107
    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 109
    .line 110
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->Z4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 123
    .line 124
    iget v2, v2, Lcom/p1/mobile/putong/core/data/GPTopicCard;->iconRes:I

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->q(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v0}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 138
    .line 139
    if-eqz v0, :cond_7

    .line 140
    .line 141
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->B:Lv/VButton;

    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 147
    .line 148
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->B:Lv/VButton;

    .line 149
    .line 150
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->Z4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 163
    .line 164
    iget p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->payBtnDesc:I

    .line 165
    .line 166
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_7
    iget-object p1, v2, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->B:Lv/VButton;

    .line 171
    .line 172
    const/4 v0, 0x0

    .line 173
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 177
    .line 178
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 183
    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->E:Ljava/lang/String;

    .line 185
    .line 186
    const-string v1, "theme_type"

    .line 187
    .line 188
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    filled-new-array {v0}, [Ll/pf60;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 206
    .line 207
    .line 208
    :cond_8
    :goto_2
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag$a;->a:Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;->Z4(Lcom/p1/mobile/putong/core/newui/discovery/ThemeSuggestFrag;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->z(Lcom/p1/mobile/putong/core/data/GPTopicCard;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
