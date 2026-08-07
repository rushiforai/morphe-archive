.class public final Lcom/google/android/exoplayer2/audio/h$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/audio/AudioSink$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/audio/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/h;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/audio/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/h;Lcom/google/android/exoplayer2/audio/h$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/audio/h$c;-><init>(Lcom/google/android/exoplayer2/audio/h;)V

    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->y1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/audio/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/c$a;->s(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecAudioRenderer"

    .line 2
    .line 3
    const-string v1, "Audio sink error"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->y1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/audio/c$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/audio/c$a;->l(Ljava/lang/Exception;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->y1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/audio/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/audio/c$a;->r(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(IJJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->y1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/audio/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move v1, p1

    .line 8
    move-wide v2, p2

    .line 9
    move-wide v4, p4

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/c$a;->t(IJJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->A1(Lcom/google/android/exoplayer2/audio/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/h;->z1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/x$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->z1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/x$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/google/android/exoplayer2/x$a;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/h;->H1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/audio/h;->z1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/x$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/audio/h$c;->a:Lcom/google/android/exoplayer2/audio/h;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/google/android/exoplayer2/audio/h;->z1(Lcom/google/android/exoplayer2/audio/h;)Lcom/google/android/exoplayer2/x$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/google/android/exoplayer2/x$a;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
