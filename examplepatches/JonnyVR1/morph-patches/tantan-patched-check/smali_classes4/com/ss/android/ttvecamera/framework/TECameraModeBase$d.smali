.class Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "TECameraModeBase"

    .line 2
    .line 3
    const-string v0, "onConfigureFailed..."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 11
    .line 12
    .line 13
    const-wide/16 p0, 0x0

    .line 14
    .line 15
    const-string v0, "te_record_camera2_create_session_ret"

    .line 16
    .line 17
    invoke-static {v0, p0, p1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 6
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "TECameraModeBase-onConfigured"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 11
    .line 12
    iget-wide v3, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H:J

    .line 13
    .line 14
    sub-long v3, v0, v3

    .line 15
    .line 16
    iput-wide v3, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I:J

    .line 17
    .line 18
    iput-wide v0, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->J:J

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 24
    .line 25
    iput-object p1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 26
    .line 27
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 37
    .line 38
    const/16 v5, 0x1c

    .line 39
    .line 40
    if-lt v1, v5, :cond_1

    .line 41
    .line 42
    :try_start_0
    iget-boolean v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 43
    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    new-instance p1, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-ge v0, v1, :cond_0

    .line 93
    .line 94
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/hardware/camera2/params/OutputConfiguration;

    .line 103
    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Landroid/view/Surface;

    .line 109
    .line 110
    invoke-static {v1, v5}, Ll/fsh0;->a(Landroid/hardware/camera2/params/OutputConfiguration;Landroid/view/Surface;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 114
    .line 115
    iput-boolean v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 116
    .line 117
    add-int/lit8 v0, v0, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catch_0
    move-exception p1

    .line 121
    goto :goto_1

    .line 122
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 123
    .line 124
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 125
    .line 126
    if-nez v0, :cond_1

    .line 127
    .line 128
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 129
    .line 130
    if-eqz v0, :cond_1

    .line 131
    .line 132
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 133
    .line 134
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 137
    .line 138
    invoke-static {p1, v0}, Ll/gsh0;->a(Landroid/hardware/camera2/CameraCaptureSession;Ljava/util/List;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 142
    .line 143
    iput-boolean v2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 144
    .line 145
    const-string p1, "TECameraModeBase"

    .line 146
    .line 147
    const-string v0, "finalizeOutputConfigurations in session onConfigured"

    .line 148
    .line 149
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 154
    .line 155
    .line 156
    :cond_1
    :goto_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 157
    .line 158
    iget-object v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 159
    .line 160
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 161
    .line 162
    if-eqz v0, :cond_2

    .line 163
    .line 164
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 165
    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    :cond_2
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u0()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_4

    .line 173
    .line 174
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 177
    .line 178
    .line 179
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;

    .line 180
    .line 181
    invoke-direct {v0, p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d$a;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;I)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 185
    .line 186
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 187
    .line 188
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 189
    .line 190
    if-eqz v1, :cond_3

    .line 191
    .line 192
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 195
    .line 196
    .line 197
    goto :goto_4

    .line 198
    :catch_1
    move-exception p1

    .line 199
    goto :goto_3

    .line 200
    :cond_3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 201
    .line 202
    .line 203
    goto :goto_4

    .line 204
    :goto_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 210
    .line 211
    .line 212
    :cond_4
    :goto_4
    const-wide/16 p0, 0x1

    .line 213
    .line 214
    const-string v0, "te_record_camera2_create_session_ret"

    .line 215
    .line 216
    invoke-static {v0, p0, p1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 217
    .line 218
    .line 219
    const-string p0, "te_record_camera2_create_session_cost"

    .line 220
    .line 221
    invoke-static {p0, v3, v4}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 222
    .line 223
    .line 224
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Ll/dsh0;->b()V

    .line 239
    .line 240
    .line 241
    return-void
.end method
