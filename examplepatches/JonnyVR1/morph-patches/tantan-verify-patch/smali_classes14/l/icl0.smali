.class public Ll/icl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/media/SoundPool;

.field public b:I

.field public c:I

.field public d:Z


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

.method public static synthetic a(Ll/icl0;Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/icl0;->c(Landroid/media/SoundPool;II)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

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
    new-instance v2, Landroid/media/AudioAttributes$Builder;

    .line 11
    .line 12
    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-virtual {v2, v3}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v2}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 31
    .line 32
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 33
    .line 34
    sget v3, Ll/ufc0;->a:I

    .line 35
    .line 36
    invoke-virtual {v0, v2, v3, v1}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 40
    .line 41
    new-instance v1, Ll/hcl0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/hcl0;-><init>(Ll/icl0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic c(Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iput p2, p0, Ll/icl0;->b:I

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/icl0;->d:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/icl0;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public d()V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/icl0;->d:Z

    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "playRingtone:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/icl0;->b:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "videoChat"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget v3, p0, Ll/icl0;->b:I

    .line 26
    .line 27
    if-gtz v3, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v2, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    const/4 v7, -0x1

    .line 35
    const/high16 v8, 0x3f800000    # 1.0f

    .line 36
    .line 37
    const/high16 v4, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const/high16 v5, 0x3f800000    # 1.0f

    .line 40
    .line 41
    const/4 v6, 0x0

    .line 42
    invoke-virtual/range {v2 .. v8}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Ll/icl0;->c:I

    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/icl0;->d:Z

    .line 3
    .line 4
    const-string v0, "videoChat"

    .line 5
    .line 6
    const-string v1, "release"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/icl0;->f()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/icl0;->d:Z

    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "stopRingtone:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/icl0;->c:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "videoChat"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/icl0;->c:I

    .line 26
    .line 27
    if-lez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/icl0;->a:Landroid/media/SoundPool;

    .line 38
    .line 39
    iget p0, p0, Ll/icl0;->c:I

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Landroid/media/SoundPool;->stop(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
