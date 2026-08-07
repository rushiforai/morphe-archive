.class public final Ll/ioy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/ioy0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ioy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ioy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ioy0;->a:Ll/ioy0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;
    .locals 27

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xxu0;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v13

    .line 7
    invoke-virtual {v0}, Ll/xxu0;->m()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    new-instance v2, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    move-object v6, v1

    .line 28
    :goto_0
    move-object/from16 v1, p1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move-object v6, v3

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-virtual {v0, v1}, Ll/xxu0;->o(Landroid/content/Context;)Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    const-class v2, Lcom/google/ads/mediation/admob/AdMobAdapter;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ll/xxu0;->d(Ljava/lang/Class;)Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v0}, Ll/xxu0;->i()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    invoke-virtual {v0}, Ll/xxu0;->f()Ll/ree0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2, v1}, Ll/obt0;->s([Ljava/lang/StackTraceElement;Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    move-object/from16 v18, v1

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_1
    move-object/from16 v18, v3

    .line 79
    .line 80
    :goto_2
    invoke-virtual {v0}, Ll/xxu0;->n()Z

    .line 81
    .line 82
    .line 83
    move-result v19

    .line 84
    invoke-static {}, Ll/gdv0;->f()Ll/gdv0;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/gdv0;->c()Lcom/google/android/gms/ads/RequestConfiguration;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0}, Ll/xxu0;->b()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration;->c()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration;->a()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    sget-object v3, Ll/wky0;->a:Ll/wky0;

    .line 117
    .line 118
    invoke-static {v2, v3}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    move-object/from16 v22, v2

    .line 123
    .line 124
    check-cast v22, Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/xxu0;->k()Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object v23

    .line 130
    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl;

    .line 131
    .line 132
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->e()Landroid/os/Bundle;

    .line 133
    .line 134
    .line 135
    move-result-object v14

    .line 136
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->c()Landroid/os/Bundle;

    .line 137
    .line 138
    .line 139
    move-result-object v15

    .line 140
    new-instance v2, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->l()Ljava/util/Set;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 150
    .line 151
    .line 152
    move-result-object v16

    .line 153
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->j()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v17

    .line 157
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration;->d()I

    .line 158
    .line 159
    .line 160
    move-result v21

    .line 161
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->a()I

    .line 162
    .line 163
    .line 164
    move-result v24

    .line 165
    invoke-virtual/range {p2 .. p2}, Ll/xxu0;->g()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v25

    .line 169
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration;->b()Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;->getValue()I

    .line 174
    .line 175
    .line 176
    move-result v26

    .line 177
    const/16 v1, 0x8

    .line 178
    .line 179
    const-wide/16 v2, -0x1

    .line 180
    .line 181
    const/4 v5, -0x1

    .line 182
    const/4 v9, 0x0

    .line 183
    const/4 v11, 0x0

    .line 184
    const/4 v12, 0x0

    .line 185
    const/16 v20, 0x0

    .line 186
    .line 187
    invoke-direct/range {v0 .. v26}, Lcom/google/android/gms/ads/internal/client/zzl;-><init>(IJLandroid/os/Bundle;ILjava/util/List;ZIZLjava/lang/String;Lcom/google/android/gms/ads/internal/client/zzfh;Landroid/location/Location;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/ads/internal/client/zzc;ILjava/lang/String;Ljava/util/List;ILjava/lang/String;I)V

    .line 188
    .line 189
    .line 190
    return-object v0
.end method
