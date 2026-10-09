.class public final Le/e/a/CommentListExtras;
.super Ljava/lang/Object;
.source "CommentListExtras.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentListExtras$Meta;,
        Le/e/a/CommentListExtras$Follow;
    }
.end annotation


# static fields
.field static final follows:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/CommentListExtras$Follow;",
            ">;>;"
        }
    .end annotation
.end field

.field static final meta:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentListExtras$Meta;",
            ">;"
        }
    .end annotation
.end field

.field static final pending:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/util/IdentityHashMap<",
            "Lorg/json/JSONObject;",
            "Le/e/a/CommentListExtras$Meta;",
            ">;>;"
        }
    .end annotation
.end field

.field static final reactionId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    .line 6
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentListExtras;->pending:Ljava/lang/ThreadLocal;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentListExtras;->follows:Ljava/util/WeakHashMap;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    sput v0, Le/e/a/CommentListExtras;->reactionId:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 15

    .line 9
    :try_start_0
    const-string v0, "modernWatch"

    invoke-static {p1, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "comment"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_18

    const/4 p1, 0x0

    goto :goto_1e

    :cond_18
    const-string v1, "nvComment"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_ba

    :goto_1e
    const-string v1, "id"

    const-string v2, ""

    if-nez v0, :cond_26

    move-object v0, v2

    goto :goto_2a

    :cond_26
    :try_start_26
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2a
    if-nez p1, :cond_2e

    move-object p1, v2

    goto :goto_34

    :cond_2e
    const-string v3, "server"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_34
    new-instance v3, Ljava/util/IdentityHashMap;

    invoke-direct {v3}, Ljava/util/IdentityHashMap;-><init>()V

    const-string v4, "data"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v4, "threads"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_47
    if-eqz p0, :cond_b4

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_b4

    invoke-virtual {p0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "comments"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    const/4 v8, 0x0

    :goto_5a
    if-eqz v7, :cond_b1

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_b1

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    new-instance v10, Le/e/a/CommentListExtras$Meta;

    invoke-direct {v10}, Le/e/a/CommentListExtras$Meta;-><init>()V

    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Le/e/a/CommentListExtras$Meta;->thread:Ljava/lang/String;

    const-string v11, "fork"

    const-string v12, "main"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Le/e/a/CommentListExtras$Meta;->fork:Ljava/lang/String;

    const-string v11, "body"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Le/e/a/CommentListExtras$Meta;->body:Ljava/lang/String;

    iput-object v0, v10, Le/e/a/CommentListExtras$Meta;->video:Ljava/lang/String;

    iput-object p1, v10, Le/e/a/CommentListExtras$Meta;->server:Ljava/lang/String;

    const-string v11, "no"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v10, Le/e/a/CommentListExtras$Meta;->no:I

    const-string v11, "nicoruCount"

    invoke-virtual {v9, v11, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    iput v11, v10, Le/e/a/CommentListExtras$Meta;->count:I

    const-string v11, "nicoruId"

    invoke-virtual {v9, v11, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    const-string v11, "null"

    iget-object v12, v10, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ab

    iput-object v2, v10, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    :cond_ab
    invoke-virtual {v3, v9, v10}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    goto :goto_5a

    :cond_b1
    add-int/lit8 v5, v5, 0x1

    goto :goto_47

    :cond_b4
    sget-object p0, Le/e/a/CommentListExtras;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {p0, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_b9} :catch_ba

    goto :goto_c3

    :catch_ba
    move-exception p0

    sget-object p1, Le/e/a/CommentListExtras;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->remove()V

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_c3
    return-void
.end method

.method public static capture(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 3

    .line 10
    sget-object v0, Le/e/a/CommentListExtras;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/IdentityHashMap;

    if-eqz v0, :cond_17

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/CommentListExtras$Meta;

    if-eqz p1, :cond_17

    sget-object v0, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    return-void
.end method

.method static count(Ljava/lang/Object;)I
    .registers 2

    .line 30
    sget-object v0, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CommentListExtras$Meta;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    goto :goto_e

    :cond_c
    iget p0, p0, Le/e/a/CommentListExtras$Meta;->count:I

    :goto_e
    return p0
.end method

.method public static end()V
    .registers 1

    .line 11
    sget-object v0, Le/e/a/CommentListExtras;->pending:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public static expandComment(Landroid/view/View;)V
    .registers 5

    const v0, 0x7f0801b4

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_4e

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_41

    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    if-eqz v0, :cond_4e

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v2

    if-gtz v2, :cond_41

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-lez v0, :cond_4e

    :cond_41
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    const v0, 0x7fffffff

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_4e
    return-void
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 13

    .line 18
    :try_start_0
    const-string v0, "f0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    const-string v1, "Y"

    invoke-static {p0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v0, :cond_175

    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-nez v2, :cond_18

    goto/16 :goto_175

    .line 19
    :cond_18
    sget-object v2, Le/e/a/CommentListExtras;->follows:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_24

    const/4 v2, 0x0

    goto :goto_2a

    :cond_24
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CommentListExtras$Follow;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_176

    .line 20
    :goto_2a
    const-string v3, "nicoid_comment_controls"

    if-eqz v2, :cond_3f

    :try_start_2e
    iget-boolean v4, v2, Le/e/a/CommentListExtras$Follow;->active:Z

    if-eqz v4, :cond_3f

    invoke-static {v0, v3}, Le/e/a/Followup173;->findControls(Landroid/widget/ListView;Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_3f

    invoke-virtual {v2}, Le/e/a/CommentListExtras$Follow;->sort()V

    invoke-virtual {v2}, Le/e/a/CommentListExtras$Follow;->clicks()V

    return-void

    .line 21
    :cond_3f
    if-eqz v2, :cond_44

    invoke-virtual {v2}, Le/e/a/CommentListExtras$Follow;->stop()V

    :cond_44
    invoke-static {v0, v3}, Le/e/a/Followup173;->findControls(Landroid/widget/ListView;Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_53

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    :cond_53
    new-instance v2, Le/e/a/CommentListExtras$Follow;

    invoke-direct {v2, p0, v0}, Le/e/a/CommentListExtras$Follow;-><init>(Ljava/lang/Object;Landroid/widget/ListView;)V

    sget-object p0, Le/e/a/CommentListExtras;->follows:Ljava/util/WeakHashMap;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {p0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v4, 0x10

    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 23
    new-instance v4, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    const-string v5, "\u518d\u751f\u4f4d\u7f6e\u306b\u81ea\u52d5\u8ffd\u5f93"

    invoke-static {v5}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setTextSize(F)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setSingleLine(Z)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    iget-object v6, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    invoke-static {v6}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v6

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    invoke-virtual {v4, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    new-instance v6, Le/e/a/CommentListExtras$$ExternalSyntheticLambda4;

    invoke-direct {v6, v2}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda4;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, -0x2

    invoke-direct {v6, v3, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    new-instance v4, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object v4, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const-string v6, "\u518d\u751f\u6642\u9593\u9806"

    invoke-static {v6}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v3

    const-string v6, "\u30cb\u30b3\u308b\u6570\u9806"

    invoke-static {v6}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    new-instance v6, Le/e/a/CommentListExtras$1;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x1090008

    invoke-direct {v6, v9, v10, v4}, Le/e/a/CommentListExtras$1;-><init>(Landroid/content/Context;I[Ljava/lang/String;)V

    const v4, 0x1090009

    invoke-virtual {v6, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    const-string v4, "ThemeChoice"

    const-string v6, "spinner"

    new-array v9, v5, [Ljava/lang/Class;

    const-class v10, Landroid/widget/Spinner;

    aput-object v10, v9, v3

    new-array v10, v5, [Ljava/lang/Object;

    iget-object v11, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    aput-object v11, v10, v3

    invoke-static {v4, v6, v9, v10}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    invoke-virtual {v4, v3}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    new-instance v6, Le/e/a/CommentListExtras$2;

    invoke-direct {v6, v2}, Le/e/a/CommentListExtras$2;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object v4, v2, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    move-object v3, v1

    check-cast v3, Landroid/widget/LinearLayout;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v3, p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-static {v0, p0}, Le/e/a/Followup173;->pinControls(Landroid/widget/ListView;Landroid/view/View;)V

    .line 26
    new-instance p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda5;

    invoke-direct {p0, v2}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda5;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 27
    new-instance p0, Le/e/a/CommentListExtras$3;

    invoke-direct {p0, v2}, Le/e/a/CommentListExtras$3;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 28
    invoke-virtual {v2}, Le/e/a/CommentListExtras$Follow;->sort()V

    invoke-virtual {v2}, Le/e/a/CommentListExtras$Follow;->clicks()V

    new-instance p0, Le/e/a/CommentListExtras$4;

    invoke-direct {p0, v2, v0}, Le/e/a/CommentListExtras$4;-><init>(Le/e/a/CommentListExtras$Follow;Landroid/widget/ListView;)V

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_174

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
    :try_end_174
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_174} :catch_176

    .line 29
    :cond_174
    goto :goto_17a

    .line 18
    :cond_175
    :goto_175
    return-void

    .line 29
    :catch_176
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_17a
    return-void
.end method

.method static synthetic lambda$install$4(Le/e/a/CommentListExtras$Follow;Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 23
    if-eqz p2, :cond_11

    iget-boolean p1, p0, Le/e/a/CommentListExtras$Follow;->byNicoru:Z

    if-eqz p1, :cond_11

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/CommentListExtras$Follow;->byNicoru:Z

    iget-object p2, p0, Le/e/a/CommentListExtras$Follow;->sortControl:Landroid/widget/Spinner;

    invoke-virtual {p2, p1}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->sort()V

    :cond_11
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Le/e/a/CommentListExtras$Follow;->last:J

    const/4 p1, -0x1

    iput p1, p0, Le/e/a/CommentListExtras$Follow;->lastIndex:I

    return-void
.end method

.method static synthetic lambda$install$5(Le/e/a/CommentListExtras$Follow;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 11

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1c

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p0, Le/e/a/CommentListExtras$Follow;->touchY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p0, Le/e/a/CommentListExtras$Follow;->touchX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Le/e/a/CommentListExtras$Follow;->touchDown:J

    iput-boolean v1, p0, Le/e/a/CommentListExtras$Follow;->touchMoved:Z

    return v1

    :cond_1c
    const/4 v2, 0x3

    if-ne v0, v2, :cond_26

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    const/4 v2, 0x1

    iput-boolean v2, p0, Le/e/a/CommentListExtras$Follow;->touchMoved:Z

    return v1

    :cond_26
    const/4 v2, 0x2

    if-eq v0, v2, :cond_2c

    const/4 v2, 0x1

    if-ne v0, v2, :cond_a7

    :cond_2c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iget v3, p0, Le/e/a/CommentListExtras$Follow;->touchY:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Le/e/a/CommentListExtras$Follow;->touchX:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5d

    const/4 v2, 0x1

    iput-boolean v2, p0, Le/e/a/CommentListExtras$Follow;->touchMoved:Z

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    :cond_5d
    const/4 v2, 0x1

    if-ne v0, v2, :cond_a7

    iget-boolean v2, p0, Le/e/a/CommentListExtras$Follow;->touchMoved:Z

    if-nez v2, :cond_a7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iget-wide v4, p0, Le/e/a/CommentListExtras$Follow;->touchDown:J

    sub-long/2addr v2, v4

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v4

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_a7

    iget-object v3, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v2, v4}, Landroid/widget/ListView;->pointToPosition(II)I

    move-result v5

    if-ltz v5, :cond_a7

    invoke-virtual {v3}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    sub-int v2, v5, v2

    invoke-virtual {v3, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_a7

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    move-object v2, p0

    const-wide/16 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Le/e/a/CommentListExtras$Follow;->lambda$clicks$1$e-e-a-CommentListExtras$Follow(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    const/4 v1, 0x1

    :cond_a7
    return v1
.end method

.method static synthetic lambda$nicoru$1(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;ILandroid/widget/Button;Ljava/lang/Object;)V
    .registers 5

    .line 14
    iput-object p1, p0, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    iput p2, p0, Le/e/a/CommentListExtras$Meta;->count:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/CommentListExtras$Meta;->busy:Z

    invoke-virtual {p3}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p4, :cond_10

    invoke-static {p3, p0}, Le/e/a/CommentListExtras;->render(Landroid/widget/Button;Le/e/a/CommentListExtras$Meta;)V

    :cond_10
    return-void
.end method

.method static synthetic lambda$nicoru$2(Le/e/a/CommentListExtras$Meta;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 4

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentListExtras$Meta;->busy:Z

    invoke-virtual {p1}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_c

    invoke-static {p1, p0}, Le/e/a/CommentListExtras;->render(Landroid/widget/Button;Le/e/a/CommentListExtras$Meta;)V

    :cond_c
    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u30cb\u30b3\u308b\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$nicoru$3(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;Ljava/net/URI;Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 11

    .line 14
    const-string v0, "nicoruKey"

    const-string v1, "data"

    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://nvapi.nicovideo.jp/v1/comment/keys/nicoru?threadId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le/e/a/CommentListExtras$Meta;->thread:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, p1}, Le/e/a/CommentListExtras;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "content"

    iget-object v5, p0, Le/e/a/CommentListExtras$Meta;->body:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "fork"

    iget-object v5, p0, Le/e/a/CommentListExtras$Meta;->fork:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "no"

    iget v5, p0, Le/e/a/CommentListExtras$Meta;->no:I

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "videoId"

    iget-object v0, p0, Le/e/a/CommentListExtras$Meta;->video:Ljava/lang/String;

    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "/v1/threads/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/CommentListExtras$Meta;->thread:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "/nicorus"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v3}, Le/e/a/CommentListExtras;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "nicoruId"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string p2, "nicoruCount"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    sget-object p1, Le/e/a/VideoExtras;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;

    move-object v0, p2

    move-object v1, p0

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda1;-><init>(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;ILandroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9b} :catch_9c

    goto :goto_a7

    :catch_9c
    move-exception p1

    sget-object p1, Le/e/a/VideoExtras;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0, p3, p4}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda2;-><init>(Le/e/a/CommentListExtras$Meta;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_a7
    return-void
.end method

.method static synthetic lambda$row$0(Landroid/widget/Button;Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 12
    invoke-static {p0, p1}, Le/e/a/CommentListExtras;->nicoru(Landroid/widget/Button;Ljava/lang/Object;)V

    return-void
.end method

.method static nicoru(Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 11

    .line 14
    sget-object v0, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Le/e/a/CommentListExtras$Meta;

    if-eqz v2, :cond_9d

    iget-boolean v0, v2, Le/e/a/CommentListExtras$Meta;->busy:Z

    if-nez v0, :cond_9d

    iget-object v0, v2, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0, p1}, Le/e/a/FeedbackDev10;->undoNicoru(Landroid/widget/Button;Ljava/lang/Object;)V

    goto/16 :goto_9d

    :cond_1c
    const/4 v0, 0x1

    :try_start_1d
    invoke-static {}, Le/e/a/VideoExtras;->cookie()Ljava/lang/String;

    move-result-object v3

    const-string v1, "user_session="

    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3b

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v1, "\u30cb\u30b3\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {v1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_3b
    new-instance v4, Ljava/net/URI;

    iget-object v1, v2, Le/e/a/CommentListExtras$Meta;->server:Ljava/lang/String;

    invoke-direct {v4, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v1, "https"

    invoke-virtual {v4}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_80

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v5, "nvcomment.nicovideo.jp"

    const/4 v6, 0x0

    aput-object v5, v1, v6

    const-string v5, "public.nvcomment.nicovideo.jp"

    aput-object v5, v1, v0

    const-string v5, "nv-comment.nicovideo.jp"

    const/4 v6, 0x2

    aput-object v5, v1, v6

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v4}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_80

    iput-boolean v0, v2, Le/e/a/CommentListExtras$Meta;->busy:Z

    invoke-static {p0, v2}, Le/e/a/CommentListExtras;->render(Landroid/widget/Button;Le/e/a/CommentListExtras$Meta;)V

    sget-object v7, Le/e/a/VideoExtras;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Le/e/a/CommentListExtras$$ExternalSyntheticLambda0;

    move-object v1, v8

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentListExtras$Meta;Ljava/lang/String;Ljava/net/URI;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_9d

    :cond_80
    new-instance p1, Ljava/io/IOException;

    const-string v1, "Invalid comment server"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_88} :catch_88

    :catch_88
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u30cb\u30b3\u308b\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_9d
    :goto_9d
    return-void
.end method

.method static render(Landroid/widget/Button;Le/e/a/CommentListExtras$Meta;)V
    .registers 5

    .line 13
    iget v0, p1, Le/e/a/CommentListExtras$Meta;->count:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/ReactionIcons;->neutral(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v0, Le/e/a/ReactionIcons$Face;

    iget-object v1, p1, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-direct {v0, p0, v1}, Le/e/a/ReactionIcons$Face;-><init>(Landroid/view/View;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    iget-boolean v0, p1, Le/e/a/CommentListExtras$Meta;->busy:Z

    if-nez v0, :cond_3c

    const-string v0, "main"

    iget-object v1, p1, Le/e/a/CommentListExtras$Meta;->fork:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    goto :goto_3d

    :cond_3c
    const/4 v2, 0x0

    :goto_3d
    invoke-virtual {p0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Le/e/a/CommentListExtras$Meta;->nicoruId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_50

    const-string v1, "\u30cb\u30b3\u308b"

    goto :goto_52

    :cond_50
    const-string v1, "\u30cb\u30b3\u308b\u6e08\u307f"

    :goto_52
    invoke-static {v1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget p1, p1, Le/e/a/CommentListExtras$Meta;->count:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Le/e/a/CommentListExtras;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    const-string v0, "meta"

    const-string v1, "https://www.nicovideo.jp"

    const-string v2, "application/json"

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    const/16 v3, 0x1f40

    :try_start_13
    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v3, 0x2710

    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {p0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Accept"

    invoke-virtual {p0, v4, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "X-Frontend-Id"

    const-string v5, "6"

    invoke-virtual {p0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "X-Frontend-Version"

    const-string v5, "0"

    invoke-virtual {p0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "X-Niconico-Language"

    const-string v5, "ja-jp"

    invoke-virtual {p0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Origin"

    invoke-virtual {p0, v4, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "X-Request-With"

    invoke-virtual {p0, v4, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_51

    const-string v1, "Cookie"

    invoke-virtual {p0, v1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catchall {:try_start_13 .. :try_end_51} :catchall_110

    :cond_51
    const-string p2, "UTF-8"

    if-eqz p1, :cond_80

    :try_start_55
    const-string v1, "POST"

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v1, "Content-Type"

    invoke-virtual {p0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_67
    .catchall {:try_start_55 .. :try_end_67} :catchall_110

    :try_start_67
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_6e
    .catchall {:try_start_67 .. :try_end_6e} :catchall_74

    if-eqz v1, :cond_80

    :try_start_70
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_73
    .catchall {:try_start_70 .. :try_end_73} :catchall_110

    goto :goto_80

    :catchall_74
    move-exception p1

    if-eqz v1, :cond_7f

    :try_start_77
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_7a
    .catchall {:try_start_77 .. :try_end_7a} :catchall_7b

    goto :goto_7f

    :catchall_7b
    move-exception p2

    :try_start_7c
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7f
    :goto_7f
    throw p1

    :cond_80
    :goto_80
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v1, 0xc8

    if-lt p1, v1, :cond_f7

    const/16 v1, 0x12c

    if-ge p1, v1, :cond_f7

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v2, v4, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_9a
    .catchall {:try_start_7c .. :try_end_9a} :catchall_110

    const/16 p2, 0x1000

    :try_start_9c
    new-array p2, p2, [C

    :goto_9e
    invoke-virtual {v2, p2}, Ljava/io/Reader;->read([C)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_be

    invoke-virtual {p1, p2, v3, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eqz p3, :cond_b1

    const/high16 v5, 0x80000

    goto :goto_b3

    :cond_b1
    const/high16 v5, 0x200000

    :goto_b3
    if-gt v4, v5, :cond_b6

    goto :goto_9e

    :cond_b6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Oversized response"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_be
    .catchall {:try_start_9c .. :try_end_be} :catchall_ed

    :cond_be
    :try_start_be
    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    new-instance p2, Lorg/json/JSONObject;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    if-eqz p3, :cond_e9

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_e1

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p3, "status"

    const/16 v0, 0x1f4

    invoke-virtual {p1, p3, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ge p1, v1, :cond_e1

    goto :goto_e9

    :cond_e1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Reaction failed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_e8
    .catchall {:try_start_be .. :try_end_e8} :catchall_110

    goto :goto_7f

    :cond_e9
    :goto_e9
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p2

    :catchall_ed
    move-exception p1

    :try_start_ee
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_f1
    .catchall {:try_start_ee .. :try_end_f1} :catchall_f2

    goto :goto_7f

    :catchall_f2
    move-exception p2

    :try_start_f3
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7f

    :cond_f7
    new-instance p2, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Reaction HTTP "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_110
    .catchall {:try_start_f3 .. :try_end_110} :catchall_110

    :catchall_110
    move-exception p1

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1
.end method

.method public static row(Landroid/view/View;Ljava/lang/Object;)V
    .registers 9

    .line 12
    const v0, 0x7f0801b4

    :try_start_3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_b1

    invoke-static {p0}, Le/e/a/Followup173;->centerComment(Landroid/widget/TextView;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout;

    if-nez v0, :cond_18

    goto/16 :goto_b1

    :cond_18
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    sget v1, Le/e/a/CommentListExtras;->reactionId:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const/4 v2, 0x0

    if-nez v1, :cond_90

    new-instance v1, Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    sget v3, Le/e/a/CommentListExtras;->reactionId:I

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setId(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setFocusable(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setFocusableInTouchMode(Z)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setSingleLine(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/4 v3, 0x4

    invoke-virtual {v1, v3, v2, v3, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    const/16 v5, 0x44

    invoke-static {v4, v5}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0x24

    invoke-static {v5, v6}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0xb

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v4, 0xf

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Le/e/a/CommentListExtras;->reactionId:I

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_90
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    sget-object p0, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CommentListExtras$Meta;

    if-nez p0, :cond_9f

    const/16 v2, 0x8

    :cond_9f
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    if-nez p0, :cond_a5

    return-void

    :cond_a5
    invoke-static {v1, p0}, Le/e/a/CommentListExtras;->render(Landroid/widget/Button;Le/e/a/CommentListExtras$Meta;)V

    new-instance p0, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;

    invoke-direct {p0, v1, p1}, Le/e/a/CommentListExtras$$ExternalSyntheticLambda3;-><init>(Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_b0} :catch_b2

    goto :goto_b6

    :cond_b1
    :goto_b1
    return-void

    :catch_b2
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_b6
    return-void
.end method

.method static time(Ljava/lang/Object;)J
    .registers 5

    .line 31
    :try_start_0
    const-string v0, "d"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_11

    const-wide/16 v2, 0xa

    mul-long v0, v0, v2

    return-wide v0

    :catch_11
    move-exception p0

    const-wide v0, 0x7fffffffffffffffL

    return-wide v0
.end method
