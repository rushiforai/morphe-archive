.class final Le/e/a/VideoDetails$TreePage;
.super Ljava/lang/Object;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TreePage"
.end annotation


# instance fields
.field active:Le/e/a/NetworkTask;

.field final box:Landroid/widget/LinearLayout;

.field busy:Z

.field final collapse:Landroid/widget/Button;

.field collapsed:Z

.field final id:Ljava/lang/String;

.field initialRows:I

.field final key:Ljava/lang/String;

.field final more:Landroid/widget/Button;

.field offset:I

.field final rows:Landroid/widget/LinearLayout;

.field final title:Landroid/widget/TextView;

.field total:I


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/VideoDetails$TreePage;->id:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/VideoDetails$TreePage;->key:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string v0, "parents"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_20

    const-string p3, "Parent works"

    const-string v0, "\u7236\u4f5c\u54c1"

    const-string v1, "\u89aa\u4f5c\u54c1"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, p3, v0}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_28

    :cond_20
    const-string p3, "Child works"

    const-string v0, "\u5b50\u4f5c\u54c1"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, p3, v0}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :goto_28
    const/16 v0, 0xe

    # invokes: Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    invoke-static {p2, p3, v0}, Le/e/a/VideoDetails;->access$1(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$TreePage;->title:Landroid/widget/TextView;

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/VideoDetails$TreePage;->title:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "Loading\u2026"

    const-string v0, "\u8f09\u5165\u4e2d\u2026"

    const-string v1, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, p3, v0}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p2, p3}, Le/e/a/VideoDetails;->access$2(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    new-instance p3, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda3;

    invoke-direct {p3, p0}, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda3;-><init>(Le/e/a/VideoDetails$TreePage;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "Show less"

    const-string p3, "\u6536\u5408"

    const-string v0, "\u6298\u308a\u305f\u305f\u3080"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, p2, p3}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p2}, Le/e/a/VideoDetails;->access$2(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    new-instance p2, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda4;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda4;-><init>(Le/e/a/VideoDetails$TreePage;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->box:Landroid/widget/LinearLayout;

    new-instance p2, Le/e/a/VideoDetails$TreePage$1;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$TreePage$1;-><init>(Le/e/a/VideoDetails$TreePage;)V

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method buttons()V
    .registers 7

    .line 21
    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$TreePage;->collapsed:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-nez v1, :cond_13

    iget v1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    iget v4, p0, Le/e/a/VideoDetails$TreePage;->total:I

    if-ge v1, v4, :cond_10

    goto :goto_13

    :cond_10
    const/16 v1, 0x8

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v1, 0x0

    :goto_14
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    const-string v1, "View more"

    const-string v4, "\u67e5\u770b\u66f4\u591a"

    const-string v5, "\u3082\u3063\u3068\u898b\u308b"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5, v1, v4}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$TreePage;->collapsed:Z

    if-nez v1, :cond_40

    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    iget v4, p0, Le/e/a/VideoDetails$TreePage;->initialRows:I

    if-le v1, v4, :cond_40

    const/4 v2, 0x0

    :cond_40
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-VideoDetails$TreePage(Landroid/view/View;)V
    .registers 4

    .line 20
    iget-boolean p1, p0, Le/e/a/VideoDetails$TreePage;->collapsed:Z

    if-eqz p1, :cond_21

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$TreePage;->collapsed:Z

    iget v0, p0, Le/e/a/VideoDetails$TreePage;->initialRows:I

    :goto_9
    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_15

    invoke-virtual {p0}, Le/e/a/VideoDetails$TreePage;->buttons()V

    goto :goto_24

    :cond_15
    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_21
    invoke-virtual {p0}, Le/e/a/VideoDetails$TreePage;->load()V

    :goto_24
    return-void
.end method

.method synthetic lambda$1$e-e-a-VideoDetails$TreePage(Landroid/view/View;)V
    .registers 4

    .line 20
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/VideoDetails$TreePage;->collapsed:Z

    iget p1, p0, Le/e/a/VideoDetails$TreePage;->initialRows:I

    :goto_5
    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt p1, v0, :cond_11

    invoke-virtual {p0}, Le/e/a/VideoDetails$TreePage;->buttons()V

    return-void

    :cond_11
    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_5
.end method

.method synthetic lambda$2$e-e-a-VideoDetails$TreePage(ILe/e/a/NetworkTask;)V
    .registers 6

    .line 22
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://public-api.commons.nicovideo.jp/v1/tree/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/relatives/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?_limit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "&_offset="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "&with_meta=1"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "GET"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1, p2}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_4a

    const/4 p1, 0x0

    goto :goto_50

    :cond_4a
    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    :goto_50
    if-eqz p1, :cond_6b

    const-string v0, "contents"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const-string v1, "total"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p1

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$4()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p2, p1, v0}, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda1;-><init>(Le/e/a/VideoDetails$TreePage;Le/e/a/NetworkTask;ILorg/json/JSONArray;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_7e

    :cond_6b
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_71} :catch_71

    :catch_71
    move-exception p1

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$4()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2}, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda2;-><init>(Le/e/a/VideoDetails$TreePage;Le/e/a/NetworkTask;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_7e
    return-void
.end method

.method synthetic lambda$3$e-e-a-VideoDetails$TreePage(Le/e/a/NetworkTask;ILorg/json/JSONArray;)V
    .registers 8

    .line 22
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    iput p2, p0, Le/e/a/VideoDetails$TreePage;->total:I

    iget-object p2, p0, Le/e/a/VideoDetails$TreePage;->title:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->key:Ljava/lang/String;

    const-string v2, "parents"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    const-string v1, "Parent works"

    const-string v2, "\u7236\u4f5c\u54c1"

    const-string v3, "\u89aa\u4f5c\u54c1"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2d

    :cond_25
    const-string v1, "Child works"

    const-string v2, "\u5b50\u4f5c\u54c1"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v1, v2}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_2d
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Le/e/a/VideoDetails$TreePage;->total:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez p3, :cond_51

    const/4 p2, 0x0

    goto :goto_55

    :cond_51
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result p2

    :goto_55
    if-lt p1, p2, :cond_72

    iget p1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    if-nez p1, :cond_63

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    iput p1, p0, Le/e/a/VideoDetails$TreePage;->initialRows:I

    :cond_63
    iget p1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    add-int/2addr p1, p2

    iput p1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    if-nez p2, :cond_6e

    iget p1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    iput p1, p0, Le/e/a/VideoDetails$TreePage;->total:I

    :cond_6e
    invoke-virtual {p0}, Le/e/a/VideoDetails$TreePage;->buttons()V

    return-void

    :cond_72
    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_8d

    const-string v1, "visibleStatus"

    const-string v2, "visible"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8d

    iget-object v1, p0, Le/e/a/VideoDetails$TreePage;->rows:Landroid/widget/LinearLayout;

    const-string v2, ""

    # invokes: Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    invoke-static {v1, v0, v2}, Le/e/a/VideoDetails;->access$5(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    :cond_8d
    add-int/lit8 p1, p1, 0x1

    goto :goto_55
.end method

.method synthetic lambda$4$e-e-a-VideoDetails$TreePage(Le/e/a/NetworkTask;)V
    .registers 5

    .line 22
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    const-string v0, "Retry"

    const-string v1, "\u91cd\u8a66"

    const-string v2, "\u518d\u8a66\u884c"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v0, v1}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method load()V
    .registers 5

    .line 22
    iget-boolean v0, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/VideoDetails$TreePage;->busy:Z

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->more:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$TreePage;->collapse:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/VideoDetails$TreePage;->active:Le/e/a/NetworkTask;

    iget v1, p0, Le/e/a/VideoDetails$TreePage;->offset:I

    if-nez v1, :cond_20

    const/4 v1, 0x3

    goto :goto_22

    :cond_20
    const/16 v1, 0x14

    :goto_22
    # getter for: Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/VideoDetails;->access$3()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v1, v0}, Le/e/a/VideoDetails$TreePage$$ExternalSyntheticLambda0;-><init>(Le/e/a/VideoDetails$TreePage;ILe/e/a/NetworkTask;)V

    invoke-virtual {v0, v2, v3}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method
