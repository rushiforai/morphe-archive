.class public final synthetic Ll/y3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic a:Ll/y3z0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/y3z0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/y3z0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/y3z0;->a:Ll/y3z0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    check-cast p2, Ljava/util/List;

    .line 4
    .line 5
    invoke-static {}, Ll/gqw0;->j()Ll/gqw0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Ll/i5z0;->a:Ll/i5z0;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/k5z0;

    .line 16
    .line 17
    invoke-static {p2, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/k5z0;

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2, v0}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p0, v0, v1}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v0, Ll/j5z0;->a:Ll/j5z0;

    .line 40
    .line 41
    invoke-static {p1, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ll/k5z0;

    .line 46
    .line 47
    invoke-static {p2, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Ll/k5z0;

    .line 52
    .line 53
    invoke-virtual {p0, p1, p2, v0}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/gqw0;->a()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method
