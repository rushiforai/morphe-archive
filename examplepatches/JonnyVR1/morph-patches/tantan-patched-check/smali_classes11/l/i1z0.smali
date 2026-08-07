.class public final Ll/i1z0;
.super Ll/mpr0;
.source "SourceFile"


# instance fields
.field public c:Ll/zar0;


# direct methods
.method public constructor <init>(Ll/zar0;)V
    .locals 1

    .line 1
    const-string v0, "internal.registerCallback"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/mpr0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/i1z0;->c:Ll/zar0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final d(Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mpr0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v0, v1, p2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/ewr0;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/ewr0;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    instance-of v2, v1, Ll/pxr0;

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/ewr0;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    instance-of p2, p1, Ll/avr0;

    .line 50
    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    check-cast p1, Ll/avr0;

    .line 54
    .line 55
    const-string p2, "type"

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ll/avr0;->zzc(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Ll/avr0;->zza(Ljava/lang/String;)Ll/ewr0;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p2}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    const-string v2, "priority"

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ll/avr0;->zzc(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_0

    .line 78
    .line 79
    invoke-virtual {p1, v2}, Ll/avr0;->zza(Ljava/lang/String;)Ll/ewr0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    invoke-static {v2, v3}, Ll/tqw0;->i(D)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    const/16 p1, 0x3e8

    .line 97
    .line 98
    :goto_0
    iget-object p0, p0, Ll/i1z0;->c:Ll/zar0;

    .line 99
    .line 100
    check-cast v1, Ll/pxr0;

    .line 101
    .line 102
    invoke-virtual {p0, v0, p1, v1, p2}, Ll/zar0;->b(Ljava/lang/String;ILl/pxr0;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    sget-object p0, Ll/ewr0;->w0:Ll/ewr0;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_1
    const-string p0, "Undefined rule type"

    .line 109
    .line 110
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v3

    .line 114
    :cond_2
    const-string p0, "Invalid callback params"

    .line 115
    .line 116
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-object v3

    .line 120
    :cond_3
    const-string p0, "Invalid callback type"

    .line 121
    .line 122
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-object v3
.end method
