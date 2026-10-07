.class final Le/e/a/CommentListExtras$Follow;
.super Ljava/lang/Object;
.source "CommentListExtras.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentListExtras;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Follow"
.end annotation


# instance fields
.field active:Z

.field byNicoru:Z

.field final fragment:Ljava/lang/Object;

.field last:J

.field lastIndex:I

.field final list:Landroid/widget/ListView;

.field pendingTap:Ljava/lang/Runnable;

.field positions:[J

.field sortControl:Landroid/widget/Spinner;

.field tapPosition:I

.field toggle:Landroid/widget/CheckBox;

.field touchY:F
.field touchX:F
.field touchDown:J
.field touchMoved:Z
.field tapTime:J


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 5

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentListExtras$Follow;->active:Z

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/CommentListExtras$Follow;->last:J

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/CommentListExtras$Follow;->lastIndex:I

    iput v0, p0, Le/e/a/CommentListExtras$Follow;->tapPosition:I

    .line 34
    iput-object p1, p0, Le/e/a/CommentListExtras$Follow;->fragment:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method cancelTap()V
    .registers 3

    .line 36
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    iget-object v1, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/CommentListExtras$Follow;->tapPosition:I

    return-void
.end method

.method clicks()V
    .registers 3

    .line 37
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    new-instance v1, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda2;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method items()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 35
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->fragment:Ljava/lang/Object;

    const-string v1, "e0"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method synthetic lambda$clicks$0$e-e-a-CommentListExtras$Follow(Ljava/lang/Object;Landroid/view/View;)V
    .locals 3
    const/4 v0, 0x0
    iput-object v0, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;
    const/4 v0, -0x1
    iput v0, p0, Le/e/a/CommentListExtras$Follow;->tapPosition:I
    iget-boolean v0, p0, Le/e/a/CommentListExtras$Follow;->active:Z
    if-eqz v0, :single_done
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->isAttachedToWindow()Z
    move-result v0
    if-eqz v0, :single_done
    :single_try
    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->items()Ljava/util/ArrayList;
    move-result-object v0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I
    move-result v0
    if-ltz v0, :single_done
    invoke-static {p2}, Le/e/a/CommentListExtras;->expandComment(Landroid/view/View;)V
    :single_end
    .catch Ljava/lang/Exception; {:single_try .. :single_end} :single_error
    goto :single_done
    :single_error
    move-exception v0
    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V
    :single_done
    return-void
.end method

.method synthetic lambda$clicks$1$e-e-a-CommentListExtras$Follow(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13

    .line 37
    iget-object p1, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result p1

    sub-int/2addr p3, p1

    :try_start_7
    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->items()Ljava/util/ArrayList;

    move-result-object p1

    if-ltz p3, :cond_83

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-lt p3, p4, :cond_14

    goto :goto_83

    :cond_14
    iget-object p4, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    if-eqz p4, :cond_69

    iget p4, p0, Le/e/a/CommentListExtras$Follow;->tapPosition:I

    if-ne p4, p3, :cond_69

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Le/e/a/CommentListExtras$Follow;->tapTime:J
    sub-long/2addr v0, v2
    const-wide/16 v2, 0x190
    cmp-long v4, v0, v2
    if-gtz v4, :cond_69
    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    iget-object p2, p0, Le/e/a/CommentListExtras$Follow;->fragment:Ljava/lang/Object;

    const-string p4, "b0"

    invoke-static {p2, p4}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    const-string p4, "a0"

    invoke-static {p2, p4}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    const-string p4, "getDuration"

    const/4 p5, 0x0

    new-array v0, p5, [Ljava/lang/Class;

    new-array v1, p5, [Ljava/lang/Object;

    invoke-static {p2, p4, v0, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Number;

    invoke-virtual {p4}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CommentListExtras;->time(Ljava/lang/Object;)J

    move-result-wide p3

    const-string p1, "seekTo"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, p5

    new-array v2, v2, [Ljava/lang/Object;

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-lez v6, :cond_5b

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p3

    :cond_5b
    invoke-static {v4, v5, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, v2, p5

    invoke-static {p2, p1, v3, v2}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_69
    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    iput p3, p0, Le/e/a/CommentListExtras$Follow;->tapPosition:I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Le/e/a/CommentListExtras$Follow;->tapTime:J

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    new-instance p3, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0, p1, p2}, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentListExtras$Follow;Ljava/lang/Object;Landroid/view/View;)V

    iput-object p3, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    iget-object p1, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    iget-object p2, p0, Le/e/a/CommentListExtras$Follow;->pendingTap:Ljava/lang/Runnable;

    const-wide/16 p3, 0x190

    invoke-virtual {p1, p2, p3, p4}, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_82} :catch_84

    goto :goto_88

    :cond_83
    :goto_83
    return-void

    :catch_84
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_88
    return-void
.end method

.method synthetic lambda$sort$2$e-e-a-CommentListExtras$Follow(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 10

    .line 38
    invoke-static {p1}, Le/e/a/CommentListExtras;->time(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {p1}, Le/e/a/CommentListExtras;->count(Ljava/lang/Object;)I

    move-result v2

    invoke-static {p2}, Le/e/a/CommentListExtras;->time(Ljava/lang/Object;)J

    move-result-wide v3

    invoke-static {p2}, Le/e/a/CommentListExtras;->count(Ljava/lang/Object;)I

    move-result v5

    iget-boolean v6, p0, Le/e/a/CommentListExtras$Follow;->byNicoru:Z

    invoke-static/range {v0 .. v6}, Le/e/a/CommentListRules;->compare(JIJIZ)I

    move-result p1

    return p1
.end method

.method public run()V
    .registers 8

    .line 40
    iget-boolean v0, p0, Le/e/a/CommentListExtras$Follow;->active:Z

    if-eqz v0, :cond_a6

    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_a6

    :cond_e
    :try_start_e
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->toggle:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_9f

    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_9f

    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->fragment:Ljava/lang/Object;

    const-string v1, "b0"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "a0"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getCurrentPosition"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->items()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    if-eqz v4, :cond_58

    iget-object v4, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    array-length v4, v4

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_75

    :cond_58
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [J

    iput-object v4, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    :goto_60
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_75

    iget-object v4, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Le/e/a/CommentListExtras;->time(Ljava/lang/Object;)J

    move-result-wide v5

    aput-wide v5, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_60

    :cond_75
    iget-object v2, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    invoke-static {v2, v0, v1}, Le/e/a/CommentFollowRules;->nearest([JJ)I

    move-result v2

    if-ltz v2, :cond_9b

    iget-object v3, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    iget-object v4, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v4

    add-int/2addr v4, v2

    invoke-static {v3, v4}, Le/e/a/Followup173;->followBottom(Landroid/widget/ListView;I)V

    iput v2, p0, Le/e/a/CommentListExtras$Follow;->lastIndex:I

    :cond_9b
    iput-wide v0, p0, Le/e/a/CommentListExtras$Follow;->last:J
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_9d} :catch_9e

    goto :goto_9f

    :catch_9e
    move-exception v0

    :cond_9f
    :goto_9f
    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a6
    :goto_a6
    return-void
.end method

.method sort()V
    .registers 5

    .line 38
    :try_start_0
    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->items()Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Le/e/a/CommentListExtras$Follow$$ExternalSyntheticLambda1;-><init>(Le/e/a/CommentListExtras$Follow;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v1, p0, Le/e/a/CommentListExtras$Follow;->fragment:Ljava/lang/Object;

    const-string v2, "g0"

    invoke-static {v1, v2}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "b"

    invoke-static {v1, v2}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_2a

    move-object v3, v2

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_2a
    check-cast v1, Landroid/widget/BaseAdapter;

    invoke-virtual {v1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object v1, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-static {v1}, Le/e/a/FeedbackDev10;->redraw(Landroid/widget/ListView;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/CommentListExtras$Follow;->positions:[J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/CommentListExtras$Follow;->last:J

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/CommentListExtras$Follow;->lastIndex:I
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    goto :goto_43

    :catch_3f
    move-exception v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_43
    return-void
.end method

.method stop()V
    .registers 2

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentListExtras$Follow;->active:Z

    invoke-virtual {p0}, Le/e/a/CommentListExtras$Follow;->cancelTap()V

    iget-object v0, p0, Le/e/a/CommentListExtras$Follow;->list:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method
