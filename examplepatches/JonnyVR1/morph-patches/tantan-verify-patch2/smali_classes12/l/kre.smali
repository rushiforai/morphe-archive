.class public final Ll/kre;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tsl;
.implements Ll/i8s$b;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0018\u00002\u00020\u00012\u00020\u0002B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000c\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0015H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0019\u0010\u001b\u001a\u00020\t2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u001dR\u0018\u0010 \u001a\u0004\u0018\u00010\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001fR\u0018\u0010\"\u001a\u0004\u0018\u00010\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\n\u0010!R\u0018\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010#R\u0016\u0010&\u001a\u00020$8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010%\u00a8\u0006\'"
    }
    d2 = {
        "Ll/kre;",
        "Ll/tsl;",
        "Ll/i8s$b;",
        "Ll/voq;",
        "filter",
        "<init>",
        "(Ll/voq;)V",
        "Lcom/momo/mcamera/mask/MaskModel;",
        "maskModel",
        "",
        "c",
        "(Lcom/momo/mcamera/mask/MaskModel;)V",
        "a",
        "Ll/esl;",
        "detect",
        "e",
        "(Ll/esl;)V",
        "Lcom/momo/piplinemomoext/input/audio/a;",
        "surroundMusic",
        "d",
        "(Lcom/momo/piplinemomoext/input/audio/a;)V",
        "Lcom/momo/mcamera/mask/Sticker;",
        "sticker",
        "f",
        "(Lcom/momo/mcamera/mask/Sticker;)V",
        "",
        "type",
        "b",
        "(Ljava/lang/String;)V",
        "Ll/voq;",
        "Ll/i8s;",
        "Ll/i8s;",
        "detectorCounter",
        "Ll/esl;",
        "detector",
        "Lcom/momo/piplinemomoext/input/audio/a;",
        "",
        "I",
        "audioEffectType",
        "momomediaext_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Ll/voq;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private b:Ll/i8s;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private c:Ll/esl;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private d:Lcom/momo/piplinemomoext/input/audio/a;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private e:I


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0
    .param p1    # Ll/voq;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/kre;->a:Ll/voq;

    .line 8
    .line 9
    new-instance p1, Ll/i8s;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/i8s;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/kre;->b:Ll/i8s;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/i8s;->e(Ll/i8s$b;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 3
    .param p1    # Lcom/momo/mcamera/mask/MaskModel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getRealWrapType()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v1, "face_warp"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/i8s;->b(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getTriggeringMicEffect()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v1, "audio_effect"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/i8s;->b(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->isAudioRecord()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Ll/kre;->a:Ll/voq;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/voq;->X()V

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_4

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lcom/momo/mcamera/mask/Sticker;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-nez v2, :cond_3

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    goto :goto_0

    .line 84
    :cond_4
    if-eqz v1, :cond_5

    .line 85
    .line 86
    iget-object v0, p0, Ll/kre;->a:Ll/voq;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/voq;->releaseSoundPlayer()V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object v0, p0, Ll/kre;->a:Ll/voq;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {v0, v1}, Ll/voq;->clearMaskWithModelType(I)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/kre;->a:Ll/voq;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/voq;->m2(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "active_face_expression"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/kre;->c:Ll/esl;

    .line 11
    .line 12
    if-eqz p0, :cond_4

    .line 13
    .line 14
    invoke-interface {p0, v1}, Ll/esl;->k(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string v0, "eye_classify"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/kre;->c:Ll/esl;

    .line 27
    .line 28
    if-eqz p0, :cond_4

    .line 29
    .line 30
    invoke-interface {p0, v1}, Ll/esl;->w(Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const-string v0, "face_warp"

    .line 35
    .line 36
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Ll/kre;->a:Ll/voq;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, v1, p1, p1}, Ll/voq;->changeFaceWarp(IFF)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    const-string v0, "audio_effect"

    .line 50
    .line 51
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    iget-object p1, p0, Ll/kre;->d:Lcom/momo/piplinemomoext/input/audio/a;

    .line 58
    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    invoke-interface {p1, v1}, Ll/l6m;->f0(I)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iput v1, p0, Ll/kre;->e:I

    .line 65
    .line 66
    :cond_4
    return-void
.end method

.method public c(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 14
    .param p1    # Lcom/momo/mcamera/mask/MaskModel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getRealWrapType()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Ll/kre;->b:Ll/i8s;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v2, "face_warp"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/i8s;->c(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Ll/kre;->a:Ll/voq;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFaceFacialFeatureScale()F

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFaceScale()F

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v1, v0, v2, v3}, Ll/voq;->changeFaceWarp(IFF)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getTriggeringMicEffect()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    iget-object v1, p0, Ll/kre;->b:Ll/i8s;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    const-string v2, "audio_effect"

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ll/i8s;->c(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object v1, p0, Ll/kre;->d:Lcom/momo/piplinemomoext/input/audio/a;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    if-eqz v1, :cond_4

    .line 52
    .line 53
    invoke-interface {v1, v0}, Ll/l6m;->f0(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    iput v0, p0, Ll/kre;->e:I

    .line 58
    .line 59
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->isAudioRecord()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    iget-object v0, p0, Ll/kre;->a:Ll/voq;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/voq;->I1()V

    .line 68
    .line 69
    .line 70
    :cond_5
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/4 v1, 0x0

    .line 79
    const-string v2, ""

    .line 80
    .line 81
    move v3, v1

    .line 82
    move v4, v3

    .line 83
    move v5, v4

    .line 84
    move v6, v5

    .line 85
    move v7, v6

    .line 86
    move v8, v7

    .line 87
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v9

    .line 91
    const/4 v10, 0x4

    .line 92
    const/4 v11, 0x1

    .line 93
    if-eqz v9, :cond_c

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    check-cast v9, Lcom/momo/mcamera/mask/Sticker;

    .line 100
    .line 101
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getTriggerType()I

    .line 102
    .line 103
    .line 104
    move-result v12

    .line 105
    const/16 v13, 0x8

    .line 106
    .line 107
    if-eq v12, v13, :cond_7

    .line 108
    .line 109
    const/16 v13, 0x10

    .line 110
    .line 111
    if-eq v12, v13, :cond_7

    .line 112
    .line 113
    const/16 v13, 0x40

    .line 114
    .line 115
    if-eq v12, v13, :cond_7

    .line 116
    .line 117
    const/16 v13, 0x80

    .line 118
    .line 119
    if-eq v12, v13, :cond_7

    .line 120
    .line 121
    const/16 v13, 0x100

    .line 122
    .line 123
    if-eq v12, v13, :cond_7

    .line 124
    .line 125
    const/16 v13, 0x200

    .line 126
    .line 127
    if-eq v12, v13, :cond_6

    .line 128
    .line 129
    const/16 v13, 0x400

    .line 130
    .line 131
    if-eq v12, v13, :cond_6

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    invoke-virtual {v9, v10}, Lcom/momo/mcamera/mask/Sticker;->updateTriggerFlag(I)V

    .line 135
    .line 136
    .line 137
    move v5, v11

    .line 138
    goto :goto_2

    .line 139
    :cond_7
    const/4 v6, 0x2

    .line 140
    invoke-virtual {v9, v6}, Lcom/momo/mcamera/mask/Sticker;->updateTriggerFlag(I)V

    .line 141
    .line 142
    .line 143
    move v6, v11

    .line 144
    :goto_2
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    if-eqz v10, :cond_8

    .line 149
    .line 150
    move v7, v11

    .line 151
    :cond_8
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getSound()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v10

    .line 155
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v10

    .line 159
    if-nez v10, :cond_9

    .line 160
    .line 161
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getSoundPath()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 169
    .line 170
    .line 171
    move-result v8

    .line 172
    move v3, v11

    .line 173
    :cond_9
    invoke-virtual {v9}, Lcom/momo/mcamera/mask/Sticker;->getSoundNeedsPublish()Z

    .line 174
    .line 175
    .line 176
    move-result v10

    .line 177
    if-eqz v10, :cond_a

    .line 178
    .line 179
    move v4, v11

    .line 180
    :cond_a
    sget-object v10, Ll/yu2;->INSTANCE:Ll/yu2;

    .line 181
    .line 182
    invoke-virtual {v10}, Ll/yu2;->a()Z

    .line 183
    .line 184
    .line 185
    move-result v10

    .line 186
    if-eqz v10, :cond_b

    .line 187
    .line 188
    const-string v10, "byteDance"

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_b
    const-string v10, "momo"

    .line 192
    .line 193
    :goto_3
    invoke-virtual {v9, v10}, Lcom/momo/mcamera/mask/Sticker;->setSegmentType(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_c
    if-eqz v3, :cond_d

    .line 198
    .line 199
    if-nez v4, :cond_d

    .line 200
    .line 201
    iget-object v0, p0, Ll/kre;->a:Ll/voq;

    .line 202
    .line 203
    invoke-virtual {v0, v11}, Ll/voq;->setEnableSound(Z)V

    .line 204
    .line 205
    .line 206
    :cond_d
    if-eqz v5, :cond_f

    .line 207
    .line 208
    iget-object v0, p0, Ll/kre;->c:Ll/esl;

    .line 209
    .line 210
    if-eqz v0, :cond_e

    .line 211
    .line 212
    invoke-interface {v0, v11}, Ll/esl;->k(Z)V

    .line 213
    .line 214
    .line 215
    :cond_e
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 216
    .line 217
    if-eqz v0, :cond_f

    .line 218
    .line 219
    const-string v5, "active_face_expression"

    .line 220
    .line 221
    invoke-virtual {v0, v5}, Ll/i8s;->c(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_f
    if-eqz v6, :cond_11

    .line 225
    .line 226
    iget-object v0, p0, Ll/kre;->c:Ll/esl;

    .line 227
    .line 228
    if-eqz v0, :cond_10

    .line 229
    .line 230
    invoke-interface {v0, v11}, Ll/esl;->w(Z)V

    .line 231
    .line 232
    .line 233
    :cond_10
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 234
    .line 235
    if-eqz v0, :cond_11

    .line 236
    .line 237
    const-string v5, "eye_classify"

    .line 238
    .line 239
    invoke-virtual {v0, v5}, Ll/i8s;->c(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :cond_11
    if-eqz v7, :cond_13

    .line 243
    .line 244
    sget-object v0, Ll/yu2;->INSTANCE:Ll/yu2;

    .line 245
    .line 246
    invoke-virtual {v0}, Ll/yu2;->a()Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-eqz v0, :cond_12

    .line 251
    .line 252
    const/16 v0, 0xa

    .line 253
    .line 254
    invoke-static {v0}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {v0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->setLicensePath(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    const/16 v0, 0x9

    .line 262
    .line 263
    invoke-static {v0}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-static {v0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->setModelPath(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_12
    invoke-static {v10}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setModelPath(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    :cond_13
    :goto_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    iget-object v5, p0, Ll/kre;->a:Ll/voq;

    .line 283
    .line 284
    if-ne v0, v10, :cond_15

    .line 285
    .line 286
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getTriggerType()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v5, v0, p1}, Ll/voq;->addGestureMaskModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    if-eqz p1, :cond_14

    .line 295
    .line 296
    if-eqz v3, :cond_14

    .line 297
    .line 298
    if-eqz v4, :cond_14

    .line 299
    .line 300
    iget-object p0, p0, Ll/kre;->d:Lcom/momo/piplinemomoext/input/audio/a;

    .line 301
    .line 302
    if-eqz p0, :cond_14

    .line 303
    .line 304
    invoke-interface {p0, v8, v2, v1, v11}, Ll/l6m;->l0(ILjava/lang/String;ZZ)Z

    .line 305
    .line 306
    .line 307
    :cond_14
    return-void

    .line 308
    :cond_15
    invoke-virtual {v5, p1}, Ll/voq;->addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 309
    .line 310
    .line 311
    return-void
.end method

.method public d(Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 0
    .param p1    # Lcom/momo/piplinemomoext/input/audio/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kre;->d:Lcom/momo/piplinemomoext/input/audio/a;

    .line 5
    .line 6
    iget p0, p0, Ll/kre;->e:I

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1, p0}, Ll/l6m;->f0(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public e(Ll/esl;)V
    .locals 0
    .param p1    # Ll/esl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kre;->c:Ll/esl;

    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2
    .param p1    # Lcom/momo/mcamera/mask/Sticker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerFlag()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    and-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, "active_face_expression"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/i8s;->b(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getTriggerFlag()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    and-int/lit8 v0, v0, 0x2

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/kre;->b:Ll/i8s;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string v1, "eye_classify"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/i8s;->b(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getSoundPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getSoundNeedsPublish()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Ll/kre;->d:Lcom/momo/piplinemomoext/input/audio/a;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-interface {p0, p1}, Ll/l6m;->R1(I)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method
