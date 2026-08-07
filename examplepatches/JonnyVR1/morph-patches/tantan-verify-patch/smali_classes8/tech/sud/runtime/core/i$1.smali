.class Ltech/sud/runtime/core/i$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/i;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/core/i;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/runtime/core/i;->a(Ltech/sud/runtime/core/i;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 10
    .line 11
    invoke-static {v0}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 16
    .line 17
    invoke-static {v1}, Ltech/sud/runtime/core/i;->c(Ltech/sud/runtime/core/i;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 24
    .line 25
    invoke-static {v0}, Ltech/sud/runtime/core/i;->d(Ltech/sud/runtime/core/i;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 30
    .line 31
    invoke-static {v1}, Ltech/sud/runtime/core/i;->e(Ltech/sud/runtime/core/i;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eq v0, v1, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 38
    .line 39
    invoke-static {v0}, Ltech/sud/runtime/core/i;->f(Ltech/sud/runtime/core/i;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 46
    .line 47
    invoke-static {v0}, Ltech/sud/runtime/core/i;->f(Ltech/sud/runtime/core/i;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 52
    .line 53
    iget-object v2, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 54
    .line 55
    invoke-static {v2}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-object v3, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 60
    .line 61
    invoke-static {v3}, Ltech/sud/runtime/core/i;->d(Ltech/sud/runtime/core/i;)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 72
    .line 73
    invoke-static {v0}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v0, v1}, Ltech/sud/runtime/core/i;->a(Ltech/sud/runtime/core/i;I)I

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ltech/sud/runtime/core/i$1;->a:Ltech/sud/runtime/core/i;

    .line 81
    .line 82
    invoke-static {p0}, Ltech/sud/runtime/core/i;->d(Ltech/sud/runtime/core/i;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-static {p0, v0}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;I)I

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method
