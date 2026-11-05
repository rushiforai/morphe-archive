.class Le/e/a/ThemeChoice$1;
.super Ljava/lang/Object;
.source "ThemeChoice.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ThemeChoice;->apply(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;)V
    .registers 2

    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ListDividers191;->tree(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerTheme;->detailRows(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;)V
    .registers 2

    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->controls(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiTheme191;->activity(Landroid/app/Activity;)V

    invoke-static {p0}, Le/e/a/CustomTheme119;->activity(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ListDividers191;->tree(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;)V
    .registers 2

    .line 54
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->controls(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiTheme191;->activity(Landroid/app/Activity;)V

    invoke-static {p0}, Le/e/a/CustomTheme119;->activity(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ListDividers191;->tree(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4

    .line 50
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    new-instance v0, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda7;

    invoke-direct {v0, p1}, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    new-instance v0, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda8;

    invoke-direct {v0, p1}, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 64
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 61
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    .line 53
    invoke-static {p1}, Le/e/a/VideoMarks119;->changed(Landroid/content/Context;)V

    .line 54
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda6;

    invoke-direct {v1, p1}, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 55
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    # invokes: Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;
    invoke-static {p1}, Le/e/a/ThemeChoice;->access$1(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 56
    if-eqz v0, :cond_4c

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4c

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_4c

    .line 57
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Le/e/a/ThemeChoice$Refresh;

    invoke-direct {v1, p1}, Le/e/a/ThemeChoice$Refresh;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 60
    :cond_4c
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 63
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 51
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 62
    return-void
.end method
