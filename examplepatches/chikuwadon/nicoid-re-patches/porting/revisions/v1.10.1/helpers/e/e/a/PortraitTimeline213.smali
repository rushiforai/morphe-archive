.class public final Le/e/a/PortraitTimeline213;
.super Ljava/lang/Object;
.source "PortraitTimeline213.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PortraitTimeline213$State;
    }
.end annotation


# static fields
.field private static final STATES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/PortraitTimeline213$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PortraitTimeline213;->STATES:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 8
    instance-of v0, p0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_c

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/widget/RelativeLayout$LayoutParams;)V

    return-object v0

    :cond_c
    instance-of v0, p0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_18

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object v0

    :cond_18
    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_24

    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    :cond_24
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static restore(Landroid/view/View;)V
    .registers 2

    .line 10
    sget-object v0, Le/e/a/PortraitTimeline213;->STATES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PortraitTimeline213$State;

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Le/e/a/PortraitTimeline213$State;->restore()V

    :cond_d
    return-void
.end method

.method public static update(Landroid/view/View;)V
    .registers 5

    if-eqz p0, :cond_41

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_41

    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "controller"

    invoke-static {p0, v1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    instance-of v2, v0, Landroid/widget/RelativeLayout;

    if-eqz v2, :cond_40

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_40

    sget-object v2, Le/e/a/PortraitTimeline213;->STATES:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/PortraitTimeline213$State;

    if-nez v3, :cond_3d

    new-instance v3, Le/e/a/PortraitTimeline213$State;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-direct {v3, p0, v0, v1}, Le/e/a/PortraitTimeline213$State;-><init>(Landroid/view/View;Landroid/widget/RelativeLayout;Landroid/view/View;)V

    invoke-interface {v2, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3d
    invoke-virtual {v3}, Le/e/a/PortraitTimeline213$State;->apply()V

    :cond_40
    return-void

    :cond_41
    invoke-static {p0}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V

    return-void
.end method
