.class public final Ll/mfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u7j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mfe$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\n\u0018\u0000 \u00192\u00020\u0001:\u0001\u000eB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\n\u001a\u00020\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u0016R\u0016\u0010\u0018\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u0017\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/mfe;",
        "Ll/u7j;",
        "Ll/kr0;",
        "animationInformation",
        "<init>",
        "(Ll/kr0;)V",
        "",
        "animationTimeMs",
        "lastFrameTimeMs",
        "",
        "b",
        "(JJ)I",
        "d",
        "()J",
        "a",
        "(J)J",
        "",
        "e",
        "()Z",
        "timeInCurrentLoopMs",
        "c",
        "(J)I",
        "Ll/kr0;",
        "J",
        "_loopDurationMs",
        "Companion",
        "animated-drawable_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/mfe$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/kr0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/mfe$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/mfe$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/mfe;->Companion:Ll/mfe$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/kr0;)V
    .locals 2
    .param p1    # Ll/kr0;
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
    iput-object p1, p0, Ll/mfe;->a:Ll/kr0;

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Ll/mfe;->b:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(J)J
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/mfe;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v4, v0, v2

    .line 8
    .line 9
    const-wide/16 v5, -0x1

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    return-wide v5

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/mfe;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-nez v4, :cond_1

    .line 19
    .line 20
    div-long v7, p1, v0

    .line 21
    .line 22
    iget-object v4, p0, Ll/mfe;->a:Ll/kr0;

    .line 23
    .line 24
    invoke-interface {v4}, Ll/kr0;->getLoopCount()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-long v9, v4

    .line 29
    cmp-long v4, v7, v9

    .line 30
    .line 31
    if-ltz v4, :cond_1

    .line 32
    .line 33
    return-wide v5

    .line 34
    :cond_1
    rem-long v0, p1, v0

    .line 35
    .line 36
    iget-object v4, p0, Ll/mfe;->a:Ll/kr0;

    .line 37
    .line 38
    invoke-interface {v4}, Ll/kr0;->getFrameCount()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    const/4 v5, 0x0

    .line 43
    :goto_0
    if-ge v5, v4, :cond_2

    .line 44
    .line 45
    cmp-long v6, v2, v0

    .line 46
    .line 47
    if-gtz v6, :cond_2

    .line 48
    .line 49
    iget-object v6, p0, Ll/mfe;->a:Ll/kr0;

    .line 50
    .line 51
    invoke-interface {v6, v5}, Ll/kr0;->g(I)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    int-to-long v6, v6

    .line 56
    add-long/2addr v2, v6

    .line 57
    add-int/lit8 v5, v5, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    sub-long/2addr v2, v0

    .line 61
    add-long/2addr p1, v2

    .line 62
    return-wide p1
.end method

.method public b(JJ)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/mfe;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide p3

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v2, p3, v0

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/mfe;->c(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/mfe;->e()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    div-long v0, p1, p3

    .line 23
    .line 24
    iget-object v2, p0, Ll/mfe;->a:Ll/kr0;

    .line 25
    .line 26
    invoke-interface {v2}, Ll/kr0;->getLoopCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-long v2, v2

    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-ltz v0, :cond_1

    .line 34
    .line 35
    const/4 p0, -0x1

    .line 36
    return p0

    .line 37
    :cond_1
    rem-long/2addr p1, p3

    .line 38
    invoke-virtual {p0, p1, p2}, Ll/mfe;->c(J)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public final c(J)I
    .locals 5
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    :goto_0
    iget-object v3, p0, Ll/mfe;->a:Ll/kr0;

    .line 5
    .line 6
    invoke-interface {v3, v0}, Ll/kr0;->g(I)I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    int-to-long v3, v3

    .line 11
    add-long/2addr v1, v3

    .line 12
    add-int/lit8 v3, v0, 0x1

    .line 13
    .line 14
    cmp-long v4, p1, v1

    .line 15
    .line 16
    if-gez v4, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    move v0, v3

    .line 20
    goto :goto_0
.end method

.method public d()J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/mfe;->b:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Ll/mfe;->b:J

    .line 13
    .line 14
    iget-object v0, p0, Ll/mfe;->a:Ll/kr0;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/kr0;->getFrameCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    iget-wide v2, p0, Ll/mfe;->b:J

    .line 22
    .line 23
    if-ge v1, v0, :cond_1

    .line 24
    .line 25
    iget-object v4, p0, Ll/mfe;->a:Ll/kr0;

    .line 26
    .line 27
    invoke-interface {v4, v1}, Ll/kr0;->g(I)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    int-to-long v4, v4

    .line 32
    add-long/2addr v2, v4

    .line 33
    iput-wide v2, p0, Ll/mfe;->b:J

    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-wide v2
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mfe;->a:Ll/kr0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kr0;->getLoopCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
