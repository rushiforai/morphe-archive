.class Ll/k3r0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/k3r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Ll/k3r0$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ll/k3r0$b;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_1
    if-nez p2, :cond_2

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_2
    instance-of p0, p1, Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_3

    .line 18
    .line 19
    check-cast p1, Ljava/util/List;

    .line 20
    .line 21
    check-cast p2, Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1, p2}, Ll/k3r0;->g(Ljava/util/List;Ljava/util/List;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_3
    instance-of p0, p1, Ljava/util/Set;

    .line 29
    .line 30
    if-eqz p0, :cond_4

    .line 31
    .line 32
    check-cast p1, Ljava/util/Set;

    .line 33
    .line 34
    check-cast p2, Ljava/util/Set;

    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/k3r0;->i(Ljava/util/Set;Ljava/util/Set;)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_4
    instance-of p0, p1, Ljava/util/Map;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    check-cast p1, Ljava/util/Map;

    .line 46
    .line 47
    check-cast p2, Ljava/util/Map;

    .line 48
    .line 49
    invoke-static {p1, p2}, Ll/k3r0;->h(Ljava/util/Map;Ljava/util/Map;)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_5
    instance-of p0, p1, [B

    .line 55
    .line 56
    if-eqz p0, :cond_6

    .line 57
    .line 58
    check-cast p1, [B

    .line 59
    .line 60
    check-cast p2, [B

    .line 61
    .line 62
    invoke-static {p1, p2}, Ll/k3r0;->l([B[B)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_6
    check-cast p1, Ljava/lang/Comparable;

    .line 68
    .line 69
    check-cast p2, Ljava/lang/Comparable;

    .line 70
    .line 71
    invoke-static {p1, p2}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0
.end method
