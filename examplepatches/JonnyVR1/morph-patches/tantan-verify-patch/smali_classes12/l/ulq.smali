.class public final Ll/ulq;
.super Ll/tlq;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ7\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0016\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u000eH\u0017\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/ulq;",
        "Ll/tlq;",
        "Ll/plq;",
        "jankStats",
        "Landroid/view/View;",
        "view",
        "Landroid/view/Window;",
        "window",
        "<init>",
        "(Ll/plq;Landroid/view/View;Landroid/view/Window;)V",
        "",
        "startTime",
        "uiDuration",
        "expectedDuration",
        "Landroid/view/FrameMetrics;",
        "frameMetrics",
        "",
        "isJank",
        "Ll/n6j;",
        "s",
        "(JJJLandroid/view/FrameMetrics;Z)Ll/n6j;",
        "metrics",
        "k",
        "(Landroid/view/FrameMetrics;)J",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V
    .locals 0
    .param p1    # Ll/plq;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/Window;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3}, Ll/tlq;-><init>(Ll/plq;Landroid/view/View;Landroid/view/Window;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public k(Landroid/view/FrameMetrics;)J
    .locals 0
    .param p1    # Landroid/view/FrameMetrics;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/16 p0, 0xd

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/FrameMetrics;->getMetric(I)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public bridge synthetic l(JJJLandroid/view/FrameMetrics;Z)Ll/m6j;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Ll/ulq;->s(JJJLandroid/view/FrameMetrics;Z)Ll/n6j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(JJJLandroid/view/FrameMetrics;Z)Ll/n6j;
    .locals 11
    .param p7    # Landroid/view/FrameMetrics;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p7

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qlq;->h()Ll/lr60$b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/lr60$b;->a()Ll/lr60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    add-long v1, p1, p3

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, v1, v2}, Ll/lr60;->c(JJ)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    :goto_0
    move-object v10, p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    const/4 p0, 0x6

    .line 32
    invoke-virtual {v0, p0}, Landroid/view/FrameMetrics;->getMetric(I)J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    add-long/2addr v1, p3

    .line 37
    const/4 p0, 0x7

    .line 38
    invoke-virtual {v0, p0}, Landroid/view/FrameMetrics;->getMetric(I)J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    add-long v5, v1, v3

    .line 43
    .line 44
    const/16 p0, 0x8

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Landroid/view/FrameMetrics;->getMetric(I)J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    const/16 p0, 0xd

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/view/FrameMetrics;->getMetric(I)J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    sub-long v7, v1, v3

    .line 57
    .line 58
    new-instance v0, Ll/n6j;

    .line 59
    .line 60
    move-wide v1, p1

    .line 61
    move-wide v3, p3

    .line 62
    move/from16 v9, p8

    .line 63
    .line 64
    invoke-direct/range {v0 .. v10}, Ll/n6j;-><init>(JJJJZLjava/util/List;)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method
