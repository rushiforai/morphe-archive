.class public final Ll/kgi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kgi$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 $2\u00020\u0001:\u0001!B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0008\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ!\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011JO\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u00042\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\"\u0010\u0019\u001a\u001e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\u0017j\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001`\u0018H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ)\u0010!\u001a\u00020 2\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\u0008\u0008\u0002\u0010\u001f\u001a\u00020\u000b\u00a2\u0006\u0004\u0008!\u0010\"J\u001d\u0010#\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008#\u0010\t\u00a8\u0006%"
    }
    d2 = {
        "Ll/kgi;",
        "",
        "<init>",
        "()V",
        "",
        "urlString",
        "Ll/lgi;",
        "rule",
        "c",
        "(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;",
        "url",
        "",
        "h",
        "(Ljava/lang/String;)Z",
        "f",
        "Ll/lgi$a;",
        "e",
        "(Ljava/lang/String;Ll/lgi;)Ll/lgi$a;",
        "",
        "errorCode",
        "message",
        "",
        "throwable",
        "Ljava/util/HashMap;",
        "Lkotlin/collections/HashMap;",
        "extraInfo",
        "",
        "g",
        "(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V",
        "",
        "localVer",
        "justParam",
        "Ll/ngi;",
        "a",
        "(Ljava/lang/String;Ljava/lang/Long;Z)Ll/ngi;",
        "d",
        "Companion",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Ll/kgi$a;

.field private static final a:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/kgi$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/kgi$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/kgi;->Companion:Ll/kgi$a;

    .line 8
    .line 9
    const-string v0, "^[1-9]+[0-9]*.x$"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/kgi;->a:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/kgi;Ljava/lang/String;Ljava/lang/Long;ZILjava/lang/Object;)Ll/ngi;
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Ll/kgi;->a(Ljava/lang/String;Ljava/lang/Long;Z)Ll/ngi;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private final c(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "_fep"

    .line 2
    .line 3
    const-string p2, "g"

    .line 4
    .line 5
    invoke-static {p1, p0, p2}, Ll/a6k0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private final e(Ljava/lang/String;Ll/lgi;)Ll/lgi$a;
    .locals 9

    .line 1
    invoke-virtual {p2}, Ll/lgi;->b()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "url"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "Version infos is null, rule: "

    .line 19
    .line 20
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {v1, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p2, p1}, Ll/pgi;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 39
    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_0
    invoke-virtual {p2}, Ll/lgi;->a()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p0, p1}, Ll/kgi;->f(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-object p0, v0

    .line 69
    check-cast p0, Ljava/util/Collection;

    .line 70
    .line 71
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/4 v3, 0x0

    .line 76
    :goto_0
    if-ge v3, p0, :cond_2

    .line 77
    .line 78
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Ljava/lang/String;

    .line 83
    .line 84
    const-string v5, "v-"

    .line 85
    .line 86
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_1

    .line 91
    .line 92
    add-int/lit8 v4, v3, 0x1

    .line 93
    .line 94
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-ge v4, v5, :cond_1

    .line 99
    .line 100
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    check-cast p0, Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    move-object p0, v2

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    const-string p0, "default"

    .line 113
    .line 114
    :goto_1
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v4, "Version tag: "

    .line 123
    .line 124
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-static {v1, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    const/4 v7, 0x4

    .line 143
    const/4 v8, 0x0

    .line 144
    const/4 v6, 0x0

    .line 145
    invoke-static/range {v3 .. v8}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    if-eqz p0, :cond_4

    .line 149
    .line 150
    invoke-virtual {p2}, Ll/lgi;->b()Ljava/util/Map;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Ll/lgi$a;

    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_4
    return-object v2
.end method

.method private final f(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 p0, 0x2

    .line 2
    const/4 v0, 0x0

    .line 3
    const-string v1, "/v-/"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p1, v1, v2, p0, v0}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private final g(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final h(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const-string v0, "_fep"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "g"

    .line 13
    .line 14
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "f"

    .line 21
    .line 22
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    :catch_0
    return p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/Long;Z)Ll/ngi;
    .locals 26
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Long;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ngi;

    .line 7
    .line 8
    const/16 v9, 0x3e

    .line 9
    .line 10
    const/4 v10, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v8, 0x0

    .line 17
    move-object/from16 v2, p1

    .line 18
    .line 19
    invoke-direct/range {v1 .. v10}, Ll/ngi;-><init>(Ljava/lang/String;IJLl/lgi$a;Ll/lgi;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 20
    .line 21
    .line 22
    move-object/from16 v25, v2

    .line 23
    .line 24
    move-object v2, v1

    .line 25
    move-object/from16 v1, v25

    .line 26
    .line 27
    invoke-static {v1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const-string v4, "url"

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "URL is blank, skip processing, url: "

    .line 44
    .line 45
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    const/4 v10, 0x6

    .line 64
    const/4 v11, 0x0

    .line 65
    const/4 v7, 0x0

    .line 66
    const/4 v8, 0x0

    .line 67
    invoke-static/range {v5 .. v11}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-object v2

    .line 71
    :cond_0
    sget-object v3, Ll/ggi;->INSTANCE:Ll/ggi;

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/ggi;->b()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-nez v5, :cond_1

    .line 78
    .line 79
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v3, "Grey regular is disabled, skip processing, url: "

    .line 88
    .line 89
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    const/4 v9, 0x4

    .line 108
    const/4 v10, 0x0

    .line 109
    const/4 v8, 0x0

    .line 110
    invoke-static/range {v5 .. v10}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-object v2

    .line 114
    :cond_1
    invoke-static {v1}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-static {v5}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    const-string v7, "bid"

    .line 123
    .line 124
    if-nez v6, :cond_3

    .line 125
    .line 126
    invoke-static {v5}, Lkotlin/text/StringsKt;->p(Ljava/lang/String;)Ljava/lang/Long;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    const-wide/16 v8, 0x0

    .line 131
    .line 132
    if-eqz v6, :cond_2

    .line 133
    .line 134
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 135
    .line 136
    .line 137
    move-result-wide v10

    .line 138
    goto :goto_0

    .line 139
    :cond_2
    move-wide v10, v8

    .line 140
    :goto_0
    const-wide/32 v12, 0xf4240

    .line 141
    .line 142
    .line 143
    cmp-long v6, v10, v12

    .line 144
    .line 145
    if-gtz v6, :cond_4

    .line 146
    .line 147
    :cond_3
    move-object v6, v2

    .line 148
    goto/16 :goto_4

    .line 149
    .line 150
    :cond_4
    invoke-static {v7, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    filled-new-array {v6, v4}, [Lkotlin/Pair;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-static {v4}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 163
    .line 164
    .line 165
    move-result-object v14

    .line 166
    sget-object v4, Ll/a6k0;->INSTANCE:Ll/a6k0;

    .line 167
    .line 168
    invoke-virtual {v4, v1}, Ll/a6k0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v3, v5, v4}, Ll/ggi;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_5

    .line 177
    .line 178
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v4, "bid or host is in blacklist, url: "

    .line 187
    .line 188
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    const/16 v3, -0x7d5

    .line 199
    .line 200
    invoke-virtual {v0, v1, v14, v3}, Ll/pgi;->e(Ljava/lang/String;Ljava/util/Map;I)V

    .line 201
    .line 202
    .line 203
    return-object v2

    .line 204
    :cond_5
    invoke-direct/range {p0 .. p1}, Ll/kgi;->h(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_6

    .line 209
    .line 210
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 213
    .line 214
    .line 215
    move-result-object v10

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    const-string v3, "URL already has _fep parameter, skip processing, url: "

    .line 219
    .line 220
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v11

    .line 230
    const/4 v15, 0x6

    .line 231
    const/16 v16, 0x0

    .line 232
    .line 233
    const/4 v12, 0x0

    .line 234
    const/4 v13, 0x0

    .line 235
    invoke-static/range {v10 .. v16}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    return-object v2

    .line 239
    :cond_6
    sget-object v3, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 240
    .line 241
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->e()Ll/mgi;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    invoke-virtual {v4, v5}, Ll/mgi;->c(Ljava/lang/String;)Ll/lgi;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    const-string v4, ", url: "

    .line 250
    .line 251
    if-nez v6, :cond_7

    .line 252
    .line 253
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    new-instance v3, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    const-string v6, "No matched rule for bid: "

    .line 260
    .line 261
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    const/16 v3, -0x7d6

    .line 278
    .line 279
    invoke-virtual {v0, v1, v14, v3}, Ll/pgi;->e(Ljava/lang/String;Ljava/util/Map;I)V

    .line 280
    .line 281
    .line 282
    return-object v2

    .line 283
    :cond_7
    invoke-direct {v0, v1, v6}, Ll/kgi;->e(Ljava/lang/String;Ll/lgi;)Ll/lgi$a;

    .line 284
    .line 285
    .line 286
    move-result-object v20

    .line 287
    if-nez v20, :cond_8

    .line 288
    .line 289
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 290
    .line 291
    .line 292
    move-result-object v10

    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    const-string v3, "No matched version for url: "

    .line 296
    .line 297
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v1, ", rule: "

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v11

    .line 315
    const/4 v15, 0x6

    .line 316
    const/16 v16, 0x0

    .line 317
    .line 318
    const/4 v12, 0x0

    .line 319
    const/4 v13, 0x0

    .line 320
    invoke-static/range {v10 .. v16}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    return-object v2

    .line 324
    :cond_8
    if-eqz p2, :cond_9

    .line 325
    .line 326
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Long;->longValue()J

    .line 327
    .line 328
    .line 329
    move-result-wide v10

    .line 330
    cmp-long v7, v10, v8

    .line 331
    .line 332
    if-lez v7, :cond_9

    .line 333
    .line 334
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Long;->longValue()J

    .line 335
    .line 336
    .line 337
    move-result-wide v8

    .line 338
    goto :goto_1

    .line 339
    :cond_9
    if-eqz p3, :cond_a

    .line 340
    .line 341
    goto :goto_1

    .line 342
    :cond_a
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->b()Ll/jgi;

    .line 343
    .line 344
    .line 345
    move-result-object v7

    .line 346
    invoke-virtual/range {v20 .. v20}, Ll/lgi$a;->a()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v10

    .line 350
    invoke-interface {v7, v5, v10, v1}, Ll/jgi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;

    .line 351
    .line 352
    .line 353
    move-result-object v5

    .line 354
    if-eqz v5, :cond_b

    .line 355
    .line 356
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 357
    .line 358
    .line 359
    move-result-wide v8

    .line 360
    :cond_b
    :goto_1
    invoke-virtual/range {v20 .. v20}, Ll/lgi$a;->c()J

    .line 361
    .line 362
    .line 363
    move-result-wide v10

    .line 364
    invoke-static {v8, v9, v10, v11}, Ll/bkw;->a(JJ)Z

    .line 365
    .line 366
    .line 367
    move-result v5

    .line 368
    if-eqz v5, :cond_c

    .line 369
    .line 370
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 371
    .line 372
    .line 373
    move-result-object v10

    .line 374
    new-instance v0, Ljava/lang/StringBuilder;

    .line 375
    .line 376
    const-string v2, "Local version is equal to matched version, skip processing, url: "

    .line 377
    .line 378
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v11

    .line 388
    move-object v12, v14

    .line 389
    const/4 v14, 0x4

    .line 390
    const/4 v15, 0x0

    .line 391
    const/4 v13, 0x0

    .line 392
    invoke-static/range {v10 .. v15}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 393
    .line 394
    .line 395
    new-instance v0, Ll/ngi;

    .line 396
    .line 397
    invoke-virtual/range {v20 .. v20}, Ll/lgi$a;->b()I

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    const/4 v7, 0x1

    .line 402
    move-wide v3, v8

    .line 403
    move-object/from16 v5, v20

    .line 404
    .line 405
    invoke-direct/range {v0 .. v7}, Ll/ngi;-><init>(Ljava/lang/String;IJLl/lgi$a;Ll/lgi;Z)V

    .line 406
    .line 407
    .line 408
    return-object v0

    .line 409
    :cond_c
    move-wide/from16 v18, v8

    .line 410
    .line 411
    move-object/from16 v5, v20

    .line 412
    .line 413
    invoke-virtual {v5}, Ll/lgi$a;->b()I

    .line 414
    .line 415
    .line 416
    move-result v17

    .line 417
    if-nez v17, :cond_e

    .line 418
    .line 419
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 420
    .line 421
    .line 422
    move-result-object v10

    .line 423
    new-instance v2, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    const-string v3, "Apply multi version URL, url: "

    .line 426
    .line 427
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v11

    .line 437
    move-object v12, v14

    .line 438
    const/4 v14, 0x4

    .line 439
    const/4 v15, 0x0

    .line 440
    const/4 v13, 0x0

    .line 441
    invoke-static/range {v10 .. v15}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    if-eqz p3, :cond_d

    .line 445
    .line 446
    invoke-direct {v0, v1, v6}, Ll/kgi;->c(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    :goto_2
    move-object/from16 v16, v0

    .line 451
    .line 452
    goto :goto_3

    .line 453
    :cond_d
    invoke-virtual {v0, v1, v6}, Ll/kgi;->d(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v0

    .line 457
    goto :goto_2

    .line 458
    :goto_3
    new-instance v15, Ll/ngi;

    .line 459
    .line 460
    const/16 v23, 0x20

    .line 461
    .line 462
    const/16 v24, 0x0

    .line 463
    .line 464
    const/16 v22, 0x0

    .line 465
    .line 466
    move-object/from16 v20, v5

    .line 467
    .line 468
    move-object/from16 v21, v6

    .line 469
    .line 470
    invoke-direct/range {v15 .. v24}, Ll/ngi;-><init>(Ljava/lang/String;IJLl/lgi$a;Ll/lgi;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 471
    .line 472
    .line 473
    return-object v15

    .line 474
    :cond_e
    move-object v6, v2

    .line 475
    move/from16 v2, v17

    .line 476
    .line 477
    const/4 v0, 0x1

    .line 478
    if-ne v2, v0, :cond_f

    .line 479
    .line 480
    new-instance v0, Ll/ngi;

    .line 481
    .line 482
    const/16 v8, 0x30

    .line 483
    .line 484
    const/4 v9, 0x0

    .line 485
    const/4 v6, 0x0

    .line 486
    const/4 v7, 0x0

    .line 487
    move-wide/from16 v3, v18

    .line 488
    .line 489
    invoke-direct/range {v0 .. v9}, Ll/ngi;-><init>(Ljava/lang/String;IJLl/lgi$a;Ll/lgi;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 490
    .line 491
    .line 492
    return-object v0

    .line 493
    :cond_f
    invoke-virtual {v3}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 494
    .line 495
    .line 496
    move-result-object v10

    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    const-string v2, "Unknown version type: "

    .line 500
    .line 501
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v5}, Ll/lgi$a;->b()I

    .line 505
    .line 506
    .line 507
    move-result v2

    .line 508
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v11

    .line 521
    const/4 v15, 0x6

    .line 522
    const/16 v16, 0x0

    .line 523
    .line 524
    const/4 v12, 0x0

    .line 525
    const/4 v13, 0x0

    .line 526
    invoke-static/range {v10 .. v16}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 527
    .line 528
    .line 529
    return-object v6

    .line 530
    :goto_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 531
    .line 532
    const-string v3, "bid is not valid, skip processing, url: "

    .line 533
    .line 534
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .line 539
    .line 540
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    new-instance v2, Lkotlin/Pair;

    .line 545
    .line 546
    invoke-direct {v2, v7, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 547
    .line 548
    .line 549
    filled-new-array {v2}, [Lkotlin/Pair;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    invoke-static {v2}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 554
    .line 555
    .line 556
    move-result-object v2

    .line 557
    const/16 v3, -0x7d4

    .line 558
    .line 559
    const/4 v4, 0x0

    .line 560
    invoke-direct {v0, v3, v1, v4, v2}, Ll/kgi;->g(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V

    .line 561
    .line 562
    .line 563
    return-object v6
.end method

.method public final d(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/lgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :try_start_0
    invoke-virtual {p2}, Ll/lgi;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-eqz p2, :cond_8

    .line 18
    .line 19
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_8

    .line 31
    .line 32
    invoke-static {v3}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    if-eqz v3, :cond_8

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v4, 0x2

    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-static {v3, v0, v6, v4, v5}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "Grey URL transform skipped: path does not contain projectName"

    .line 58
    .line 59
    const-string v0, "url"

    .line 60
    .line 61
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v4, "projectName"

    .line 66
    .line 67
    invoke-static {v4, p2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    filled-new-array {v0, p2}, [Lkotlin/Pair;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {p2}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    const/4 v7, 0x6

    .line 80
    const/4 v8, 0x0

    .line 81
    const/4 v4, 0x0

    .line 82
    const/4 v5, 0x0

    .line 83
    invoke-static/range {v2 .. v8}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-object p1

    .line 87
    :catch_0
    move-exception v0

    .line 88
    move-object p2, v0

    .line 89
    goto/16 :goto_4

    .line 90
    .line 91
    :cond_0
    invoke-direct {p0, p1}, Ll/kgi;->f(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {v2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    const-string v4, ""

    .line 104
    .line 105
    invoke-virtual {v2, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    move-object v4, v3

    .line 112
    check-cast v4, Ljava/util/Collection;

    .line 113
    .line 114
    invoke-interface {v4}, Ljava/util/Collection;->size()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    const/4 v5, -0x1

    .line 119
    :goto_0
    if-ge v6, v4, :cond_7

    .line 120
    .line 121
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    check-cast v7, Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v2, v7}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 128
    .line 129
    .line 130
    if-eqz v0, :cond_1

    .line 131
    .line 132
    if-gez v5, :cond_4

    .line 133
    .line 134
    const-string v8, "v-"

    .line 135
    .line 136
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    if-eqz v7, :cond_4

    .line 141
    .line 142
    add-int/lit8 v5, v6, 0x1

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_1
    if-gez v5, :cond_4

    .line 146
    .line 147
    invoke-static {v7, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    if-eqz v7, :cond_4

    .line 152
    .line 153
    add-int/lit8 v5, v6, 0x1

    .line 154
    .line 155
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    if-ge v5, v7, :cond_3

    .line 160
    .line 161
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    if-ge v5, v7, :cond_2

    .line 166
    .line 167
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    check-cast v7, Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v7, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    if-eqz v7, :cond_2

    .line 178
    .line 179
    add-int/lit8 v5, v5, 0x1

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_2
    add-int/lit8 v5, v5, -0x1

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_3
    move v5, v6

    .line 186
    :cond_4
    :goto_2
    if-lez v5, :cond_6

    .line 187
    .line 188
    if-ne v5, v6, :cond_6

    .line 189
    .line 190
    const-string v7, "grey"

    .line 191
    .line 192
    if-eqz v0, :cond_5

    .line 193
    .line 194
    :try_start_1
    invoke-static {v3, v6}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    check-cast v8, Ljava/lang/String;

    .line 199
    .line 200
    if-eqz v8, :cond_6

    .line 201
    .line 202
    sget-object v9, Ll/kgi;->a:Ljava/util/regex/Pattern;

    .line 203
    .line 204
    invoke-virtual {v9, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    if-eqz v8, :cond_6

    .line 213
    .line 214
    invoke-virtual {v2, v7}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 215
    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_5
    invoke-virtual {v2, v7}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 219
    .line 220
    .line 221
    :cond_6
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 222
    .line 223
    goto :goto_0

    .line 224
    :cond_7
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 229
    .line 230
    .line 231
    return-object p2

    .line 232
    :cond_8
    return-object p1

    .line 233
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v2, "Apply multi version URL failed: "

    .line 236
    .line 237
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-instance v2, Lkotlin/Pair;

    .line 252
    .line 253
    const-string v3, "bid"

    .line 254
    .line 255
    invoke-direct {v2, v3, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    filled-new-array {v2}, [Lkotlin/Pair;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-static {v1}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    const/16 v2, -0x7d3

    .line 267
    .line 268
    invoke-direct {p0, v2, v0, p2, v1}, Ll/kgi;->g(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V

    .line 269
    .line 270
    .line 271
    return-object p1
.end method
