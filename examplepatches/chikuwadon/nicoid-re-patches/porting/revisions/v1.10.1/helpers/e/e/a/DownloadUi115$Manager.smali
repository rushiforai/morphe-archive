.class final Le/e/a/DownloadUi115$Manager;
.super Landroid/widget/BaseAdapter;
.source "DownloadUi115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DownloadUi115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Manager"
.end annotation


# instance fields
.field final activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field cacheActive:Ljava/lang/String;

.field cacheRows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/DownloadUi115$Row;",
            ">;"
        }
    .end annotation
.end field

.field closed:Z

.field final context:Landroid/content/Context;

.field dialog:Landroid/app/AlertDialog;

.field lastScan:J

.field final list:Landroid/widget/ListView;

.field mode:I

.field final rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/DownloadUi115$Row;",
            ">;"
        }
    .end annotation
.end field

.field scanning:Z

.field tabs:Le/e/a/Ui110$Tabs;

.field final tick:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/content/Context;Landroid/widget/ListView;)V
    .registers 5

    .line 55
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    new-instance v0, Le/e/a/DownloadUi115$Manager$1;

    invoke-direct {v0, p0}, Le/e/a/DownloadUi115$Manager$1;-><init>(Le/e/a/DownloadUi115$Manager;)V

    iput-object v0, p0, Le/e/a/DownloadUi115$Manager;->tick:Ljava/lang/Runnable;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/DownloadUi115$Manager;->list:Landroid/widget/ListView;

    return-void
.end method

.method static synthetic lambda$15(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 58
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$7(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 58
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/DownloadUi115;->open(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)V

    return-void
.end method

.method static synthetic lambda$8(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 58
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/DownloadUi115;->open(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)V

    return-void
.end method


# virtual methods
.method actions(Le/e/a/DownloadUi115$Row;)V
    .registers 11

    .line 58
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_104

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_12

    goto/16 :goto_104

    :cond_12
    iget-boolean v1, p1, Le/e/a/DownloadUi115$Row;->cache:Z

    const/4 v2, 0x0

    const-string v3, "\u4fdd\u5b58\u6e08\u307f"

    if-eqz v1, :cond_3a

    iget-object p1, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-static {v0, p1}, Le/e/a/CacheFolders;->startActivity(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_39

    :cond_30
    const-string p1, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u64cd\u4f5c\u306f\u65e2\u5b58\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8\u3067\u884c\u3048\u307e\u3059"

    invoke-static {v0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_39
    return-void

    :cond_3a
    iget-object v1, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_83

    const-string v3, "\u5916\u90e8\u30a2\u30d7\u30ea\u3067\u958b\u304f"

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda17;

    invoke-direct {v3, v0, v1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda17;-><init>(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v3, "\u5171\u6709"

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda18;

    invoke-direct {v3, v0, v1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v0, "\u4fdd\u5b58\u5148\u3092\u8868\u793a"

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0, v1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda19;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v0, "\u524a\u9664"

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda20;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;)V

    :goto_7f
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d9

    :cond_83
    const-string v3, "\u4e00\u6642\u505c\u6b62"

    const-string v6, "\u30a8\u30e9\u30fc"

    const-string v7, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    filled-new-array {v3, v6, v7}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iget-object v8, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-interface {v3, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c1

    const-string v3, "\u518d\u53d6\u5f97"

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda21;

    invoke-direct {v3, p0, v1, v0}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda21;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b6

    iget-object v0, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d9

    :cond_b6
    const-string v0, "\u5c65\u6b74\u304b\u3089\u524a\u9664"

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda22;

    invoke-direct {v0, p0, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda22;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;)V

    goto :goto_7f

    :cond_c1
    const-string p1, "\u4e00\u6642\u505c\u6b62\uff08\u518d\u958b\u6642\u306f\u518d\u53d6\u5f97\uff09"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda23;

    invoke-direct {p1, p0, v1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda23;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda24;

    invoke-direct {p1, p0, v1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda24;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d9
    :goto_d9
    iget-object p1, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, v1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    new-instance v1, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda25;

    invoke-direct {v1, v5}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda25;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_104
    :goto_104
    return-void
.end method

.method deleteSaved(Le/e/a/DownloadUi115$Row;)V
    .registers 6

    .line 56
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_59

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_59

    iget-boolean v1, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-nez v1, :cond_59

    const-string v1, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    goto :goto_59

    :cond_1f
    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-boolean v2, p1, Le/e/a/DownloadUi115$Row;->cache:Z

    if-eqz v2, :cond_2c

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    goto :goto_2e

    :cond_2c
    const-string v2, "MP4\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    :goto_2e
    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u524a\u9664"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;

    invoke-direct {v3, p0, p1, v0}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda26;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;Landroid/app/Activity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_59
    :goto_59
    return-void
.end method

.method public getCount()I
    .registers 2

    .line 55
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 55
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 55
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 15

    .line 55
    instance-of p3, p2, Landroid/widget/LinearLayout;

    if-eqz p3, :cond_8

    move-object p3, p2

    check-cast p3, Landroid/widget/LinearLayout;

    goto :goto_e

    :cond_8
    iget-object p3, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p3}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p3

    :goto_e
    const-string v0, ""

    if-nez p2, :cond_6f

    iget-object p2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/16 v1, 0xc

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p3, p2, p2, p2, p2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object p2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/16 v2, 0x10

    invoke-static {p2, v0, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p2, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p2, Landroid/widget/ProgressBar;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const v4, 0x1010078

    invoke-direct {p2, v2, v3, v4}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/4 v4, 0x6

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p3, p2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p2, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_6f
    iget-object p2, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/DownloadUi115$Row;

    const/4 p2, 0x0

    invoke-virtual {p3, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    iget-boolean v4, p1, Le/e/a/DownloadUi115$Row;->cache:Z

    if-eqz v4, :cond_93

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5"

    goto :goto_95

    :cond_93
    const-string v4, "MP4"

    :goto_95
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " \u00b7 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    if-eqz v5, :cond_c5

    iget-object v5, p1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b5

    goto :goto_c5

    :cond_b5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_c6

    :cond_c5
    :goto_c5
    move-object v5, v0

    :goto_c6
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v5, v1, :cond_e2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, p1, Le/e/a/DownloadUi115$Row;->bytes:J

    invoke-static {v6, v7}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_e3

    :cond_e2
    move-object v5, v0

    :goto_e3
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x2

    invoke-virtual {p3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iget v3, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    const-string v5, "\u30ad\u30e5\u30fc\u5f85\u3061"

    const/16 v6, 0x8

    if-nez v3, :cond_111

    iget-object v3, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_111

    const-string v3, "\u4e00\u6642\u505c\u6b62"

    iget-object v7, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_111

    const/4 v3, 0x0

    goto :goto_113

    :cond_111
    const/16 v3, 0x8

    :goto_113
    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget v3, p1, Le/e/a/DownloadUi115$Row;->percent:I

    if-gez v3, :cond_11c

    const/4 v3, 0x1

    goto :goto_11d

    :cond_11c
    const/4 v3, 0x0

    :goto_11d
    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget v3, p1, Le/e/a/DownloadUi115$Row;->percent:I

    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    iget-wide v7, p1, Le/e/a/DownloadUi115$Row;->bytes:J

    invoke-static {v7, v8}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v7, p1, Le/e/a/DownloadUi115$Row;->total:J

    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-lez v3, :cond_156

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, " / "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v7, p1, Le/e/a/DownloadUi115$Row;->total:J

    invoke-static {v7, v8}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_157

    :cond_156
    move-object v3, v0

    :goto_157
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Le/e/a/DownloadUi115$Row;->percent:I

    if-ltz v3, :cond_178

    iget v3, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v3, :cond_178

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Le/e/a/DownloadUi115$Row;->percent:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "%"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_178
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v2, :cond_203

    const-string v2, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u4e2d"

    iget-object v3, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_203

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v2, v2, Le/e/a/DownloadJobs115$Job;->started:J

    cmp-long v7, v2, v9

    if-lez v7, :cond_203

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-object v7, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v7, v7, Le/e/a/DownloadJobs115$Job;->started:J

    sub-long/2addr v2, v7

    const-wide/16 v7, 0x3e8

    cmp-long v9, v2, v7

    if-lez v9, :cond_203

    iget-wide v7, p1, Le/e/a/DownloadUi115$Row;->bytes:J

    long-to-double v7, v7

    long-to-double v2, v2

    const-wide v9, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v9

    div-double/2addr v7, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    double-to-long v2, v7

    invoke-static {v2, v3}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/\u79d2"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-wide v2, p1, Le/e/a/DownloadUi115$Row;->total:J

    iget-wide v9, p1, Le/e/a/DownloadUi115$Row;->bytes:J

    cmp-long v4, v2, v9

    if-lez v4, :cond_203

    const-wide/16 v2, 0x0

    cmpl-double v4, v7, v2

    if-lez v4, :cond_203

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " \u00b7 \u6b8b\u308a\u7d04"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p1, Le/e/a/DownloadUi115$Row;->total:J

    iget-wide v9, p1, Le/e/a/DownloadUi115$Row;->bytes:J

    sub-long/2addr v2, v9

    long-to-double v2, v2

    div-double/2addr v2, v7

    double-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\u79d2"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_203
    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20d

    const-string v0, "\u5bb9\u91cf\u306f\u53d6\u5f97\u958b\u59cb\u5f8c\u306b\u8868\u793a\u3057\u307e\u3059"

    :cond_20d
    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v2, :cond_236

    iget-object v2, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v2, v2, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_236

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_236
    const/4 p1, 0x3

    invoke-virtual {p3, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v0, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v0, v1, :cond_246

    const/16 p2, 0x8

    :cond_246
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    return-object p3
.end method

.method synthetic lambda$0$e-e-a-DownloadUi115$Manager(Landroid/content/Context;)V
    .registers 4

    .line 55
    invoke-static {p1}, Le/e/a/DownloadFiles118;->reconcile(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/DownloadUi115;->caches(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda16;-><init>(Le/e/a/DownloadUi115$Manager;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$1$e-e-a-DownloadUi115$Manager(Ljava/util/List;)V
    .registers 3

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-nez v0, :cond_c

    iput-object p1, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    :cond_c
    return-void
.end method

.method synthetic lambda$10$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;)V
    .registers 2

    .line 58
    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->deleteSaved(Le/e/a/DownloadUi115$Row;)V

    return-void
.end method

.method synthetic lambda$11$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V
    .registers 6

    .line 58
    invoke-static {p2}, Le/e/a/DownloadUi115;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "mp4_tree_uri"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    iget-object v0, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget p1, p1, Le/e/a/DownloadJobs115$Job;->height:I

    invoke-static {p2, v0, v1, p1}, Le/e/a/DownloadUi115;->folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_23

    :cond_20
    invoke-static {p2, p1}, Le/e/a/DownloadJobs115;->submit(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V

    :goto_23
    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$12$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;)V
    .registers 2

    .line 58
    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->removeHistory(Le/e/a/DownloadUi115$Row;)Z

    return-void
.end method

.method synthetic lambda$13$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 58
    const/4 v0, 0x1

    invoke-static {p1, v0}, Le/e/a/DownloadJobs115;->control(Le/e/a/DownloadJobs115$Job;Z)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$14$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 58
    const/4 v0, 0x0

    invoke-static {p1, v0}, Le/e/a/DownloadJobs115;->control(Le/e/a/DownloadJobs115$Job;Z)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$2$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 56
    iget-boolean p3, p1, Le/e/a/DownloadUi115$Row;->cache:Z

    if-eqz p3, :cond_f

    iget-object p3, p1, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    new-instance p4, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda27;

    invoke-direct {p4, p0, p1, p2}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda27;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;Landroid/app/Activity;)V

    invoke-static {p2, p3, p4}, Le/e/a/CacheControl110;->remove(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_f
    iget-object p1, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz p1, :cond_33

    const-string p3, "\u4fdd\u5b58\u6e08\u307f"

    iget-object p4, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_1e

    goto :goto_33

    :cond_1e
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iget-object p3, p1, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    new-instance p4, Ljava/lang/Thread;

    new-instance v0, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0, p2, p3, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda28;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/content/Context;Ljava/lang/String;Le/e/a/DownloadJobs115$Job;)V

    const-string p1, "nicoid-saved-delete"

    invoke-direct {p4, v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {p4}, Ljava/lang/Thread;->start()V

    :cond_33
    :goto_33
    return-void
.end method

.method synthetic lambda$3$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;Landroid/app/Activity;)V
    .registers 4

    .line 56
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-static {p2}, Le/e/a/VideoMarks119;->changed(Landroid/content/Context;)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->reload()V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$4$e-e-a-DownloadUi115$Manager(Landroid/content/Context;Ljava/lang/String;Le/e/a/DownloadJobs115$Job;)V
    .registers 6

    .line 56
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_27

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_2d

    :try_start_11
    iget-object v1, p3, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_21

    sget-object p2, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    :cond_21
    monitor-exit v0

    const/4 p1, 0x1

    goto :goto_2f

    :catchall_24
    move-exception p1

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_11 .. :try_end_26} :catchall_24

    :goto_26
    :try_start_26
    throw p1

    :cond_27
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_2c} :catch_2d

    goto :goto_26

    :catch_2d
    move-exception p1

    const/4 p1, 0x0

    :goto_2f
    sget-object p2, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda31;

    invoke-direct {p3, p0, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda31;-><init>(Le/e/a/DownloadUi115$Manager;Z)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$5$e-e-a-DownloadUi115$Manager(Z)V
    .registers 4

    .line 56
    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_29

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_16

    goto :goto_29

    :cond_16
    if-nez p1, :cond_26

    const-string p1, "\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_26
    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    :cond_29
    :goto_29
    return-void
.end method

.method synthetic lambda$6$e-e-a-DownloadUi115$Manager(Landroid/app/Activity;Le/e/a/DownloadUi115$Row;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 57
    iget-object p2, p2, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    invoke-static {p1, p2}, Le/e/a/DownloadFiles118;->forget(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)Z

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$9$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 4

    .line 58
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u4fdd\u5b58\u5148"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method reload()V
    .registers 4

    .line 55
    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    if-nez v0, :cond_27

    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-eqz v0, :cond_9

    goto :goto_27

    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/DownloadUi115$Manager;->lastScan:J

    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda30;

    invoke-direct {v2, p0, v0}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda30;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/content/Context;)V

    const-string v0, "nicoid-download-list"

    invoke-direct {v1, v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :cond_27
    :goto_27
    return-void
.end method

.method removeHistory(Le/e/a/DownloadUi115$Row;)Z
    .registers 6

    .line 57
    const-string v0, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v1, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_f

    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->deleteSaved(Le/e/a/DownloadUi115$Row;)V

    return v1

    :cond_f
    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v0, :cond_69

    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v2, "\u30a8\u30e9\u30fc"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    goto :goto_69

    :cond_2c
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_68

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_3d

    goto :goto_68

    :cond_3d
    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u5c65\u6b74\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p1, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda29;

    invoke-direct {v3, p0, v0, p1}, Le/e/a/DownloadUi115$Manager$$ExternalSyntheticLambda29;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/app/Activity;Le/e/a/DownloadUi115$Row;)V

    const-string p1, "\u524a\u9664"

    invoke-virtual {v2, p1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_68
    :goto_68
    return v1

    :cond_69
    :goto_69
    const/4 p1, 0x0

    return p1
.end method

.method update()V
    .registers 8

    .line 55
    invoke-static {}, Le/e/a/DownloadUi115;->liveCache()Le/e/a/DownloadUi115$Row;

    move-result-object v0

    if-nez v0, :cond_9

    const-string v1, ""

    goto :goto_b

    :cond_9
    iget-object v1, v0, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    :goto_b
    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    iput-object v1, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    if-nez v2, :cond_20

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->reload()V

    :cond_20
    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-static {}, Le/e/a/DownloadJobs115;->all()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2d
    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_57

    iget v1, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v1, v3, :cond_3f

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3f
    iget v1, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v1, :cond_53

    if-eqz v0, :cond_4a

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4a
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-static {}, Le/e/a/DownloadUi115;->queuedCaches()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_53
    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->notifyDataSetChanged()V

    return-void

    :cond_57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/DownloadJobs115$Job;

    const-string v4, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v5, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "\u30a8\u30e9\u30fc"

    iget-object v6, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7b

    const-string v5, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    iget-object v6, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7b

    const/4 v5, 0x0

    goto :goto_7c

    :cond_7b
    const/4 v5, 0x1

    :goto_7c
    iget v6, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v6, v3, :cond_83

    if-nez v4, :cond_90

    goto :goto_2d

    :cond_83
    iget v3, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_8b

    if-nez v5, :cond_90

    goto :goto_2d

    :cond_8b
    if-nez v4, :cond_2d

    if-eqz v5, :cond_90

    goto :goto_2d

    :cond_90
    new-instance v3, Le/e/a/DownloadUi115$Row;

    invoke-direct {v3}, Le/e/a/DownloadUi115$Row;-><init>()V

    iput-object v2, v3, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    iput-object v4, v3, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iput-object v4, v3, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    iput-object v4, v3, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iput-object v4, v3, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    iget-wide v4, v2, Le/e/a/DownloadJobs115$Job;->bytes:J

    iput-wide v4, v3, Le/e/a/DownloadUi115$Row;->bytes:J

    iget-wide v4, v2, Le/e/a/DownloadJobs115$Job;->total:J

    iput-wide v4, v3, Le/e/a/DownloadUi115$Row;->total:J

    invoke-virtual {v2}, Le/e/a/DownloadJobs115$Job;->percent()I

    move-result v4

    iput v4, v3, Le/e/a/DownloadUi115$Row;->percent:I

    iget-object v2, v2, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    iput-object v2, v3, Le/e/a/DownloadUi115$Row;->uri:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2d
.end method
