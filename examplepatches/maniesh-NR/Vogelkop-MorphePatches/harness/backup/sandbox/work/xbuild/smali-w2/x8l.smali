.class public final Lx8l;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final d:Lumi;

.field public final e:Lk6l;

.field public final f:B

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:I

.field public final n:I

.field public o:Loml;


# direct methods
.method public constructor <init>(Lumi;Lk6l;IIIIIIII)V
    .registers 12

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Lx8l;->d:Lumi;

    iput-object p2, p0, Lx8l;->e:Lk6l;

    const/16 p1, 0x14

    iput-byte p1, p0, Lx8l;->f:B

    iput p3, p0, Lx8l;->g:I

    iput p4, p0, Lx8l;->h:I

    iput p5, p0, Lx8l;->i:I

    iput p6, p0, Lx8l;->j:I

    iput p7, p0, Lx8l;->k:I

    iput p8, p0, Lx8l;->l:I

    iput p9, p0, Lx8l;->m:I

    iput p10, p0, Lx8l;->n:I

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 3

    iget-object v0, p0, Lx8l;->o:Loml;

    if-eqz v0, :cond_8

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_8
    const/4 v0, 0x0

    iput-object v0, p0, Lx8l;->o:Loml;

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0}, Lx8l;->cancel()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    if-eqz p1, :cond_25

    invoke-static/range {p1 .. p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_25

    new-instance v3, Lesi;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lesi;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    goto :goto_26

    :cond_25
    const/4 v3, 0x0

    :goto_26
    if-nez v3, :cond_2e

    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {v1, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_2e
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v2

    iget-object v4, v0, Lx8l;->e:Lk6l;

    iget-object v4, v4, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_40
    :goto_40
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_97

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb2l;

    move-object v6, v5

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->m()Z

    move-result v6

    move/from16 v7, p3

    if-ne v6, v7, :cond_40

    move-object v6, v5

    check-cast v6, Ld7l;

    iget-object v8, v6, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->isActive()Z

    move-result v8

    if-nez v8, :cond_40

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_40

    new-instance v6, Lu8l;

    check-cast v5, Ld7l;

    invoke-virtual {v5}, Ld7l;->t()Lesk;

    move-result-object v8

    iget-object v9, v5, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v5, Ld7l;->j:Le7l;

    invoke-interface {v10}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lsy3;

    const/4 v12, 0x2

    invoke-direct {v11, v10, v12}, Lsy3;-><init>(Ljava/lang/String;B)V

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getId()I

    move-result v5

    invoke-direct {v6, v8, v9, v11, v5}, Lu8l;-><init>(Lesk;Ljava/lang/String;Lsy3;I)V

    invoke-virtual {v2, v6}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_97
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v2

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v4

    invoke-static {}, LJ/N;->MENDCTHo()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/opera/android/sync/SyncedSession;

    array-length v6, v5

    const/4 v8, 0x0

    :goto_a7
    if-ge v8, v6, :cond_f9

    aget-object v9, v5, v8

    iget-object v9, v9, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    invoke-static {v9}, LJ/N;->MD0ZtbWr(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lcom/opera/android/sync/SyncedSessionWindow;

    if-eqz v9, :cond_f2

    array-length v10, v9

    const/4 v11, 0x0

    :goto_b7
    if-ge v11, v10, :cond_f2

    aget-object v12, v9, v11

    iget-object v13, v12, Lcom/opera/android/sync/SyncedSessionWindow;->a:Ljava/lang/String;

    iget-wide v14, v12, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    invoke-static {v13, v14, v15}, LJ/N;->Mn0q_taN(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Lcom/opera/android/sync/SyncedSessionTab;

    if-eqz v12, :cond_eb

    array-length v13, v12

    const/4 v14, 0x0

    :goto_c9
    if-ge v14, v13, :cond_eb

    aget-object v15, v12, v14

    iget-object v7, v15, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    invoke-static {v7}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_e4

    new-instance v7, Lv8l;

    move-object/from16 p2, v5

    iget-object v5, v15, Lcom/opera/android/sync/SyncedSessionTab;->e:Ljava/lang/String;

    iget-object v15, v15, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    invoke-direct {v7, v5, v15}, Lv8l;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_e6

    :cond_e4
    move-object/from16 p2, v5

    :goto_e6
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v5, p2

    goto :goto_c9

    :cond_eb
    move-object/from16 p2, v5

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v5, p2

    goto :goto_b7

    :cond_f2
    move-object/from16 p2, v5

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v5, p2

    goto :goto_a7

    :cond_f9
    invoke-static {v4}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v4

    new-instance v5, Lmgh;

    const/4 v6, 0x7

    invoke-direct {v5, v2, v4, v6}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lrml;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v6, v0, Lx8l;->d:Lumi;

    invoke-direct {v2, v4, v6}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v4, Ltmi;

    const/16 v6, 0xb

    invoke-direct {v4, v0, v5, v3, v6}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v2

    new-instance v3, Ld7k;

    const/16 v4, 0x19

    invoke-direct {v3, v1, v0, v4}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    invoke-virtual {v1}, Lplk;->l()Loml;

    move-result-object v1

    iput-object v1, v0, Lx8l;->o:Loml;

    return-void
.end method
