.class public final Le/e/a/Followup3;
.super Ljava/lang/Object;
.source "Followup3.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Followup3$Job;
    }
.end annotation


# static fields
.field static final jobs:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/Followup3$Job;",
            ">;"
        }
    .end annotation
.end field

.field static final loading:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final main:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Followup3;->main:Landroid/os/Handler;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    .line 14
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/Followup3;->loading:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beforeResults(Ljava/lang/Object;)V
    .registers 2

    .line 10
    sget-object v0, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    :try_start_9
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_14} :catch_15

    goto :goto_19

    :catch_15
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_19
    return-void
.end method

.method public static button(Landroid/widget/Button;)V
    .registers 10

    .line 7
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->amoled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_f
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_28

    move-object v1, v0

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0801a7

    if-ne v1, v2, :cond_23

    invoke-static {p0}, Le/e/a/Followup3;->tagButton(Landroid/widget/Button;)V

    return-void

    :cond_23
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_f

    :cond_28
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3ee66666    # 0.45f

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v1, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v3, -0xededee

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x4

    invoke-static {v3, v4}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingRight()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    const v8, 0xffffff

    and-int/2addr v0, v8

    const/high16 v8, 0x33000000

    or-int/2addr v0, v8

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {v7, v0, v2, v6}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1, v3, v4, v5}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method

.method public static connected(Ljava/net/HttpURLConnection;)V
    .registers 3

    .line 16
    sget-object v0, Le/e/a/Followup3;->loading:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Le/e/a/Followup3;->loading:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    invoke-static {v0, p0}, Le/e/a/Followup3;->connection(Ljava/lang/Object;Ljava/net/HttpURLConnection;)V

    return-void
.end method

.method public static connection(Ljava/lang/Object;Ljava/net/HttpURLConnection;)V
    .registers 5

    .line 17
    sget-object v0, Le/e/a/Followup3;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/Followup3$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/Followup3$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "request: host="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    sget-object p0, Le/e/a/Followup3;->main:Landroid/os/Handler;

    new-instance v0, Le/e/a/Followup3$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Le/e/a/Followup3$$ExternalSyntheticLambda2;-><init>(Ljava/net/HttpURLConnection;)V

    const-wide/16 v1, 0x4e20

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static done(Ljava/lang/Object;Z)V
    .registers 7

    .line 11
    sget-object v0, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/Followup3$Job;

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v1, v0, Le/e/a/Followup3$Job;->swipe:Ljava/lang/Object;

    invoke-static {v1}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    if-eqz p1, :cond_16

    invoke-static {p0}, Le/e/a/Followup3;->hideLoading(Ljava/lang/Object;)V

    goto :goto_1a

    :cond_16
    const/4 v1, 0x0

    invoke-static {p0, v1}, Le/e/a/Followup3;->footer(Ljava/lang/Object;Z)V

    :goto_1a
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refresh "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    if-eqz p1, :cond_2a

    const-string p1, "completed"

    goto :goto_2c

    :cond_2a
    const-string p1, "failed"

    :goto_2c
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " elapsedMs="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Le/e/a/Followup3$Job;->start:J

    sub-long/2addr v1, v3

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static failure(Ljava/lang/Exception;)V
    .registers 3

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "request failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    return-void
.end method

.method static footer(Ljava/lang/Object;Z)V
    .registers 7

    .line 12
    :try_start_0
    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "z0"

    invoke-static {p0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_28

    if-eqz p1, :cond_15

    const-string p1, "addFooterView"

    goto :goto_17

    :cond_15
    const-string p1, "removeFooterView"

    :goto_17
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/view/View;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    invoke-static {v0, p1, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    goto :goto_28

    :catch_27
    move-exception p0

    :cond_28
    :goto_28
    return-void
.end method

.method static hideLoading(Ljava/lang/Object;)V
    .registers 4

    .line 13
    :try_start_0
    const-string v0, "c"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    goto :goto_c

    :catch_b
    move-exception p0

    :goto_c
    return-void
.end method

.method public static http(Ljava/net/HttpURLConnection;)V
    .registers 3

    .line 18
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1b

    goto :goto_1f

    :catch_1b
    move-exception p0

    invoke-static {p0}, Le/e/a/Followup3;->failure(Ljava/lang/Exception;)V

    :goto_1f
    return-void
.end method

.method static synthetic lambda$connection$1(Ljava/lang/Object;Ljava/net/HttpURLConnection;)V
    .registers 5

    .line 17
    sget-object v0, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Followup3$Job;

    iget-object v2, v1, Le/e/a/Followup3$Job;->loader:Ljava/lang/Object;

    if-ne v2, p0, :cond_a

    iput-object p1, v1, Le/e/a/Followup3$Job;->connection:Ljava/net/HttpURLConnection;

    goto :goto_a

    :cond_1d
    return-void
.end method

.method static synthetic lambda$connection$2(Ljava/net/HttpURLConnection;)V
    .registers 3

    .line 17
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/Followup3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/Followup3$$ExternalSyntheticLambda0;-><init>(Ljava/net/HttpURLConnection;)V

    const-string p0, "search-deadline"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic lambda$refresh$0(Ljava/lang/Object;Le/e/a/Followup3$Job;Ljava/lang/Object;)V
    .registers 5

    .line 9
    sget-object v0, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_9

    return-void

    :cond_9
    iget-object v0, p1, Le/e/a/Followup3$Job;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_21

    new-instance v0, Ljava/lang/Thread;

    iget-object p1, p1, Le/e/a/Followup3$Job;->connection:Ljava/net/HttpURLConnection;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/Followup3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Le/e/a/Followup3$$ExternalSyntheticLambda0;-><init>(Ljava/net/HttpURLConnection;)V

    const-string p1, "search-timeout"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_21
    invoke-static {p2}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/Followup3;->hideLoading(Ljava/lang/Object;)V

    const/4 p1, 0x0

    invoke-static {p0, p1}, Le/e/a/Followup3;->footer(Ljava/lang/Object;Z)V

    const-string p1, "refresh watchdog: 20s exceeded"

    invoke-static {p1}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    :try_start_30
    const-string p1, "o0"

    invoke-static {p0, p1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    const-string p1, "\u691c\u7d22\u306e\u66f4\u65b0\u304c\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8\u3057\u307e\u3057\u305f\u3002\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_46} :catch_47

    goto :goto_48

    :catch_47
    move-exception p0

    :goto_48
    return-void
.end method

.method public static loading(Ljava/lang/Object;)V
    .registers 2

    .line 15
    sget-object v0, Le/e/a/Followup3;->loading:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public static parsed(I)V
    .registers 3

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parsed videos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    return-void
.end method

.method static record(Ljava/lang/String;)V
    .registers 8

    .line 6
    const-string v0, "nicoid-search"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_5
    const-string v0, "ModernDebug"

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Search: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception p0

    :goto_2d
    return-void
.end method

.method public static refresh(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    .line 9
    const-string v0, "a"

    const-string v1, "o"

    const-string v2, "n"

    :try_start_6
    const-string v3, "c0"

    invoke-static {p0, v3}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_96

    invoke-static {v3, v2}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1c

    goto/16 :goto_96

    :cond_1c
    const-string v4, "PageCache"

    const-string v5, "refresh"

    const/4 v6, 0x0

    new-array v7, v6, [Ljava/lang/Class;

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {v4, v5, v7, v8}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v3, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    new-instance v5, Le/e/a/Followup3$Job;

    invoke-direct {v5, v3, p1}, Le/e/a/Followup3$Job;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v7, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v7, p0, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x1

    if-eqz v4, :cond_42

    invoke-static {p0, v7}, Le/e/a/Followup3;->footer(Ljava/lang/Object;Z)V

    :cond_42
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v2, v4}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "j"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3, v4, v7}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "f"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3, v4, v7}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "i"

    const/16 v7, 0x19

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3, v4, v7}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v1, v4}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "b"

    invoke-static {v3, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v3, v0, v1}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v3, v2, v1}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "refresh start: page=1, counters reset"

    invoke-static {v1}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    new-array v1, v6, [Ljava/lang/Class;

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v3, v0, v1, v2}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/Followup3;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/Followup3$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v5, p1}, Le/e/a/Followup3$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Le/e/a/Followup3$Job;Ljava/lang/Object;)V

    const-wide/16 v2, 0x4e20

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_c9

    :cond_96
    :goto_96
    invoke-static {p1}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    const-string v0, "refresh ignored: request in flight or missing loader"

    invoke-static {v0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_9e} :catch_9f

    return-void

    :catch_9f
    move-exception v0

    sget-object v1, Le/e/a/Followup3;->jobs:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "refresh error: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_c9
    return-void
.end method

.method public static tagButton(Landroid/widget/Button;)V
    .registers 10

    .line 8
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xededee

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingRight()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    const v8, 0xffffff

    and-int/2addr v0, v8

    const/high16 v8, 0x33000000

    or-int/2addr v0, v8

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {v7, v0, v1, v6}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method
