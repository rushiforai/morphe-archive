.class public final Le/e/a/LayoutRepair216;
.super Ljava/lang/Object;
.source "LayoutRepair216.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/LayoutRepair216$Guard;
    }
.end annotation


# static fields
.field private static final GUARDS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/LayoutRepair216$Guard;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/WeakHashMap;
    .registers 1

    .line 17
    sget-object v0, Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method public static compatible(Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 5

    .line 22
    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    instance-of v0, p0, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_2

    instance-of v0, p1, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_2

    .line 24
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    .line 26
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 27
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 30
    :cond_1
    return-object p0

    .line 32
    :cond_2
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3

    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v0, :cond_3

    .line 33
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0

    .line 34
    :cond_3
    instance-of p0, p0, Landroid/widget/RelativeLayout;

    if-eqz p0, :cond_4

    instance-of p0, p1, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez p0, :cond_4

    .line 35
    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0

    .line 36
    :cond_4
    return-object p1

    .line 22
    :cond_5
    :goto_0
    return-object p1
.end method

.method public static sanitize(Landroid/view/View;)V
    .registers 7

    .line 41
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 42
    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    .line 43
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 44
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 46
    invoke-static {p0, v2}, Le/e/a/LayoutRepair216;->compatible(Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 47
    if-eq v2, v3, :cond_1

    .line 48
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Corrected "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 50
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " params "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 51
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " -> "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 52
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    const-string v3, "nicoid-mini"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    :cond_1
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    invoke-static {v1}, Le/e/a/LayoutRepair216;->sanitize(Landroid/view/View;)V

    .line 43
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_3
    return-void
.end method

.method public static watch(Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 64
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 67
    invoke-static {v0}, Le/e/a/LayoutRepair216;->sanitize(Landroid/view/View;)V

    .line 68
    sget-object v0, Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/LayoutRepair216$Guard;

    .line 69
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Le/e/a/LayoutRepair216$Guard;->cancel()V

    .line 70
    :cond_1
    new-instance v0, Le/e/a/LayoutRepair216$Guard;

    invoke-direct {v0, p0, p1}, Le/e/a/LayoutRepair216$Guard;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 71
    sget-object p1, Le/e/a/LayoutRepair216;->GUARDS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    invoke-virtual {v0}, Le/e/a/LayoutRepair216$Guard;->schedule()V

    .line 73
    return-void

    .line 65
    :cond_2
    :goto_0
    return-void
.end method
