.class public Ll/uyl0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Landroid/media/SoundPool;

.field public j:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uyl0;->L3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/uyl0;Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uyl0;->M3(Landroid/media/SoundPool;II)V

    return-void
.end method

.method public static synthetic K3(Ll/uyl0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceToneMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uyl0;->N3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceToneMessage;)V

    return-void
.end method


# virtual methods
.method public final L3()V
    .locals 3

    .line 1
    new-instance v0, Landroid/media/SoundPool$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 31
    .line 32
    return-void
.end method

.method public final synthetic M3(Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iput p2, p0, Ll/uyl0;->j:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceToneMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uyl0;->O3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final O3()V
    .locals 7

    .line 1
    iget v1, p0, Ll/uyl0;->j:I

    .line 2
    .line 3
    if-gtz v1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    const/high16 v6, 0x3f800000    # 1.0f

    .line 12
    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/high16 v3, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 5
    .line 6
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Ll/vfc0;->a:I

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 15
    .line 16
    new-instance v1, Ll/syl0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/syl0;-><init>(Ll/uyl0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/uyl0;->i:Landroid/media/SoundPool;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->M()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/tyl0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/tyl0;-><init>(Ll/uyl0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
