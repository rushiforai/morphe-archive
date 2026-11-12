.class public final Lks4;
.super Ln1f;
.source "SourceFile"


# instance fields
.field public final e:Lzyk;

.field public final synthetic f:Lls4;


# direct methods
.method public constructor <init>(Lls4;Ljg8;Ljg8;)V
    .registers 5

    sget-object v0, Lngh;->a:Lr16;

    iput-object p1, p0, Lks4;->f:Lls4;

    invoke-direct {p0, p2, p3}, Ln1f;-><init>(Ljg8;Ljg8;)V

    new-instance p2, Lr94;

    const/4 p3, 0x5

    invoke-direct {p2, p1, p3}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lks4;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final f(Lmt5;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v1, p0

    :try_start_2
    sget-object v0, Lls4;->h:Lfs4;

    new-instance v0, Ljava/io/File;

    iget-object v5, v1, Lks4;->e:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    const-string v6, "data"

    invoke-direct {v0, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v5, Ljava/io/DataInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1d
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_1d} :catch_1aa
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1d} :catch_1a3
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_1d} :catch_19b

    :try_start_1d
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v0
    :try_end_21
    .catchall {:try_start_1d .. :try_end_21} :catchall_18d

    const-string v6, "Bad data"

    if-ltz v0, :cond_183

    const v7, 0xa00001

    if-ge v0, v7, :cond_183

    :try_start_2a
    new-array v0, v0, [B

    invoke-virtual {v5, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v8, Ljava/lang/String;

    sget-object v9, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v0, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v8, "channels"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "groups"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    if-nez v9, :cond_4b

    const/4 v10, 0x0

    goto :goto_50

    :cond_4b
    new-instance v10, Lvpb;

    invoke-direct {v10, v9}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_50
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v8}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v11

    :cond_59
    :goto_59
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12
    :try_end_5d
    .catchall {:try_start_2a .. :try_end_5d} :catchall_18d

    const-string v13, "last_updated"

    if-eqz v12, :cond_a3

    :try_start_61
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Lp37;->W(Ljava/lang/String;)Lcs4;

    move-result-object v15

    if-eqz v15, :cond_59

    new-instance v14, Lorb;

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-direct {v14, v12}, Lorb;-><init>(Lorg/json/JSONObject;)V

    iget-object v12, v14, Lorb;->a:Lorg/json/JSONObject;

    new-instance v16, Lgs4;
    :try_end_7a
    .catchall {:try_start_61 .. :try_end_7a} :catchall_18d

    const-wide/16 v21, 0x0

    :try_start_7c
    const-string v2, "version"

    invoke-virtual {v14, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lebb;->c:Lebb;

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v13, v14}, Lj06;->m(J)Lebb;

    move-result-object v17

    const-string v3, "offset"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v18

    const-string v3, "size"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v20

    move-object/from16 v14, v16

    move-object/from16 v16, v2

    invoke-direct/range {v14 .. v20}, Lgs4;-><init>(Lcs4;Ljava/lang/String;Lebb;JI)V

    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_59

    :cond_a3
    const-wide/16 v21, 0x0

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_b6

    new-instance v2, Lyg9;

    const/16 v3, 0x11

    invoke-direct {v2, v3}, Lyg9;-><init>(B)V

    invoke-static {v2, v9}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    :cond_b6
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    move-wide/from16 v11, v21

    const/4 v14, 0x0

    :goto_c2
    if-ge v14, v3, :cond_12d

    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Lgs4;

    move-object/from16 v16, v9

    iget-wide v8, v15, Lgs4;->d:J
    :try_end_d0
    .catchall {:try_start_7c .. :try_end_d0} :catchall_18b

    iget v4, v15, Lgs4;->e:I

    cmp-long v19, v8, v11

    if-ltz v19, :cond_127

    if-ltz v4, :cond_121

    if-ge v4, v7, :cond_121

    if-lez v19, :cond_102

    :try_start_dc
    sget-object v19, Lls4;->h:Lfs4;

    sub-long/2addr v8, v11

    long-to-int v8, v8

    invoke-virtual {v5, v8}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v9

    if-ne v9, v8, :cond_e9

    iget-wide v11, v15, Lgs4;->d:J

    goto :goto_102

    :cond_e9
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to skip "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " bytes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_102
    :goto_102
    new-array v8, v4, [B

    invoke-virtual {v5, v8}, Ljava/io/DataInputStream;->readFully([B)V

    move-object/from16 v19, v8

    int-to-long v7, v4

    add-long/2addr v11, v7

    iget-object v4, v15, Lgs4;->a:Lcs4;

    new-instance v7, Lfs4;

    iget-object v8, v15, Lgs4;->b:Ljava/lang/String;

    iget-object v15, v15, Lgs4;->c:Lebb;

    move-object/from16 v9, v19

    invoke-direct {v7, v8, v15, v9}, Lfs4;-><init>(Ljava/lang/String;Lebb;[B)V

    invoke-interface {v2, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v9, v16

    const v7, 0xa00001

    goto :goto_c2

    :cond_121
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_127
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12d
    sget-object v3, Lcs4;->q:Lh58;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lw4;

    const/4 v6, 0x0

    invoke-direct {v4, v3, v6}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_138
    :goto_138
    invoke-virtual {v4}, Lw4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_150

    invoke-virtual {v4}, Lw4;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcs4;

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_138

    sget-object v7, Lls4;->h:Lfs4;

    invoke-interface {v2, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_138

    :cond_150
    new-instance v3, Lp4j;

    invoke-direct {v3}, Lp4j;-><init>()V

    if-eqz v10, :cond_16a

    iget-object v4, v10, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v8, v6

    :goto_15e
    if-ge v8, v4, :cond_16a

    invoke-virtual {v10, v8}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lp4j;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_15e

    :cond_16a
    invoke-static {v3}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v3

    new-instance v4, Lhs4;

    sget-object v6, Lebb;->c:Lebb;

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lj06;->m(J)Lebb;

    move-result-object v0

    invoke-direct {v4, v2, v3, v0}, Lhs4;-><init>(Ljava/util/LinkedHashMap;Ljava/util/Set;Lebb;)V
    :try_end_17d
    .catchall {:try_start_dc .. :try_end_17d} :catchall_18b

    :try_start_17d
    invoke-interface {v5}, Ljava/io/Closeable;->close()V
    :try_end_180
    .catch Ljava/io/FileNotFoundException; {:try_start_17d .. :try_end_180} :catch_1a1
    .catch Ljava/io/IOException; {:try_start_17d .. :try_end_180} :catch_199
    .catch Lorg/json/JSONException; {:try_start_17d .. :try_end_180} :catch_197

    goto :goto_1ad

    :goto_181
    move-object v2, v0

    goto :goto_191

    :cond_183
    const-wide/16 v21, 0x0

    :try_start_185
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_18b
    .catchall {:try_start_185 .. :try_end_18b} :catchall_18b

    :catchall_18b
    move-exception v0

    goto :goto_181

    :catchall_18d
    move-exception v0

    const-wide/16 v21, 0x0

    goto :goto_181

    :goto_191
    :try_start_191
    throw v2
    :try_end_192
    .catchall {:try_start_191 .. :try_end_192} :catchall_192

    :catchall_192
    move-exception v0

    :try_start_193
    invoke-static {v5, v2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_197
    .catch Ljava/io/FileNotFoundException; {:try_start_193 .. :try_end_197} :catch_1a1
    .catch Ljava/io/IOException; {:try_start_193 .. :try_end_197} :catch_199
    .catch Lorg/json/JSONException; {:try_start_193 .. :try_end_197} :catch_197

    :catch_197
    move-exception v0

    goto :goto_19e

    :catch_199
    move-exception v0

    goto :goto_1a6

    :catch_19b
    move-exception v0

    const-wide/16 v21, 0x0

    :goto_19e
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    :catch_1a1
    :goto_1a1
    const/4 v4, 0x0

    goto :goto_1ad

    :catch_1a3
    move-exception v0

    const-wide/16 v21, 0x0

    :goto_1a6
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_1a1

    :catch_1aa
    const-wide/16 v21, 0x0

    goto :goto_1a1

    :goto_1ad
    if-nez v4, :cond_1ee

    sget-object v0, Lcs4;->q:Lh58;

    new-instance v2, Ljava/util/LinkedHashMap;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    const/16 v4, 0x10

    if-ge v3, v4, :cond_1c2

    move v3, v4

    :cond_1c2
    invoke-direct {v2, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :goto_1c9
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1dc

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcs4;

    sget-object v4, Lls4;->h:Lfs4;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c9

    :cond_1dc
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    sget-object v2, Lv08;->a:Lv08;

    sget-object v3, Lebb;->c:Lebb;

    invoke-static/range {v21 .. v22}, Lj06;->m(J)Lebb;

    move-result-object v3

    new-instance v4, Lhs4;

    invoke-direct {v4, v0, v2, v3}, Lhs4;-><init>(Ljava/util/LinkedHashMap;Ljava/util/Set;Lebb;)V

    :cond_1ee
    iget-object v0, v1, Lks4;->f:Lls4;

    iput-object v4, v0, Lls4;->g:Lhs4;

    iget-object v0, v0, Lls4;->a:Lisd;

    move-object/from16 v1, p1

    check-cast v1, Lnt5;

    invoke-virtual {v0, v1}, Lisd;->C(Lnt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpx5;->a:Lpx5;

    if-ne v0, v1, :cond_201

    return-object v0

    :cond_201
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public final n(Ljava/lang/Object;)V
    .registers 14

    check-cast p1, Lhs4;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p1, Lhs4;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-wide/16 v2, 0x0

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-string v5, "last_updated"

    if-eqz v4, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcs4;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfs4;

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    iget-object v8, v4, Lfs4;->a:Ljava/lang/String;

    iget-object v9, v4, Lfs4;->c:[B

    const-string v10, "version"

    invoke-virtual {v7, v8, v10}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v4, Lfs4;->b:Lebb;

    invoke-virtual {v4}, Lebb;->i()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11, v5}, Lorb;->o(JLjava/lang/String;)V

    const-string v4, "offset"

    invoke-virtual {v7, v2, v3, v4}, Lorb;->o(JLjava/lang/String;)V

    const-string v4, "size"

    array-length v5, v9

    invoke-virtual {v7, v5, v4}, Lorb;->n(ILjava/lang/String;)V

    iget-object v4, v6, Lcs4;->a:Ljava/lang/String;

    invoke-virtual {v0, v7, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v4, v9

    int-to-long v4, v4

    add-long/2addr v2, v4

    goto :goto_13

    :cond_58
    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object v2, p1, Lhs4;->b:Ljava/util/Set;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_65
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_65

    :cond_75
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iget-object v3, p1, Lhs4;->c:Lebb;

    invoke-virtual {v3}, Lebb;->i()J

    move-result-wide v3

    :try_start_80
    invoke-virtual {v2, v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_83
    .catch Lorg/json/JSONException; {:try_start_80 .. :try_end_83} :catch_11d

    const-string v3, "channels"

    :try_start_85
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8c
    .catch Lorg/json/JSONException; {:try_start_85 .. :try_end_8c} :catch_118

    const-string v0, "groups"

    :try_start_8e
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_95
    .catch Lorg/json/JSONException; {:try_start_8e .. :try_end_95} :catch_113

    iget-object p0, p0, Lks4;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    const-string v3, ".data"

    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_ad
    sget-object v1, Lls4;->h:Lfs4;

    new-instance v1, Ljava/io/DataOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_b9
    .catch Ljava/io/IOException; {:try_start_ad .. :try_end_b9} :catch_106
    .catchall {:try_start_ad .. :try_end_b9} :catchall_10e

    :try_start_b9
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    array-length v3, v2

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    iget-object p1, p1, Lhs4;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfs4;

    iget-object v2, v2, Lfs4;->c:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_d6

    :cond_e8
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V
    :try_end_eb
    .catchall {:try_start_b9 .. :try_end_eb} :catchall_ff

    :try_start_eb
    invoke-interface {v1}, Ljava/io/Closeable;->close()V

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    const-string v1, "data"

    invoke-direct {p1, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_fe
    .catch Ljava/io/IOException; {:try_start_eb .. :try_end_fe} :catch_106
    .catchall {:try_start_eb .. :try_end_fe} :catchall_10e

    goto :goto_10a

    :catchall_ff
    move-exception p0

    :try_start_100
    throw p0
    :try_end_101
    .catchall {:try_start_100 .. :try_end_101} :catchall_101

    :catchall_101
    move-exception p1

    :try_start_102
    invoke-static {v1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1
    :try_end_106
    .catch Ljava/io/IOException; {:try_start_102 .. :try_end_106} :catch_106
    .catchall {:try_start_102 .. :try_end_106} :catchall_10e

    :catch_106
    move-exception p0

    :try_start_107
    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V
    :try_end_10a
    .catchall {:try_start_107 .. :try_end_10a} :catchall_10e

    :goto_10a
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void

    :catchall_10e
    move-exception p0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw p0

    :catch_113
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_118
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_11d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method
