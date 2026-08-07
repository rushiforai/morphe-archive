.class public final Ll/mwx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/media/AudioManager;

.field public final b:Ll/fwx0;

.field public c:Ll/iwx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ll/iwx0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/mwx0;->e:F

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "audio"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/media/AudioManager;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/mwx0;->a:Landroid/media/AudioManager;

    .line 24
    .line 25
    iput-object p3, p0, Ll/mwx0;->c:Ll/iwx0;

    .line 26
    .line 27
    new-instance p1, Ll/fwx0;

    .line 28
    .line 29
    invoke-direct {p1, p0, p2}, Ll/fwx0;-><init>(Ll/mwx0;Landroid/os/Handler;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/mwx0;->b:Ll/fwx0;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Ll/mwx0;->d:I

    .line 36
    .line 37
    return-void
.end method

.method public static bridge synthetic c(Ll/mwx0;I)V
    .locals 2

    .line 1
    const/4 v0, -0x3

    .line 2
    const/4 v1, -0x2

    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    if-eq p1, v1, :cond_2

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "Unknown focus change type: "

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "AudioFocusManager"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, v0}, Ll/mwx0;->g(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/mwx0;->f(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p0, v0}, Ll/mwx0;->f(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/mwx0;->e()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    if-eq p1, v1, :cond_3

    .line 48
    .line 49
    const/4 p1, 0x3

    .line 50
    invoke-virtual {p0, p1}, Ll/mwx0;->g(I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p1}, Ll/mwx0;->f(I)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x2

    .line 59
    invoke-virtual {p0, p1}, Ll/mwx0;->g(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/mwx0;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public final b(ZI)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwx0;->e()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/mwx0;->c:Ll/iwx0;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mwx0;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget v0, p0, Ll/mwx0;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget v0, Ll/mpw0;->a:I

    .line 7
    .line 8
    const/16 v1, 0x1a

    .line 9
    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/mwx0;->a:Landroid/media/AudioManager;

    .line 13
    .line 14
    iget-object v1, p0, Ll/mwx0;->b:Ll/fwx0;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Ll/mwx0;->g(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final f(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mwx0;->c:Ll/iwx0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/v5y0;

    .line 6
    .line 7
    iget-object v0, p0, Ll/v5y0;->a:Ll/n6y0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/n6y0;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {v0, p1}, Ll/n6y0;->l(ZI)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object p0, p0, Ll/v5y0;->a:Ll/n6y0;

    .line 18
    .line 19
    invoke-static {p0, v0, p1, v1}, Ll/n6y0;->B(Ll/n6y0;ZII)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final g(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/mwx0;->d:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput p1, p0, Ll/mwx0;->d:I

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    const p1, 0x3e4ccccd    # 0.2f

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    :goto_0
    iget v0, p0, Ll/mwx0;->e:F

    .line 18
    .line 19
    cmpl-float v0, v0, p1

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iput p1, p0, Ll/mwx0;->e:F

    .line 24
    .line 25
    iget-object p0, p0, Ll/mwx0;->c:Ll/iwx0;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    check-cast p0, Ll/v5y0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/v5y0;->a:Ll/n6y0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/n6y0;->y(Ll/n6y0;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_1
    return-void
.end method
