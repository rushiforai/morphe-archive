.class public final Ll/plq;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/plq$b;,
        Ll/plq$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0007\n\u0002\u0008\t\u0018\u0000 &2\u00020\u0001:\u0002\u0011\u0015B#\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0000\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0000\u00a2\u0006\u0004\u0008\u000f\u0010\u000eR\u0014\u0010\u0013\u001a\u00020\u00108\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0017\u001a\u00020\u00148\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R*\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u00068\u0006@FX\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR*\u0010#\u001a\u00020\u001e2\u0006\u0010\u0018\u001a\u00020\u001e8\u0006@FX\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u001f\u001a\u0004\u0008\u0011\u0010 \"\u0004\u0008!\u0010\"R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010$R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008%\u0010\u0019\u001a\u0004\u0008\u0015\u0010\u001b\u00a8\u0006\'"
    }
    d2 = {
        "Ll/plq;",
        "",
        "Landroid/view/Window;",
        "window",
        "Ll/plq$b;",
        "frameListener",
        "",
        "onlyMonitorJankFame",
        "<init>",
        "(Landroid/view/Window;Ll/plq$b;Z)V",
        "Ll/l6j;",
        "frameData",
        "",
        "c",
        "(Ll/l6j;)V",
        "d",
        "Ll/lr60$b;",
        "a",
        "Ll/lr60$b;",
        "metricsStateHolder",
        "Ll/vlq;",
        "b",
        "Ll/vlq;",
        "implementation",
        "value",
        "Z",
        "isTrackingEnabled",
        "()Z",
        "e",
        "(Z)V",
        "",
        "F",
        "()F",
        "setJankHeuristicMultiplier",
        "(F)V",
        "jankHeuristicMultiplier",
        "Ll/plq$b;",
        "f",
        "Companion",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Ll/plq$a;


# instance fields
.field private final a:Ll/lr60$b;

.field private final b:Ll/vlq;

.field private c:Z

.field private d:F

.field private final e:Ll/plq$b;

.field private final f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/plq$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/plq$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/plq;->Companion:Ll/plq$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Landroid/view/Window;Ll/plq$b;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/plq;->e:Ll/plq$b;

    .line 5
    .line 6
    iput-boolean p3, p0, Ll/plq;->f:Z

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    sget-object p3, Ll/lr60;->Companion:Ll/lr60$a;

    .line 15
    .line 16
    invoke-virtual {p3, p2}, Ll/lr60$a;->a(Landroid/view/View;)Ll/lr60$b;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iput-object p3, p0, Ll/plq;->a:Ll/lr60$b;

    .line 21
    .line 22
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v0, 0x1f

    .line 25
    .line 26
    if-lt p3, v0, :cond_0

    .line 27
    .line 28
    new-instance p3, Ll/ulq;

    .line 29
    .line 30
    invoke-direct {p3, p0, p2, p1}, Ll/ulq;-><init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/16 v0, 0x1a

    .line 35
    .line 36
    if-lt p3, v0, :cond_1

    .line 37
    .line 38
    new-instance p3, Ll/tlq;

    .line 39
    .line 40
    invoke-direct {p3, p0, p2, p1}, Ll/tlq;-><init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    new-instance p3, Ll/slq;

    .line 45
    .line 46
    invoke-direct {p3, p0, p2, p1}, Ll/slq;-><init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iput-object p3, p0, Ll/plq;->b:Ll/vlq;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p3, p1}, Ll/vlq;->c(Z)V

    .line 53
    .line 54
    .line 55
    iput-boolean p1, p0, Ll/plq;->c:Z

    .line 56
    .line 57
    const/high16 p1, 0x40000000    # 2.0f

    .line 58
    .line 59
    iput p1, p0, Ll/plq;->d:F

    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    const-string p0, "window.peekDecorView() is null: JankStats can only be created with a Window that has a non-null DecorView"

    .line 63
    .line 64
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    throw p0
.end method

.method public synthetic constructor <init>(Landroid/view/Window;Ll/plq$b;ZLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2, p3}, Ll/plq;-><init>(Landroid/view/Window;Ll/plq$b;Z)V

    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/plq;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/plq;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c(Ll/l6j;)V
    .locals 0
    .param p1    # Ll/l6j;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/plq;->e:Ll/plq$b;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/plq$b;->a(Ll/l6j;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Ll/l6j;)V
    .locals 0
    .param p1    # Ll/l6j;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/plq;->e:Ll/plq$b;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/plq$b;->b(Ll/l6j;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/plq;->b:Ll/vlq;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/vlq;->c(Z)V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, p0, Ll/plq;->c:Z

    .line 7
    .line 8
    return-void
.end method
