.class Le/e/a/PopupFrame233$State$1;
.super Ljava/lang/Object;
.source "PopupFrame233.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PopupFrame233$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/PopupFrame233$State;


# direct methods
.method constructor <init>(Le/e/a/PopupFrame233$State;)V
    .registers 2

    .line 6
    iput-object p1, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 6
    iget-object v0, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    iget-object v0, v0, Le/e/a/PopupFrame233$State;->video:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    iget-object v1, v1, Le/e/a/PopupFrame233$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v0, :cond_4b

    if-nez v1, :cond_17

    goto :goto_4b

    :cond_17
    :try_start_17
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "isPlaying"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_39

    iget-object v1, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    invoke-virtual {v1}, Le/e/a/PopupFrame233$State;->clear()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_37} :catch_38

    return-void

    :catch_38
    move-exception v1

    :cond_39
    iget-object v1, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    iget-object v1, v1, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    if-eqz v1, :cond_4a

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_4a

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4a
    return-void

    :cond_4b
    :goto_4b
    iget-object v0, p0, Le/e/a/PopupFrame233$State$1;->this$1:Le/e/a/PopupFrame233$State;

    invoke-virtual {v0}, Le/e/a/PopupFrame233$State;->dispose()V

    return-void
.end method
