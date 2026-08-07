.class public Ll/qlq;
.super Ll/vlq;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000K\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0008\u0004*\u0001%\u0008\u0010\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J/\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000cH\u0010\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0008H\u0000\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0013\u001a\u00020\u00082\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R \u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00158\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\u0017\u0010\u001f\u001a\u00020\u001b8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001eR\u0017\u0010$\u001a\u00020 8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010!\u001a\u0004\u0008\"\u0010#R\u0014\u0010\'\u001a\u00020%8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010&\u00a8\u0006("
    }
    d2 = {
        "Ll/qlq;",
        "Ll/vlq;",
        "Ll/plq;",
        "jankStats",
        "Landroid/view/View;",
        "view",
        "<init>",
        "(Ll/plq;Landroid/view/View;)V",
        "",
        "startTime",
        "uiDuration",
        "expectedDuration",
        "",
        "isJank",
        "Ll/l6j;",
        "f",
        "(JJJZ)Ll/l6j;",
        "g",
        "()J",
        "e",
        "(Landroid/view/View;)J",
        "Ljava/lang/ref/WeakReference;",
        "c",
        "Ljava/lang/ref/WeakReference;",
        "d",
        "()Ljava/lang/ref/WeakReference;",
        "decorViewRef",
        "Landroid/view/Choreographer;",
        "Landroid/view/Choreographer;",
        "getChoreographer",
        "()Landroid/view/Choreographer;",
        "choreographer",
        "Ll/lr60$b;",
        "Ll/lr60$b;",
        "h",
        "()Ll/lr60$b;",
        "metricsStateHolder",
        "l/qlq$a",
        "Ll/qlq$a;",
        "onFrameListenerDelegate",
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
.field private final c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Landroid/view/Choreographer;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ll/lr60$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ll/qlq$a;


# direct methods
.method public constructor <init>(Ll/plq;Landroid/view/View;)V
    .locals 1
    .param p1    # Ll/plq;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/vlq;-><init>(Ll/plq;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/qlq;->c:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/qlq;->d:Landroid/view/Choreographer;

    .line 25
    .line 26
    sget-object v0, Ll/lr60;->Companion:Ll/lr60$a;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, Ll/lr60$a;->b(Landroid/view/View;)Ll/lr60$b;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p0, Ll/qlq;->e:Ll/lr60$b;

    .line 33
    .line 34
    new-instance p2, Ll/qlq$a;

    .line 35
    .line 36
    invoke-direct {p2, p0, p1}, Ll/qlq$a;-><init>(Ll/qlq;Ll/plq;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Ll/qlq;->f:Ll/qlq$a;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/ref/WeakReference;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qlq;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Landroid/view/View;)J
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/rud;->Companion:Ll/rud$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rud$a;->b(Landroid/view/View;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public f(JJJZ)Ll/l6j;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qlq;->e:Ll/lr60$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lr60$b;->a()Ll/lr60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    add-long p5, p1, p3

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p5, p6}, Ll/lr60;->c(JJ)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    :goto_0
    move-wide p4, p3

    .line 18
    move-wide p2, p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    goto :goto_0

    .line 25
    :goto_1
    new-instance p1, Ll/l6j;

    .line 26
    .line 27
    move p6, p7

    .line 28
    move-object p7, p0

    .line 29
    invoke-direct/range {p1 .. p7}, Ll/l6j;-><init>(JJZLjava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method

.method public final g()J
    .locals 2

    .line 1
    sget-object v0, Ll/rud;->Companion:Ll/rud$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rud$a;->a()Ljava/lang/reflect/Field;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/qlq;->d:Landroid/view/Choreographer;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    return-wide v0

    .line 22
    :cond_0
    const-string p0, "null cannot be cast to non-null type kotlin.Long"

    .line 23
    .line 24
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v0, 0x0

    .line 28
    .line 29
    return-wide v0
.end method

.method public final h()Ll/lr60$b;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qlq;->e:Ll/lr60$b;

    .line 2
    .line 3
    return-object p0
.end method
