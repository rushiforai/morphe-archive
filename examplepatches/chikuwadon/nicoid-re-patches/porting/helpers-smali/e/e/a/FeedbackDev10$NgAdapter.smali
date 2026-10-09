.class final Le/e/a/FeedbackDev10$NgAdapter;
.super Landroid/widget/BaseAdapter;
.source "FeedbackDev10.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FeedbackDev10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "NgAdapter"
.end annotation


# instance fields
.field final base:Landroid/widget/BaseAdapter;

.field final list:Landroid/widget/ListView;

.field final manager:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V
    .registers 4

    .line 134
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter;->list:Landroid/widget/ListView;

    iput-object p2, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    iput-object p3, p0, Le/e/a/FeedbackDev10$NgAdapter;->manager:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method synthetic confirmedDelete(Landroid/widget/Button;Ljava/lang/Object;)V
    .registers 5

    .line 143
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setEnabled(Z)V

    # getter for: Le/e/a/FeedbackDev10;->workers:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/FeedbackDev10;->access$000()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2, p1}, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda2;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Ljava/lang/Object;Landroid/widget/Button;)V

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 148
    return-void
.end method

.method public getCount()I
    .registers 2

    .line 135
    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 4

    .line 135
    :try_start_0
    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    const-string v1, "b"

    invoke-static {v0, v1}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    return-object p1

    :catch_f
    move-exception p1

    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 136
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11

    .line 138
    new-instance p2, Landroid/widget/LinearLayout;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 139
    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p3}, Landroid/widget/BaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x2

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    new-instance v0, Landroid/widget/Button;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {v0, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string p3, "\u524a\u9664"

    invoke-static {p3}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-static {v0}, Le/e/a/FeedbackDev10;->color(Landroid/view/View;)I

    move-result p3

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 141
    :try_start_52
    const-string p3, "FeedbackDev10"

    const-string v1, "roundButton"

    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/Class;

    const-class v6, Landroid/widget/Button;

    aput-object v6, v5, v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-static {p3, v1, v5, v3}, Le/e/a/FeedbackDev10;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_64} :catch_65

    goto :goto_69

    :catch_65
    move-exception p3

    invoke-static {p3}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    .line 142
    :goto_69
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v3, 0x40

    invoke-static {v1, v3}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v5, 0x28

    invoke-static {v1, v5}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {p3, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x4

    invoke-static {v1, v3}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iput v3, p3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    const/16 v3, 0x8

    invoke-static {v1, v3}, Le/e/a/FeedbackDev10;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, p3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {p2, v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p1}, Le/e/a/FeedbackDev10$NgAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    .line 143
    new-instance p3, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda3;

    invoke-direct {p3, p0, v0, p1}, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda3;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    return-object p2
.end method

.method synthetic lambda$getView$0$e-e-a-FeedbackDev10$NgAdapter(Ljava/lang/Object;)V
    .registers 4

    .line 147
    :try_start_0
    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    const-string v1, "b"

    invoke-static {v0, v1}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->manager:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "n"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter;->list:Landroid/widget/ListView;

    invoke-static {p1}, Le/e/a/FeedbackDev10;->redraw(Landroid/widget/ListView;)V

    iget-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter;->list:Landroid/widget/ListView;

    iget-object v0, p0, Le/e/a/FeedbackDev10$NgAdapter;->base:Landroid/widget/BaseAdapter;

    iget-object v1, p0, Le/e/a/FeedbackDev10$NgAdapter;->manager:Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Le/e/a/FeedbackDev10;->refreshNg(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3a} :catch_3b

    goto :goto_3f

    :catch_3b
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    :goto_3f
    return-void
.end method

.method synthetic lambda$getView$1$e-e-a-FeedbackDev10$NgAdapter(Landroid/widget/Button;)V
    .registers 4

    .line 148
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/FeedbackDev10$NgAdapter;->list:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "NG\u8a2d\u5b9a\u306e\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {v0}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$getView$2$e-e-a-FeedbackDev10$NgAdapter(Ljava/lang/Object;Landroid/widget/Button;)V
    .registers 7

    .line 144
    :try_start_0
    const-string v0, "a"

    invoke-static {p1, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string v1, "b"

    invoke-static {p1, v1}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v0, :cond_19

    const-string v0, "word"

    goto :goto_21

    :cond_19
    const/4 v2, 0x1

    if-ne v0, v2, :cond_1f

    const-string v0, "command"

    goto :goto_21

    :cond_1f
    const-string v0, "id"

    .line 145
    :goto_21
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&source="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

    const-string v2, "DELETE"

    invoke-static {}, Le/e/a/FeedbackDev10;->cookie()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v0, v3}, Le/e/a/FeedbackDev10;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 147
    # getter for: Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackDev10;->access$100()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda0;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5d} :catch_5e

    .line 148
    goto :goto_6e

    :catch_5e
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackDev10;->log(Ljava/lang/Exception;)V

    # getter for: Le/e/a/FeedbackDev10;->main:Landroid/os/Handler;
    invoke-static {}, Le/e/a/FeedbackDev10;->access$100()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Le/e/a/FeedbackDev10$NgAdapter$$ExternalSyntheticLambda1;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/Button;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_6e
    return-void
.end method

.method synthetic lambda$getView$3$e-e-a-FeedbackDev10$NgAdapter(Landroid/widget/Button;Ljava/lang/Object;Landroid/view/View;)V
    .registers 9

    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "NG\u8a2d\u5b9a\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v0}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v0, "b"

    invoke-static {p2, v0}, Le/e/a/FeedbackDev10;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v0, "\u524a\u9664"

    invoke-static {v0}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/NgDeleteConfirmation;

    invoke-direct {v2, p0, p1, p2}, Le/e/a/NgDeleteConfirmation;-><init>(Le/e/a/FeedbackDev10$NgAdapter;Landroid/widget/Button;Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0}, Le/e/a/FeedbackDev10;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
