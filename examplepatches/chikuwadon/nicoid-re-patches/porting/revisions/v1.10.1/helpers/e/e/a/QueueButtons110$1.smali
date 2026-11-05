.class Le/e/a/QueueButtons110$1;
.super Ljava/lang/Object;
.source "QueueButtons110.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/QueueButtons110;->bind(Landroid/view/View;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field claimed:Z

.field owner:Ljava/lang/Object;

.field popup:Z

.field private final synthetic val$explicit:Ljava/lang/Object;

.field private final synthetic val$forward:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;Z)V
    .registers 3

    .line 5
    iput-object p1, p0, Le/e/a/QueueButtons110$1;->val$explicit:Ljava/lang/Object;

    iput-boolean p2, p0, Le/e/a/QueueButtons110$1;->val$forward:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 6

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_6a

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->val$explicit:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    instance-of p2, p2, Landroid/app/Service;

    iput-boolean p2, p0, Le/e/a/QueueButtons110$1;->popup:Z

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    if-nez p2, :cond_2c

    :try_start_16
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_2c

    const-string p2, "v"

    invoke-static {p1, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_2a} :catch_2b

    goto :goto_2c

    :catch_2b
    move-exception p1

    :cond_2c
    :goto_2c
    sget-object p1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    :try_start_2e
    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    if-eqz p2, :cond_60

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    invoke-static {p2}, Le/e/a/ManualQueue119;->owns(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4a

    sget-object p2, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_61

    sget-object p2, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_61

    :cond_4a
    if-eqz p1, :cond_60

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    iget-boolean v0, p0, Le/e/a/QueueButtons110$1;->popup:Z

    if-eqz v0, :cond_55

    const-string v0, "O"

    goto :goto_57

    :cond_55
    const-string v0, "C1"

    :goto_57
    invoke-static {p2, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    iget-object p1, p1, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    if-ne p2, p1, :cond_60

    goto :goto_61

    :cond_60
    const/4 v2, 0x0

    :cond_61
    :goto_61
    iput-boolean v2, p0, Le/e/a/QueueButtons110$1;->claimed:Z
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_63} :catch_64

    goto :goto_67

    :catch_64
    move-exception p1

    iput-boolean v1, p0, Le/e/a/QueueButtons110$1;->claimed:Z

    :goto_67
    iget-boolean p1, p0, Le/e/a/QueueButtons110$1;->claimed:Z

    return p1

    :cond_6a
    iget-boolean v0, p0, Le/e/a/QueueButtons110$1;->claimed:Z

    if-nez v0, :cond_6f

    return v1

    :cond_6f
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v2, :cond_b8

    iput-boolean v1, p0, Le/e/a/QueueButtons110$1;->claimed:Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v2, :cond_c7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_c7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_c7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_c7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_c7

    iget-object p2, p0, Le/e/a/QueueButtons110$1;->owner:Ljava/lang/Object;

    iget-boolean v0, p0, Le/e/a/QueueButtons110$1;->val$forward:Z

    iget-boolean v1, p0, Le/e/a/QueueButtons110$1;->popup:Z

    invoke-static {p2, v0, v1}, Le/e/a/TabPlayback110;->move(Ljava/lang/Object;ZZ)Z

    move-result p2

    if-nez p2, :cond_c7

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    goto :goto_c7

    :cond_b8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_c5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-le p1, v2, :cond_c7

    :cond_c5
    iput-boolean v1, p0, Le/e/a/QueueButtons110$1;->claimed:Z

    :cond_c7
    :goto_c7
    return v2
.end method
