.class public final Ll/vos0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 4

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "window"

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/view/WindowManager;

    .line 14
    .line 15
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 16
    .line 17
    .line 18
    move-object p2, p1

    .line 19
    check-cast p2, Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/google/android/gms/ads/internal/util/b;->U(Landroid/view/WindowManager;)Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 26
    .line 27
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    new-array v1, v1, [I

    .line 31
    .line 32
    new-instance v2, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 38
    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    aget p2, v1, p2

    .line 42
    .line 43
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const-string v3, "xInPixels"

    .line 48
    .line 49
    invoke-interface {v2, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const/4 p2, 0x1

    .line 53
    aget p2, v1, p2

    .line 54
    .line 55
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string v1, "yInPixels"

    .line 60
    .line 61
    invoke-interface {v2, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const-string v0, "windowWidthInPixels"

    .line 69
    .line 70
    invoke-interface {v2, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p2, "windowHeightInPixels"

    .line 78
    .line 79
    invoke-interface {v2, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string p0, "locationReady"

    .line 83
    .line 84
    invoke-interface {p1, p0, v2}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 85
    .line 86
    .line 87
    const-string p0, "GET LOCATION COMPILED"

    .line 88
    .line 89
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
