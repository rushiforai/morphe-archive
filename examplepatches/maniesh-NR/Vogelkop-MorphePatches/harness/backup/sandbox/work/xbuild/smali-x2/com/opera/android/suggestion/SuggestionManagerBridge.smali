.class public final Lcom/opera/android/suggestion/SuggestionManagerBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->b:Ljava/util/ArrayList;

    invoke-static {}, LJ/N;->MzoytVDl()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    return-void
.end method

.method public static addSuggestion(Ljava/util/List;ILjava/lang/String;Ljava/lang/String;ILcom/opera/android/suggestion/Suggestion;Ljava/lang/Object;)V
    .registers 23
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/opera/android/suggestion/Suggestion;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/opera/android/suggestion/Suggestion;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Lcom/opera/android/suggestion/Suggestion;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    if-eqz v1, :cond_56

    iget-object v2, v1, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    iget v3, v1, Lcom/opera/android/suggestion/Suggestion;->a:I

    move/from16 v5, p4

    if-ne v5, v3, :cond_39

    iget-object v3, v1, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    move-object/from16 v6, p2

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    move-object/from16 v8, p3

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    if-nez v2, :cond_36

    :cond_22
    iget v2, v1, Lcom/opera/android/suggestion/Suggestion;->g:I

    move/from16 v11, p1

    if-ne v11, v2, :cond_33

    iget-object v2, v1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    move-object/from16 v15, p6

    invoke-static {v15, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    goto :goto_52

    :cond_33
    :goto_33
    move-object/from16 v15, p6

    goto :goto_3e

    :cond_36
    move/from16 v11, p1

    goto :goto_33

    :cond_39
    move/from16 v11, p1

    move-object/from16 v6, p2

    goto :goto_33

    :cond_3e
    :goto_3e
    new-instance v4, Lcom/opera/android/suggestion/Suggestion;

    iget-object v7, v1, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    iget-object v8, v1, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    iget-object v9, v1, Lcom/opera/android/suggestion/Suggestion;->e:Lrn9;

    iget-object v10, v1, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    iget-object v12, v1, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    iget v13, v1, Lcom/opera/android/suggestion/Suggestion;->i:I

    iget v14, v1, Lcom/opera/android/suggestion/Suggestion;->j:I

    invoke-direct/range {v4 .. v15}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    move-object v1, v4

    :goto_52
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_56
    move-object/from16 v8, p3

    new-instance v4, Lcom/opera/android/suggestion/Suggestion;

    const-string v7, ""

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v13, 0x0

    const/4 v14, -0x1

    move-object v12, v7

    move/from16 v11, p1

    move-object/from16 v6, p2

    move/from16 v5, p4

    move-object/from16 v15, p6

    invoke-direct/range {v4 .. v15}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static createList(I)Ljava/util/List;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/opera/android/suggestion/Suggestion;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0
.end method

.method public static reportSlowProvider(Ljava/util/List;I)V
    .registers 3
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lkqk;",
            ">;I)V"
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lkqk;->values()[Lkqk;

    move-result-object v0

    aget-object p1, v0, p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_9} :catch_9

    :catch_9
    return-void
.end method

.method public static runCallback(Lcom/opera/android/suggestion/SuggestionListCallback;Ljava/util/List;)V
    .registers 2
    .param p0    # Lcom/opera/android/suggestion/SuggestionListCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/android/suggestion/SuggestionListCallback;",
            "Ljava/util/List<",
            "Lcom/opera/android/suggestion/Suggestion;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/android/suggestion/SuggestionListCallback;->d(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final a(Llt8;Lkqk;Z)V
    .registers 12

    invoke-virtual {p1}, Llt8;->d()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v1, p0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b
    iget-wide v0, p0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v0, v1}, LJ/N;->MsnOjWk7(J)J

    move-result-wide v4

    iget-wide v2, p1, Llt8;->b:J

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    move v7, p3

    invoke-static/range {v2 .. v7}, LJ/N;->ME2$Sfed(JJIZ)V

    return-void
.end method

.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v0, v1}, LJ/N;->MKD6pB0N(J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
