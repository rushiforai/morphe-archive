.class public Ll/fph0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static A:Ll/l4g0; = null

.field public static a:Ljava/lang/String; = "signup"

.field public static b:Ljava/lang/String; = "profile"

.field public static c:Ljava/lang/String; = "message"

.field public static d:Ljava/lang/String; = "moments"

.field public static e:Ljava/lang/String; = "student_certification"

.field public static f:Ljava/lang/String; = "feedback"

.field public static g:Ljava/lang/String; = "fake"

.field public static h:Ljava/lang/String; = "home"

.field public static i:Ll/l4g0;

.field public static j:Ll/l4g0;

.field public static k:Ll/l4g0;

.field public static l:Ll/l4g0;

.field public static m:Ll/l4g0;

.field public static n:Ll/l4g0;

.field public static o:Ll/l4g0;

.field public static p:Ll/l4g0;

.field public static q:Ll/l4g0;

.field public static r:Ll/l4g0;

.field public static s:Ll/l4g0;

.field public static t:Ll/l4g0;

.field public static u:Ll/l4g0;

.field public static v:Ll/l4g0;

.field public static w:Ll/l4g0;

.field public static x:Ll/l4g0;

.field public static y:Ll/l4g0;

.field public static z:Ll/l4g0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "p_sys_album_auth_popup_view"

    .line 10
    .line 11
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/fph0;->i:Ll/l4g0;

    .line 15
    .line 16
    new-instance v0, Ll/l4g0;

    .line 17
    .line 18
    const-string v2, "p_prompt_album_auth_popup_view"

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/fph0;->j:Ll/l4g0;

    .line 28
    .line 29
    new-instance v0, Ll/l4g0;

    .line 30
    .line 31
    const-string v2, "p_second_prompt_album_auth_popup_view"

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Ll/fph0;->k:Ll/l4g0;

    .line 41
    .line 42
    new-instance v0, Ll/l4g0;

    .line 43
    .line 44
    const-string v2, "p_sys_location_auth_popup_view"

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Ll/fph0;->l:Ll/l4g0;

    .line 54
    .line 55
    new-instance v0, Ll/l4g0;

    .line 56
    .line 57
    const-string v2, "p_privacy_setting_popup_view"

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sput-object v0, Ll/fph0;->m:Ll/l4g0;

    .line 67
    .line 68
    new-instance v0, Ll/l4g0;

    .line 69
    .line 70
    const-string v2, "p_sys_address_book_auth_popup_view"

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Ll/fph0;->n:Ll/l4g0;

    .line 80
    .line 81
    new-instance v0, Ll/l4g0;

    .line 82
    .line 83
    const-string v2, "p_prompt_address_book_auth_popup_view"

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    sput-object v0, Ll/fph0;->o:Ll/l4g0;

    .line 93
    .line 94
    new-instance v0, Ll/l4g0;

    .line 95
    .line 96
    const-string v2, "p_second_prompt_address_book_auth_popup_view"

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    sput-object v0, Ll/fph0;->p:Ll/l4g0;

    .line 106
    .line 107
    new-instance v0, Ll/l4g0;

    .line 108
    .line 109
    const-string v2, "p_prompt_notification_auth_popup_view"

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sput-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 119
    .line 120
    new-instance v0, Ll/l4g0;

    .line 121
    .line 122
    const-string v2, "p_sys_phone_auth_popup_view"

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    sput-object v0, Ll/fph0;->r:Ll/l4g0;

    .line 132
    .line 133
    new-instance v0, Ll/l4g0;

    .line 134
    .line 135
    const-string v2, "p_prompt_phone_auth_popup_view"

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    sput-object v0, Ll/fph0;->s:Ll/l4g0;

    .line 145
    .line 146
    new-instance v0, Ll/l4g0;

    .line 147
    .line 148
    const-string v2, "p_second_prompt_phone_auth_popup_view"

    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    sput-object v0, Ll/fph0;->t:Ll/l4g0;

    .line 158
    .line 159
    new-instance v0, Ll/l4g0;

    .line 160
    .line 161
    const-string v2, "p_first_like_popup_view"

    .line 162
    .line 163
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 171
    .line 172
    new-instance v0, Ll/l4g0;

    .line 173
    .line 174
    const-string v2, "p_first_dislike_popup_view"

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    sput-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 184
    .line 185
    new-instance v0, Ll/l4g0;

    .line 186
    .line 187
    const-string v2, "p_fake_alert_popup_view"

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sput-object v0, Ll/fph0;->w:Ll/l4g0;

    .line 197
    .line 198
    new-instance v0, Ll/l4g0;

    .line 199
    .line 200
    const-string v2, "p_fake_submit_new_image_popup_view"

    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    sput-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 210
    .line 211
    new-instance v0, Ll/l4g0;

    .line 212
    .line 213
    const-string v2, "p_forbidden_good_to_fake_popup_view"

    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    sput-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 223
    .line 224
    new-instance v0, Ll/l4g0;

    .line 225
    .line 226
    const-string v2, "p_binding_phone_number_popup_view"

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sput-object v0, Ll/fph0;->z:Ll/l4g0;

    .line 236
    .line 237
    new-instance v0, Ll/l4g0;

    .line 238
    .line 239
    const-string v2, "p_fake_avatar_star"

    .line 240
    .line 241
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    sput-object v0, Ll/fph0;->A:Ll/l4g0;

    .line 249
    .line 250
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

.method public static A()V
    .locals 2

    .line 1
    const-string v0, "e_first_like_popup_confirm_button"

    .line 2
    .line 3
    const-string v1, "p_first_like_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static B()V
    .locals 2

    .line 1
    const-string v0, "e_first_like_popup_cancel_button"

    .line 2
    .line 3
    const-string v1, "p_first_like_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static C()V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "tooltips_trigger_mode"

    .line 4
    .line 5
    const-string v2, "passive"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v1, "tooltips_type"

    .line 12
    .line 13
    const-string v2, "alert"

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    const-string v1, "tooltips_type_ui"

    .line 20
    .line 21
    const-string v2, "alert_self_definition_basic"

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const-string v1, "tooltips_trigger_module"

    .line 28
    .line 29
    const-string v2, "card"

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    const-string v1, "tooltips_trigger_page"

    .line 36
    .line 37
    const-string v2, "swipe_page"

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    const-string v1, "tooltips_trigger_reason"

    .line 44
    .line 45
    const-string v2, "swipe"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    filled-new-array/range {v3 .. v8}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 65
    .line 66
    .line 67
    sget-object v0, Ll/fph0;->u:Ll/l4g0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static D()V
    .locals 2

    .line 1
    const-string v0, "e_forbidden_good_to_fake_popup_keep_button"

    .line 2
    .line 3
    const-string v1, "p_forbidden_good_to_fake_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static E()V
    .locals 7

    .line 1
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 2
    .line 3
    const-string v5, "swipe_page"

    .line 4
    .line 5
    const-string v6, "exchange_picture"

    .line 6
    .line 7
    const-string v1, "passive"

    .line 8
    .line 9
    const-string v2, "alert"

    .line 10
    .line 11
    const-string v3, "alert_self_definition_basic"

    .line 12
    .line 13
    const-string v4, "null"

    .line 14
    .line 15
    invoke-static/range {v1 .. v6}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static F()V
    .locals 2

    .line 1
    const-string v0, "e_forbidden_good_to_fake_popup_upload_button"

    .line 2
    .line 3
    const-string v1, "p_forbidden_good_to_fake_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->y:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static G()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "userid"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_forbidden_good_to_fake_upload_newavatar_success"

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static H(Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "userid"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 18
    .line 19
    const/16 v1, 0x1d

    .line 20
    .line 21
    if-lt p0, v1, :cond_1

    .line 22
    .line 23
    const-string p0, "android.permission.ACCESS_BACKGROUND_LOCATION"

    .line 24
    .line 25
    filled-new-array {p0}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "wheninuse"

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    const-string p0, "on"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    const-string p0, "off"

    .line 43
    .line 44
    :goto_1
    const-string v1, "user_auth"

    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v0, "e_location_auth_success"

    .line 55
    .line 56
    const-string v1, ""

    .line 57
    .line 58
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static I()V
    .locals 2

    .line 1
    const-string v0, "e_prompt_notification_auth_popup_open_button"

    .line 2
    .line 3
    const-string v1, "p_prompt_notification_auth_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {v0}, Ll/fph0;->J(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static J(Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "userid"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "on"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "off"

    .line 21
    .line 22
    :goto_0
    const-string v1, "user_auth"

    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "e_notification_auth_success"

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static K()V
    .locals 2

    .line 1
    const-string v0, "e_chat_prompt_notification_auth_banner_open_button"

    .line 2
    .line 3
    const-string v1, "p_chat_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static L()V
    .locals 2

    .line 1
    const-string v0, "e_chat_prompt_notification_auth_banner_open_button"

    .line 2
    .line 3
    const-string v1, "p_chat_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static M()V
    .locals 2

    .line 1
    const-string v0, "e_prompt_notification_auth_popup_close_button"

    .line 2
    .line 3
    const-string v1, "p_prompt_notification_auth_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static N()V
    .locals 8

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_prompt_notification_auth_popup_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v6, "anywhere"

    .line 16
    .line 17
    const-string v7, "no_permission_notice"

    .line 18
    .line 19
    const-string v2, "passive"

    .line 20
    .line 21
    const-string v3, "alert"

    .line 22
    .line 23
    const-string v4, "alert_self_definition_basic"

    .line 24
    .line 25
    const-string v5, "null"

    .line 26
    .line 27
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Ll/fph0;->q:Ll/l4g0;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/fph0;->q:Ll/l4g0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static O()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 24
    .line 25
    const-string v2, "wechat"

    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    const-string v1, "only_wechat"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v1, "phone_number_wechat"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string v1, "only_phone_number"

    .line 46
    .line 47
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string v3, "userid"

    .line 58
    .line 59
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-string v3, "phone_number_type"

    .line 64
    .line 65
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    const-string v4, ""

    .line 74
    .line 75
    if-eqz v3, :cond_2

    .line 76
    .line 77
    move-object v0, v4

    .line 78
    :cond_2
    const-string v3, "phone_num"

    .line 79
    .line 80
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    filled-new-array {v2, v1, v0}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "e_phone_number_success"

    .line 89
    .line 90
    invoke-static {v1, v4, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static P(Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/fph0;->m:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "on"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "off"

    .line 9
    .line 10
    :goto_0
    const-string v1, "get_phone_number"

    .line 11
    .line 12
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Ll/fph0;->m:Ll/l4g0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 30
    .line 31
    .line 32
    sget-object p0, Ll/fph0;->m:Ll/l4g0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static Q(ZZZ)V
    .locals 3

    .line 1
    const-string v0, "off"

    .line 2
    .line 3
    const-string v1, "on"

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    move-object p0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object p0, v0

    .line 10
    :goto_0
    const-string v2, "block_contacts"

    .line 11
    .line 12
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move-object p1, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move-object p1, v0

    .line 21
    :goto_1
    const-string v2, "common_contacts"

    .line 22
    .line 23
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p2, :cond_2

    .line 28
    .line 29
    move-object v0, v1

    .line 30
    :cond_2
    const-string p2, "binding_phone_number"

    .line 31
    .line 32
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "e_privacy_setting_popup_start_button"

    .line 41
    .line 42
    const-string p2, "p_privacy_setting_popup_view"

    .line 43
    .line 44
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Ll/fph0;->m:Ll/l4g0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 50
    .line 51
    .line 52
    sget-object p0, Ll/fph0;->m:Ll/l4g0;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static R(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_prompt_address_book_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_address_book_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static S(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_prompt_address_book_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_address_book_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static T(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->o:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "logon_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_mail_list"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->o:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static U(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_prompt_album_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static V(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_prompt_album_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static W(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->j:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_photo"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->j:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static X(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_second_prompt_address_book_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_address_book_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static Y(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_second_prompt_address_book_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_address_book_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static Z(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->p:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "logon_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_mail_list"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->p:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static a(Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "userid"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "on"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "off"

    .line 21
    .line 22
    :goto_0
    const-string v1, "user_auth"

    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "e_address_book_auth_success"

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static a0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_second_prompt_album_auth_popup_open_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static b(Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "userid"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "on"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "off"

    .line 21
    .line 22
    :goto_0
    const-string v1, "user_auth"

    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "e_album_auth_success"

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static b0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_second_prompt_album_auth_popup_close_button"

    .line 12
    .line 13
    const-string v1, "p_second_prompt_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "skipable"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_binding_phone_number_popup_binding_button"

    .line 12
    .line 13
    const-string v1, "p_binding_phone_number_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c0(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->k:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_storage"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->k:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "skipable"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "number_type"

    .line 8
    .line 9
    const-string v1, "one_click"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "e_binding_phone_number_popup_other_number_button"

    .line 20
    .line 21
    const-string v1, "p_binding_phone_number_popup_view"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static d0(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 7
    .line 8
    sget-object p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    iput-object p0, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iput-object p1, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 19
    .line 20
    :cond_0
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static e()V
    .locals 3

    .line 1
    const-string v0, "skipable"

    .line 2
    .line 3
    const-string v1, "on"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_binding_phone_number_popup_close_button"

    .line 14
    .line 15
    const-string v2, "p_binding_phone_number_popup_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static e0()V
    .locals 2

    .line 1
    const-string v0, "e_suggest_users_home_page_location_button"

    .line 2
    .line 3
    const-string v1, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->z:Ll/l4g0;

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
    sget-object v0, Ll/fph0;->z:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/fph0;->z:Ll/l4g0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static f0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_sys_address_book_auth_popup_allowed_button"

    .line 12
    .line 13
    const-string v1, "p_sys_address_book_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    invoke-static {p0}, Ll/fph0;->a(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "skipable"

    .line 10
    .line 11
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string p0, "number_type"

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string p0, "tooltips_trigger_mode"

    .line 22
    .line 23
    const-string p1, "passive"

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p0, "tooltips_type"

    .line 30
    .line 31
    const-string p1, "alert"

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-string p0, "tooltips_type_ui"

    .line 38
    .line 39
    const-string p1, "alert_special"

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string p0, "tooltips_trigger_module"

    .line 46
    .line 47
    const-string p1, "privacy_settings"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string p0, "tooltips_trigger_page"

    .line 54
    .line 55
    const-string p1, "swipe_page"

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    const-string p0, "tooltips_trigger_reason"

    .line 62
    .line 63
    const-string p1, "unbound_phone_number"

    .line 64
    .line 65
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v9

    .line 69
    filled-new-array/range {v2 .. v9}, [Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p1, "p_binding_phone_number_popup_view"

    .line 78
    .line 79
    invoke-virtual {v0, p1, p0}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget-object p1, Ll/fph0;->z:Ll/l4g0;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 86
    .line 87
    .line 88
    sget-object p0, Ll/fph0;->z:Ll/l4g0;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 91
    .line 92
    .line 93
    sget-object p0, Ll/fph0;->z:Ll/l4g0;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public static g0(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "off"

    .line 13
    .line 14
    :goto_0
    const-string v0, "no_longer_ask"

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_sys_address_book_auth_popup_denied_button"

    .line 25
    .line 26
    const-string v0, "p_sys_address_book_auth_popup_view"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 34
    .line 35
    .line 36
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static h(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "skipable"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_binding_phone_number_popup_verification_code_button"

    .line 12
    .line 13
    const-string v1, "p_binding_phone_number_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static h0(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->n:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "logon_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_mail_list"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->n:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static i(Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "off"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "on"

    .line 7
    .line 8
    :goto_0
    const-string v0, "skipable"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "userid"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "e_binding_phone_number_popup_binding_phone_number_success_failed"

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/fph0;->d0(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static i0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_sys_album_auth_popup_allowed_button"

    .line 12
    .line 13
    const-string v1, "p_sys_album_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    invoke-static {p0}, Ll/fph0;->b(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static j(ZLjava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "userid"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "off"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "on"

    .line 23
    .line 24
    :goto_0
    const-string v1, "skipable"

    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "phone_num"

    .line 31
    .line 32
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    filled-new-array {v0, p0, p1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "e_binding_phone_number_popup_binding_phone_number_success"

    .line 41
    .line 42
    const-string v0, ""

    .line 43
    .line 44
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/fph0;->O()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static j0(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "off"

    .line 13
    .line 14
    :goto_0
    const-string v0, "no_longer_ask"

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_sys_album_auth_popup_denied_button"

    .line 25
    .line 26
    const-string v0, "p_sys_album_auth_popup_view"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 34
    .line 35
    .line 36
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static k()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "userid"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_binding_phone_number_popup_signout_success"

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static k0(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->i:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "system_alert"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "media_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "no_permission_photo"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->i:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static l()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "userid"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "phone_num"

    .line 32
    .line 33
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    filled-new-array {v1, v0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "e_block_contacts_page_binding_phone_number_success"

    .line 42
    .line 43
    const-string v2, ""

    .line 44
    .line 45
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static l0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_sys_location_auth_popup_allowed_button"

    .line 12
    .line 13
    const-string v1, "p_sys_location_auth_popup_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    invoke-static {p0}, Ll/fph0;->H(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static varargs m([Ll/pf60;)Lorg/json/JSONObject;
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 14
    .line 15
    .line 16
    :try_start_1
    array-length v1, p0

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v1, :cond_0

    .line 19
    .line 20
    aget-object v3, p0, v2

    .line 21
    .line 22
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v4, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 29
    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    move-object v1, v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    return-object v0

    .line 38
    :catch_1
    move-exception p0

    .line 39
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-object v1
.end method

.method public static m0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "auth_source"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "no_longer_ask"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_sys_location_auth_popup_denied_button"

    .line 18
    .line 19
    const-string v0, "p_sys_location_auth_popup_view"

    .line 20
    .line 21
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static n()V
    .locals 2

    .line 1
    const-string v0, "e_fake_alert_popup_replace_button"

    .line 2
    .line 3
    const-string v1, "p_fake_alert_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n0(Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->l:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "auth_source"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string p0, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v1, "passive"

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string p0, "tooltips_type"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string p0, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v1, "alert_self_definition_basic"

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string p0, "tooltips_trigger_module"

    .line 34
    .line 35
    const-string v1, "null"

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string p0, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v1, "logon_page"

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string p0, "tooltips_trigger_reason"

    .line 50
    .line 51
    const-string v1, "get_location_permission"

    .line 52
    .line 53
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/fph0;->l:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static o()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->w:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/fph0;->w:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "swipe_page"

    .line 8
    .line 9
    :cond_0
    move-object v4, p0

    .line 10
    const-string v5, "swipe"

    .line 11
    .line 12
    const-string v0, "passive"

    .line 13
    .line 14
    const-string v1, "alert"

    .line 15
    .line 16
    const-string v2, "alert_self_definition_basic"

    .line 17
    .line 18
    const-string v3, "card"

    .line 19
    .line 20
    invoke-static/range {v0 .. v5}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/dkb;->W7()Z

    .line 29
    .line 30
    .line 31
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    const-string v1, "fake_status"

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    :try_start_1
    const-string v0, "gender"

    .line 37
    .line 38
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :catch_0
    move-exception v0

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/dkb;->k8()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    const-string v0, "age"

    .line 55
    .line 56
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    const-string v0, "unreal"

    .line 71
    .line 72
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/dkb;->Y7()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    const-string v0, "violation"

    .line 87
    .line 88
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_1
    sget-object v0, Ll/fph0;->w:Ll/l4g0;

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 101
    .line 102
    .line 103
    sget-object p0, Ll/fph0;->w:Ll/l4g0;

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 106
    .line 107
    .line 108
    sget-object p0, Ll/fph0;->w:Ll/l4g0;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static q()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static r()V
    .locals 2

    .line 1
    const-string v0, "e_fake_submit_new_image_popup_known_button"

    .line 2
    .line 3
    const-string v1, "p_fake_submit_new_image_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static s()V
    .locals 7

    .line 1
    sget-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 2
    .line 3
    const-string v5, "swipe_page"

    .line 4
    .line 5
    const-string v6, "exchange_picture"

    .line 6
    .line 7
    const-string v1, "passive"

    .line 8
    .line 9
    const-string v2, "alert"

    .line 10
    .line 11
    const-string v3, "alert_self_definition_basic"

    .line 12
    .line 13
    const-string v4, "null"

    .line 14
    .line 15
    invoke-static/range {v1 .. v6}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/fph0;->x:Ll/l4g0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static t()V
    .locals 1

    .line 1
    sget-object v0, Ll/fph0;->A:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/fph0;->A:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static u(I)V
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "appeal_times"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    sget-object p0, Ll/fph0;->A:Ll/l4g0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Ll/fph0;->A:Ll/l4g0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 24
    .line 25
    .line 26
    sget-object p0, Ll/fph0;->A:Ll/l4g0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static v()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {v0}, Ll/fph0;->w(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "userid"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_fake_upload_newavatar_success"

    .line 22
    .line 23
    invoke-static {v1, p0, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static x()V
    .locals 2

    .line 1
    const-string v0, "e_first_dislike_popup_confirm_button"

    .line 2
    .line 3
    const-string v1, "p_first_dislike_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static y()V
    .locals 2

    .line 1
    const-string v0, "e_first_dislike_popup_cancel_button"

    .line 2
    .line 3
    const-string v1, "p_first_dislike_popup_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static z()V
    .locals 9

    .line 1
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "tooltips_trigger_mode"

    .line 4
    .line 5
    const-string v2, "passive"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v1, "tooltips_type"

    .line 12
    .line 13
    const-string v2, "alert"

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    const-string v1, "tooltips_type_ui"

    .line 20
    .line 21
    const-string v2, "alert_self_definition_basic"

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const-string v1, "tooltips_trigger_module"

    .line 28
    .line 29
    const-string v2, "card"

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    const-string v1, "tooltips_trigger_page"

    .line 36
    .line 37
    const-string v2, "swipe_page"

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    const-string v1, "tooltips_trigger_reason"

    .line 44
    .line 45
    const-string v2, "swipe"

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    filled-new-array/range {v3 .. v8}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/fph0;->m([Ll/pf60;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 65
    .line 66
    .line 67
    sget-object v0, Ll/fph0;->v:Ll/l4g0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 70
    .line 71
    .line 72
    return-void
.end method
