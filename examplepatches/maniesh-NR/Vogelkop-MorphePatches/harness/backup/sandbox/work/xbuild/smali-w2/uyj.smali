.class public final Luyj;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "SourceFile"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# static fields
.field public static final k:Lzyk;


# instance fields
.field public final a:Lumi;

.field public final b:Lkze;

.field public final c:Lqie;

.field public final d:Landroid/speech/tts/TextToSpeech;

.field public e:Lkotlin/jvm/functions/Function0;

.field public final f:Lkze;

.field public final g:Lode;

.field public final h:Lpyl;

.field public i:Lsyj;

.field public j:F


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lunj;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lunj;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Luyj;->k:Lzyk;

    return-void
.end method

.method public constructor <init>(Ldx3;Lumi;)V
    .registers 5

    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    iput-object p2, p0, Luyj;->a:Lumi;

    new-instance p2, Lkze;

    sget-object v0, Lwyj;->a:Lwyj;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Luyj;->b:Lkze;

    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    iput-object v0, p0, Luyj;->c:Lqie;

    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v0, p0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    new-instance p1, Lunj;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lunj;-><init>(B)V

    iput-object p1, p0, Luyj;->e:Lkotlin/jvm/functions/Function0;

    new-instance p1, Lkze;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Luyj;->f:Lkze;

    new-instance p1, Lode;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Luyj;->g:Lode;

    new-instance p1, Lpyl;

    const/16 v0, 0x9

    invoke-direct {p1, v0}, Lpyl;-><init>(B)V

    iput-object p1, p0, Luyj;->h:Lpyl;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Luyj;->j:F

    new-instance p1, Ltji;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final onAudioAvailable(Ljava/lang/String;[B)V
    .registers 6

    iget-object p0, p0, Luyj;->i:Lsyj;

    if-eqz p0, :cond_51

    if-eqz p2, :cond_51

    iget p1, p0, Lsyj;->b:I

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-eq p1, v0, :cond_37

    const/4 v0, 0x3

    if-eq p1, v0, :cond_28

    const/4 v0, 0x4

    if-ne p1, v0, :cond_51

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    array-length p2, p2

    div-int/2addr p2, v0

    :goto_1c
    if-ge v1, p2, :cond_51

    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {p0, v0}, Lsyj;->a(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    :cond_28
    array-length p1, p2

    :goto_29
    if-ge v1, p1, :cond_51

    aget-byte v0, p2, v1

    int-to-float v0, v0

    const/high16 v2, 0x43000000    # 128.0f

    div-float/2addr v0, v2

    invoke-virtual {p0, v0}, Lsyj;->a(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    :cond_37
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    array-length p2, p2

    div-int/2addr p2, v0

    :goto_41
    if-ge v1, p2, :cond_51

    invoke-virtual {p1, v1}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x47000000    # 32768.0f

    div-float/2addr v0, v2

    invoke-virtual {p0, v0}, Lsyj;->a(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_41

    :cond_51
    return-void
.end method

.method public final onBeginSynthesis(Ljava/lang/String;III)V
    .registers 8

    iget-object v0, p0, Luyj;->h:Lpyl;

    invoke-virtual {v0}, Lpyl;->l()Ltyj;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, v0, Ltyj;->b:Ljava/lang/String;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    const/4 p1, 0x1

    if-ne p4, p1, :cond_3e

    iget-object p1, p0, Luyj;->i:Lsyj;

    if-eqz p1, :cond_29

    iget-object p4, p1, Lsyj;->f:Lsyj;

    monitor-enter p4

    :try_start_1d
    iget-object v0, p1, Lsyj;->j:Lssi;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-object v1, p1, Lsyj;->g:Ljava/lang/Long;
    :try_end_24
    .catchall {:try_start_1d .. :try_end_24} :catchall_26

    monitor-exit p4

    goto :goto_29

    :catchall_26
    move-exception p0

    monitor-exit p4

    throw p0

    :cond_29
    :goto_29
    iput-object v1, p0, Luyj;->i:Lsyj;

    new-instance p1, Lsyj;

    iget-object p4, p0, Luyj;->g:Lode;

    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Luyj;->j:F

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2, v0, v1}, Lcs5;->O(FFF)F

    move-result v0

    invoke-direct {p1, p4, p2, p3, v0}, Lsyj;-><init>(Lode;IIF)V

    iput-object p1, p0, Luyj;->i:Lsyj;

    :cond_3e
    return-void
.end method

.method public final onDone(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Luyj;->h:Lpyl;

    invoke-virtual {v0}, Lpyl;->l()Ltyj;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    iget-object v1, v1, Ltyj;->b:Ljava/lang/String;

    goto :goto_d

    :cond_c
    move-object v1, v2

    :goto_d
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_27

    iget-object p1, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_25

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0}, Lpyl;->l()Ltyj;

    move-result-object v2

    :cond_25
    if-eqz v2, :cond_28

    :cond_27
    return-void

    :cond_28
    iget-object p0, p0, Luyj;->b:Lkze;

    sget-object p1, Lzyj;->a:Lzyj;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final onError(Ljava/lang/String;)V
    .registers 2

    .line 51
    return-void
.end method

.method public final onError(Ljava/lang/String;I)V
    .registers 4

    iget-object v0, p0, Luyj;->h:Lpyl;

    invoke-virtual {v0}, Lpyl;->l()Ltyj;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v0, v0, Ltyj;->b:Ljava/lang/String;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    return-void

    :cond_13
    new-instance p1, Lvyj;

    const/16 v0, -0x9

    if-eq p2, v0, :cond_28

    const/4 v0, -0x7

    if-eq p2, v0, :cond_25

    const/4 v0, -0x6

    if-eq p2, v0, :cond_22

    sget-object p2, Lryj;->d:Lryj;

    goto :goto_2a

    :cond_22
    sget-object p2, Lryj;->c:Lryj;

    goto :goto_2a

    :cond_25
    sget-object p2, Lryj;->c:Lryj;

    goto :goto_2a

    :cond_28
    sget-object p2, Lryj;->a:Lryj;

    :goto_2a
    invoke-direct {p1, p2}, Lvyj;-><init>(Lryj;)V

    iget-object p0, p0, Luyj;->b:Lkze;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final onInit(I)V
    .registers 3

    iget-object v0, p0, Luyj;->b:Lkze;

    if-nez p1, :cond_22

    iget-object p1, p0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p1, p0}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    move-result p1

    if-eqz p1, :cond_17

    new-instance p0, Lvyj;

    sget-object p1, Lryj;->d:Lryj;

    invoke-direct {p0, p1}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {v0, p0}, Lekc;->n(Ljava/lang/Object;)V

    return-void

    :cond_17
    new-instance p1, Lmni;

    const/16 v0, 0x11

    invoke-direct {p1, p0, v0}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_22
    new-instance p0, Lvyj;

    sget-object p1, Lryj;->d:Lryj;

    invoke-direct {p0, p1}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {v0, p0}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final onRangeStart(Ljava/lang/String;III)V
    .registers 11

    iget-object p2, p0, Luyj;->h:Lpyl;

    invoke-virtual {p2}, Lpyl;->l()Ltyj;

    move-result-object p2

    if-eqz p2, :cond_81

    iget-object p4, p2, Ltyj;->b:Ljava/lang/String;

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_81

    iget-object p1, p0, Luyj;->h:Lpyl;

    invoke-virtual {p1}, Lpyl;->l()Ltyj;

    move-result-object p4

    if-eqz p4, :cond_49

    iget-object p1, p1, Lpyl;->d:Ljava/lang/Object;

    check-cast p1, Laz7;

    if-eqz p1, :cond_47

    iget-object p1, p1, Laz7;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v3, p3

    move v2, v1

    :goto_27
    if-ge v2, v0, :cond_46

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v5, v1, 0x1

    if-ltz v1, :cond_41

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    add-int/2addr v1, p3

    add-int/lit8 v1, v1, 0x1

    if-ge v4, v1, :cond_3f

    move v3, v1

    :cond_3f
    move v1, v5

    goto :goto_27

    :cond_41
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_46
    move p3, v3

    :cond_47
    iput p3, p4, Ltyj;->e:I

    :cond_49
    iget-object p1, p0, Luyj;->f:Lkze;

    iget p3, p2, Ltyj;->d:I

    iget p2, p2, Ltyj;->e:I

    add-int/2addr p3, p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lekc;->n(Ljava/lang/Object;)V

    iget-object p0, p0, Luyj;->i:Lsyj;

    if-eqz p0, :cond_81

    iget-object p1, p0, Lsyj;->f:Lsyj;

    monitor-enter p1

    :try_start_5e
    iget-object p2, p0, Lsyj;->e:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_7c

    iget-object p2, p0, Lsyj;->g:Ljava/lang/Long;

    if-nez p2, :cond_7c

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p2

    const-wide/16 v0, 0x14

    div-long/2addr p2, v0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lsyj;->g:Ljava/lang/Long;

    iget-object p0, p0, Lsyj;->j:Lssi;

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_7c
    .catchall {:try_start_5e .. :try_end_7c} :catchall_7e

    :cond_7c
    monitor-exit p1

    return-void

    :catchall_7e
    move-exception p0

    monitor-exit p1

    throw p0

    :cond_81
    return-void
.end method

.method public final onStart(Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Luyj;->h:Lpyl;

    invoke-virtual {v0}, Lpyl;->l()Ltyj;

    move-result-object v0

    if-eqz v0, :cond_10

    iget-object v1, v0, Ltyj;->b:Ljava/lang/String;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    :cond_10
    return-void

    :cond_11
    const/4 p1, 0x0

    iget-object v1, p0, Luyj;->g:Lode;

    invoke-virtual {v1, p1}, Lekc;->n(Ljava/lang/Object;)V

    new-instance p1, Lyyj;

    iget-object v2, v0, Ltyj;->a:Ljava/lang/String;

    iget-object v0, v0, Ltyj;->c:Ljava/lang/String;

    iget-object v3, p0, Luyj;->f:Lkze;

    invoke-direct {p1, v2, v0, v3, v1}, Lyyj;-><init>(Ljava/lang/String;Ljava/lang/String;Lkze;Lode;)V

    iget-object p0, p0, Luyj;->b:Lkze;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final onStop(Ljava/lang/String;Z)V
    .registers 3

    iget-object p2, p0, Luyj;->h:Lpyl;

    invoke-virtual {p2}, Lpyl;->l()Ltyj;

    move-result-object p2

    if-eqz p2, :cond_b

    iget-object p2, p2, Ltyj;->b:Ljava/lang/String;

    goto :goto_c

    :cond_b
    const/4 p2, 0x0

    :goto_c
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    return-void

    :cond_13
    iget-object p0, p0, Luyj;->b:Lkze;

    sget-object p1, Lzyj;->a:Lzyj;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method
