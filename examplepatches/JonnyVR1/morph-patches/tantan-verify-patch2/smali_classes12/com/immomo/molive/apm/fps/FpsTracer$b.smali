.class public final Lcom/immomo/molive/apm/fps/FpsTracer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/molive/apm/fps/FpsTracer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0016\u0010\u0014\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0013R\u0014\u0010\u0017\u001a\u00020\u00158\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u0016R\u0016\u0010\u0019\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u0018R\u0016\u0010\u001c\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0016\u0010\u001e\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u0018R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010\u0018\u00a8\u0006 "
    }
    d2 = {
        "Lcom/immomo/molive/apm/fps/FpsTracer$b;",
        "Landroid/view/Choreographer$FrameCallback;",
        "",
        "refreshRate",
        "<init>",
        "(Lcom/immomo/molive/apm/fps/FpsTracer;I)V",
        "",
        "frameTimeNanos",
        "",
        "doFrame",
        "(J)V",
        "c",
        "()V",
        "",
        "b",
        "()Z",
        "Ll/g4j;",
        "a",
        "()Ll/g4j;",
        "J",
        "mLastTimeNanos",
        "Ll/juf;",
        "Ll/juf;",
        "fpsArray",
        "I",
        "mClockFrame",
        "d",
        "Z",
        "isStop",
        "e",
        "fpsCount",
        "f",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private a:J

.field private final b:Ll/juf;

.field private c:I

.field private volatile d:Z

.field private volatile e:I

.field private final f:I

.field final synthetic g:Lcom/immomo/molive/apm/fps/FpsTracer;


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/fps/FpsTracer;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->g:Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->f:I

    .line 7
    .line 8
    new-instance p1, Ll/juf;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/juf;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->b:Ll/juf;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Ll/g4j;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->g:Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/molive/apm/fps/FpsTracer;->i(Lcom/immomo/molive/apm/fps/FpsTracer;)Ll/g4j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->e:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/g4j;->i(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->g:Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/immomo/molive/apm/fps/FpsTracer;->i(Lcom/immomo/molive/apm/fps/FpsTracer;)Ll/g4j;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->b:Ll/juf;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/juf;->b()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ll/g4j;->g(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->g:Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->i(Lcom/immomo/molive/apm/fps/FpsTracer;)Ll/g4j;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->b:Ll/juf;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/juf;->c()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->a:J

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 15
    .line 16
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->e:I

    .line 17
    .line 18
    return-void
.end method

.method public doFrame(J)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->a:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    iput-wide p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->a:J

    .line 16
    .line 17
    iput v3, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    sub-long v0, p1, v0

    .line 21
    .line 22
    const-wide/32 v4, 0x3b9aca00

    .line 23
    .line 24
    .line 25
    cmp-long v0, v0, v4

    .line 26
    .line 27
    if-ltz v0, :cond_2

    .line 28
    .line 29
    iget v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 30
    .line 31
    iget v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->f:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->e:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->b:Ll/juf;

    .line 40
    .line 41
    iget v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->e:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/juf;->a(I)V

    .line 44
    .line 45
    .line 46
    iput-wide p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->a:J

    .line 47
    .line 48
    iput v3, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 49
    .line 50
    :cond_2
    iget p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 51
    .line 52
    add-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    iput p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c:I

    .line 55
    .line 56
    :goto_0
    iget-boolean p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->d:Z

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    :goto_1
    return-void

    .line 61
    :cond_3
    iget-object p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer$b;->g:Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->j(Lcom/immomo/molive/apm/fps/FpsTracer;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
