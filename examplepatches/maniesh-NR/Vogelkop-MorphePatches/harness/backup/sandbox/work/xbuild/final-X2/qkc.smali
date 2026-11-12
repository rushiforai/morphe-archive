.class public final Lqkc;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Lrkc;

.field public final b:Ljs6;

.field public final c:Lnoc;

.field public final d:Lrlh;

.field public final e:Lfwf;

.field public final f:Lwub;

.field public final g:Laan;

.field public final h:Lyzb;

.field public final i:Lokc;

.field public final j:Lpkc;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Ljava/util/List;


# direct methods
.method public constructor <init>(Lrkc;Ljs6;Lnoc;Lrlh;Lfwf;Lwub;)V
    .registers 7

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lqkc;->a:Lrkc;

    iput-object p2, p0, Lqkc;->b:Ljs6;

    iput-object p3, p0, Lqkc;->c:Lnoc;

    iput-object p4, p0, Lqkc;->d:Lrlh;

    iput-object p5, p0, Lqkc;->e:Lfwf;

    iput-object p6, p0, Lqkc;->f:Lwub;

    new-instance p1, Laan;

    invoke-direct {p1}, Laan;-><init>()V

    iput-object p1, p0, Lqkc;->g:Laan;

    new-instance p1, Lyzb;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lqkc;->h:Lyzb;

    new-instance p1, Lokc;

    invoke-direct {p1, p0}, Lokc;-><init>(Lqkc;)V

    iput-object p1, p0, Lqkc;->i:Lokc;

    new-instance p1, Lpkc;

    invoke-direct {p1, p0}, Lpkc;-><init>(Lqkc;)V

    iput-object p1, p0, Lqkc;->j:Lpkc;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqkc;->k:Z

    iput-boolean p1, p0, Lqkc;->l:Z

    sget-object p2, Ll08;->a:Ll08;

    iput-object p2, p0, Lqkc;->n:Ljava/util/List;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lqkc;->n:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lqkc;->n:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lllc;

    invoke-virtual {p0}, Lllc;->a()J

    move-result-wide p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-object p0, p0, Lqkc;->n:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lllc;

    const/4 p1, 0x0

    if-eqz p0, :cond_32

    instance-of v0, p0, Ljlc;

    if-eqz v0, :cond_12

    sget-object p0, Lykc;->b:[Lykc;

    return p1

    :cond_12
    instance-of v0, p0, Lhlc;

    if-eqz v0, :cond_1a

    sget-object p0, Lykc;->b:[Lykc;

    const/4 p0, 0x1

    return p0

    :cond_1a
    instance-of v0, p0, Ldlc;

    if-eqz v0, :cond_22

    sget-object p0, Lykc;->b:[Lykc;

    const/4 p0, 0x2

    return p0

    :cond_22
    instance-of v0, p0, Lblc;

    if-eqz v0, :cond_2a

    sget-object p0, Lykc;->b:[Lykc;

    const/4 p0, 0x3

    return p0

    :cond_2a
    instance-of p0, p0, Lflc;

    if-eqz p0, :cond_32

    sget-object p0, Lykc;->b:[Lykc;

    const/4 p0, 0x4

    return p0

    :cond_32
    invoke-static {}, Lh9o;->p()V

    return p1
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Lqkc;->g:Laan;

    invoke-virtual {p0, p1}, Laan;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcan;->b(Z)V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lzkc;

    iget-object v2, v0, Lqkc;->n:Ljava/util/List;

    move/from16 v3, p2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lllc;

    if-eqz v1, :cond_335

    instance-of v3, v1, Lzoc;

    const/16 v4, 0xe

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v3, :cond_103

    instance-of v3, v2, Ljlc;

    if-eqz v3, :cond_23

    move-object v3, v2

    check-cast v3, Ljlc;

    goto :goto_24

    :cond_23
    move-object v3, v10

    :goto_24
    if-eqz v3, :cond_32f

    move-object v3, v1

    check-cast v3, Lzoc;

    check-cast v2, Ljlc;

    iget-object v2, v2, Ljlc;->a:Lklc;

    iget-object v11, v2, Lklc;->a:Lwmc;

    iget-boolean v12, v2, Lklc;->b:Z

    iget-boolean v13, v2, Lklc;->c:Z

    iget-boolean v2, v2, Lklc;->d:Z

    iget-object v14, v3, Lzoc;->c:Lmlc;

    iput-object v11, v3, Lzoc;->j:Lwmc;

    iget-object v15, v3, Lzoc;->g:Li16;

    const-wide/16 p1, 0x0

    iget-object v6, v11, Lwmc;->a:Llmc;

    iget-object v6, v6, Llmc;->c:Lvmc;

    invoke-static {v15, v6, v10, v10, v4}, Li16;->w(Li16;Lvmc;Lxmc;Lxmc;I)V

    iget-object v4, v11, Lwmc;->a:Llmc;

    iget-object v6, v4, Llmc;->d:Ljava/lang/String;

    const-string v7, "postponed"

    invoke-static {v6, v7, v9}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_83

    iget-object v7, v4, Llmc;->e:Lrmc;

    iget-wide v9, v7, Lrmc;->a:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    cmp-long v9, v9, p1

    if-gtz v9, :cond_5d

    const/4 v7, 0x0

    :cond_5d
    if-eqz v7, :cond_83

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v16

    iget-object v7, v3, Lzoc;->e:Lulp;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    const-wide/32 v20, 0x5265c00

    const/high16 v22, 0x40000

    invoke-static/range {v16 .. v22}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v7

    move-wide/from16 v9, v16

    iget-object v15, v3, Lzoc;->f:Ljava/text/SimpleDateFormat;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v9, v10}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v15, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    goto :goto_85

    :cond_83
    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_85
    iget-object v9, v14, Lmlc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v10, v14, Lmlc;->d:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v7, :cond_90

    move v15, v8

    goto :goto_92

    :cond_90
    const/16 v15, 0x8

    :goto_92
    invoke-virtual {v9, v15}, Landroid/view/View;->setVisibility(I)V

    iget-object v9, v14, Lmlc;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v5, :cond_9e

    move v15, v8

    goto :goto_a0

    :cond_9e
    const/16 v15, 0x8

    :goto_a0
    invoke-virtual {v9, v15}, Landroid/view/View;->setVisibility(I)V

    iget-object v9, v14, Lmlc;->g:Landroid/view/View;

    check-cast v9, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    if-nez v7, :cond_ab

    const/4 v15, 0x1

    goto :goto_ac

    :cond_ab
    move v15, v8

    :goto_ac
    iput-boolean v15, v9, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->e:Z

    if-eqz v15, :cond_b5

    sget-object v7, Lukc;->a:Lukc;

    invoke-virtual {v9, v7}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->a(Lukc;)V

    :cond_b5
    iget-object v7, v9, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->c:Lnak;

    invoke-virtual {v7, v11}, Lnak;->j(Ljava/lang/Object;)V

    iget-boolean v7, v4, Llmc;->i:Z

    if-eqz v7, :cond_c2

    if-nez v5, :cond_c2

    const/4 v15, 0x1

    goto :goto_c3

    :cond_c2
    move v15, v8

    :goto_c3
    if-nez v6, :cond_ca

    if-nez v15, :cond_ca

    const/16 v5, 0x8

    goto :goto_cb

    :cond_ca
    move v5, v8

    :goto_cb
    invoke-virtual {v10, v5}, Landroid/view/View;->setVisibility(I)V

    if-eqz v6, :cond_dc

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v7, 0x7f14094e

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_eb

    :cond_dc
    if-eqz v15, :cond_ea

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v7, 0x7f14094a

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_eb

    :cond_ea
    const/4 v5, 0x0

    :goto_eb
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, v3, Lzoc;->h:Ldpc;

    if-nez v6, :cond_f6

    if-eqz v13, :cond_f6

    const/4 v9, 0x1

    goto :goto_f7

    :cond_f6
    move v9, v8

    :goto_f7
    invoke-virtual {v5, v11, v9, v2}, Ldpc;->a(Lzmc;ZZ)V

    iget-object v2, v3, Lzoc;->i:Ligi;

    iget-object v3, v4, Llmc;->h:Limc;

    invoke-virtual {v2, v12, v3, v8}, Ligi;->X(ZLimc;Z)V

    goto/16 :goto_32f

    :cond_103
    const-wide/16 p1, 0x0

    instance-of v3, v1, Lhoc;

    if-eqz v3, :cond_213

    instance-of v3, v2, Lhlc;

    if-eqz v3, :cond_111

    move-object v3, v2

    check-cast v3, Lhlc;

    goto :goto_112

    :cond_111
    const/4 v3, 0x0

    :goto_112
    if-eqz v3, :cond_32f

    move-object v3, v1

    check-cast v3, Lhoc;

    check-cast v2, Lhlc;

    iget-object v2, v2, Lhlc;->a:Lilc;

    iget-object v4, v2, Lilc;->a:Lqmc;

    iget-boolean v5, v2, Lilc;->b:Z

    iget-boolean v6, v2, Lilc;->c:Z

    iget-boolean v2, v2, Lilc;->d:Z

    iget-object v7, v3, Lhoc;->c:Ly83;

    iput-object v4, v3, Lhoc;->h:Lqmc;

    iget-object v9, v3, Lhoc;->e:Li16;

    iget-object v10, v4, Lqmc;->a:Llmc;

    iget-object v10, v10, Llmc;->c:Lvmc;

    iget-object v11, v4, Lqmc;->b:Lxmc;

    iget-object v12, v4, Lqmc;->c:Lxmc;

    const/16 v13, 0x8

    invoke-static {v9, v10, v11, v12, v13}, Li16;->w(Li16;Lvmc;Lxmc;Lxmc;I)V

    iget-object v9, v4, Lqmc;->a:Llmc;

    iget-object v10, v9, Llmc;->d:Ljava/lang/String;

    if-eqz v10, :cond_14a

    new-instance v11, Lkotlin/text/Regex;

    const-string v12, "\\s"

    invoke-direct {v11, v12}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v12, ""

    invoke-virtual {v11, v10, v12}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_14b

    :cond_14a
    const/4 v10, 0x0

    :goto_14b
    const-string v11, "halftime"

    const/4 v15, 0x1

    invoke-static {v10, v11, v15}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_167

    iget-object v10, v7, Ly83;->d:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f14094c

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v16, v9

    goto/16 :goto_1db

    :cond_167
    iget-object v10, v9, Llmc;->e:Lrmc;

    iget-object v11, v10, Lrmc;->i:Ljava/lang/Long;

    iget-object v12, v10, Lrmc;->b:Ljava/lang/Long;

    if-eqz v11, :cond_174

    iget-object v10, v10, Lrmc;->j:Ljava/lang/Long;

    const/16 v11, 0x78

    goto :goto_18e

    :cond_174
    iget-object v11, v10, Lrmc;->g:Ljava/lang/Long;

    if-eqz v11, :cond_17d

    iget-object v10, v10, Lrmc;->h:Ljava/lang/Long;

    const/16 v11, 0x69

    goto :goto_18e

    :cond_17d
    iget-object v11, v10, Lrmc;->e:Ljava/lang/Long;

    if-eqz v11, :cond_186

    iget-object v10, v10, Lrmc;->f:Ljava/lang/Long;

    const/16 v11, 0x5a

    goto :goto_18e

    :cond_186
    iget-object v12, v10, Lrmc;->c:Ljava/lang/Long;

    if-eqz v12, :cond_1d8

    iget-object v10, v10, Lrmc;->d:Ljava/lang/Long;

    const/16 v11, 0x2d

    :goto_18e
    if-eqz v12, :cond_195

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    goto :goto_197

    :cond_195
    move-wide/from16 v12, p1

    :goto_197
    const-wide/32 v18, 0xea60

    div-long v12, v12, v18

    const-wide/16 v20, 0x1

    add-long v12, v12, v20

    move-object/from16 v16, v9

    int-to-long v8, v11

    cmp-long v11, v12, v8

    if-lez v11, :cond_1a8

    move-wide v12, v8

    :cond_1a8
    if-eqz v10, :cond_1b7

    invoke-virtual {v10}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    div-long v8, v8, v18

    add-long v8, v8, v20

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_1b8

    :cond_1b7
    const/4 v10, 0x0

    :goto_1b8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    if-eqz v10, :cond_1ce

    const-string v9, "+"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    :cond_1ce
    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_1db

    :cond_1d8
    move-object/from16 v16, v9

    const/4 v10, 0x0

    :goto_1db
    iget-object v8, v7, Ly83;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v7, v7, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v7, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v10, :cond_1ea

    const/4 v9, 0x0

    goto :goto_1ec

    :cond_1ea
    const/16 v9, 0x8

    :goto_1ec
    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    if-nez v10, :cond_1f3

    const/4 v9, 0x1

    goto :goto_1f4

    :cond_1f3
    const/4 v9, 0x0

    :goto_1f4
    iput-boolean v9, v7, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->e:Z

    if-eqz v9, :cond_1fd

    sget-object v8, Lukc;->a:Lukc;

    invoke-virtual {v7, v8}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->a(Lukc;)V

    :cond_1fd
    iget-object v7, v7, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->c:Lnak;

    invoke-virtual {v7, v4}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v7, v3, Lhoc;->f:Ldpc;

    invoke-virtual {v7, v4, v6, v2}, Ldpc;->a(Lzmc;ZZ)V

    iget-object v2, v3, Lhoc;->g:Ligi;

    move-object/from16 v3, v16

    iget-object v3, v3, Llmc;->h:Limc;

    const/4 v14, 0x0

    invoke-virtual {v2, v5, v3, v14}, Ligi;->X(ZLimc;Z)V

    goto/16 :goto_32f

    :cond_213
    instance-of v3, v1, Lznc;

    if-eqz v3, :cond_2d0

    instance-of v3, v2, Ldlc;

    if-eqz v3, :cond_21f

    move-object v3, v2

    check-cast v3, Ldlc;

    goto :goto_220

    :cond_21f
    const/4 v3, 0x0

    :goto_220
    if-eqz v3, :cond_32f

    move-object v3, v1

    check-cast v3, Lznc;

    check-cast v2, Ldlc;

    iget-object v2, v2, Ldlc;->a:Lelc;

    iget-object v4, v2, Lelc;->a:Lnmc;

    iget-boolean v2, v2, Lelc;->b:Z

    iget-object v5, v3, Lznc;->c:Ly83;

    iput-object v4, v3, Lznc;->h:Lnmc;

    iget-object v6, v3, Lznc;->f:Li16;

    iget-object v7, v4, Lnmc;->a:Llmc;

    iget-object v8, v7, Llmc;->c:Lvmc;

    iget-object v9, v4, Lnmc;->b:Lxmc;

    iget-object v10, v4, Lnmc;->c:Lxmc;

    iget-object v11, v4, Lnmc;->d:Lmmc;

    invoke-virtual {v6, v8, v9, v10, v11}, Li16;->v(Lvmc;Lxmc;Lxmc;Lmmc;)V

    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_262

    const/4 v15, 0x1

    if-eq v6, v15, :cond_259

    const/4 v8, 0x2

    if-ne v6, v8, :cond_255

    new-instance v6, Lrxh;

    const v8, 0x7f140948

    invoke-direct {v6, v8}, Lrxh;-><init>(I)V

    goto :goto_26a

    :cond_255
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_259
    new-instance v6, Lrxh;

    const v8, 0x7f140947

    invoke-direct {v6, v8}, Lrxh;-><init>(I)V

    goto :goto_26a

    :cond_262
    new-instance v6, Lrxh;

    const v8, 0x7f14094b

    invoke-direct {v6, v8}, Lrxh;-><init>(I)V

    :goto_26a
    iget-object v8, v5, Ly83;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v6, v9}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, v7, Llmc;->e:Lrmc;

    iget-wide v8, v6, Lrmc;->a:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    cmp-long v8, v8, p1

    if-gtz v8, :cond_286

    const/4 v6, 0x0

    :cond_286
    if-eqz v6, :cond_29f

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v18

    iget-object v6, v3, Lznc;->e:Lulp;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    const-wide/32 v22, 0x5265c00

    const/high16 v24, 0x40000

    invoke-static/range {v18 .. v24}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v10

    goto :goto_2a0

    :cond_29f
    const/4 v10, 0x0

    :goto_2a0
    iget-object v6, v5, Ly83;->e:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v10, :cond_2ab

    const/4 v8, 0x0

    goto :goto_2ad

    :cond_2ab
    const/16 v8, 0x8

    :goto_2ad
    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v5, v5, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v5, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    if-nez v10, :cond_2b8

    const/4 v9, 0x1

    goto :goto_2b9

    :cond_2b8
    const/4 v9, 0x0

    :goto_2b9
    iput-boolean v9, v5, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->e:Z

    if-eqz v9, :cond_2c2

    sget-object v6, Lukc;->a:Lukc;

    invoke-virtual {v5, v6}, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->a(Lukc;)V

    :cond_2c2
    iget-object v5, v5, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->c:Lnak;

    invoke-virtual {v5, v4}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v3, v3, Lznc;->g:Ligi;

    iget-object v4, v7, Llmc;->h:Limc;

    const/4 v14, 0x0

    invoke-virtual {v3, v2, v4, v14}, Ligi;->X(ZLimc;Z)V

    goto :goto_32f

    :cond_2d0
    instance-of v3, v1, Lxkc;

    if-eqz v3, :cond_2fd

    instance-of v3, v2, Lblc;

    if-eqz v3, :cond_2dc

    move-object v3, v2

    check-cast v3, Lblc;

    goto :goto_2dd

    :cond_2dc
    const/4 v3, 0x0

    :goto_2dd
    if-eqz v3, :cond_32f

    move-object v3, v1

    check-cast v3, Lxkc;

    check-cast v2, Lblc;

    iget-object v2, v2, Lblc;->a:Lclc;

    iget-object v5, v2, Lclc;->a:Lkmc;

    iget-boolean v2, v2, Lclc;->b:Z

    iput-object v5, v3, Lxkc;->g:Lkmc;

    iget-object v6, v3, Lxkc;->e:Li16;

    iget-object v5, v5, Lkmc;->a:Llmc;

    iget-object v5, v5, Llmc;->c:Lvmc;

    const/4 v7, 0x0

    invoke-static {v6, v5, v7, v7, v4}, Li16;->w(Li16;Lvmc;Lxmc;Lxmc;I)V

    iget-object v3, v3, Lxkc;->f:Ligi;

    const/4 v14, 0x0

    invoke-virtual {v3, v2, v7, v14}, Ligi;->X(ZLimc;Z)V

    goto :goto_32f

    :cond_2fd
    instance-of v3, v1, Lfoc;

    if-eqz v3, :cond_335

    instance-of v3, v2, Lflc;

    if-eqz v3, :cond_309

    move-object v7, v2

    check-cast v7, Lflc;

    goto :goto_30a

    :cond_309
    const/4 v7, 0x0

    :goto_30a
    if-eqz v7, :cond_32f

    move-object v3, v1

    check-cast v3, Lfoc;

    check-cast v2, Lflc;

    iget-object v2, v2, Lflc;->a:Lglc;

    iget-object v4, v2, Lglc;->a:Lpmc;

    iget-boolean v2, v2, Lglc;->b:Z

    iput-object v4, v3, Lfoc;->g:Lpmc;

    iget-object v5, v3, Lfoc;->e:Li16;

    iget-object v6, v4, Lpmc;->a:Llmc;

    iget-object v6, v6, Llmc;->c:Lvmc;

    iget-object v7, v4, Lpmc;->b:Lxmc;

    iget-object v4, v4, Lpmc;->c:Lxmc;

    const/16 v13, 0x8

    invoke-static {v5, v6, v7, v4, v13}, Li16;->w(Li16;Lvmc;Lxmc;Lxmc;I)V

    iget-object v3, v3, Lfoc;->f:Ligi;

    const/4 v7, 0x0

    const/4 v15, 0x1

    invoke-virtual {v3, v2, v7, v15}, Ligi;->X(ZLimc;Z)V

    :cond_32f
    :goto_32f
    iget-object v0, v0, Lqkc;->g:Laan;

    invoke-virtual {v0, v1}, Laan;->f(Landroidx/recyclerview/widget/i;)V

    return-void

    :cond_335
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 29

    move-object/from16 v0, p0

    sget-object v1, Lykc;->c:Lh58;

    move/from16 v2, p2

    invoke-virtual {v1, v2}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lykc;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    iget v1, v1, Lykc;->a:I

    iget-object v4, v0, Lqkc;->a:Lrkc;

    iget-object v9, v0, Lqkc;->c:Lnoc;

    iget-object v7, v0, Lqkc;->i:Lokc;

    iget-object v8, v0, Lqkc;->j:Lpkc;

    iget-object v10, v0, Lqkc;->d:Lrlh;

    iget-object v11, v0, Lqkc;->e:Lfwf;

    const v5, 0x7f0a0655

    const v6, 0x7f0a0652

    const v12, 0x7f0a0118

    const-string v13, "Missing required view with ID: "

    const v14, 0x7f0a0b5d

    const v15, 0x7f0a0782

    const/16 p1, 0x0

    const v3, 0x7f0a01d2

    if-eqz v2, :cond_224

    const/4 v0, 0x1

    if-eq v2, v0, :cond_19e

    const/4 v0, 0x2

    if-eq v2, v0, :cond_107

    const/4 v0, 0x3

    const v5, 0x7f0a0ad9

    if-eq v2, v0, :cond_a8

    const/4 v0, 0x4

    if-ne v2, v0, :cond_a4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v18, :cond_91

    invoke-static {v15, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_8d

    invoke-static {v1}, Ly83;->b(Landroid/view/View;)Ly83;

    move-result-object v19

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_89

    invoke-static {v14, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_86

    invoke-static {v1}, Lmlc;->a(Landroid/view/View;)Lmlc;

    move-result-object v20

    new-instance v16, Lalc;

    const/16 v21, 0x1

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v21}, Lalc;-><init>(Landroid/view/View;Landroidx/constraintlayout/widget/ConstraintLayout;Ly83;Lmlc;B)V

    move-object/from16 v0, v16

    new-instance v1, Lfoc;

    invoke-direct {v1, v0, v7, v8, v9}, Lfoc;-><init>(Lalc;Lokc;Lpkc;Lnoc;)V

    return-object v1

    :cond_86
    move-object/from16 v17, v0

    goto :goto_94

    :cond_89
    move-object/from16 v17, v0

    move v14, v5

    goto :goto_94

    :cond_8d
    move-object/from16 v17, v0

    move v14, v15

    goto :goto_94

    :cond_91
    move-object/from16 v17, v0

    move v14, v3

    :goto_94
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p1

    :cond_a4
    invoke-static {}, Lh9o;->p()V

    return-object p1

    :cond_a8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v18, :cond_f4

    invoke-static {v15, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_f0

    invoke-static {v1}, Ly83;->b(Landroid/view/View;)Ly83;

    move-result-object v19

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_ec

    invoke-static {v14, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_e9

    invoke-static {v1}, Lmlc;->a(Landroid/view/View;)Lmlc;

    move-result-object v20

    new-instance v16, Lalc;

    const/16 v21, 0x0

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v21}, Lalc;-><init>(Landroid/view/View;Landroidx/constraintlayout/widget/ConstraintLayout;Ly83;Lmlc;B)V

    move-object/from16 v0, v16

    new-instance v1, Lxkc;

    invoke-direct {v1, v0, v7, v8, v9}, Lxkc;-><init>(Lalc;Lokc;Lpkc;Lnoc;)V

    return-object v1

    :cond_e9
    move-object/from16 v17, v0

    goto :goto_f7

    :cond_ec
    move-object/from16 v17, v0

    move v14, v5

    goto :goto_f7

    :cond_f0
    move-object/from16 v17, v0

    move v14, v15

    goto :goto_f7

    :cond_f4
    move-object/from16 v17, v0

    move v14, v3

    :goto_f7
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p1

    :cond_107
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v12, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    if-eqz v18, :cond_18b

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v19, :cond_187

    const v1, 0x7f0a049e

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_183

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v21, :cond_17f

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v1, :cond_17c

    const v5, 0x7f0a0656

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v1, :cond_17c

    invoke-static {v15, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_178

    invoke-static {v1}, Ly83;->b(Landroid/view/View;)Ly83;

    move-result-object v22

    invoke-static {v14, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_174

    invoke-static {v1}, Lmlc;->a(Landroid/view/View;)Lmlc;

    move-result-object v23

    new-instance v16, Ly83;

    const/16 v24, 0x3

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v24}, Ly83;-><init>(Landroid/view/View;Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Ljava/lang/Object;Ljava/lang/Object;Lmlc;B)V

    new-instance v5, Lznc;

    move-object/from16 v6, v16

    invoke-direct/range {v5 .. v11}, Lznc;-><init>(Ly83;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V

    return-object v5

    :cond_174
    move-object/from16 v17, v0

    move v5, v14

    goto :goto_18e

    :cond_178
    move-object/from16 v17, v0

    move v5, v15

    goto :goto_18e

    :cond_17c
    move-object/from16 v17, v0

    goto :goto_18e

    :cond_17f
    move-object/from16 v17, v0

    move v5, v6

    goto :goto_18e

    :cond_183
    move-object/from16 v17, v0

    move v5, v1

    goto :goto_18e

    :cond_187
    move-object/from16 v17, v0

    move v5, v3

    goto :goto_18e

    :cond_18b
    move-object/from16 v17, v0

    move v5, v12

    :goto_18e
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p1

    :cond_19e
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v12, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    if-eqz v18, :cond_211

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v19, :cond_20d

    const v1, 0x7f0a0611

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_209

    invoke-static {v15, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_205

    invoke-static {v1}, Ly83;->b(Landroid/view/View;)Ly83;

    move-result-object v21

    const v1, 0x7f0a0ac2

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    if-eqz v22, :cond_1ff

    invoke-static {v14, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1fb

    invoke-static {v1}, Lmlc;->a(Landroid/view/View;)Lmlc;

    move-result-object v23

    new-instance v16, Ly83;

    const/16 v24, 0x4

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v24}, Ly83;-><init>(Landroid/view/View;Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Ljava/lang/Object;Ljava/lang/Object;Lmlc;B)V

    new-instance v5, Lhoc;

    move-object/from16 v6, v16

    invoke-direct/range {v5 .. v11}, Lhoc;-><init>(Ly83;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V

    return-object v5

    :cond_1fb
    move-object/from16 v17, v0

    move v0, v14

    goto :goto_214

    :cond_1ff
    move-object/from16 v17, v0

    const v0, 0x7f0a0ac2

    goto :goto_214

    :cond_205
    move-object/from16 v17, v0

    move v0, v15

    goto :goto_214

    :cond_209
    move-object/from16 v17, v0

    move v0, v1

    goto :goto_214

    :cond_20d
    move-object/from16 v17, v0

    move v0, v3

    goto :goto_214

    :cond_211
    move-object/from16 v17, v0

    move v0, v12

    :goto_214
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p1

    :cond_224
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v0}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v12, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    if-eqz v18, :cond_2c1

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v19, :cond_2bd

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_2b9

    const v1, 0x7f0a0653

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v21, v2

    check-cast v21, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v21, :cond_2b5

    const v1, 0x7f0a0654

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v2, :cond_2b5

    invoke-static {v5, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v1, :cond_2b1

    const v1, 0x7f0a0659

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v22, :cond_2b5

    invoke-static {v15, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2ad

    invoke-static {v1}, Ly83;->b(Landroid/view/View;)Ly83;

    move-result-object v23

    const v1, 0x7f0a0ac2

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v24, v2

    check-cast v24, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    if-eqz v24, :cond_2b5

    invoke-static {v14, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2a9

    invoke-static {v1}, Lmlc;->a(Landroid/view/View;)Lmlc;

    move-result-object v25

    new-instance v16, Lmlc;

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v25}, Lmlc;-><init>(Landroid/view/View;Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Ly83;Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;Lmlc;)V

    new-instance v5, Lzoc;

    move-object/from16 v6, v16

    invoke-direct/range {v5 .. v11}, Lzoc;-><init>(Lmlc;Lokc;Lpkc;Lnoc;Lrlh;Lfwf;)V

    return-object v5

    :cond_2a9
    move-object/from16 v17, v0

    move v0, v14

    goto :goto_2c4

    :cond_2ad
    move-object/from16 v17, v0

    move v0, v15

    goto :goto_2c4

    :cond_2b1
    move-object/from16 v17, v0

    move v0, v5

    goto :goto_2c4

    :cond_2b5
    move-object/from16 v17, v0

    move v0, v1

    goto :goto_2c4

    :cond_2b9
    move-object/from16 v17, v0

    move v0, v6

    goto :goto_2c4

    :cond_2bd
    move-object/from16 v17, v0

    move v0, v3

    goto :goto_2c4

    :cond_2c1
    move-object/from16 v17, v0

    move v0, v12

    :goto_2c4
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p1
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Lqkc;->g:Laan;

    iget-object v0, p0, Laan;->d:Lyc3;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object v0, p0, Laan;->e:Lz61;

    if-eqz v0, :cond_25

    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object v0, v0, Lz61;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_22
    const/4 p1, 0x0

    iput-object p1, p0, Laan;->e:Lz61;

    :cond_25
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcan;->b(Z)V

    return-void
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 5

    check-cast p1, Lzkc;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    if-eqz p1, :cond_66

    instance-of v0, p1, Lzoc;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    move-object v0, p1

    check-cast v0, Lzoc;

    iput-object v1, v0, Lzoc;->j:Lwmc;

    iget-object v2, v0, Lzoc;->c:Lmlc;

    iget-object v2, v2, Lmlc;->i:Landroid/view/View;

    check-cast v2, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v0, Lzoc;->i:Ligi;

    invoke-virtual {v0}, Ligi;->c0()V

    goto :goto_5b

    :cond_20
    instance-of v0, p1, Lhoc;

    if-eqz v0, :cond_2f

    move-object v0, p1

    check-cast v0, Lhoc;

    iput-object v1, v0, Lhoc;->h:Lqmc;

    iget-object v0, v0, Lhoc;->g:Ligi;

    invoke-virtual {v0}, Ligi;->c0()V

    goto :goto_5b

    :cond_2f
    instance-of v0, p1, Lznc;

    if-eqz v0, :cond_3e

    move-object v0, p1

    check-cast v0, Lznc;

    iput-object v1, v0, Lznc;->h:Lnmc;

    iget-object v0, v0, Lznc;->g:Ligi;

    invoke-virtual {v0}, Ligi;->c0()V

    goto :goto_5b

    :cond_3e
    instance-of v0, p1, Lxkc;

    if-eqz v0, :cond_4d

    move-object v0, p1

    check-cast v0, Lxkc;

    iput-object v1, v0, Lxkc;->g:Lkmc;

    iget-object v0, v0, Lxkc;->f:Ligi;

    invoke-virtual {v0}, Ligi;->c0()V

    goto :goto_5b

    :cond_4d
    instance-of v0, p1, Lfoc;

    if-eqz v0, :cond_66

    move-object v0, p1

    check-cast v0, Lfoc;

    iput-object v1, v0, Lfoc;->g:Lpmc;

    iget-object v0, v0, Lfoc;->f:Ligi;

    invoke-virtual {v0}, Ligi;->c0()V

    :goto_5b
    iget-object p0, p0, Lqkc;->g:Laan;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcan;->a(Landroid/view/View;)V

    return-void

    :cond_66
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
