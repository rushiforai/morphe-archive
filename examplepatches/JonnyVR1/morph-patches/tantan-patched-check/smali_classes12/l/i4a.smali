.class public final Ll/i4a;
.super Ll/qpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i4a$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u0000 &2\u00020\u0001:\u0001\'B\u0011\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\'\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\'\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\r2\u0006\u0010\u0014\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\"\u0010!\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u001e0\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010 R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\"\u0010#\u001a\u0004\u0008$\u0010%\u00a8\u0006("
    }
    d2 = {
        "Ll/i4a;",
        "Ll/qpl;",
        "Ll/hul;",
        "pMkWebview",
        "<init>",
        "(Ll/hul;)V",
        "Lorg/json/JSONObject;",
        "params",
        "",
        "t",
        "(Lorg/json/JSONObject;)V",
        "r",
        "json",
        "",
        "k",
        "",
        "b",
        "s",
        "(Lorg/json/JSONObject;Ljava/lang/String;Z)V",
        "namespace",
        "method",
        "p",
        "(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z",
        "l",
        "()V",
        "Ll/ehi;",
        "c",
        "Ll/ehi;",
        "packageObserver",
        "",
        "Ll/jf3;",
        "d",
        "Ljava/util/Map;",
        "cacheCallbacks",
        "e",
        "Ll/hul;",
        "getPMkWebview",
        "()Ll/hul;",
        "Companion",
        "a",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Ll/i4a$a;


# instance fields
.field private c:Ll/ehi;

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/jf3;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ll/hul;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/i4a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/i4a$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/i4a;->Companion:Ll/i4a$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/hul;)V
    .locals 0
    .param p1    # Ll/hul;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/qpl;-><init>(Ll/hul;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i4a;->e:Ll/hul;

    .line 5
    .line 6
    new-instance p1, Ll/i4a$b;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/i4a$b;-><init>(Ll/i4a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/i4a;->c:Ll/ehi;

    .line 12
    .line 13
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/i4a;->d:Ljava/util/Map;

    .line 19
    .line 20
    iget-object p0, p0, Ll/i4a;->c:Ll/ehi;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, p0}, Lcom/hellogroup/fep/base/core/FepManager;->v(Ll/ehi;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static final synthetic q(Ll/i4a;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i4a;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method private final r(Lorg/json/JSONObject;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {v1}, Ll/glw;->d(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "resources"

    .line 10
    .line 11
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_8

    .line 16
    .line 17
    const-string v4, "bid"

    .line 18
    .line 19
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    new-instance v5, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    if-eqz v6, :cond_7

    .line 37
    .line 38
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    check-cast v6, Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    const/4 v9, 0x0

    .line 53
    if-eqz v8, :cond_0

    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    invoke-direct {v0, v5, v6, v9}, Ll/i4a;->s(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-static {v7}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v8

    .line 66
    invoke-static {v1}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v10

    .line 70
    if-eqz v10, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    move-object v8, v1

    .line 76
    :cond_1
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v10

    .line 80
    if-eqz v10, :cond_2

    .line 81
    .line 82
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    invoke-direct {v0, v5, v6, v9}, Ll/i4a;->s(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    sget-object v10, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 90
    .line 91
    invoke-virtual {v10}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 92
    .line 93
    .line 94
    move-result-object v11

    .line 95
    sget-object v12, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 96
    .line 97
    const/4 v13, 0x0

    .line 98
    invoke-virtual {v11, v8, v13, v7, v12}, Lcom/hellogroup/fep/base/core/FepManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 99
    .line 100
    .line 101
    move-result-object v11

    .line 102
    if-eqz v11, :cond_3

    .line 103
    .line 104
    invoke-virtual {v11}, Ll/zgi;->h()Ljava/io/File;

    .line 105
    .line 106
    .line 107
    move-result-object v11

    .line 108
    goto :goto_1

    .line 109
    :cond_3
    move-object v11, v13

    .line 110
    :goto_1
    invoke-static {v7}, Ll/a6k0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v12

    .line 114
    new-instance v14, Ljava/io/File;

    .line 115
    .line 116
    invoke-direct {v14, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    .line 120
    .line 121
    .line 122
    move-result v11

    .line 123
    const/4 v15, 0x1

    .line 124
    const-wide/16 v16, 0x0

    .line 125
    .line 126
    if-eqz v11, :cond_4

    .line 127
    .line 128
    invoke-virtual {v14}, Ljava/io/File;->length()J

    .line 129
    .line 130
    .line 131
    move-result-wide v18

    .line 132
    cmp-long v11, v18, v16

    .line 133
    .line 134
    if-lez v11, :cond_4

    .line 135
    .line 136
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    invoke-direct {v0, v5, v6, v15}, Ll/i4a;->s(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    new-instance v11, Ljava/io/File;

    .line 144
    .line 145
    invoke-virtual {v10}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 146
    .line 147
    .line 148
    move-result-object v10

    .line 149
    const-string v14, "custom"

    .line 150
    .line 151
    invoke-virtual {v10, v8, v14, v7}, Lcom/hellogroup/fep/base/core/FepManager;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    if-eqz v7, :cond_5

    .line 156
    .line 157
    invoke-virtual {v7}, Ll/zgi;->h()Ljava/io/File;

    .line 158
    .line 159
    .line 160
    move-result-object v13

    .line 161
    :cond_5
    invoke-direct {v11, v13, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    if-eqz v7, :cond_6

    .line 169
    .line 170
    invoke-virtual {v11}, Ljava/io/File;->length()J

    .line 171
    .line 172
    .line 173
    move-result-wide v7

    .line 174
    cmp-long v7, v7, v16

    .line 175
    .line 176
    if-lez v7, :cond_6

    .line 177
    .line 178
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    invoke-direct {v0, v5, v6, v15}, Ll/i4a;->s(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 182
    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_6
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 187
    .line 188
    .line 189
    invoke-direct {v0, v5, v6, v9}, Ll/i4a;->s(Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 190
    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_7
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v0, v2, v1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_8
    return-void
.end method

.method private final s(Lorg/json/JSONObject;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    sget-object p1, Ll/qpl;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string p2, ""

    .line 13
    .line 14
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final t(Lorg/json/JSONObject;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "bid"

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {p1}, Ll/glw;->d(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const-string v4, "status"

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    filled-new-array {v4}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1, v0}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, v2, p1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-static {p1}, Ll/elj;->b(Lorg/json/JSONObject;)Ll/elj;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/elj;->a()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v0, Ll/i4a$c;

    .line 58
    .line 59
    invoke-direct {v0, p0, v1, p1, v2}, Ll/i4a$c;-><init>(Ll/i4a;Ljava/lang/String;Ll/elj;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x2

    .line 63
    invoke-static {p0, v0}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    :goto_0
    filled-new-array {v4}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {p1, v0}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, v2, p1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public l()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/qpl;->l()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 5
    .line 6
    iget-object v0, p0, Ll/i4a;->d:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/i4a;->c:Ll/ehi;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v0}, Lcom/hellogroup/fep/base/core/FepManager;->x(Ll/ehi;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/i4a;->c:Ll/ehi;

    .line 26
    .line 27
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 28
    .line 29
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 35
    .line 36
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 11
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
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
    invoke-static {p3}, Ll/glw;->d(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "\u5220\u9664\u6210\u529f"

    .line 19
    .line 20
    const-string v2, "0"

    .line 21
    .line 22
    const-string v3, "\u66f4\u65b0\u5931\u8d25"

    .line 23
    .line 24
    const-string v4, "\u66f4\u65b0\u6210\u529f"

    .line 25
    .line 26
    const-string v5, "url"

    .line 27
    .line 28
    const-string v6, "baseVersion"

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x1

    .line 33
    const-string v10, "bid"

    .line 34
    .line 35
    sparse-switch v0, :sswitch_data_0

    .line 36
    .line 37
    .line 38
    goto/16 :goto_6

    .line 39
    .line 40
    :sswitch_0
    const-string v0, "getVersion"

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_10

    .line 47
    .line 48
    invoke-virtual {p3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    iget-object v0, p0, Ll/qpl;->a:Ll/hul;

    .line 57
    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    invoke-interface {v0}, Ll/hul;->getResourceResponse()Ll/x4d0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p2}, Ll/x4d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    move-object v8, v0

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    if-eqz p3, :cond_1

    .line 78
    .line 79
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    :cond_1
    move v7, v9

    .line 86
    :cond_2
    if-nez v7, :cond_3

    .line 87
    .line 88
    move-object v0, p3

    .line 89
    goto :goto_0

    .line 90
    :cond_3
    move-object v0, v8

    .line 91
    :goto_0
    if-eqz v0, :cond_4

    .line 92
    .line 93
    const-string v1, "https://s.immomo.com/v-/"

    .line 94
    .line 95
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    :cond_4
    :goto_1
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 100
    .line 101
    invoke-virtual {p0, v8, p2, p3, v0}, Ll/qpl;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    if-eqz p2, :cond_5

    .line 106
    .line 107
    invoke-virtual {p2}, Ll/zgi;->g()J

    .line 108
    .line 109
    .line 110
    move-result-wide p2

    .line 111
    goto :goto_2

    .line 112
    :cond_5
    const-wide/16 p2, 0x0

    .line 113
    .line 114
    :goto_2
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_6

    .line 122
    .line 123
    :sswitch_1
    const-string p1, "sendOfflineRequest"

    .line 124
    .line 125
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_10

    .line 130
    .line 131
    invoke-direct {p0, p3}, Ll/i4a;->t(Lorg/json/JSONObject;)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_6

    .line 135
    .line 136
    :sswitch_2
    const-string v0, "checkUpdate"

    .line 137
    .line 138
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_10

    .line 143
    .line 144
    sget-object p2, Ll/qpl;->b:Ljava/lang/String;

    .line 145
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v1, "\u68c0\u67e5\u66f4\u65b0 "

    .line 149
    .line 150
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {p2, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p3

    .line 171
    new-instance v0, Ll/jf3$b;

    .line 172
    .line 173
    invoke-direct {v0}, Ll/jf3$b;-><init>()V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Ll/qpl;->a:Ll/hul;

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ll/jf3$b;->e(Ll/hul;)Ll/jf3$b;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0, p1}, Ll/jf3$b;->d(Ljava/lang/String;)Ll/jf3$b;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p1, v7}, Ll/jf3$b;->f(I)Ll/jf3$b;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p1, v4}, Ll/jf3$b;->g(Ljava/lang/String;)Ll/jf3$b;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1, v9}, Ll/jf3$b;->b(I)Ll/jf3$b;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1, v3}, Ll/jf3$b;->c(Ljava/lang/String;)Ll/jf3$b;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-static {p3, p2}, Ll/a6k0;->b(Ljava/lang/String;Ljava/lang/String;)Lkotlin/Pair;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    invoke-virtual {p2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {p2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    check-cast p2, Ljava/lang/String;

    .line 217
    .line 218
    if-eqz v0, :cond_7

    .line 219
    .line 220
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-eqz v1, :cond_6

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_6
    iget-object p0, p0, Ll/i4a;->d:Ljava/util/Map;

    .line 228
    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {p1}, Ll/jf3$b;->a()Ll/jf3;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 249
    .line 250
    .line 251
    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    sget-object p0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->FORCE_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 261
    .line 262
    invoke-virtual {p0, v0, p2, p3, p1}, Lcom/hellogroup/fep/base/core/FepManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 263
    .line 264
    .line 265
    goto/16 :goto_6

    .line 266
    .line 267
    :cond_7
    :goto_3
    return v9

    .line 268
    :sswitch_3
    const-string v0, "getOfflineType"

    .line 269
    .line 270
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p2

    .line 274
    if-eqz p2, :cond_10

    .line 275
    .line 276
    invoke-virtual {p3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p2

    .line 280
    invoke-virtual {p3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p3

    .line 284
    iget-object v0, p0, Ll/qpl;->a:Ll/hul;

    .line 285
    .line 286
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 287
    .line 288
    .line 289
    invoke-interface {v0}, Ll/hul;->getResourceResponse()Ll/x4d0;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    if-eqz v0, :cond_8

    .line 294
    .line 295
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v0, p2}, Ll/x4d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    if-eqz v0, :cond_8

    .line 303
    .line 304
    move-object v8, v0

    .line 305
    goto :goto_5

    .line 306
    :cond_8
    if-eqz p3, :cond_9

    .line 307
    .line 308
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    if-nez v0, :cond_a

    .line 313
    .line 314
    :cond_9
    move v7, v9

    .line 315
    :cond_a
    if-nez v7, :cond_b

    .line 316
    .line 317
    move-object v0, p3

    .line 318
    goto :goto_4

    .line 319
    :cond_b
    move-object v0, v8

    .line 320
    :goto_4
    if-eqz v0, :cond_c

    .line 321
    .line 322
    const-string v1, "https://v-/"

    .line 323
    .line 324
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    :cond_c
    :goto_5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    const-string v1, "undefined"

    .line 333
    .line 334
    if-nez v0, :cond_d

    .line 335
    .line 336
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 337
    .line 338
    invoke-virtual {p0, v8, p2, p3, v0}, Ll/qpl;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 339
    .line 340
    .line 341
    move-result-object p2

    .line 342
    if-eqz p2, :cond_d

    .line 343
    .line 344
    invoke-virtual {p2}, Ll/zgi;->f()Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 345
    .line 346
    .line 347
    move-result-object p2

    .line 348
    if-eqz p2, :cond_d

    .line 349
    .line 350
    invoke-virtual {p2}, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;->getOfflineType()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p2

    .line 354
    if-eqz p2, :cond_d

    .line 355
    .line 356
    move-object v1, p2

    .line 357
    :cond_d
    const-string p2, "type"

    .line 358
    .line 359
    filled-new-array {p2}, [Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    filled-new-array {v1}, [Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p3

    .line 367
    invoke-static {p2, p3}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 368
    .line 369
    .line 370
    move-result-object p2

    .line 371
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p2

    .line 375
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    goto/16 :goto_6

    .line 379
    .line 380
    :sswitch_4
    const-string p1, "isResourceOfflined"

    .line 381
    .line 382
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result p1

    .line 386
    if-eqz p1, :cond_10

    .line 387
    .line 388
    invoke-direct {p0, p3}, Ll/i4a;->r(Lorg/json/JSONObject;)V

    .line 389
    .line 390
    .line 391
    goto/16 :goto_6

    .line 392
    .line 393
    :sswitch_5
    const-string v0, "removeCache"

    .line 394
    .line 395
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result p2

    .line 399
    if-eqz p2, :cond_10

    .line 400
    .line 401
    invoke-virtual {p3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p2

    .line 405
    invoke-virtual {p3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p3

    .line 409
    sget-object v0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 410
    .line 411
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0, p2, p3}, Lcom/hellogroup/fep/base/core/FepManager;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    const-string p2, "status"

    .line 422
    .line 423
    const-string p3, "message"

    .line 424
    .line 425
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object p2

    .line 429
    filled-new-array {v2, v1}, [Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p3

    .line 433
    invoke-static {p2, p3}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p2

    .line 441
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    goto/16 :goto_6

    .line 445
    .line 446
    :sswitch_6
    const-string p3, "clearCache"

    .line 447
    .line 448
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 449
    .line 450
    .line 451
    move-result p2

    .line 452
    if-eqz p2, :cond_10

    .line 453
    .line 454
    sget-object p2, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 455
    .line 456
    invoke-virtual {p2}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 457
    .line 458
    .line 459
    move-result-object p2

    .line 460
    invoke-virtual {p2}, Lcom/hellogroup/fep/base/core/FepManager;->e()V

    .line 461
    .line 462
    .line 463
    invoke-virtual {p0, p1, v8, v1, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    goto/16 :goto_6

    .line 467
    .line 468
    :sswitch_7
    const-string v0, "update"

    .line 469
    .line 470
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    move-result p2

    .line 474
    if-eqz p2, :cond_10

    .line 475
    .line 476
    sget-object p2, Ll/qpl;->b:Ljava/lang/String;

    .line 477
    .line 478
    new-instance v0, Ljava/lang/StringBuilder;

    .line 479
    .line 480
    const-string v1, "\u5f3a\u5236\u66f4\u65b0 "

    .line 481
    .line 482
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    invoke-static {p2, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {p3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object p2

    .line 499
    invoke-virtual {p3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    const-string v1, "zip_url"

    .line 504
    .line 505
    if-eqz v0, :cond_e

    .line 506
    .line 507
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 508
    .line 509
    .line 510
    move-result v2

    .line 511
    if-eqz v2, :cond_f

    .line 512
    .line 513
    :cond_e
    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    :cond_f
    const-string v2, "newest_version"

    .line 518
    .line 519
    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object p3

    .line 523
    invoke-static {p3}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object p3

    .line 527
    new-instance v5, Ll/jf3$b;

    .line 528
    .line 529
    invoke-direct {v5}, Ll/jf3$b;-><init>()V

    .line 530
    .line 531
    .line 532
    iget-object v6, p0, Ll/qpl;->a:Ll/hul;

    .line 533
    .line 534
    invoke-virtual {v5, v6}, Ll/jf3$b;->e(Ll/hul;)Ll/jf3$b;

    .line 535
    .line 536
    .line 537
    move-result-object v5

    .line 538
    invoke-virtual {v5, p1}, Ll/jf3$b;->d(Ljava/lang/String;)Ll/jf3$b;

    .line 539
    .line 540
    .line 541
    move-result-object p1

    .line 542
    invoke-virtual {p1, v7}, Ll/jf3$b;->f(I)Ll/jf3$b;

    .line 543
    .line 544
    .line 545
    move-result-object p1

    .line 546
    invoke-virtual {p1, v4}, Ll/jf3$b;->g(Ljava/lang/String;)Ll/jf3$b;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    invoke-virtual {p1, v9}, Ll/jf3$b;->b(I)Ll/jf3$b;

    .line 551
    .line 552
    .line 553
    move-result-object p1

    .line 554
    invoke-virtual {p1, v3}, Ll/jf3$b;->c(Ljava/lang/String;)Ll/jf3$b;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    invoke-static {p3}, Ll/jhi;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 559
    .line 560
    .line 561
    move-result-object v3

    .line 562
    iget-object p0, p0, Ll/i4a;->d:Ljava/util/Map;

    .line 563
    .line 564
    new-instance v4, Ljava/lang/StringBuilder;

    .line 565
    .line 566
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 567
    .line 568
    .line 569
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 576
    .line 577
    .line 578
    move-result-object v3

    .line 579
    invoke-virtual {p1}, Ll/jf3$b;->a()Ll/jf3;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 584
    .line 585
    .line 586
    invoke-interface {p0, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    .line 588
    .line 589
    sget-object p0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 590
    .line 591
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 592
    .line 593
    .line 594
    move-result-object p0

    .line 595
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 596
    .line 597
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 598
    .line 599
    .line 600
    invoke-static {p2}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object p2

    .line 604
    invoke-interface {p1, v10, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    invoke-interface {p1, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    .line 609
    .line 610
    invoke-static {v0}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object p2

    .line 614
    invoke-interface {p1, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    new-array p2, v9, [Ljava/util/Map;

    .line 618
    .line 619
    aput-object p1, p2, v7

    .line 620
    .line 621
    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 622
    .line 623
    .line 624
    move-result-object p1

    .line 625
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/base/core/FepManager;->s(Ljava/util/List;)V

    .line 626
    .line 627
    .line 628
    :cond_10
    :goto_6
    return v9

    :sswitch_data_0
    .sparse-switch
        -0x31ffc737 -> :sswitch_7
        -0x2d410ecb -> :sswitch_6
        -0x131286a2 -> :sswitch_5
        0x11b8a659 -> :sswitch_4
        0x1860ae87 -> :sswitch_3
        0x30fb23f1 -> :sswitch_2
        0x4bbe74d4 -> :sswitch_1
        0x52c258a2 -> :sswitch_0
    .end sparse-switch
.end method
