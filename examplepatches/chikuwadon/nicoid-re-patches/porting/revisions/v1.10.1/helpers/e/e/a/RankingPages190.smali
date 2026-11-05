.class public final Le/e/a/RankingPages190;
.super Ljava/lang/Object;
.source "RankingPages190.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static custom(Ljava/lang/Object;)Z
    .registers 1

    .line 14
    invoke-static {p0}, Le/e/a/RankingPager196;->custom(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 5

    .line 6
    if-nez p0, :cond_3

    return-void

    :cond_3
    :try_start_3
    const-string v0, "c0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_c

    return-void

    :cond_c
    const-string v1, "a"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/RankingPages190;->isRanking(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "i0"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/16 v3, 0x64

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    const-string v2, "/custom-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "g"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "h0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    const-string v0, "p0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_61} :catch_62

    goto :goto_7d

    :catch_62
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Ranking pagination binding failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/RankingPages190;->record(Ljava/lang/String;)V

    :cond_7d
    :goto_7d
    return-void
.end method

.method public static isRanking(Ljava/lang/String;)Z
    .registers 2

    .line 7
    if-eqz p0, :cond_1c

    const-string v0, "http://www.nicovideo.jp/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "https://www.nicovideo.jp/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "https://sp.nicovideo.jp/api/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static loaded(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "f"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Ranking page="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/RankingPages190;->offset(Ljava/lang/Object;)I

    move-result v1

    div-int/lit8 v1, v1, 0x64

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rows="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/RankingPages190;->record(Ljava/lang/String;)V

    sget-object v0, Le/e/a/RankingFetch190;->PAGE:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const/4 v1, 0x0

    if-eqz v0, :cond_4d

    const-string v3, "hasNext"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4d

    goto :goto_4e

    :cond_4d
    move v2, v1

    :goto_4e
    sget-object v0, Le/e/a/RankingFetch190;->PAGE:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "i"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    if-eqz v2, :cond_71

    invoke-static {p0}, Le/e/a/RankingPages190;->offset(Ljava/lang/Object;)I

    move-result v2

    const/16 v3, 0x384

    if-ge v2, v3, :cond_71

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_71

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_71
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    return-void
.end method

.method static offset(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "j"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_15

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    move v1, v2

    :cond_15
    invoke-static {v1}, Le/e/a/RankingCatalog190;->offset(I)I

    move-result p0

    return p0
.end method

.method public static rank(Ljava/lang/Object;I)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    invoke-static {p0}, Le/e/a/RankingPages190;->offset(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, p1

    add-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static record(Ljava/lang/String;)V
    .registers 6

    .line 8
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    :catch_1d
    move-exception p0

    :goto_1e
    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static url(Ljava/lang/Object;)Ljava/lang/String;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    const-string v0, "a"

    move-object/from16 v1, p0

    invoke-static {v1, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    const-string v3, "term"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    const-string v0, "24h"

    :cond_1e
    invoke-static {v2}, Le/e/a/RankingRules190;->known(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_84

    const-string v19, "radio"

    const-string v20, "other"

    const-string v4, "all"

    const-string v5, "game"

    const-string v6, "anime"

    const-string v7, "music_sound"

    const-string v8, "dance"

    const-string v9, "animal"

    const-string v10, "nature"

    const-string v11, "cooking"

    const-string v12, "traveling_outdoor"

    const-string v13, "vehicle"

    const-string v14, "sports"

    const-string v15, "society_politics_news"

    const-string v16, "technology_craft"

    const-string v17, "commentary_lecture"

    const-string v18, "entertainment"

    filled-new-array/range {v4 .. v20}, [Ljava/lang/String;

    move-result-object v3

    const-string v19, "oxzi6bje"

    const-string v20, "ramuboyn"

    const-string v4, "e9uj2uks"

    const-string v5, "4eet3ca4"

    const-string v6, "zc49b03a"

    const-string v7, "wq76qdin"

    const-string v8, "6yuf530c"

    const-string v9, "ne72lua2"

    const-string v10, "24aa8fkw"

    const-string v11, "lq8d5918"

    const-string v12, "k1libcse"

    const-string v13, "3d8zlls9"

    const-string v14, "4w3p65pf"

    const-string v15, "lzicx0y6"

    const-string v16, "n46kcz9u"

    const-string v17, "v6wdx6p5"

    const-string v18, "8kjl94d9"

    filled-new-array/range {v4 .. v20}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    :goto_71
    const/16 v6, 0x11

    if-lt v5, v6, :cond_76

    goto :goto_84

    :cond_76
    aget-object v6, v3, v5

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_81

    aget-object v2, v4, v5

    goto :goto_84

    :cond_81
    add-int/lit8 v5, v5, 0x1

    goto :goto_71

    :cond_84
    :goto_84
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https://nvapi.nicovideo.jp/v1/ranking/teiban/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?term="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&pageSize=100&page="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static/range {p0 .. p0}, Le/e/a/RankingPages190;->offset(Ljava/lang/Object;)I

    move-result v1

    div-int/lit8 v1, v1, 0x64

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
