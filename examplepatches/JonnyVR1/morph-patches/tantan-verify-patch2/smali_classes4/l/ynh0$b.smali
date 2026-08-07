.class public Ll/ynh0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ynh0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ynh0;


# direct methods
.method public constructor <init>(Ll/ynh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "marryMode"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_3

    .line 20
    .line 21
    iget-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 22
    .line 23
    invoke-static {p1}, Ll/ynh0;->C(Ll/ynh0;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v1, "mode_select"

    .line 28
    .line 29
    const-string v2, "marry"

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "e_mode_sidebar"

    .line 40
    .line 41
    invoke-static {v2, p1, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    iget-object p1, p1, Ll/dkb;->F4:Ll/jxd0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    invoke-virtual {p1, v1}, Ll/dkb;->b8(Z)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 109
    .line 110
    if-eqz p1, :cond_0

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 127
    .line 128
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 129
    .line 130
    if-eqz p1, :cond_0

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 136
    .line 137
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 145
    .line 146
    iget-object p1, p1, Ll/dkb;->F1:Lrx/subjects/b;

    .line 147
    .line 148
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 154
    .line 155
    iget-object p1, p1, Ll/ynh0;->h:Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 158
    .line 159
    if-eqz v0, :cond_1

    .line 160
    .line 161
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 162
    .line 163
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 166
    .line 167
    .line 168
    const-string p1, "\u5df2\u5207\u6362\u4e3a\u60f3\u7ed3\u5a5a\u6a21\u5f0f"

    .line 169
    .line 170
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_1
    iget-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 174
    .line 175
    invoke-static {p1}, Ll/ynh0;->z(Ll/ynh0;)Lv/VImage;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    sget v0, Ll/dbc0;->gr:I

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 185
    .line 186
    invoke-static {p0}, Ll/ynh0;->A(Ll/ynh0;)Lv/VImage;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    sget p1, Ll/dbc0;->fr:I

    .line 191
    .line 192
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 197
    .line 198
    iget-object p1, p1, Ll/ynh0;->h:Lcom/p1/mobile/android/app/Act;

    .line 199
    .line 200
    const-string v0, "mode_switching"

    .line 201
    .line 202
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->d2(Landroid/content/Intent;)V

    .line 207
    .line 208
    .line 209
    iget-object p0, p0, Ll/ynh0$b;->a:Ll/ynh0;

    .line 210
    .line 211
    iget-object p0, p0, Ll/ynh0;->h:Lcom/p1/mobile/android/app/Act;

    .line 212
    .line 213
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 214
    .line 215
    .line 216
    :cond_3
    return-void
.end method
