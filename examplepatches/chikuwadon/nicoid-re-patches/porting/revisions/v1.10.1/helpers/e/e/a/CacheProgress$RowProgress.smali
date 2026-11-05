.class final Le/e/a/CacheProgress$RowProgress;
.super Ljava/lang/Object;
.source "CacheProgress.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheProgress;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RowProgress"
.end annotation


# instance fields
.field attachmentWait:I

.field base:Ljava/lang/CharSequence;

.field final id:Ljava/lang/String;

.field final label:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field lastReceived:J

.field lastTotal:J

.field final view:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field wasActive:Z


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 5

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/CacheProgress$RowProgress;->view:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/CacheProgress$RowProgress;->label:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Le/e/a/CacheProgress$RowProgress;->id:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 112
    # getter for: Le/e/a/CacheProgress;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/CacheProgress;->access$0()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 113
    invoke-virtual {p0}, Le/e/a/CacheProgress$RowProgress;->cancel()V

    invoke-virtual {p0}, Le/e/a/CacheProgress$RowProgress;->run()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 114
    invoke-virtual {p0}, Le/e/a/CacheProgress$RowProgress;->cancel()V

    return-void
.end method

.method public run()V
    .registers 14

    .line 115
    iget-object v0, p0, Le/e/a/CacheProgress$RowProgress;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Le/e/a/CacheProgress$RowProgress;->label:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v0, :cond_14e

    if-eqz v1, :cond_14e

    # getter for: Le/e/a/CacheProgress;->ROWS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/CacheProgress;->access$1()Ljava/util/WeakHashMap;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p0, :cond_20

    goto/16 :goto_14e

    .line 116
    :cond_20
    iget-object v2, p0, Le/e/a/CacheProgress$RowProgress;->base:Ljava/lang/CharSequence;

    const-string v3, ""

    if-nez v2, :cond_28

    iput-object v3, p0, Le/e/a/CacheProgress$RowProgress;->base:Ljava/lang/CharSequence;

    .line 117
    :cond_28
    const/4 v2, 0x0

    :try_start_29
    const-string v4, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "t"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "v"

    invoke-virtual {v4, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v4

    const/4 v6, 0x1

    if-eqz v4, :cond_59

    iget-object v4, p0, Le/e/a/CacheProgress$RowProgress;->id:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_55} :catch_12f

    if-eqz v4, :cond_59

    move v4, v6

    goto :goto_5a

    :cond_59
    move v4, v2

    :goto_5a
    const-string v5, " \u00b7 "

    const-wide/16 v7, 0x0

    if-eqz v4, :cond_da

    :try_start_60
    # getter for: Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {}, Le/e/a/CacheProgress;->access$2()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v9

    # getter for: Le/e/a/CacheProgress;->totalBytes:J
    invoke-static {}, Le/e/a/CacheProgress;->access$3()J

    move-result-wide v11

    iput-wide v9, p0, Le/e/a/CacheProgress$RowProgress;->lastReceived:J

    iput-wide v11, p0, Le/e/a/CacheProgress$RowProgress;->lastTotal:J

    # invokes: Le/e/a/CacheProgress;->format(J)Ljava/lang/String;
    invoke-static {v9, v10}, Le/e/a/CacheProgress;->access$4(J)Ljava/lang/String;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    cmp-long v4, v11, v7

    if-lez v4, :cond_94

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " / "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # invokes: Le/e/a/CacheProgress;->format(J)Ljava/lang/String;
    invoke-static {v11, v12}, Le/e/a/CacheProgress;->access$4(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_94
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # invokes: Le/e/a/CacheProgress;->percent()I
    invoke-static {}, Le/e/a/CacheProgress;->access$5()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Landroid/text/SpannableStringBuilder;

    const-string v7, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u4e2d"

    invoke-static {v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_d7

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_d7
    iput-boolean v6, p0, Le/e/a/CacheProgress$RowProgress;->wasActive:Z

    goto :goto_130

    :cond_da
    iget-boolean v4, p0, Le/e/a/CacheProgress$RowProgress;->wasActive:Z

    if-eqz v4, :cond_130

    new-instance v4, Landroid/text/SpannableStringBuilder;

    # getter for: Le/e/a/CacheProgress;->completed:Z
    invoke-static {}, Le/e/a/CacheProgress;->access$6()Z

    move-result v6

    if-nez v6, :cond_f8

    iget-wide v9, p0, Le/e/a/CacheProgress$RowProgress;->lastTotal:J

    cmp-long v6, v9, v7

    if-lez v6, :cond_f5

    iget-wide v9, p0, Le/e/a/CacheProgress$RowProgress;->lastReceived:J

    iget-wide v11, p0, Le/e/a/CacheProgress$RowProgress;->lastTotal:J

    cmp-long v6, v9, v11

    if-ltz v6, :cond_f5

    goto :goto_f8

    :cond_f5
    const-string v6, "\u672a\u5b8c\u4e86"

    goto :goto_fa

    :cond_f8
    :goto_f8
    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u5b8c\u4e86"

    :goto_fa
    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    iget-wide v5, p0, Le/e/a/CacheProgress$RowProgress;->lastReceived:J

    # invokes: Le/e/a/CacheProgress;->format(J)Ljava/lang/String;
    invoke-static {v5, v6}, Le/e/a/CacheProgress;->access$4(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    # getter for: Le/e/a/CacheProgress;->completed:Z
    invoke-static {}, Le/e/a/CacheProgress;->access$6()Z

    move-result v5

    if-nez v5, :cond_123

    iget-wide v5, p0, Le/e/a/CacheProgress$RowProgress;->lastTotal:J

    cmp-long v5, v5, v7

    if-lez v5, :cond_125

    iget-wide v5, p0, Le/e/a/CacheProgress$RowProgress;->lastReceived:J

    iget-wide v7, p0, Le/e/a/CacheProgress$RowProgress;->lastTotal:J

    cmp-long v5, v5, v7

    if-ltz v5, :cond_125

    :cond_123
    const-string v3, " (100%)"

    :cond_125
    invoke-virtual {v4, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-boolean v2, p0, Le/e/a/CacheProgress$RowProgress;->wasActive:Z
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_12e} :catch_12f

    goto :goto_130

    .line 118
    :catch_12f
    move-exception v1

    :cond_130
    :goto_130
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    const-wide/16 v3, 0x1f4

    if-eqz v0, :cond_142

    iput v2, p0, Le/e/a/CacheProgress$RowProgress;->attachmentWait:I

    :goto_13a
    # getter for: Le/e/a/CacheProgress;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/CacheProgress;->access$0()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_14d

    :cond_142
    iget v0, p0, Le/e/a/CacheProgress$RowProgress;->attachmentWait:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Le/e/a/CacheProgress$RowProgress;->attachmentWait:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_14d

    goto :goto_13a

    .line 119
    :cond_14d
    :goto_14d
    return-void

    .line 115
    :cond_14e
    :goto_14e
    return-void
.end method
