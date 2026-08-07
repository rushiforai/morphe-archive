.class public final Ll/jfr;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0011\u0010\u0014\u001a\u0004\u0018\u00010\u000cH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u000eJ\u0017\u0010\u0016\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u001b\u001a\u00020\u00188\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u001a\u0010\u001f\u001a\u00020\u00078\u0006X\u0086D\u00a2\u0006\u000c\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u0010R\u001d\u0010\"\u001a\u0004\u0018\u00010\u000c8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\r\u0010 \u001a\u0004\u0008!\u0010\u000eR\u001b\u0010$\u001a\u00020\u00118FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010 \u001a\u0004\u0008#\u0010\u0013\u00a8\u0006%"
    }
    d2 = {
        "Ll/jfr;",
        "",
        "<init>",
        "()V",
        "",
        "j",
        "()Z",
        "",
        "type",
        "Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;",
        "d",
        "(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;",
        "Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;",
        "c",
        "()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;",
        "e",
        "()Ljava/lang/String;",
        "",
        "g",
        "()I",
        "i",
        "data",
        "k",
        "(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;",
        "Ll/jxd0;",
        "a",
        "Ll/jxd0;",
        "isDebug",
        "b",
        "Ljava/lang/String;",
        "getTest",
        "test",
        "Lkotlin/Lazy;",
        "f",
        "likeMindedConfigData",
        "h",
        "swipeCount",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Ll/jfr;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll/jxd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/jfr;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jfr;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jfr;->INSTANCE:Ll/jfr;

    .line 7
    .line 8
    new-instance v0, Ll/jxd0;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "like_minded_debug_"

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 35
    .line 36
    .line 37
    sput-object v0, Ll/jfr;->a:Ll/jxd0;

    .line 38
    .line 39
    const-string v0, "{\"enable\":true,\"mcc\":{\"310\":{\"swipeCount\":2,\"items\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]},\"420\":{\"swipeCount\":4,\"items\":[\"1\",\"2\"]}},\"same\":{\"1\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday1\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday1\",\"icon\":\"https://auto.tancdn.com/v1/raw/9b05f161-d8be-4675-ba09-de11f5baa3a510.png\"}}}},\"2\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday2\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday2\",\"icon\":\"https://auto.tancdn.com/v1/raw/4b54ff2d-e684-4543-8816-49e495fbce0311.png\"}}}},\"3\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday3\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday3\",\"icon\":\"https://auto.tancdn.com/v1/raw/9b05f161-d8be-4675-ba09-de11f5baa3a510.png\"}}}},\"4\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday4\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday4\",\"icon\":\"https://auto.tancdn.com/v1/raw/701e86b8-0347-445a-9f29-387205c3b4c111.png\"}}}},\"5\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday5\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday5\",\"icon\":\"https://auto.tancdn.com/v1/raw/124ee0b0-78a4-49e5-957e-8d08dfb0d7c010.png\"}}}},\"6\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday6\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday6\",\"icon\":\"https://auto.tancdn.com/v1/raw/789e4fee-1fe8-4fdb-b558-995d33bec0ff11.png\"}}}},\"7\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday7\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday7\",\"icon\":\"https://auto.tancdn.com/v1/raw/cefb2117-a1b2-49f8-8c3f-2315e4e4466510.png\"}}}},\"8\":{\"type\":\"\",\"multiLanguage\":{\"en-US\":{\"swipe\":{\"icon\":\"https://gitlab.p1staff.com/liuwenbo/image/raw/master/52.png\",\"title\":\"Taco Tuesday8\"},\"status\":{\"description\":\"I like you a latte\",\"subTitle\":\"Let\'s eat and Taco Bout It (like \\\"talk about it\\\")\",\"title\":\"Taco Tuesday8\",\"icon\":\"https://auto.tancdn.com/v1/raw/a49659b3-31c4-4225-9839-d96fa272d37311.png\"}}}}}}"

    .line 40
    .line 41
    sput-object v0, Ll/jfr;->b:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v0, Ll/hfr;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/hfr;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Ll/jfr;->c:Lkotlin/Lazy;

    .line 53
    .line 54
    new-instance v0, Ll/ifr;

    .line 55
    .line 56
    invoke-direct {v0}, Ll/ifr;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sput-object v0, Ll/jfr;->d:Lkotlin/Lazy;

    .line 64
    .line 65
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

.method public static a()I
    .locals 1

    .line 1
    sget-object v0, Ll/jfr;->INSTANCE:Ll/jfr;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jfr;->g()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static b()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;
    .locals 1

    .line 1
    sget-object v0, Ll/jfr;->INSTANCE:Ll/jfr;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jfr;->i()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public final c()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/jfr;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/jfr;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jfr;->j()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/jfr;->c()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/jfr;->f()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    const/4 v0, 0x0

    .line 20
    if-eqz p0, :cond_4

    .line 21
    .line 22
    sget v1, Ll/uqb0;->f0:I

    .line 23
    .line 24
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->mcc:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->mcc:Ljava/util/Map;

    .line 37
    .line 38
    sget v2, Ll/uqb0;->f0:I

    .line 39
    .line 40
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/core/data/LikeMindedMccConfigData;

    .line 49
    .line 50
    if-eqz v1, :cond_4

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->same:Ljava/util/Map;

    .line 53
    .line 54
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/p1/mobile/putong/core/data/LikeMindedItemData;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LikeMindedItemData;->multiLanguage:Ljava/util/Map;

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    sget-object v2, Ll/jfr;->INSTANCE:Ll/jfr;

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/jfr;->e()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/core/data/LikeMindedItemLanguagesData;

    .line 77
    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LikeMindedItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    move-object v1, v0

    .line 84
    :goto_1
    if-nez v1, :cond_3

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->same:Ljava/util/Map;

    .line 87
    .line 88
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeMindedItemData;

    .line 93
    .line 94
    if-eqz p0, :cond_2

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikeMindedItemData;->multiLanguage:Ljava/util/Map;

    .line 97
    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    const-string p1, "en-US"

    .line 101
    .line 102
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeMindedItemLanguagesData;

    .line 107
    .line 108
    if-eqz p0, :cond_2

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikeMindedItemLanguagesData;->status:Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_2
    return-object v0

    .line 114
    :cond_3
    return-object v1

    .line 115
    :cond_4
    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const-string v0, "zh"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "TW"

    .line 32
    .line 33
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const/4 v0, 0x1

    .line 38
    if-ne p0, v0, :cond_0

    .line 39
    .line 40
    const-string p0, "zh-TW"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    const-string p0, "zh-CN"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    const-string v0, "en"

    .line 47
    .line 48
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const-string v4, "en-US"

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    return-object v4

    .line 57
    :cond_2
    const-string v0, "ko"

    .line 58
    .line 59
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    const-string p0, "ko-KR"

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_3
    const-string v0, "ja"

    .line 69
    .line 70
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    const-string p0, "ja-JP"

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_4
    const-string v0, "in"

    .line 80
    .line 81
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    const-string p0, "id-ID"

    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_5
    const-string v0, "th"

    .line 91
    .line 92
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    const-string p0, "th-TH"

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_6
    const-string v0, "vi"

    .line 102
    .line 103
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_7

    .line 108
    .line 109
    const-string p0, "vi-VN"

    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_7
    return-object v4
.end method

.method public final f()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/jfr;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 8
    .line 9
    return-object p0
.end method

.method public final g()I
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/jfr;->f()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/uqb0;->f0:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->mcc:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->mcc:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeMindedMccConfigData;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LikeMindedMccConfigData;->swipeCount:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    return p0

    .line 34
    :catch_0
    :cond_0
    const/4 p0, -0x1

    .line 35
    return p0
.end method

.method public final h()I
    .locals 0

    .line 1
    sget-object p0, Ll/jfr;->d:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final i()Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "intl_same_config"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/jfr;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return-object p0

    .line 19
    :catch_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    sget-object p0, Ll/jfr;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikeMindedConfigData;

    .line 11
    .line 12
    return-object p0
.end method
