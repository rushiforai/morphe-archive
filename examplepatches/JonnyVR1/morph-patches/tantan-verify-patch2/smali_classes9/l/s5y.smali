.class public Ll/s5y;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/w30;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/ad00;


# direct methods
.method public constructor <init>(Ll/xc00;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/s5y;->a:Ll/w30;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/ad00;

    .line 18
    .line 19
    iput-object p1, p0, Ll/s5y;->c:Ll/ad00;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/s5y;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s5y;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/s5y;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s5y;->g(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/s5y;Lkotlin/Triple;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s5y;->h(Lkotlin/Triple;)V

    return-void
.end method

.method public static synthetic d(Ll/s5y;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/s5y;->i(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method


# virtual methods
.method public e()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/core/R$string;->d:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/core/R$string;->e:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/w30$b;

    .line 29
    .line 30
    iget-object v2, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v3, Ll/o5y;

    .line 48
    .line 49
    invoke-direct {v3, p0}, Ll/o5y;-><init>(Ll/s5y;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v2, Ll/p5y;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/p5y;-><init>(Ll/s5y;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/s5y;->a:Ll/w30;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5y;->a:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/s5y;->c:Ll/ad00;

    .line 8
    .line 9
    new-instance v1, Ll/s5y$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/s5y$a;-><init>(Ll/s5y;)V

    .line 12
    .line 13
    .line 14
    filled-new-array {p1}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "tantan_swipe_uploadImage"

    .line 19
    .line 20
    invoke-virtual {v0, p1, v1, p0}, Ll/ad00;->c(Ljava/lang/String;Ll/y20;[Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic h(Lkotlin/Triple;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/s5y;->c:Ll/ad00;

    .line 4
    .line 5
    new-instance v1, Ll/s5y$b;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/s5y$b;-><init>(Ll/s5y;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lkotlin/Triple;->getFirst()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Lkotlin/Triple;->getThird()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, ""

    .line 29
    .line 30
    filled-new-array {p0, v3, v2, p1}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "tantan_swipe_uploadVideo"

    .line 35
    .line 36
    invoke-virtual {v0, p1, v1, p0}, Ll/ad00;->c(Ljava/lang/String;Ll/y20;[Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic i(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/s5y;->a:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iget-object p3, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget v0, Lcom/p1/mobile/putong/core/R$string;->d:I

    .line 11
    .line 12
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p3, 0x0

    .line 21
    const/16 v0, 0x1a0a

    .line 22
    .line 23
    const/16 v1, 0x9

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sput-object p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->e:Lrx/subjects/b;

    .line 33
    .line 34
    iget-object p2, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/q5y;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Ll/q5y;-><init>(Ll/s5y;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const v3, 0x3f4ccccd    # 0.8f

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {}, Ll/bnl0;->y0()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/high16 v4, 0x42200000    # 40.0f

    .line 78
    .line 79
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    sub-int/2addr v3, v4

    .line 84
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iget-object v1, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 103
    .line 104
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p1, p2, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    sget p1, Ll/x7c0;->y:I

    .line 122
    .line 123
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_0
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 128
    .line 129
    iget-object p2, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    sget v3, Lcom/p1/mobile/putong/core/R$string;->e:I

    .line 132
    .line 133
    invoke-virtual {p2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_1

    .line 142
    .line 143
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sput-object p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->f:Lrx/subjects/b;

    .line 148
    .line 149
    iget-object p2, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    new-instance p2, Ll/r5y;

    .line 156
    .line 157
    invoke-direct {p2, p0}, Ll/r5y;-><init>(Ll/s5y;)V

    .line 158
    .line 159
    .line 160
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-virtual {p1, p2, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 202
    .line 203
    .line 204
    iget-object p0, p0, Ll/s5y;->b:Lcom/p1/mobile/android/app/Act;

    .line 205
    .line 206
    sget p1, Ll/x7c0;->y:I

    .line 207
    .line 208
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 209
    .line 210
    .line 211
    :cond_1
    return-void
.end method
