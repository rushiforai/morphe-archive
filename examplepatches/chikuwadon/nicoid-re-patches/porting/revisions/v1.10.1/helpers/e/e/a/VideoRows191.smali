.class public final Le/e/a/VideoRows191;
.super Ljava/lang/Object;
.source "VideoRows191.java"


# static fields
.field private static final DATE:Ljava/util/regex/Pattern;

.field static final NOTE:Ljava/lang/String; = "nicoid_row_note"

.field static final POSTED:Ljava/lang/String; = "nicoid_row_posted"

.field private static final POSTED_TIMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final TIMES:Ljava/util/regex/Pattern;

.field static final TRANSFER:Ljava/lang/String; = "nicoid_row_transfer"

.field private static final VIDEO_URL:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 18
    const-string v0, "[0-9]{4}(?:[-/][0-9]{2}[-/][0-9]{2}[ T][0-9]{2}:[0-9]{2}(?::[0-9]{2}(?:\\.[0-9]+)?)?(?:Z|[+-][0-9]{2}:?[0-9]{2})?|\u5e74[0-9]{2}\u6708[0-9]{2}\u65e5 [0-9]{2}(?:\u6642[0-9]{2}\u5206|:[0-9]{2}))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/VideoRows191;->DATE:Ljava/util/regex/Pattern;

    .line 19
    const-string v0, "([0-9][0-9,]*)\\s*(?:\u56de\u8996\u8074|views|\u6b21\u89c0\u770b)"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/VideoRows191;->TIMES:Ljava/util/regex/Pattern;

    .line 20
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/VideoRows191;->POSTED_TIMES:Ljava/util/Map;

    .line 21
    const-string v0, "https?://[^/]*nicovideo.jp/(?:watch|shorts)/.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/VideoRows191;->VIDEO_URL:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    invoke-static {p0, p2}, Le/e/a/VideoMarks119;->bind(Landroid/view/View;Ljava/lang/Object;)V

    .line 50
    :try_start_3
    invoke-static {p0, p1, p2}, Le/e/a/VideoRows191;->bindRow(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_f

    :catch_7
    move-exception p0

    const-string p1, "nicoid-row"

    const-string p2, "Unable to format video row"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    :goto_f
    return-void
.end method

.method private static bindRow(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 29

    .line 54
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    const-string v0, "videourl"

    invoke-static {v2, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 55
    sget-object v3, Le/e/a/VideoRows191;->VIDEO_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_17

    return-void

    .line 56
    :cond_17
    const v0, 0x7f08015e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/TextView;

    const v0, 0x7f0801b4

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v4, 0x7f0801d3

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 57
    if-eqz v3, :cond_2ed

    if-eqz v0, :cond_2ed

    if-eqz v4, :cond_2ed

    invoke-virtual {v4}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/LinearLayout;

    if-nez v5, :cond_43

    goto/16 :goto_2ed

    .line 58
    :cond_43
    invoke-virtual {v4}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    .line 59
    const v6, 0x7f0801e2

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 60
    if-nez v7, :cond_6e

    new-instance v7, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setId(I)V

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 62
    :cond_6e
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v8

    if-le v6, v8, :cond_82

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v5, v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 63
    :cond_82
    const v6, -0x48453d

    const v8, -0x99958d

    const-string v9, "nicoid_muted"

    invoke-static {v1, v9, v6, v8}, Le/e/a/VideoRows191;->color(Landroid/view/View;Ljava/lang/String;II)I

    move-result v6

    .line 64
    invoke-static {v3, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    invoke-static {v7, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    invoke-static {v4, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    .line 65
    const/high16 v8, 0x41700000    # 15.0f

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    const-string v8, "nicoid_ink"

    const v9, -0xdfdedc

    const v10, -0x111112

    invoke-static {v1, v8, v10, v9}, Le/e/a/VideoRows191;->color(Landroid/view/View;Ljava/lang/String;II)I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    const-string v0, "nicoid_row_posted"

    invoke-static {v4, v0}, Le/e/a/VideoRows191;->extra(Landroid/widget/TextView;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v8

    const-string v0, "nicoid_row_transfer"

    invoke-static {v4, v0}, Le/e/a/VideoRows191;->extra(Landroid/widget/TextView;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v9

    const-string v0, "nicoid_row_note"

    invoke-static {v4, v0}, Le/e/a/VideoRows191;->extra(Landroid/widget/TextView;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v11

    .line 67
    invoke-static {v8, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    invoke-static {v9, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    invoke-static {v11, v6}, Le/e/a/VideoRows191;->metadata(Landroid/widget/TextView;I)V

    .line 68
    const-string v0, "nicoid_history_posted"

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    const/16 v6, 0x8

    if-eqz v0, :cond_d3

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 69
    :cond_d3
    invoke-static/range {p1 .. p1}, Le/e/a/VideoRows191;->type(Ljava/lang/Object;)I

    move-result v0

    const/4 v12, 0x4

    if-eq v0, v12, :cond_de

    if-eq v0, v6, :cond_de

    const/4 v15, 0x0

    goto :goto_df

    :cond_de
    const/4 v15, 0x1

    :goto_df
    invoke-static/range {p1 .. p1}, Le/e/a/LocalPlaylists;->hasAdapter(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_ee

    const/4 v12, 0x5

    if-eq v0, v12, :cond_ee

    const/16 v12, 0x9

    if-eq v0, v12, :cond_ee

    const/4 v12, 0x0

    goto :goto_ef

    :cond_ee
    const/4 v12, 0x1

    .line 70
    :goto_ef
    sget-object v10, Le/e/a/CacheListing;->INFO:Ljava/util/Map;

    invoke-interface {v10, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Le/e/a/CacheRowInfo;

    .line 71
    const-string v13, "posttime"

    invoke-static {v2, v13}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "videoinfo"

    invoke-static {v2, v14}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 72
    if-nez v15, :cond_109

    if-nez v12, :cond_109

    const/4 v6, 0x1

    goto :goto_10a

    :cond_109
    const/4 v6, 0x0

    :goto_10a
    invoke-static {v2, v6}, Le/e/a/VideoRows191;->posted(Ljava/lang/Object;Z)J

    move-result-wide v17

    .line 74
    const-string v6, "\u6295\u7a3f"

    move-object/from16 v19, v5

    const-string v5, ""

    const-wide/16 v20, 0x0

    if-eqz v15, :cond_1a0

    .line 75
    invoke-static/range {p2 .. p2}, Le/e/a/HistorySupport;->watched(Ljava/lang/Object;)J

    move-result-wide v22

    cmp-long v24, v22, v20

    if-gtz v24, :cond_124

    invoke-static {v13}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v22

    :cond_124
    move-object/from16 v24, v8

    move-object/from16 v25, v9

    move-wide/from16 v8, v22

    .line 76
    const-string v1, "\u8996\u8074"

    invoke-static {v8, v9, v1}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 78
    const/16 v8, 0x8

    if-ne v0, v8, :cond_182

    invoke-static/range {p2 .. p2}, Le/e/a/HistorySupport;->views(Ljava/lang/Object;)J

    move-result-wide v22

    sget-object v0, Le/e/a/VideoRows191;->TIMES:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    cmp-long v9, v22, v20

    if-gtz v9, :cond_159

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-eqz v9, :cond_159

    const/4 v9, 0x1

    :try_start_149
    invoke-virtual {v0, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const-string v9, ","

    invoke-virtual {v0, v9, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v22
    :try_end_157
    .catch Ljava/lang/NumberFormatException; {:try_start_149 .. :try_end_157} :catch_158

    goto :goto_159

    :catch_158
    move-exception v0

    .line 79
    :cond_159
    :goto_159
    cmp-long v0, v22, v20

    if-lez v0, :cond_182

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static/range {v22 .. v23}, Le/e/a/VideoCountRules;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u56de\u8996\u8074"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 80
    :cond_182
    cmp-long v0, v17, v20

    if-gtz v0, :cond_19d

    const/16 v9, 0xa

    invoke-virtual {v14, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_19d

    invoke-virtual {v14, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v9, 0x1

    add-int/2addr v0, v9

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v17

    .line 81
    goto :goto_1b0

    .line 82
    :cond_19d
    move-wide/from16 v8, v17

    goto :goto_1b2

    .line 81
    :cond_1a0
    move-object/from16 v24, v8

    move-object/from16 v25, v9

    const/16 v8, 0x8

    if-eqz v12, :cond_1ab

    const-string v0, "\u767b\u9332"

    goto :goto_1ac

    :cond_1ab
    move-object v0, v6

    :goto_1ac
    invoke-static {v13, v0}, Le/e/a/VideoRows191;->date(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1b0
    move-wide/from16 v8, v17

    .line 82
    :goto_1b2
    if-eqz v10, :cond_1b7

    iget-object v1, v10, Le/e/a/CacheRowInfo;->posted:Ljava/lang/String;

    goto :goto_1c5

    .line 83
    :cond_1b7
    if-nez v15, :cond_1c5

    if-nez v12, :cond_1c5

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1c5

    invoke-static {v8, v9, v6}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 84
    :cond_1c5
    :goto_1c5
    cmp-long v0, v8, v20

    if-lez v0, :cond_1d2

    sget-object v0, Le/e/a/VideoRows191;->POSTED_TIMES:Ljava/util/Map;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v0, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    :cond_1d2
    invoke-static {v3, v1}, Le/e/a/VideoRows191;->label(Landroid/widget/TextView;Ljava/lang/String;)V

    if-nez v10, :cond_1dc

    invoke-static/range {p2 .. p2}, Le/e/a/VideoRows191;->owner(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1de

    :cond_1dc
    iget-object v0, v10, Le/e/a/CacheRowInfo;->owner:Ljava/lang/String;

    :goto_1de
    invoke-static {v7, v0}, Le/e/a/VideoRows191;->label(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 86
    if-nez v15, :cond_1e8

    if-eqz v12, :cond_1e6

    goto :goto_1e8

    :cond_1e6
    move-object v0, v5

    goto :goto_1ec

    :cond_1e8
    :goto_1e8
    invoke-static {v8, v9, v6}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1ec
    move-object/from16 v1, v24

    invoke-static {v1, v0}, Le/e/a/VideoRows191;->label(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 87
    if-nez v10, :cond_1f5

    move-object v0, v5

    goto :goto_1f7

    :cond_1f5
    iget-object v0, v10, Le/e/a/CacheRowInfo;->transfer:Ljava/lang/String;

    :goto_1f7
    move-object/from16 v1, v25

    invoke-static {v1, v0}, Le/e/a/VideoRows191;->label(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 88
    const/16 v1, 0xa

    invoke-virtual {v14, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_206

    move-object v0, v5

    goto :goto_214

    :cond_206
    invoke-virtual {v14, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {v14, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 89
    :goto_214
    if-eqz v15, :cond_232

    invoke-static {v0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v1, v6, v20

    if-lez v1, :cond_232

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_228

    move-object v0, v5

    goto :goto_232

    :cond_228
    const/4 v3, 0x1

    add-int/2addr v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 90
    :cond_232
    :goto_232
    if-nez v10, :cond_235

    move-object v5, v0

    :cond_235
    invoke-static {v11, v5}, Le/e/a/VideoRows191;->label(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 91
    if-nez v10, :cond_245

    const-string v0, "\\n"

    const/4 v1, 0x2

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_248

    :cond_245
    const/4 v1, 0x0

    iget-object v0, v10, Le/e/a/CacheRowInfo;->counts:Ljava/lang/String;

    .line 92
    :goto_248
    invoke-static/range {p2 .. p2}, Le/e/a/Refresh192;->counts(Ljava/lang/Object;)[J

    move-result-object v3

    .line 93
    if-nez v3, :cond_258

    if-nez v10, :cond_255

    invoke-static/range {p2 .. p2}, Le/e/a/HistorySupport;->counts(Ljava/lang/Object;)[J

    move-result-object v2

    goto :goto_257

    :cond_255
    iget-object v2, v10, Le/e/a/CacheRowInfo;->statistics:[J

    :goto_257
    move-object v3, v2

    .line 94
    :cond_258
    if-eqz v3, :cond_26b

    invoke-static {v4, v3}, Le/e/a/VideoCounts;->render(Landroid/widget/TextView;[J)V

    invoke-virtual {v4}, Landroid/widget/TextView;->length()I

    move-result v0

    if-nez v0, :cond_266

    const/16 v6, 0x8

    goto :goto_267

    :cond_266
    move v6, v1

    :goto_267
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_27b

    .line 95
    :cond_26b
    invoke-static {v4, v0}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_277

    const/16 v6, 0x8

    goto :goto_278

    :cond_277
    move v6, v1

    :goto_278
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    :goto_27b
    const v0, 0x7f0800df

    move-object/from16 v1, p0

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 97
    if-eqz v0, :cond_293

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0x111112

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    :cond_293
    const v0, 0x7f0800cd

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 99
    if-eqz v0, :cond_2ca

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_2ca

    .line 100
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x7c

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v4, v3

    const/high16 v5, 0x41100000    # 9.0f

    mul-float/2addr v4, v5

    const/high16 v5, 0x41800000    # 16.0f

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v5, v3, :cond_2c3

    iget v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v5, v4, :cond_2ca

    :cond_2c3
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    :cond_2ca
    invoke-virtual/range {v19 .. v19}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_2ec

    .line 104
    invoke-virtual/range {v19 .. v19}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 105
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    if-eq v2, v1, :cond_2ec

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    move-object/from16 v5, v19

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    :cond_2ec
    return-void

    .line 57
    :cond_2ed
    :goto_2ed
    return-void
.end method

.method static color(Landroid/view/View;Ljava/lang/String;II)I
    .registers 8

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_1a

    const-string p1, "_dark"

    goto :goto_1c

    :cond_1a
    const-string p1, "_light"

    :goto_1c
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "color"

    invoke-virtual {v1, p1, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_39

    if-eqz v0, :cond_37

    goto :goto_41

    :cond_37
    move p2, p3

    goto :goto_41

    :cond_39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    :goto_41
    return p2
.end method

.method static date(JLjava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 24
    invoke-static {p0, p1, p2}, Le/e/a/RowDates194;->format(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static date(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 25
    invoke-static {p0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static extra(Landroid/widget/TextView;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 39
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 40
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 41
    if-nez v1, :cond_24

    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p1, -0x1

    const/4 v2, -0x2

    invoke-direct {p0, p1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    :cond_24
    return-object v1
.end method

.method static varargs first([Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 27
    array-length v0, p0

    const/4 v1, 0x0

    :goto_2
    if-lt v1, v0, :cond_7

    const-string p0, ""

    return-object p0

    :cond_7
    aget-object v2, p0, v1

    if-eqz v2, :cond_1a

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    const-string v3, "null"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    return-object v2

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method static label(Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 3

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_10

    const/16 p1, 0x8

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method static metadata(Landroid/widget/TextView;I)V
    .registers 3

    .line 46
    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setElevation(F)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    return-void
.end method

.method static millis(Ljava/lang/String;)J
    .registers 3

    .line 23
    invoke-static {p0}, Le/e/a/RowDates194;->millis(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static owner(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 29
    :try_start_0
    const-string v0, "y"

    invoke-static {p0, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    goto :goto_10

    :catch_d
    move-exception v0

    .line 30
    :cond_e
    const-string v0, ""

    :goto_10
    invoke-static {p0}, Le/e/a/HistorySupport;->owner(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0, v0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/VideoRows191;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static posted(Ljava/lang/Object;Z)J
    .registers 9

    .line 33
    sget-object v0, Le/e/a/VideoRows191;->POSTED_TIMES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v3, v3, v1

    if-lez v3, :cond_19

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 34
    :cond_19
    invoke-static {p0}, Le/e/a/HistorySupport;->posted(Ljava/lang/Object;)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_22

    return-wide v3

    .line 35
    :cond_22
    const-string v0, "postedAt"

    const-string v3, "first_retrieve"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :goto_2b
    const/4 v4, 0x2

    if-lt v3, v4, :cond_3b

    .line 36
    if-eqz p1, :cond_3a

    const-string p1, "posttime"

    invoke-static {p0, p1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v1

    :cond_3a
    return-wide v1

    .line 35
    :cond_3b
    aget-object v4, v0, v3

    invoke-static {p0, v4}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v6, v4, v1

    if-lez v6, :cond_4a

    return-wide v4

    :cond_4a
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b
.end method

.method static transfer(Landroid/view/View;)Landroid/widget/TextView;
    .registers 2

    .line 47
    const-string v0, "nicoid_row_transfer"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_d

    check-cast p0, Landroid/widget/TextView;

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    return-object p0
.end method

.method static type(Ljava/lang/Object;)I
    .registers 3

    .line 26
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    return p0

    :catch_f
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method
