.class public Ltech/sud/runtime/component/c/h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/c/h$a;
    }
.end annotation


# static fields
.field private static c:Ltech/sud/runtime/component/c/h;


# instance fields
.field public a:I

.field public b:I

.field private d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ltech/sud/runtime/component/c/h;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/runtime/component/c/h;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltech/sud/runtime/component/c/h;->c:Ltech/sud/runtime/component/c/h;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/h;->d:Z

    .line 6
    .line 7
    iput v0, p0, Ltech/sud/runtime/component/c/h;->a:I

    .line 8
    .line 9
    iput v0, p0, Ltech/sud/runtime/component/c/h;->b:I

    .line 10
    .line 11
    return-void
.end method

.method public static a(Landroid/content/Context;)I
    .locals 1

    .line 58
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 59
    invoke-static {p0, v0}, Ltech/sud/runtime/component/c/h$a;->a(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ltech/sud/runtime/component/c/h;->a(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Ltech/sud/runtime/core/g;)V
    .locals 3

    .line 1
    iget v0, p0, Ltech/sud/runtime/component/c/h;->a:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/h;->d:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/h;->d:Z

    .line 13
    .line 14
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 17
    .line 18
    .line 19
    check-cast p1, Landroid/app/Activity;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 30
    .line 31
    .line 32
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 33
    .line 34
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 35
    .line 36
    if-le p1, v0, :cond_3

    .line 37
    .line 38
    invoke-static {}, Ltech/sud/runtime/component/c/b;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/h;->d:Z

    .line 46
    .line 47
    :cond_2
    move v2, v0

    .line 48
    move v0, p1

    .line 49
    move p1, v2

    .line 50
    :cond_3
    iput p1, p0, Ltech/sud/runtime/component/c/h;->a:I

    .line 51
    .line 52
    iput v0, p0, Ltech/sud/runtime/component/c/h;->b:I

    .line 53
    .line 54
    invoke-virtual {p2, p1, v0}, Ltech/sud/runtime/core/g;->a(II)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
