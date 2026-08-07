.class final Ll/slq$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Window$OnFrameMetricsAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/slq;-><init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u00032\u000e\u0010\u0005\u001a\n \u0004*\u0004\u0018\u00010\u00060\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\n\u00a2\u0006\u0002\u0008\t"
    }
    d2 = {
        "<anonymous>",
        "",
        "<anonymous parameter 0>",
        "Landroid/view/Window;",
        "kotlin.jvm.PlatformType",
        "frameMetrics",
        "Landroid/view/FrameMetrics;",
        "<anonymous parameter 2>",
        "",
        "onFrameMetricsAvailable"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/slq;

.field final synthetic b:Ll/plq;


# direct methods
.method public constructor <init>(Ll/slq;Ll/plq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/slq$b;->a:Ll/slq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/slq$b;->b:Ll/plq;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onFrameMetricsAvailable(Landroid/view/Window;Landroid/view/FrameMetrics;I)V
    .locals 9

    .line 1
    iget-object p1, p0, Ll/slq$b;->a:Ll/slq;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Ll/slq;->m(Landroid/view/FrameMetrics;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-object p1, p0, Ll/slq$b;->a:Ll/slq;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/slq;->n()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    cmp-long p1, v1, v3

    .line 17
    .line 18
    if-ltz p1, :cond_3

    .line 19
    .line 20
    iget-object p1, p0, Ll/slq$b;->a:Ll/slq;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/slq;->p()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    cmp-long p1, v1, v3

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    iget-object p1, p0, Ll/slq$b;->a:Ll/slq;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ll/slq;->k(Landroid/view/FrameMetrics;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    long-to-float p1, v3

    .line 37
    iget-object p3, p0, Ll/slq$b;->b:Ll/plq;

    .line 38
    .line 39
    invoke-virtual {p3}, Ll/plq;->a()F

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    mul-float/2addr p1, p3

    .line 44
    iget-object p3, p0, Ll/slq$b;->a:Ll/slq;

    .line 45
    .line 46
    invoke-static {p3, p2}, Ll/slq;->i(Ll/slq;Landroid/view/FrameMetrics;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    long-to-float p3, v3

    .line 51
    cmpl-float p3, p3, p1

    .line 52
    .line 53
    if-lez p3, :cond_0

    .line 54
    .line 55
    const/4 p3, 0x1

    .line 56
    :goto_0
    move v8, p3

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 p3, 0x0

    .line 59
    goto :goto_0

    .line 60
    :goto_1
    iget-object p3, p0, Ll/slq$b;->b:Ll/plq;

    .line 61
    .line 62
    invoke-virtual {p3}, Ll/plq;->b()Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_1

    .line 67
    .line 68
    if-eqz v8, :cond_2

    .line 69
    .line 70
    iget-object p2, p0, Ll/slq$b;->b:Ll/plq;

    .line 71
    .line 72
    iget-object v0, p0, Ll/slq$b;->a:Ll/slq;

    .line 73
    .line 74
    float-to-long v5, p1

    .line 75
    const/4 v7, 0x1

    .line 76
    invoke-virtual/range {v0 .. v7}, Ll/qlq;->f(JJJZ)Ll/l6j;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p2, p1}, Ll/plq;->d(Ll/l6j;)V

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_1
    iget-object p3, p0, Ll/slq$b;->b:Ll/plq;

    .line 85
    .line 86
    iget-object v0, p0, Ll/slq$b;->a:Ll/slq;

    .line 87
    .line 88
    float-to-long v5, p1

    .line 89
    move-object v7, p2

    .line 90
    invoke-virtual/range {v0 .. v8}, Ll/slq;->l(JJJLandroid/view/FrameMetrics;Z)Ll/m6j;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p3, p1}, Ll/plq;->c(Ll/l6j;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_2
    iget-object p0, p0, Ll/slq$b;->a:Ll/slq;

    .line 98
    .line 99
    invoke-virtual {p0, v1, v2}, Ll/slq;->r(J)V

    .line 100
    .line 101
    .line 102
    :cond_3
    return-void
.end method
