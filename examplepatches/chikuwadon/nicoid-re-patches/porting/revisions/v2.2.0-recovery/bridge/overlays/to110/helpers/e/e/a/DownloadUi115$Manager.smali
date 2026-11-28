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

.field renderedRevision:J

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
    .registers 6

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

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/DownloadUi115$Manager;->renderedRevision:J

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

    .line 91
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    const/4 v0, 0x0

    .line 91
    invoke-static {p0, p1, v0}, Le/e/a/DownloadUi115;->open(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    const/4 v0, 0x1

    .line 91
    invoke-static {p0, p1, v0}, Le/e/a/DownloadUi115;->open(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Z)V

    return-void
.end method

.method static synthetic lambda$9(Landroid/app/Activity;)V
    .registers 3

    .line 91
    const-string v0, "\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method actions(Le/e/a/DownloadUi115$Row;)V
    .registers 11

    .line 91
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_6

    iget-boolean v1, p1, Le/e/a/DownloadUi115$Row;->cache:Z

    const/4 v2, 0x0

    const-string v3, "\u4fdd\u5b58\u6e08\u307f"

    if-eqz v1, :cond_1

    iget-object p0, p1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const-string p1, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-static {v0, p0}, Le/e/a/CacheFolders;->startActivity(Landroid/content/Context;Landroid/content/Intent;)V

    return-void

    :cond_0
    const-string p0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u64cd\u4f5c\u306f\u65e2\u5b58\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8\u3067\u884c\u3048\u307e\u3059"

    invoke-static {v0, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_1
    iget-object v1, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string p1, "\u5916\u90e8\u30a2\u30d7\u30ea\u3067\u958b\u304f"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$3;

    invoke-direct {p1, v0, v1}, Le/e/a/DownloadUi115$Manager$3;-><init>(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "\u5171\u6709"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$4;

    invoke-direct {p1, v0, v1}, Le/e/a/DownloadUi115$Manager$4;-><init>(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "\u4fdd\u5b58\u5148\u3092\u8868\u793a"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$5;

    invoke-direct {p1, p0, v1}, Le/e/a/DownloadUi115$Manager$5;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "\u524a\u9664"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$6;

    invoke-direct {p1, p0, v1, v0}, Le/e/a/DownloadUi115$Manager$6;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V

    :goto_0
    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
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

    if-eqz v3, :cond_4

    const-string v3, "\u518d\u53d6\u5f97"

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Le/e/a/DownloadUi115$Manager$7;

    invoke-direct {v3, p0, v1, v0}, Le/e/a/DownloadUi115$Manager$7;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_3
    const-string v0, "\u5c65\u6b74\u304b\u3089\u524a\u9664"

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Le/e/a/DownloadUi115$Manager$8;

    invoke-direct {v0, p0, p1}, Le/e/a/DownloadUi115$Manager$8;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadUi115$Row;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    const-string p1, "\u4e00\u6642\u505c\u6b62\uff08\u518d\u958b\u6642\u306f\u518d\u53d6\u5f97\uff09"

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$9;

    invoke-direct {p1, p0, v1}, Le/e/a/DownloadUi115$Manager$9;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Le/e/a/DownloadUi115$Manager$10;

    invoke-direct {p1, p0, v1}, Le/e/a/DownloadUi115$Manager$10;-><init>(Le/e/a/DownloadUi115$Manager;Le/e/a/DownloadJobs115$Job;)V

    goto :goto_0

    :cond_5
    :goto_1
    iget-object p0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    iget-object p1, v1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    new-instance v0, Le/e/a/DownloadUi115$Manager$11;

    invoke-direct {v0, v5}, Le/e/a/DownloadUi115$Manager$11;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_6
    return-void
.end method

.method public getCount()I
    .registers 1

    .line 65
    iget-object p0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 2

    .line 65
    iget-object p0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    .line 65
    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_0

    move-object v2, v1

    check-cast v2, Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    iget-object v2, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    :goto_0
    const/4 v3, 0x2

    const/16 v4, 0x8

    const-string v5, ""

    const/4 v6, 0x0

    if-nez v1, :cond_1

    .line 66
    iget-object v1, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/16 v7, 0xc

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v8, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v8, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    .line 67
    invoke-virtual {v2, v1, v8, v1, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 68
    iget-object v1, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/16 v8, 0x38

    invoke-static {v1, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 69
    iget-object v1, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/16 v8, 0x10

    invoke-static {v1, v5, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    .line 70
    invoke-virtual {v1, v6, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 71
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 72
    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 73
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    iget-object v1, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v1, v5, v7}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    .line 75
    iget-object v7, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/4 v8, 0x3

    invoke-static {v7, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v1, v6, v7, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 76
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v7, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/4 v10, 0x0

    const v11, 0x1010078

    invoke-direct {v1, v7, v10, v11}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    iget-object v7, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 79
    iget-object v7, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 80
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v10, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    iget-object v8, v0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    const/4 v9, 0x6

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 82
    invoke-virtual {v2, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    :cond_1
    iget-object v1, v0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    move/from16 v7, p1

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/DownloadUi115$Row;

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iget-object v8, v1, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    new-instance v9, Ljava/lang/StringBuilder;

    iget-boolean v10, v1, Le/e/a/DownloadUi115$Row;->cache:Z

    if-eqz v10, :cond_2

    const-string v10, "\u30ad\u30e3\u30c3\u30b7\u30e5"

    goto :goto_1

    :cond_2
    iget-object v10, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    invoke-static {v10}, Le/e/a/Mp3Save214;->isMp3(Le/e/a/DownloadJobs115$Job;)Z

    move-result v10

    if-eqz v10, :cond_3

    const-string v10, "MP3"

    goto :goto_1

    :cond_3
    const-string v10, "MP4"

    :goto_1
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, " \u00b7 "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    if-eqz v11, :cond_4

    iget-object v11, v1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_4

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, v1, Le/e/a/DownloadUi115$Row;->detail:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    :cond_4
    move-object v11, v5

    :goto_2
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iget v8, v0, Le/e/a/DownloadUi115$Manager;->mode:I

    const-string v9, "\u30ad\u30e5\u30fc\u5f85\u3061"

    if-nez v8, :cond_5

    iget-object v8, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "\u4e00\u6642\u505c\u6b62"

    iget-object v11, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    move v4, v6

    :cond_5
    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    if-gez v4, :cond_6

    move v4, v7

    goto :goto_3

    :cond_6
    move v4, v6

    :goto_3
    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setProgress(I)V

    new-instance v3, Ljava/lang/StringBuilder;

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    invoke-static {v11, v12}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->total:J

    const-wide/16 v13, 0x0

    cmp-long v4, v11, v13

    const-string v6, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u4e2d"

    if-lez v4, :cond_7

    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, " / "

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->total:J

    invoke-static {v11, v12}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-wide/from16 p1, v13

    goto :goto_4

    .line 85
    :cond_7
    iget v4, v0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v4, :cond_8

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    if-lez v4, :cond_8

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    cmp-long v4, v11, v13

    if-lez v4, :cond_8

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    const/16 v8, 0x64

    if-ge v4, v8, :cond_8

    .line 86
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, " / \u7d04"

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    move-wide/from16 p1, v13

    iget-wide v13, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    long-to-double v13, v13

    const-wide/high16 v15, 0x4059000000000000L    # 100.0

    mul-double/2addr v13, v15

    iget v8, v1, Le/e/a/DownloadUi115$Row;->percent:I

    int-to-double v7, v8

    div-double/2addr v13, v7

    invoke-static {v13, v14}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-long v7, v7

    invoke-static {v11, v12, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    invoke-static {v7, v8}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    :cond_8
    move-wide/from16 p1, v13

    .line 87
    iget v4, v0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v4, :cond_9

    iget-object v4, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, " / \u7dcf\u5bb9\u91cf\u53d6\u5f97\u4e2d"

    goto :goto_4

    :cond_9
    move-object v4, v5

    :goto_4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    if-ltz v4, :cond_a

    iget v0, v0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v1, Le/e/a/DownloadUi115$Row;->percent:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "%"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_a
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v3, :cond_b

    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v3, v3, Le/e/a/DownloadJobs115$Job;->started:J

    cmp-long v3, v3, p1

    if-lez v3, :cond_b

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v5, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v5, v5, Le/e/a/DownloadJobs115$Job;->started:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x3e8

    cmp-long v5, v3, v5

    if-lez v5, :cond_b

    iget-wide v5, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    long-to-double v5, v5

    long-to-double v3, v3

    const-wide v7, 0x408f400000000000L    # 1000.0

    div-double/2addr v3, v7

    div-double/2addr v5, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    double-to-long v7, v5

    invoke-static {v7, v8}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/\u79d2"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-wide v3, v1, Le/e/a/DownloadUi115$Row;->total:J

    iget-wide v7, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    cmp-long v3, v3, v7

    if-lez v3, :cond_b

    const-wide/16 v3, 0x0

    cmpl-double v3, v5, v3

    if-lez v3, :cond_b

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " \u00b7 \u6b8b\u308a\u7d04"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v1, Le/e/a/DownloadUi115$Row;->total:J

    iget-wide v11, v1, Le/e/a/DownloadUi115$Row;->bytes:J

    sub-long/2addr v7, v11

    long-to-double v7, v7

    div-double/2addr v7, v5

    double-to-long v4, v7

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "\u79d2"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_b
    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->status:Ljava/lang/String;

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const-string v0, "\u5bb9\u91cf\u306f\u53d6\u5f97\u958b\u59cb\u5f8c\u306b\u8868\u793a\u3057\u307e\u3059"

    :cond_c
    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v3, :cond_d

    iget-object v3, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v3, v3, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_d

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_d
    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 88
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v2
.end method

.method synthetic lambda$0$e-e-a-DownloadUi115$Manager(Landroid/content/Context;)V
    .registers 4

    .line 63
    invoke-static {p1}, Le/e/a/DownloadFiles118;->reconcile(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/DownloadUi115;->caches(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/DownloadUi115$Manager$2;

    invoke-direct {v1, p0, p1}, Le/e/a/DownloadUi115$Manager$2;-><init>(Le/e/a/DownloadUi115$Manager;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$1$e-e-a-DownloadUi115$Manager(Ljava/util/List;)V
    .registers 3

    .line 0
    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    :cond_0
    return-void
.end method

.method synthetic lambda$11$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V
    .registers 6

    .line 91
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

    if-eqz v0, :cond_0

    iget-object v0, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    iget p1, p1, Le/e/a/DownloadJobs115$Job;->height:I

    invoke-static {p2, v0, v1, p1}, Le/e/a/DownloadUi115;->folder(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    invoke-static {p2, p1}, Le/e/a/DownloadJobs115;->submit(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V

    :goto_0
    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$12$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadUi115$Row;)V
    .registers 2

    .line 91
    invoke-virtual {p0, p1}, Le/e/a/DownloadUi115$Manager;->removeHistory(Le/e/a/DownloadUi115$Row;)Z

    return-void
.end method

.method synthetic lambda$13$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 0
    const/4 v0, 0x1

    .line 91
    invoke-static {p1, v0}, Le/e/a/DownloadJobs115;->control(Le/e/a/DownloadJobs115$Job;Z)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$14$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 0
    const/4 v0, 0x0

    .line 91
    invoke-static {p1, v0}, Le/e/a/DownloadJobs115;->control(Le/e/a/DownloadJobs115$Job;Z)V

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$2$e-e-a-DownloadUi115$Manager(Landroid/app/Activity;Le/e/a/DownloadUi115$Row;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 90
    iget-object p2, p2, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    invoke-static {p1, p2}, Le/e/a/DownloadFiles118;->forget(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)Z

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->update()V

    return-void
.end method

.method synthetic lambda$5$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;)V
    .registers 3

    .line 91
    iget-object p0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v0, "\u4fdd\u5b58\u5148"

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x104000a

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$6$e-e-a-DownloadUi115$Manager(Le/e/a/DownloadJobs115$Job;Landroid/app/Activity;)V
    .registers 5

    .line 91
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u4fdd\u5b58\u6e08\u307f\u30d5\u30a1\u30a4\u30eb\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/DownloadUi115$Manager$0;

    invoke-direct {v1, p0, p2, p1}, Le/e/a/DownloadUi115$Manager$0;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    const-string p0, "\u524a\u9664"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$7$e-e-a-DownloadUi115$Manager(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 91
    new-instance p3, Ljava/lang/Thread;

    new-instance p4, Le/e/a/DownloadUi115$Manager$12;

    invoke-direct {p4, p0, p1, p2}, Le/e/a/DownloadUi115$Manager$12;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V

    invoke-direct {p3, p4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method synthetic lambda$8$e-e-a-DownloadUi115$Manager(Landroid/app/Activity;Le/e/a/DownloadJobs115$Job;)V
    .registers 5

    .line 91
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p2, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Le/e/a/DownloadJobs115;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v1, Le/e/a/DownloadJobs115;->jobs:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    monitor-exit v0

    goto :goto_1

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2}, Ljava/io/IOException;-><init>()V

    throw p2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    sget-object p2, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/DownloadUi115$Manager$13;

    invoke-direct {v0, p1}, Le/e/a/DownloadUi115$Manager$13;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1
    sget-object p1, Le/e/a/DownloadUi115;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/DownloadUi115$Manager$14;

    invoke-direct {p2, p0}, Le/e/a/DownloadUi115$Manager$14;-><init>(Le/e/a/DownloadUi115$Manager;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method reload()V
    .registers 4

    .line 63
    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/DownloadUi115$Manager;->scanning:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/DownloadUi115$Manager;->lastScan:J

    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/DownloadUi115$Manager$16;

    invoke-direct {v2, p0, v0}, Le/e/a/DownloadUi115$Manager$16;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/content/Context;)V

    const-string p0, "nicoid-download-list"

    invoke-direct {v1, v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method

.method removeHistory(Le/e/a/DownloadUi115$Row;)Z
    .registers 6

    .line 90
    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    if-eqz v0, :cond_2

    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v1, "\u30a8\u30e9\u30fc"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Le/e/a/DownloadUi115$Row;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u5c65\u6b74\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p1, Le/e/a/DownloadUi115$Row;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Le/e/a/DownloadUi115$Manager$15;

    invoke-direct {v3, p0, v0, p1}, Le/e/a/DownloadUi115$Manager$15;-><init>(Le/e/a/DownloadUi115$Manager;Landroid/app/Activity;Le/e/a/DownloadUi115$Row;)V

    const-string p0, "\u524a\u9664"

    invoke-virtual {v2, p0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_1
    return v1

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method update()V
    .registers 8

    .line 63
    invoke-static {}, Le/e/a/DownloadUi115;->liveCache()Le/e/a/DownloadUi115$Row;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, v0, Le/e/a/DownloadUi115$Row;->id:Ljava/lang/String;

    :goto_0
    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    iput-object v1, p0, Le/e/a/DownloadUi115$Manager;->cacheActive:Ljava/lang/String;

    if-nez v2, :cond_1

    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->reload()V

    :cond_1
    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-static {}, Le/e/a/DownloadJobs115;->all()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_6

    iget v1, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v1, v3, :cond_3

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/DownloadUi115$Manager;->cacheRows:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    iget v1, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-nez v1, :cond_5

    if-eqz v0, :cond_4

    iget-object v1, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    iget-object v0, p0, Le/e/a/DownloadUi115$Manager;->rows:Ljava/util/ArrayList;

    invoke-static {}, Le/e/a/DownloadUi115;->queuedCaches()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 64
    :cond_5
    const-class v2, Le/e/a/DownloadJobs115;

    monitor-enter v2

    :try_start_0
    sget-wide v0, Le/e/a/DownloadJobs115;->revision:J

    iput-wide v0, p0, Le/e/a/DownloadUi115$Manager;->renderedRevision:J

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    invoke-virtual {p0}, Le/e/a/DownloadUi115$Manager;->notifyDataSetChanged()V

    return-void

    .line 64
    :goto_2
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_2

    .line 63
    :cond_6
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

    if-nez v5, :cond_7

    const-string v5, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    iget-object v6, v2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    const/4 v5, 0x0

    goto :goto_3

    :cond_7
    move v5, v3

    :goto_3
    iget v6, p0, Le/e/a/DownloadUi115$Manager;->mode:I

    if-ne v6, v3, :cond_8

    if-nez v4, :cond_a

    goto :goto_1

    :cond_8
    const/4 v3, 0x2

    if-ne v6, v3, :cond_9

    if-nez v5, :cond_a

    goto :goto_1

    :cond_9
    if-nez v4, :cond_2

    if-nez v5, :cond_2

    :cond_a
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

    goto/16 :goto_1
.end method
