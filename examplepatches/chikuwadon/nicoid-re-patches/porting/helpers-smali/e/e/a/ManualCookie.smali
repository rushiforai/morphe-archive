.class public final Le/e/a/ManualCookie;
.super Ljava/lang/Object;
.source "ManualCookie.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 17
    .param p0, "input"    # Ljava/lang/String;

    .line 8
    move-object/from16 v0, p0

    if-eqz v0, :cond_131

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x4000

    if-gt v1, v2, :cond_131

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_131

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_131

    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 11
    .local v2, "text":Ljava/lang/String;
    const/4 v6, 0x0

    const/4 v7, 0x7

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string v5, "Cookie:"

    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_35

    const/4 v1, 0x7

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 12
    :cond_35
    const-string v1, "user_session_"

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "user_session="

    const/16 v4, 0x3d

    if-eqz v1, :cond_60

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_60

    const/16 v1, 0x3b

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_60

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 14
    :cond_60
    const/4 v1, 0x0

    .local v1, "session":Ljava/lang/String;
    const/4 v5, 0x0

    .line 15
    .local v5, "secure":Ljava/lang/String;
    const-string v6, ";"

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_6b
    if-ge v9, v7, :cond_f1

    aget-object v10, v6, v9

    .line 16
    .local v10, "part":Ljava/lang/String;
    invoke-virtual {v10, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 17
    .local v11, "equals":I
    if-gez v11, :cond_77

    goto/16 :goto_df

    .line 18
    :cond_77
    invoke-virtual {v10, v8, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 19
    .local v12, "name":Ljava/lang/String;
    const-string v13, "user_session"

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_90

    const-string v14, "user_session_secure"

    invoke-virtual {v14, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_90

    goto :goto_df

    .line 20
    :cond_90
    add-int/lit8 v14, v11, 0x1

    invoke-virtual {v10, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 21
    .local v14, "value":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_eb

    .line 22
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_a1
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v15, v4, :cond_cb

    .line 23
    invoke-virtual {v14, v15}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 24
    .local v4, "c":C
    const/16 v8, 0x20

    if-le v4, v8, :cond_c5

    const/16 v8, 0x7f

    if-ge v4, v8, :cond_c5

    const/16 v8, 0x22

    if-eq v4, v8, :cond_c5

    const/16 v8, 0x2c

    if-eq v4, v8, :cond_c5

    const/16 v8, 0x5c

    if-eq v4, v8, :cond_c5

    .line 22
    .end local v4    # "c":C
    add-int/lit8 v15, v15, 0x1

    const/16 v4, 0x3d

    const/4 v8, 0x0

    goto :goto_a1

    .line 25
    .restart local v4    # "c":C
    :cond_c5
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 27
    .end local v4    # "c":C
    .end local v15    # "i":I
    :cond_cb
    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_db

    .line 28
    if-nez v1, :cond_d5

    .line 29
    move-object v1, v14

    goto :goto_df

    .line 28
    :cond_d5
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 31
    :cond_db
    if-nez v5, :cond_e5

    .line 32
    move-object v4, v14

    move-object v5, v4

    .line 15
    .end local v10    # "part":Ljava/lang/String;
    .end local v11    # "equals":I
    .end local v12    # "name":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :goto_df
    add-int/lit8 v9, v9, 0x1

    const/16 v4, 0x3d

    const/4 v8, 0x0

    goto :goto_6b

    .line 31
    .restart local v10    # "part":Ljava/lang/String;
    .restart local v11    # "equals":I
    .restart local v12    # "name":Ljava/lang/String;
    .restart local v14    # "value":Ljava/lang/String;
    :cond_e5
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 21
    :cond_eb
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 35
    .end local v10    # "part":Ljava/lang/String;
    .end local v11    # "equals":I
    .end local v12    # "name":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_f1
    if-eqz v1, :cond_12b

    .line 37
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v5, :cond_10b

    const-string v4, ""

    goto :goto_122

    :cond_10b
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "user_session_secure="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_122
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 35
    :cond_12b
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 9
    .end local v1    # "session":Ljava/lang/String;
    .end local v2    # "text":Ljava/lang/String;
    .end local v5    # "secure":Ljava/lang/String;
    :cond_131
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method
