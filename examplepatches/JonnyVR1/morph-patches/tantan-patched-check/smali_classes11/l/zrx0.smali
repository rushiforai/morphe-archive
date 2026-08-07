.class public final Ll/zrx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vzy0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/e;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/measurement/zzs;Ljava/lang/String;Ljava/util/List;ZZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/measurement/zzs;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;ZZ)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/isx0;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    const/4 v1, 0x2

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq p1, v2, :cond_7

    .line 13
    .line 14
    if-eq p1, v1, :cond_4

    .line 15
    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 19
    .line 20
    const/4 p4, 0x4

    .line 21
    if-eq p1, p4, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/d6x0;->D()Ll/l8x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    if-eqz p4, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/d6x0;->H()Ll/l8x0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 55
    .line 56
    if-nez p5, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/d6x0;->G()Ll/l8x0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    goto :goto_0

    .line 67
    :cond_3
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    goto :goto_0

    .line 76
    :cond_4
    if-eqz p4, :cond_5

    .line 77
    .line 78
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    goto :goto_0

    .line 89
    :cond_5
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 90
    .line 91
    if-nez p5, :cond_6

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Ll/d6x0;->B()Ll/l8x0;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    goto :goto_0

    .line 102
    :cond_6
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    goto :goto_0

    .line 111
    :cond_7
    iget-object p0, p0, Ll/zrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/d6x0;->z()Ll/l8x0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    const/4 p4, 0x0

    .line 126
    if-eq p1, v2, :cond_a

    .line 127
    .line 128
    if-eq p1, v1, :cond_9

    .line 129
    .line 130
    if-eq p1, v0, :cond_8

    .line 131
    .line 132
    invoke-virtual {p0, p2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_8
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p4

    .line 144
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p0, p2, p1, p4, p3}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_9
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p3

    .line 160
    invoke-virtual {p0, p2, p1, p3}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_a
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p2, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method
