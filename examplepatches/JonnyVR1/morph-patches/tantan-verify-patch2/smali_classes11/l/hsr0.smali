.class public final synthetic Ll/hsr0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/util/Map;)Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/ewr0;",
            ">;)",
            "Ljava/util/Iterator<",
            "Ll/ewr0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/vqr0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/vqr0;-><init>(Ljava/util/Iterator;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static b(Ll/eor0;Ll/ewr0;Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/eor0;",
            "Ll/ewr0;",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ll/eor0;->zzc(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {p0, v0}, Ll/eor0;->zza(Ljava/lang/String;)Ll/ewr0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    instance-of v0, p0, Ll/mpr0;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    check-cast p0, Ll/mpr0;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p3}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "%s is not a function"

    .line 40
    .line 41
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_1
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v2, "hasOwnProperty"

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-static {v2, p1, p3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Ll/ewr0;

    .line 67
    .line 68
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {p0, p1}, Ll/eor0;->zzc(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_2

    .line 81
    .line 82
    sget-object p0, Ll/ewr0;->B0:Ll/ewr0;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    sget-object p0, Ll/ewr0;->C0:Ll/ewr0;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_3
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p1, "Object has no function %s"

    .line 97
    .line 98
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-object v1
.end method
