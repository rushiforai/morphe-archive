.class public final Ll/byy0;
.super Ll/mpr0;
.source "SourceFile"


# instance fields
.field public c:Z

.field public d:Z

.field public final synthetic e:Ll/rsy0;


# direct methods
.method public constructor <init>(Ll/rsy0;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/byy0;->e:Ll/rsy0;

    .line 2
    .line 3
    const-string p1, "log"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/mpr0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-boolean p2, p0, Ll/byy0;->c:Z

    .line 9
    .line 10
    iput-boolean p3, p0, Ll/byy0;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final d(Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 9
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
    const-string v0, "log"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1, p2}, Ll/tqw0;->k(Ljava/lang/String;ILjava/util/List;)V

    .line 5
    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/byy0;->e:Ll/rsy0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/rsy0;->e(Ll/rsy0;)Ll/vzy0;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    sget-object v4, Lcom/google/android/gms/internal/measurement/zzs;->zzc:Lcom/google/android/gms/internal/measurement/zzs;

    .line 21
    .line 22
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Ll/ewr0;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 37
    .line 38
    iget-boolean v7, p0, Ll/byy0;->c:Z

    .line 39
    .line 40
    iget-boolean v8, p0, Ll/byy0;->d:Z

    .line 41
    .line 42
    invoke-interface/range {v3 .. v8}, Ll/vzy0;->a(Lcom/google/android/gms/internal/measurement/zzs;Ljava/lang/String;Ljava/util/List;ZZ)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Ll/ewr0;->w0:Ll/ewr0;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_0
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/ewr0;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    invoke-static {v2, v3}, Ll/tqw0;->i(D)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-static {v0}, Lcom/google/android/gms/internal/measurement/zzs;->zza(I)Lcom/google/android/gms/internal/measurement/zzs;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/ewr0;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v0}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const/4 v1, 0x2

    .line 93
    if-ne v0, v1, :cond_1

    .line 94
    .line 95
    iget-object p1, p0, Ll/byy0;->e:Ll/rsy0;

    .line 96
    .line 97
    invoke-static {p1}, Ll/rsy0;->e(Ll/rsy0;)Ll/vzy0;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 102
    .line 103
    iget-boolean v6, p0, Ll/byy0;->c:Z

    .line 104
    .line 105
    iget-boolean v7, p0, Ll/byy0;->d:Z

    .line 106
    .line 107
    invoke-interface/range {v2 .. v7}, Ll/vzy0;->a(Lcom/google/android/gms/internal/measurement/zzs;Ljava/lang/String;Ljava/util/List;ZZ)V

    .line 108
    .line 109
    .line 110
    sget-object p0, Ll/ewr0;->w0:Ll/ewr0;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    const/4 v2, 0x5

    .line 123
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-ge v1, v0, :cond_2

    .line 128
    .line 129
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Ll/ewr0;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    add-int/lit8 v1, v1, 0x1

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_2
    iget-object p1, p0, Ll/byy0;->e:Ll/rsy0;

    .line 150
    .line 151
    invoke-static {p1}, Ll/rsy0;->e(Ll/rsy0;)Ll/vzy0;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    iget-boolean v6, p0, Ll/byy0;->c:Z

    .line 156
    .line 157
    iget-boolean v7, p0, Ll/byy0;->d:Z

    .line 158
    .line 159
    invoke-interface/range {v2 .. v7}, Ll/vzy0;->a(Lcom/google/android/gms/internal/measurement/zzs;Ljava/lang/String;Ljava/util/List;ZZ)V

    .line 160
    .line 161
    .line 162
    sget-object p0, Ll/ewr0;->w0:Ll/ewr0;

    .line 163
    .line 164
    return-object p0
.end method
