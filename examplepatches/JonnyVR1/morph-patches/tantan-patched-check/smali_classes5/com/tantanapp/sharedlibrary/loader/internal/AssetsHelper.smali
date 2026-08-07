.class public final Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\'\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\t8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\rR!\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u000f8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u000b\u001a\u0004\u0008\u0011\u0010\u0012R\u001b\u0010\u0017\u001a\u00020\u00148FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u000b\u001a\u0004\u0008\u0015\u0010\u0016R \u0010\u001b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00060\u00188\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u001e\u001a\u00020\u001c8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;",
        "",
        "<init>",
        "()V",
        "",
        "module",
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "g",
        "(Ljava/lang/String;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "",
        "a",
        "Lkotlin/Lazy;",
        "e",
        "()Ljava/util/Map;",
        "moduleJsonMap",
        "",
        "b",
        "f",
        "()Ljava/util/List;",
        "moduleList",
        "",
        "c",
        "()Z",
        "apkHasSoFiles",
        "",
        "d",
        "Ljava/util/Map;",
        "moduleZipInfoMap",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "()Lcom/tantanapp/sharedlibrary/loader/a;",
        "config",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 7
    .line 8
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$moduleJsonMap$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$moduleJsonMap$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$moduleList$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$moduleList$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->b:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$apkHasSoFiles$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$apkHasSoFiles$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->c:Lkotlin/Lazy;

    .line 31
    .line 32
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->d:Ljava/util/Map;

    .line 38
    .line 39
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

.method public static final synthetic a(Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;)Lcom/tantanapp/sharedlibrary/loader/a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->d()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->e()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final c()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final d()Lcom/tantanapp/sharedlibrary/loader/a;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->Companion:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;->a()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->l()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final e()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Map;

    .line 8
    .line 9
    return-object p0
.end method

.method public final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final g(Ljava/lang/String;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->c()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    if-nez p0, :cond_5

    .line 10
    .line 11
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->d:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_4

    .line 18
    .line 19
    sget-object v1, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->e()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2, p1}, Lkotlin/collections/MapsKt;->getValue(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->d()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 51
    .line 52
    new-instance v3, Ljava/io/InputStreamReader;

    .line 53
    .line 54
    invoke-direct {v3, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v3}, Lkotlin/io/TextStreamsKt;->g(Ljava/io/Reader;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$a;

    .line 62
    .line 63
    invoke-direct {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper$a;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-instance v3, Lcom/google/gson/Gson;

    .line 71
    .line 72
    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Ljava/lang/Iterable;

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/4 v2, 0x0

    .line 86
    move-object v3, v0

    .line 87
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    move-object v5, v4

    .line 98
    check-cast v5, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 99
    .line 100
    invoke-virtual {v5}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-static {v6, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    if-eqz v6, :cond_0

    .line 109
    .line 110
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 111
    .line 112
    invoke-virtual {v6}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->d()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-virtual {v6}, Lcom/tantanapp/sharedlibrary/loader/a;->b()Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-virtual {v6}, Lcom/tantanapp/sharedlibrary/loader/Abi;->getId()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    invoke-virtual {v5}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getAbi()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    const/4 v7, 0x1

    .line 129
    invoke-static {v6, v5, v7}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_0

    .line 134
    .line 135
    if-nez v2, :cond_1

    .line 136
    .line 137
    move-object v3, v4

    .line 138
    move v2, v7

    .line 139
    goto :goto_0

    .line 140
    :cond_1
    const-string p0, "Collection contains more than one matching element."

    .line 141
    .line 142
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-object v0

    .line 146
    :cond_2
    if-eqz v2, :cond_3

    .line 147
    .line 148
    move-object v1, v3

    .line 149
    check-cast v1, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 150
    .line 151
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_3
    const-string p0, "Collection contains no element matching the predicate."

    .line 156
    .line 157
    invoke-static {p0}, Ll/npj0;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-object v0

    .line 161
    :cond_4
    :goto_1
    check-cast v1, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 162
    .line 163
    return-object v1

    .line 164
    :cond_5
    const-string p0, "Please check apkHasSoFiles in advance"

    .line 165
    .line 166
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-object v0
.end method
