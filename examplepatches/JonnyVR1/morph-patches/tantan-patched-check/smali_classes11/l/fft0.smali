.class public final Ll/fft0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# instance fields
.field public final a:Landroid/media/AudioManager;

.field public final b:Ll/eft0;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/eft0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/fft0;->f:F

    .line 7
    .line 8
    const-string v0, "audio"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/media/AudioManager;

    .line 15
    .line 16
    iput-object p1, p0, Ll/fft0;->a:Landroid/media/AudioManager;

    .line 17
    .line 18
    iput-object p2, p0, Ll/fft0;->b:Ll/eft0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/fft0;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Ll/fft0;->f:F

    .line 9
    .line 10
    :goto_0
    iget-boolean p0, p0, Ll/fft0;->c:Z

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    return v1
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fft0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fft0;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fft0;->d:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fft0;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fft0;->e:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fft0;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fft0;->f:F

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fft0;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/fft0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/fft0;->e:Z

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget v0, p0, Ll/fft0;->f:F

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    cmpl-float v0, v0, v3

    .line 15
    .line 16
    if-lez v0, :cond_2

    .line 17
    .line 18
    iget-boolean v0, p0, Ll/fft0;->c:Z

    .line 19
    .line 20
    if-nez v0, :cond_5

    .line 21
    .line 22
    iget-object v0, p0, Ll/fft0;->a:Landroid/media/AudioManager;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    const/4 v4, 0x2

    .line 28
    invoke-virtual {v0, p0, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne v0, v2, :cond_0

    .line 33
    .line 34
    move v1, v2

    .line 35
    :cond_0
    iput-boolean v1, p0, Ll/fft0;->c:Z

    .line 36
    .line 37
    :cond_1
    iget-object p0, p0, Ll/fft0;->b:Ll/eft0;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/eft0;->zzn()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-boolean v0, p0, Ll/fft0;->c:Z

    .line 44
    .line 45
    if-eqz v0, :cond_5

    .line 46
    .line 47
    iget-object v0, p0, Ll/fft0;->a:Landroid/media/AudioManager;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    move v1, v2

    .line 58
    :cond_3
    iput-boolean v1, p0, Ll/fft0;->c:Z

    .line 59
    .line 60
    :cond_4
    iget-object p0, p0, Ll/fft0;->b:Ll/eft0;

    .line 61
    .line 62
    invoke-interface {p0}, Ll/eft0;->zzn()V

    .line 63
    .line 64
    .line 65
    :cond_5
    return-void
.end method

.method public final onAudioFocusChange(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p1, 0x0

    .line 6
    :goto_0
    iput-boolean p1, p0, Ll/fft0;->c:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/fft0;->b:Ll/eft0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/eft0;->zzn()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
