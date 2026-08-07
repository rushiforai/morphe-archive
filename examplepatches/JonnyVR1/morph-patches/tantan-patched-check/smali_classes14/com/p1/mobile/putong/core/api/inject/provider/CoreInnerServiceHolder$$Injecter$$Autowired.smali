.class public Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder$$Injecter$$Autowired;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/ISyringe;


# direct methods
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
.method public inject(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "/innovation_service/service"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/innovation/service/CoreInnovationInnerService;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->innovationInnerService:Lcom/p1/mobile/putong/core/innovation/service/CoreInnovationInnerService;

    .line 20
    .line 21
    const-string v0, "!"

    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 24
    .line 25
    if-eqz p0, :cond_7

    .line 26
    .line 27
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v2, "/core_business/service"

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreBusinessService:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    if-eqz p0, :cond_6

    .line 46
    .line 47
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v2, "/member_service/service"

    .line 52
    .line 53
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 62
    .line 63
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreMemberInnerService:Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v2, "/pay_service/service"

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 82
    .line 83
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->corePayInnerService:Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string v2, "/message_service/service"

    .line 92
    .line 93
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    .line 102
    .line 103
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreMessageInnerService:Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    .line 104
    .line 105
    if-eqz p0, :cond_3

    .line 106
    .line 107
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string v2, "/card_service/service"

    .line 112
    .line 113
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/p1/mobile/putong/core/card/service/CoreCardInnerService;

    .line 122
    .line 123
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreCardInnerService:Lcom/p1/mobile/putong/core/card/service/CoreCardInnerService;

    .line 124
    .line 125
    if-eqz p0, :cond_2

    .line 126
    .line 127
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    const-string v2, "/profile_service/service"

    .line 132
    .line 133
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 142
    .line 143
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreProfileInnerService:Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 144
    .line 145
    if-eqz p0, :cond_1

    .line 146
    .line 147
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const-string v2, "/buzz_service/service"

    .line 152
    .line 153
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    check-cast p0, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 162
    .line 163
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreBuzzInnerService:Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 164
    .line 165
    if-eqz p0, :cond_0

    .line 166
    .line 167
    return-void

    .line 168
    :cond_0
    const-string p0, "The field \'coreBuzzInnerService\' is null, in class \'"

    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_1
    const-string p0, "The field \'coreProfileInnerService\' is null, in class \'"

    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_2
    const-string p0, "The field \'coreCardInnerService\' is null, in class \'"

    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_3
    const-string p0, "The field \'coreMessageInnerService\' is null, in class \'"

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_4
    const-string p0, "The field \'corePayInnerService\' is null, in class \'"

    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_5
    const-string p0, "The field \'coreMemberInnerService\' is null, in class \'"

    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_6
    const-string p0, "The field \'coreBusinessService\' is null, in class \'"

    .line 229
    .line 230
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_7
    const-string p0, "The field \'innovationInnerService\' is null, in class \'"

    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    return-void
.end method
