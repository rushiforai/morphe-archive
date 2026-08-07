.class public final synthetic Lcom/google/android/libraries/places/internal/zzfr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->k()Ljava/lang/Exception;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_8

    .line 6
    .line 7
    instance-of p1, p0, Lcom/google/android/gms/common/api/ApiException;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/google/android/gms/common/api/ApiException;

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    instance-of p1, p0, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 16
    .line 17
    const/16 v0, 0xd

    .line 18
    .line 19
    if-eqz p1, :cond_7

    .line 20
    .line 21
    check-cast p0, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zze(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdj;->zza:Lcom/google/android/libraries/places/internal/zzbdj;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v1, 0x3

    .line 38
    if-eq p1, v1, :cond_6

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    if-eq p1, v1, :cond_5

    .line 42
    .line 43
    const/4 v1, 0x5

    .line 44
    if-eq p1, v1, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x7

    .line 47
    if-eq p1, v1, :cond_3

    .line 48
    .line 49
    if-eq p1, v0, :cond_2

    .line 50
    .line 51
    const/16 v2, 0xe

    .line 52
    .line 53
    if-eq p1, v2, :cond_1

    .line 54
    .line 55
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 56
    .line 57
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-direct {v1, v0, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p1, v1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    move-object p0, p1

    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_1
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 73
    .line 74
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 88
    .line 89
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 90
    .line 91
    const/16 v1, 0x8

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 105
    .line 106
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 107
    .line 108
    const/16 v1, 0x2333

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_4
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 122
    .line 123
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 124
    .line 125
    const/16 v1, 0x2335

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 139
    .line 140
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 141
    .line 142
    const/16 v1, 0xf

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_6
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 156
    .line 157
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 158
    .line 159
    const/16 v1, 0x2334

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 169
    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_7
    new-instance p1, Lcom/google/android/gms/common/api/ApiException;

    .line 173
    .line 174
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-direct {v1, v0, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-direct {p1, v1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 184
    .line 185
    .line 186
    goto :goto_0

    .line 187
    :goto_1
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    return-object p0

    .line 192
    :cond_8
    return-object p1
.end method
