.class public Ll/tnw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tnw$c;,
        Ll/tnw$e;,
        Ll/tnw$d;,
        Ll/tnw$b;
    }
.end annotation


# static fields
.field public static m:Ll/mnc0;


# instance fields
.field public a:Ll/tnw$d;

.field public b:Ll/tnw$e;

.field public c:Ll/tnw$c;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Z

.field public g:J

.field public h:J

.field public i:J

.field public j:Z

.field public k:Landroid/os/Handler;

.field public l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "/0000000.mp3"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/tnw;->d:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Ll/tnw;->e:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/tnw;->f:Z

    .line 33
    .line 34
    const-wide/16 v0, 0x0

    .line 35
    .line 36
    iput-wide v0, p0, Ll/tnw;->g:J

    .line 37
    .line 38
    iput-wide v0, p0, Ll/tnw;->h:J

    .line 39
    .line 40
    const-wide/16 v0, 0x12c

    .line 41
    .line 42
    iput-wide v0, p0, Ll/tnw;->i:J

    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic a(Ll/tnw;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tnw;->h:J

    return-wide v0
.end method

.method public static bridge synthetic b(Ll/tnw;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tnw;->i:J

    return-wide v0
.end method

.method public static bridge synthetic c(Ll/tnw;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tnw;->g:J

    return-wide v0
.end method

.method public static bridge synthetic d(Ll/tnw;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tnw;->h:J

    return-void
.end method

.method public static bridge synthetic e(Ll/tnw;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tnw;->g:J

    return-void
.end method

.method public static bridge synthetic f(Ll/tnw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tnw;->u()V

    return-void
.end method

.method public static bridge synthetic g(Ll/tnw;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tnw;->v(Landroid/os/Message;)V

    return-void
.end method

.method public static bridge synthetic h(Ll/tnw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tnw;->w()V

    return-void
.end method

.method public static bridge synthetic i(Ll/tnw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tnw;->x()V

    return-void
.end method


# virtual methods
.method public A(Ll/tnw$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnw;->a:Ll/tnw$d;

    .line 2
    .line 3
    return-void
.end method

.method public B(Ll/tnw$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnw;->b:Ll/tnw$e;

    .line 2
    .line 3
    return-void
.end method

.method public C(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tnw;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tnw;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/tnw;->k()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/mnc0;->y(I)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/tnw;->f:Z

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ll/tnw;->e:Z

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Ll/tnw;->g:J

    .line 25
    .line 26
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mnc0;->B()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/tnw;->k:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tnw;->f:Z

    .line 3
    .line 4
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/mnc0;->B()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/tnw;->k:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/mnc0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/tnw;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/tnw;->j:Z

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/mnc0;-><init>(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 15
    .line 16
    iget-boolean v1, p0, Ll/tnw;->l:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/mnc0;->w(Z)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Ll/mnc0;->x(I)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/tnw;->m:Ll/mnc0;

    .line 28
    .line 29
    new-instance v1, Ll/tnw$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/tnw$a;-><init>(Ll/tnw;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/mnc0;->v(Landroid/os/Handler;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tnw;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m()Ljava/io/File;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tnw;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public n()I
    .locals 0

    .line 1
    sget-object p0, Ll/tnw;->m:Ll/mnc0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/mnc0;->u()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o()Ll/tnw$b;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p()Ll/tnw$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnw;->c:Ll/tnw$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/tnw$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnw;->a:Ll/tnw$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ll/tnw$e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tnw;->b:Ll/tnw$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tnw;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tnw;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final u()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tnw;->o()Ll/tnw$b;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x2

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/media/a;->e(ILandroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v(Landroid/os/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tnw;->p()Ll/tnw$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tnw;->p()Ll/tnw$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget v0, p1, Landroid/os/Message;->what:I

    .line 12
    .line 13
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 14
    .line 15
    invoke-interface {p0, v0, v1}, Ll/tnw$c;->onError(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance p0, Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v0, "what"

    .line 24
    .line 25
    iget v1, p1, Landroid/os/Message;->what:I

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    const-string v0, "arg1"

    .line 31
    .line 32
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 33
    .line 34
    invoke-virtual {p0, v0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/media/a;->e(ILandroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tnw;->q()Ll/tnw$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tnw;->q()Ll/tnw$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/tnw$d;->onStart()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/media/a;->e(ILandroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final x()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tnw;->r()Ll/tnw$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tnw;->r()Ll/tnw$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/tnw;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Ll/tnw$e;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/media/a;->a()Lcom/p1/mobile/android/media/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/media/a;->e(ILandroid/os/Bundle;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tnw;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(Ll/tnw$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tnw;->c:Ll/tnw$c;

    .line 2
    .line 3
    return-void
.end method
