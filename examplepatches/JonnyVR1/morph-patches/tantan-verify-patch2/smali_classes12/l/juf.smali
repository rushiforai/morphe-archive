.class public final Ll/juf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u001a\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\u0003R(\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00040\n8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0007\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0016\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0008R\"\u0010\u0019\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\t\u0010\u0012\u001a\u0004\u0008\u0017\u0010\u0014\"\u0004\u0008\u0018\u0010\u0008R\"\u0010\u001d\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010\u0012\u001a\u0004\u0008\u001b\u0010\u0014\"\u0004\u0008\u001c\u0010\u0008R\"\u0010!\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u0012\u001a\u0004\u0008\u001f\u0010\u0014\"\u0004\u0008 \u0010\u0008R\"\u0010$\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\"\u0010\u0012\u001a\u0004\u0008\u0011\u0010\u0014\"\u0004\u0008#\u0010\u0008R\"\u0010(\u001a\u00020%8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008&\u0010\'\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+\u00a8\u0006,"
    }
    d2 = {
        "Ll/juf;",
        "",
        "<init>",
        "()V",
        "",
        "fps",
        "",
        "a",
        "(I)V",
        "c",
        "",
        "[Ljava/lang/Integer;",
        "getFpsArray",
        "()[Ljava/lang/Integer;",
        "setFpsArray",
        "([Ljava/lang/Integer;)V",
        "fpsArray",
        "b",
        "I",
        "getCurrentIndex",
        "()I",
        "setCurrentIndex",
        "currentIndex",
        "getFPS",
        "setFPS",
        "FPS",
        "d",
        "getRepeatValue",
        "setRepeatValue",
        "repeatValue",
        "e",
        "getCurrentTotal",
        "setCurrentTotal",
        "currentTotal",
        "f",
        "setAVG_FPS",
        "AVG_FPS",
        "",
        "g",
        "Z",
        "isFullArray",
        "()Z",
        "setFullArray",
        "(Z)V",
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
.field private a:[Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0, v0, v0, v0, v0}, [Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/juf;->a:[Ljava/lang/Integer;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/juf;->a:[Ljava/lang/Integer;

    .line 2
    .line 3
    iget v1, p0, Ll/juf;->b:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    aput-object v2, v0, v1

    .line 10
    .line 11
    iput p1, p0, Ll/juf;->c:I

    .line 12
    .line 13
    iget v0, p0, Ll/juf;->b:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    add-int/2addr v0, v1

    .line 17
    rem-int/lit8 v0, v0, 0x5

    .line 18
    .line 19
    iput v0, p0, Ll/juf;->b:I

    .line 20
    .line 21
    iget-boolean v2, p0, Ll/juf;->g:Z

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iput-boolean v1, p0, Ll/juf;->g:Z

    .line 28
    .line 29
    :cond_0
    iget v1, p0, Ll/juf;->e:I

    .line 30
    .line 31
    add-int/2addr v1, p1

    .line 32
    iput v1, p0, Ll/juf;->e:I

    .line 33
    .line 34
    iget-boolean p1, p0, Ll/juf;->g:Z

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget p1, p0, Ll/juf;->d:I

    .line 39
    .line 40
    sub-int/2addr v1, p1

    .line 41
    iput v1, p0, Ll/juf;->e:I

    .line 42
    .line 43
    div-int/lit8 v1, v1, 0x5

    .line 44
    .line 45
    iput v1, p0, Ll/juf;->f:I

    .line 46
    .line 47
    iget-object p1, p0, Ll/juf;->a:[Ljava/lang/Integer;

    .line 48
    .line 49
    aget-object p1, p1, v0

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Ll/juf;->d:I

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    div-int/2addr v1, v0

    .line 59
    iput v1, p0, Ll/juf;->f:I

    .line 60
    .line 61
    return-void
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/juf;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    filled-new-array {v1, v1, v1, v1, v1}, [Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, p0, Ll/juf;->a:[Ljava/lang/Integer;

    .line 11
    .line 12
    iput v0, p0, Ll/juf;->b:I

    .line 13
    .line 14
    iput v0, p0, Ll/juf;->c:I

    .line 15
    .line 16
    iput v0, p0, Ll/juf;->d:I

    .line 17
    .line 18
    iput v0, p0, Ll/juf;->e:I

    .line 19
    .line 20
    iput v0, p0, Ll/juf;->f:I

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/juf;->g:Z

    .line 23
    .line 24
    return-void
.end method
