.class Le/e/a/Review181$2;
.super Ljava/lang/Object;
.source "Review181.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Review181;->shortOverlay(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field tries:I

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$name:Landroid/widget/TextView;

.field private final synthetic val$overlay:Landroid/widget/FrameLayout;

.field private final synthetic val$owner:Landroid/widget/LinearLayout;

.field private final synthetic val$title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 119
    iput-object p1, p0, Le/e/a/Review181$2;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Review181$2;->val$overlay:Landroid/widget/FrameLayout;

    iput-object p3, p0, Le/e/a/Review181$2;->val$name:Landroid/widget/TextView;

    iput-object p4, p0, Le/e/a/Review181$2;->val$title:Landroid/widget/TextView;

    iput-object p5, p0, Le/e/a/Review181$2;->val$owner:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .line 119
    iget-object v0, p0, Le/e/a/Review181$2;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_ad

    iget-object v0, p0, Le/e/a/Review181$2;->val$overlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_12

    goto/16 :goto_ad

    :cond_12
    invoke-static {}, Le/e/a/Review181;->latest()Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_1a

    const/4 v1, 0x0

    goto :goto_20

    :cond_1a
    const-string v1, "video"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    :goto_20
    const/4 v2, 0x1

    :try_start_21
    iget-object v3, p0, Le/e/a/Review181$2;->val$a:Landroid/app/Activity;

    const-string v4, "v"

    invoke-static {v3, v4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "b0"

    invoke-static {v3, v4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v1, :cond_9d

    invoke-static {v0, v3}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9d

    const-string v3, "owner"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_4d

    const-string v3, "channel"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    :cond_4d
    iget-object v4, p0, Le/e/a/Review181$2;->val$name:Landroid/widget/TextView;

    if-nez v3, :cond_54

    const-string v3, ""

    goto :goto_60

    :cond_54
    const-string v5, "nickname"

    const-string v6, "name"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_60
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p0, Le/e/a/Review181$2;->val$title:Landroid/widget/TextView;

    const-string v4, "title"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/Review181$2;->val$overlay:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/Review181$2;->val$a:Landroid/app/Activity;

    # invokes: Le/e/a/Review181;->bindLike(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V
    invoke-static {v1, v0, v3}, Le/e/a/Review181;->access$1(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V

    iget-object v1, p0, Le/e/a/Review181$2;->val$owner:Landroid/widget/LinearLayout;

    invoke-static {v1, v0}, Le/e/a/VideoDetails;->bindOwner(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    const/4 v0, 0x1

    :goto_7b
    iget-object v1, p0, Le/e/a/Review181$2;->val$owner:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_84

    return-void

    :cond_84
    iget-object v1, p0, Le/e/a/Review181$2;->val$owner:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v3, 0x3f266666    # 0.65f

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    instance-of v3, v1, Le/e/a/VideoDetails$FollowIcon;

    if-eqz v3, :cond_99

    check-cast v1, Le/e/a/VideoDetails$FollowIcon;

    invoke-virtual {v1}, Le/e/a/VideoDetails$FollowIcon;->shortStyle()V
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_99} :catch_9c

    :cond_99
    add-int/lit8 v0, v0, 0x1

    goto :goto_7b

    :catch_9c
    move-exception v0

    :cond_9d
    iget v0, p0, Le/e/a/Review181$2;->tries:I

    add-int/2addr v0, v2

    iput v0, p0, Le/e/a/Review181$2;->tries:I

    const/16 v1, 0x3c

    if-ge v0, v1, :cond_ad

    iget-object v0, p0, Le/e/a/Review181$2;->val$overlay:Landroid/widget/FrameLayout;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_ad
    :goto_ad
    return-void
.end method
