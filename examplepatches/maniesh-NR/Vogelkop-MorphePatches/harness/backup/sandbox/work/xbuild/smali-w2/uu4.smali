.class public final Luu4;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# virtual methods
.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 17

    move-object/from16 p0, p4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_e

    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, p1}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_e
    new-instance v0, Lcom/opera/android/suggestion/Suggestion;

    const/4 v9, 0x0

    const/16 v1, 0x19

    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    const v7, 0x7fffffff

    const/4 v10, -0x1

    const/4 v11, 0x0

    move-object v8, v3

    invoke-direct/range {v0 .. v11}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method
