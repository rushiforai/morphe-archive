.class public final Lcom/opera/android/bookmarks/d;
.super Lcom/opera/android/bookmarks/b;
.source "SourceFile"

# interfaces
.implements Lpl3;


# instance fields
.field public d:Lshf;


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MNmBobM5(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final f()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MqJub8Kf(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getUrl()Lshf;
    .registers 11

    iget-object v0, p0, Lcom/opera/android/bookmarks/d;->d:Lshf;

    iget-object v1, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz v0, :cond_18

    iget-object v0, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-wide v2, v1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v2, v3}, LJ/N;->MqJub8Kf(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_dd

    :cond_18
    new-instance v0, Lorg/chromium/url/GURL;

    iget-wide v1, v1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v1, v2}, LJ/N;->MqJub8Kf(J)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    sget-object v1, Leti;->a:Lq6e;

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Leti;->a:Lq6e;

    if-eqz v1, :cond_d4

    iget-object v1, v1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :catch_39
    :cond_39
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leri;

    invoke-interface {v2}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Leti;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/regex/Pattern;

    if-nez v5, :cond_b1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    :goto_59
    const/16 v7, 0x25

    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_9b

    add-int/lit8 v8, v7, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v8, v9, :cond_9b

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v7, 0x2

    invoke-virtual {v3, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x69

    if-eq v8, v9, :cond_95

    const/16 v9, 0x73

    if-eq v8, v9, :cond_8f

    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_59

    :cond_8f
    const-string v7, "(.*?)"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_59

    :cond_95
    const-string v7, "(?:.*?)"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_59

    :cond_9b
    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b1
    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_c7

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v4

    if-lez v4, :cond_c7

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_c8

    :cond_c7
    const/4 v3, 0x0

    :goto_c8
    if-eqz v3, :cond_39

    :try_start_ca
    new-instance v4, Lshf;

    invoke-static {v3}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v0, v3, v2}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_d3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ca .. :try_end_d3} :catch_39

    goto :goto_db

    :cond_d4
    new-instance v4, Lshf;

    const/16 v1, 0xd

    invoke-direct {v4, v0, v1}, Lshf;-><init>(Ljava/lang/String;B)V

    :goto_db
    iput-object v4, p0, Lcom/opera/android/bookmarks/d;->d:Lshf;

    :cond_dd
    iget-object p0, p0, Lcom/opera/android/bookmarks/d;->d:Lshf;

    return-object p0
.end method
