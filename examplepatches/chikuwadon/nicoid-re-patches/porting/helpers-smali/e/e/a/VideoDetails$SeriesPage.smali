.class final Le/e/a/VideoDetails$SeriesPage;
.super Ljava/lang/Object;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SeriesPage"
.end annotation


# instance fields
.field active:Le/e/a/NetworkTask;

.field final box:Landroid/widget/LinearLayout;

.field busy:Z

.field final collapse:Landroid/widget/Button;

.field collapsed:Z

.field final id:Ljava/lang/String;

.field loaded:I

.field final more:Landroid/widget/Button;

.field page:I

.field final rows:Landroid/widget/LinearLayout;

.field total:I


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 6

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x1

    iput v0, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    const v0, 0x7fffffff

    iput v0, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    .line 25
    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string v0, "View more"

    const-string v1, "\u67e5\u770b\u66f4\u591a"

    const-string v2, "\u3082\u3063\u3068\u898b\u308b"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v0, v1}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p2, v0}, Le/e/a/VideoDetails;->access$2(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "Show less"

    const-string v0, "\u6536\u5408"

    const-string v1, "\u6298\u308a\u305f\u305f\u3080"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, p2, v0}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p2}, Le/e/a/VideoDetails;->access$2(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda3;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda4;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda4;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$1;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$1;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method buttons()V
    .registers 7

    .line 26
    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-nez v1, :cond_13

    iget v1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iget v4, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

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

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const-string v1, "View more"

    const-string v4, "\u67e5\u770b\u66f4\u591a"

    const-string v5, "\u3082\u3063\u3068\u898b\u308b"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5, v1, v4}, Le/e/a/VideoDetails;->access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    if-nez v1, :cond_3e

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_3e

    const/4 v2, 0x0

    :cond_3e
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-VideoDetails$SeriesPage(Landroid/view/View;)V
    .registers 3

    .line 25
    iget-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    goto :goto_13

    :cond_10
    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->load()V

    :goto_13
    return-void
.end method

.method synthetic lambda$1$e-e-a-VideoDetails$SeriesPage(Landroid/view/View;)V
    .registers 3

    .line 25
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    return-void
.end method

.method synthetic lambda$2$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;)V
    .registers 6

    .line 27
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/playlist/series/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&pageSize=20"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_4b

    const-string v1, "items"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v2, "totalCount"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$4()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, v0, v1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;ILorg/json/JSONArray;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5e

    :cond_4b
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_51} :catch_51

    :catch_51
    move-exception v0

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$4()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda1;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_5e
    return-void
.end method

.method synthetic lambda$3$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;ILorg/json/JSONArray;)V
    .registers 7

    .line 27
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iput p2, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    if-nez p3, :cond_10

    const/4 p2, 0x0

    goto :goto_14

    :cond_10
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result p2

    :goto_14
    if-lt p1, p2, :cond_2b

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    add-int/2addr p1, p2

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    if-nez p2, :cond_27

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    :cond_27
    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    return-void

    :cond_2b
    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_33

    const/4 v0, 0x0

    goto :goto_39

    :cond_33
    const-string v1, "content"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_39
    if-eqz v0, :cond_42

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    const-string v2, ""

    # invokes: Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    invoke-static {v1, v0, v2}, Le/e/a/VideoDetails;->access$5(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    :cond_42
    add-int/lit8 p1, p1, 0x1

    goto :goto_14
.end method

.method synthetic lambda$4$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;)V
    .registers 5

    .line 27
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

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
    .registers 4

    .line 27
    iget-boolean v0, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    # getter for: Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/VideoDetails;->access$3()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, v0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method
