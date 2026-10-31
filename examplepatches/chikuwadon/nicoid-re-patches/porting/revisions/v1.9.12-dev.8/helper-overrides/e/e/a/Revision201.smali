.class public final Le/e/a/Revision201;
.super Ljava/lang/Object;
.source "Revision201.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Revision201$EditorLayout;,
        Le/e/a/Revision201$MenuWatch;,
        Le/e/a/Revision201$Watch;
    }
.end annotation


# static fields
.field static final CENTER_UNTIL:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field static final EDITORS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/Revision201$EditorLayout;",
            ">;"
        }
    .end annotation
.end field

.field static final FEEDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field static final MENUS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field static final MENU_BG:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field static final MENU_COLOR:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final NORMAL_FULL:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static final NORMAL_ORIGIN:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "[I>;"
        }
    .end annotation
.end field

.field static final WATCHES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/Revision201$Watch;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->CENTER_UNTIL:Ljava/util/Map;

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->WATCHES:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->EDITORS:Ljava/util/Map;

    .line 20
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/Revision201;->FEEDS:Ljava/util/Set;

    .line 21
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->MENU_COLOR:Ljava/util/Map;

    .line 22
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->MENU_BG:Ljava/util/Map;

    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/Revision201;->MENUS:Ljava/util/Set;

    .line 63
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->NORMAL_FULL:Ljava/util/Map;

    .line 64
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Revision201;->NORMAL_ORIGIN:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static varargs call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "e.e.a."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static center(Landroid/view/View;)V
    .locals 0
    invoke-static {p0}, Le/e/a/PopupVisibility246;->center(Landroid/view/View;)V
    return-void
.end method

.method static compact(Landroid/view/View;I)V
    .registers 7

    .line 80
    instance-of v0, p0, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    :cond_e
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_41

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_1c

    goto :goto_41

    :cond_1c
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, p1, :cond_2d

    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2d
    invoke-virtual {v2, v1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    invoke-virtual {v2, v3, v1, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-static {v2, p1}, Le/e/a/Revision201;->compact(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_41
    :goto_41
    return-void
.end method

.method static detach(Landroid/view/View;)V
    .registers 2

    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_11
    return-void
.end method

.method public static editor(Ljava/lang/Object;)V
    .registers 5

    .line 107
    :try_start_0
    const-string v0, "root"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    sget-object v1, Le/e/a/Revision201;->EDITORS:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    return-void

    :cond_11
    new-instance v1, Le/e/a/Revision201$EditorLayout;

    const-string v2, "preview"

    invoke-static {p0, v2}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const-string v3, "settings"

    invoke-static {p0, v3}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-direct {v1, v0, v2, p0}, Le/e/a/Revision201$EditorLayout;-><init>(Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/View;)V

    sget-object p0, Le/e/a/Revision201;->EDITORS:Ljava/util/Map;

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_31} :catch_32

    goto :goto_3a

    :catch_32
    move-exception p0

    const-string v0, "nicoid-ui"

    const-string v1, "Cannot arrange comment editor"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3a
    return-void
.end method

.method public static feed(Landroid/app/Activity;)V
    .registers 4

    .line 118
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_my_page"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_e

    return-void

    :cond_e
    const-string v0, "y"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_34

    check-cast p0, Landroid/view/View;

    sget-object v0, Le/e/a/Revision201;->FEEDS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    new-instance v0, Le/e/a/Revision201$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Le/e/a/Revision201$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v0, Le/e/a/Revision201$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Le/e/a/Revision201$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_32} :catch_33

    goto :goto_34

    :catch_33
    move-exception p0

    :cond_34
    :goto_34
    return-void
.end method

.method static feedWidth(Landroid/view/View;)V
    .registers 4

    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x320

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    if-ne v1, v0, :cond_22

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    if-eq v1, v0, :cond_2d

    :cond_22
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, v0, v1, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_2d
    return-void
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_4
    if-eqz v0, :cond_19

    :try_start_6
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_12} :catch_13

    return-object p0

    :catch_13
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    :cond_19
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static fillFrame(Landroid/view/View;Landroid/view/View;[IZ)V
    .registers 13

    .line 72
    if-eqz p1, :cond_ca

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_c

    goto/16 :goto_ca

    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 73
    sget-object v2, Le/e/a/Revision201;->NORMAL_ORIGIN:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_3b

    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_2d

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_30

    :cond_2d
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_30
    sget-object v6, Le/e/a/Revision201;->NORMAL_ORIGIN:Ljava/util/Map;

    iget v7, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    filled-new-array {v7, v4, v5, v2}, [I

    move-result-object v2

    invoke-interface {v6, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_3b
    const/4 v2, 0x2

    new-array v2, v2, [I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getLocationInWindow([I)V

    aget v4, p2, v3

    aget v5, v2, v3

    sub-int/2addr v4, v5

    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    const/4 v7, 0x1

    if-eq v5, v6, :cond_51

    const/4 v5, 0x1

    goto :goto_52

    :cond_51
    const/4 v5, 0x0

    :goto_52
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 75
    instance-of v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v6, :cond_80

    move-object v6, v1

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v8, v4, :cond_69

    iget v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-nez v8, :cond_69

    const/4 v8, 0x0

    goto :goto_6a

    :cond_69
    const/4 v8, 0x1

    :goto_6a
    or-int/2addr v5, v8

    iput v4, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v3, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eqz p3, :cond_80

    aget p2, p2, v7

    aget v2, v2, v7

    sub-int/2addr p2, v2

    iget v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v2, p2, :cond_7c

    const/4 v2, 0x1

    goto :goto_7d

    :cond_7c
    const/4 v2, 0x0

    :goto_7d
    or-int/2addr v5, v2

    iput p2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 76
    :cond_80
    if-eqz p3, :cond_aa

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const/16 p3, 0x20

    invoke-static {p2, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    iget p3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq p3, p2, :cond_91

    goto :goto_92

    :cond_91
    const/4 v7, 0x0

    :goto_92
    or-int/2addr v5, v7

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p1, p3, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    invoke-static {p1, p2}, Le/e/a/Revision201;->compact(Landroid/view/View;I)V

    .line 77
    :cond_aa
    if-eqz v5, :cond_af

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    :cond_af
    nop

    :goto_b0
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    if-eq v0, p0, :cond_c9

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/ViewGroup;

    if-nez p1, :cond_c1

    goto :goto_c9

    :cond_c1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_b0

    .line 79
    :cond_c9
    :goto_c9
    return-void

    .line 72
    :cond_ca
    :goto_ca
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 6

    .line 27
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v1, p1, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_19

    goto :goto_1d

    :cond_19
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :goto_1d
    return-object v0
.end method

.method static held(Landroid/content/Context;)Z
    .registers 3

    .line 28
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "player_controls_visibility_mode"

    const-string v1, "off"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "popup"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "both"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$0(Landroid/view/View;)V
    .registers 1

    .line 29
    invoke-static {p0}, Le/e/a/Revision201;->center(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/view/View;IIIIIIII)V
    .registers 9

    .line 118
    invoke-static {p0}, Le/e/a/Revision201;->feedWidth(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;)V
    .registers 1

    .line 118
    invoke-static {p0}, Le/e/a/Revision201;->feedWidth(Landroid/view/View;)V

    return-void
.end method

.method public static menuButton(Landroid/view/View;)V
    .registers 2

    .line 120
    sget-object v0, Le/e/a/Revision201;->MENUS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Le/e/a/Revision201$MenuWatch;

    invoke-direct {v0, p0}, Le/e/a/Revision201$MenuWatch;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Le/e/a/Revision201$MenuWatch;->add()V

    return-void
.end method

.method public static normal(Ljava/lang/Object;)V
    .registers 4

    .line 65
    :try_start_0
    const-string v0, "x1"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const-string v1, "r0"

    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v2, "B0"

    invoke-static {p0, v2}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_33

    if-nez v1, :cond_31

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-eq p0, v1, :cond_33

    :cond_31
    const/4 p0, 0x0

    goto :goto_34

    :cond_33
    const/4 p0, 0x1

    :goto_34
    sget-object v1, Le/e/a/Revision201;->NORMAL_FULL:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/Revision201;->normalFrame(Landroid/view/View;)V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_40} :catch_41

    goto :goto_42

    :catch_41
    move-exception p0

    :goto_42
    return-void
.end method

.method static normalFrame(Landroid/view/View;)V
    .registers 8

    invoke-static {p0}, Le/e/a/PortraitTimeline213;->update(Landroid/view/View;)V

    .line 66
    sget-object v0, Le/e/a/Revision201;->NORMAL_FULL:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-nez v0, :cond_e

    return-void

    :cond_e
    invoke-static {p0}, Le/e/a/FullscreenScreen203;->layout(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_15

    return-void

    :cond_15
    invoke-static {p0}, Le/e/a/FullscreenViewport209;->side(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1c

    return-void

    :cond_1c
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "player_controls_visibility_mode"

    const-string v3, "off"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "normal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b8

    const-string v2, "both"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    goto/16 :goto_b8

    :cond_3e
    invoke-static {p0}, Le/e/a/Revision201;->pictureWidth(Landroid/view/View;)V

    const-string v1, "titlebar"

    invoke-static {p0, v1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "controller"

    invoke-static {p0, v2}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    const-string v3, "bottommenulay"

    invoke-static {p0, v3}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 67
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v4, 0x0

    if-nez v0, :cond_6d

    invoke-static {v1}, Le/e/a/Revision201;->restoreFrame(Landroid/view/View;)V

    invoke-static {v2}, Le/e/a/Revision201;->restoreFrame(Landroid/view/View;)V

    if-eqz v3, :cond_66

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/view/View;->setTranslationX(F)V

    :cond_66
    invoke-static {p0, v4}, Le/e/a/PlayerFrame202;->normal(Landroid/view/View;Z)V

    invoke-static {p0}, Le/e/a/PortraitTimeline213;->update(Landroid/view/View;)V

    return-void

    .line 68
    :cond_6d
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_b7

    if-nez v1, :cond_76

    goto :goto_b7

    :cond_76
    const/4 v0, 0x2

    new-array v5, v0, [I

    invoke-virtual {p0, v5}, Landroid/view/View;->getLocationInWindow([I)V

    .line 69
    const/4 v6, 0x1

    invoke-static {p0, v1, v5, v6}, Le/e/a/Revision201;->fillFrame(Landroid/view/View;Landroid/view/View;[IZ)V

    invoke-static {p0, v2, v5, v4}, Le/e/a/Revision201;->fillFrame(Landroid/view/View;Landroid/view/View;[IZ)V

    invoke-static {p0, v6}, Le/e/a/PlayerFrame202;->normal(Landroid/view/View;Z)V

    .line 70
    if-eqz v3, :cond_b6

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_b6

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    new-array v0, v0, [I

    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    aget v2, v5, v4

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    add-int/2addr v2, p0

    aget p0, v0, v4

    sub-int/2addr v2, p0

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result p0

    sub-int/2addr v2, p0

    int-to-float p0, v2

    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    move-result v0

    cmpl-float v0, v0, p0

    if-eqz v0, :cond_b6

    invoke-virtual {v3, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 71
    :cond_b6
    return-void

    .line 68
    :cond_b7
    :goto_b7
    return-void

    .line 66
    :cond_b8
    :goto_b8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {p0, v0}, Le/e/a/PlayerFrame202;->edge(Landroid/view/View;Z)V

    return-void
.end method

.method static pictureWidth(Landroid/view/View;)V
    .registers 10

    .line 57
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a2

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-gtz v1, :cond_10

    goto/16 :goto_a2

    :cond_10
    const-string v1, "video"

    invoke-static {p0, v1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "video_view"

    invoke-static {p0, v2}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    const-string v3, "commentlay"

    invoke-static {p0, v3}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 58
    const/4 v3, 0x3

    new-array v4, v3, [Landroid/view/View;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    aput-object v2, v4, v1

    const/4 v1, 0x2

    aput-object p0, v4, v1

    const/4 v1, 0x0

    :goto_2f
    if-lt v1, v3, :cond_73

    .line 59
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_72

    check-cast p0, Landroid/view/ViewGroup;

    :goto_37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v5, v1, :cond_3e

    goto :goto_72

    :cond_3e
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "e.e.a.t"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5a

    const-string v3, "e.e.a.u"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    :cond_5a
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    if-eq v3, v4, :cond_6f

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6f
    add-int/lit8 v5, v5, 0x1

    goto :goto_37

    .line 60
    :cond_72
    :goto_72
    return-void

    .line 58
    :cond_73
    aget-object v2, v4, v1

    if-eqz v2, :cond_9f

    invoke-virtual {v2, v5}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    if-eqz v6, :cond_8a

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_8a

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v2, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_8a
    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_9f

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-nez v7, :cond_98

    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eqz v7, :cond_9f

    :cond_98
    iput v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {v2, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 57
    :cond_a2
    :goto_a2
    return-void
.end method

.method public static popupLayout(Ljava/lang/Object;Landroid/view/View;)V
    .registers 8

    .line 38
    const-string v0, "controller"

    invoke-static {p1, v0}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 39
    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 40
    :cond_1e
    const-string v0, "popup-custom-controls"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 41
    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_3c

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    :goto_2b
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lt v2, v3, :cond_32

    goto :goto_3c

    :cond_32
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Le/e/a/Revision201;->small(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 42
    :cond_3c
    :goto_3c
    const-string v0, "infobutton"

    invoke-static {p1, v0}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_47

    invoke-static {v0}, Le/e/a/Revision201;->small(Landroid/view/View;)V

    .line 43
    :cond_47
    invoke-static {p1}, Le/e/a/Revision201;->center(Landroid/view/View;)V

    .line 45
    :try_start_4a
    const-string v0, "U"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    if-lez v2, :cond_59

    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_5d

    :cond_59
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    :goto_5d
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    if-lez v3, :cond_68

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    goto :goto_6a

    :cond_68
    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 46
    :goto_6a
    invoke-static {p0, p1}, Le/e/a/PlayerFrame202;->popupBounds(Ljava/lang/Object;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v5, v4, Landroid/graphics/Rect;->right:I

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 47
    sub-int/2addr v5, v3

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v5, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int/2addr v4, v2

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v4, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 48
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    if-ne v3, v2, :cond_98

    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    if-eq v1, v2, :cond_b3

    :cond_98
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-static {p0, v0}, Le/e/a/Revision201;->savePosition(Ljava/lang/Object;Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_b3

    const-string v1, "b"

    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0, p1, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_b0} :catch_b1

    goto :goto_b2

    .line 49
    :catch_b1
    move-exception p0

    :goto_b2
    nop

    .line 50
    :cond_b3
    return-void
.end method

.method public static popupWidth(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)I
    .registers 7

    .line 53
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "U"

    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_3a

    if-gtz v2, :cond_1e

    :try_start_d
    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_1e

    :catch_1c
    move-exception p0

    goto :goto_3c

    :cond_1e
    :goto_1e
    if-lez v2, :cond_3c

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_3c

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    if-eq v3, v2, :cond_3c

    const-string v3, "b"

    invoke-static {p0, v3}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0, p1, v1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_39} :catch_1c

    goto :goto_3c

    :catch_3a
    move-exception p0

    const/4 v2, 0x0

    .line 54
    :cond_3c
    :goto_3c
    if-gtz v2, :cond_42

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v2

    :cond_42
    invoke-virtual {p2, v0}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumWidth(I)V

    const/high16 p0, -0x1000000

    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 55
    return v2
.end method

.method public static previewFont(Ljava/lang/Object;Landroid/graphics/Paint;)V
    .registers 4

    .line 100
    :try_start_0
    const-string v0, "dense"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_43

    const-string v0, "draft"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "values"

    invoke-static {v0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x5

    aget v0, v0, v1

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int/2addr p0, v0

    int-to-float p0, p0

    const v0, 0x3f970a3d    # 1.18f

    div-float/2addr p0, v0

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    cmpl-float v0, v0, p0

    if-lez v0, :cond_43

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setTextSize(F)V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_41} :catch_42

    goto :goto_43

    :catch_42
    move-exception p0

    .line 101
    :cond_43
    :goto_43
    return-void
.end method

.method public static previewLabel(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 3

    .line 98
    if-eqz p1, :cond_a

    const/16 p1, 0xa

    const/16 v0, 0x20

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    :cond_a
    return-object p0
.end method

.method public static previewSize(Landroid/view/View;I)[I
    .registers 7

    .line 103
    int-to-float v0, p1

    const/high16 v1, 0x41100000    # 9.0f

    mul-float v0, v0, v1

    const/high16 v2, 0x41800000    # 16.0f

    div-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 104
    if-lez v3, :cond_32

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/16 v4, 0x48

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float v3, v3

    const v4, 0x3ee66666    # 0.45f

    mul-float v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {p0, v3}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 105
    :cond_32
    int-to-float p0, v0

    mul-float p0, p0, v2

    div-float/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    filled-new-array {p0, v0}, [I

    move-result-object p0

    return-object p0
.end method

.method public static previewY(Landroid/view/View;IIFZ)F
    .registers 8

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p3}, Ljava/lang/Math;->max(FF)F

    move-result p3

    const/high16 v0, 0x3f000000    # 0.5f

    const/4 v1, 0x1

    if-eqz p4, :cond_1b

    if-gt p2, v1, :cond_1b

    mul-float p0, p0, v0

    const p1, 0x3eb33333    # 0.35f

    mul-float p3, p3, p1

    add-float/2addr p0, p3

    return p0

    :cond_1b
    if-eqz p4, :cond_3a

    const p4, 0x3e19999a    # 0.15f

    mul-float p4, p4, p3

    sub-float p4, p0, p4

    const v0, 0x3f933333    # 1.15f

    mul-float v0, v0, p3

    sub-float/2addr p0, v0

    int-to-float p1, p1

    mul-float p0, p0, p1

    sub-int/2addr p2, v1

    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p0, p1

    add-float/2addr p3, p0

    invoke-static {p4, p3}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0

    .line 96
    :cond_3a
    const p4, 0x3faccccd    # 1.35f

    mul-float p4, p4, p3

    const v2, 0x40133333    # 2.3f

    mul-float p3, p3, v2

    sub-float/2addr p0, p3

    invoke-static {p4, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    sub-float/2addr p0, p4

    int-to-float p1, p1

    add-float/2addr p1, v0

    mul-float p0, p0, p1

    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p0, p1

    add-float/2addr p4, p0

    return p4
.end method

.method public static rankingChanged(Landroid/app/Activity;)V
    .registers 3

    .line 139
    :try_start_0
    const-string v0, "C"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/BaseAdapter;

    if-eqz v1, :cond_f

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    :cond_f
    const-string v0, "A"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Landroid/widget/ListView;

    if-eqz v0, :cond_31

    check-cast p0, Landroid/widget/ListView;

    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    instance-of v0, p0, Landroid/widget/BaseAdapter;

    if-eqz v0, :cond_31

    check-cast p0, Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    goto :goto_31

    :catch_29
    move-exception p0

    const-string v0, "nicoid-ranking"

    const-string v1, "Cannot refresh ranking rows"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_31
    :goto_31
    return-void
.end method

.method static restoreFrame(Landroid/view/View;)V
    .registers 5

    .line 81
    if-nez p0, :cond_3

    return-void

    :cond_3
    sget-object v0, Le/e/a/Revision201;->NORMAL_ORIGIN:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    if-nez v0, :cond_e

    return-void

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/4 v2, 0x0

    aget v2, v0, v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_2d

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v3, 0x1

    aget v3, v0, v3

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    const/4 v3, 0x2

    aget v3, v0, v3

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    const/4 v3, 0x3

    aget v0, v0, v3

    iput v0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_2d
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static savePosition(Ljava/lang/Object;Landroid/view/WindowManager$LayoutParams;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "u0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v0, "v0"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-virtual {p0, v2, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    return-void
.end method

.method public static selectMenu(Ljava/lang/Object;)V
    .registers 9

    .line 130
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidCacheManagerActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v1, "G"

    goto :goto_15

    :cond_13
    const-string v1, "k0"
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_90

    .line 132
    :goto_15
    const-string v2, "Z"

    if-nez v0, :cond_44

    :try_start_19
    const-string v3, "o0"

    invoke-static {p0, v3}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_21} :catch_90

    :try_start_21
    const-string v4, "F"

    invoke-static {v3, v4}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_44

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "NicoidVideoListFragment"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-static {v3, v2}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Landroid/view/View;
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_3f} :catch_43

    if-eqz v4, :cond_44

    move-object p0, v3

    goto :goto_44

    :catch_43
    move-exception v3

    .line 133
    :cond_44
    :goto_44
    :try_start_44
    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_67

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz v0, :cond_5a

    const-string v4, "s"

    goto :goto_5c

    :cond_5a
    const-string v4, "Y"

    :goto_5c
    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_67
    const-string v1, "BulkSelection"

    const-string v4, "modeChanged"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Object;

    aput-object v7, v6, v3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v3

    invoke-static {v1, v4, v6, v5}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    if-eqz v0, :cond_7d

    const-string v2, "y"

    :cond_7d
    invoke-static {p0, v2}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const v0, 0x7f0801be

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_98

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_8f} :catch_90

    .line 137
    goto :goto_98

    :catch_90
    move-exception p0

    const-string v0, "nicoid-selection"

    const-string v1, "Cannot enter selection"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 138
    :cond_98
    :goto_98
    return-void
.end method

.method public static selectionEntry(Landroid/view/Menu;Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4

    .line 82
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-nez v1, :cond_d

    const/4 v1, 0x0

    invoke-interface {p0, v1, v0, v1, p1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    goto :goto_11

    :cond_d
    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    :goto_11
    return-object p0
.end method

.method static small(Landroid/view/View;)V
    .registers 3

    .line 61
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_7

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_a

    :cond_7
    const v0, 0x3f6147ae    # 0.88f

    :goto_a
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_15

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    :cond_15
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_20

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    :cond_20
    return-void
.end method

.method public static tap(Landroid/view/View;)V
    .registers 6

    .line 29
    if-eqz p0, :cond_2a

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Revision201;->held(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_2a

    :cond_d
    sget-object v0, Le/e/a/Revision201;->CENTER_UNTIL:Ljava/util/Map;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x708

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/Revision201;->center(Landroid/view/View;)V

    new-instance v0, Le/e/a/Revision201$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Le/e/a/Revision201$$ExternalSyntheticLambda2;-><init>(Landroid/view/View;)V

    const-wide/16 v1, 0x712

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2a
    :goto_2a
    return-void
.end method

.method public static watchButtons(Landroid/view/View;)V
    .registers 3

    .line 83
    if-eqz p0, :cond_1e

    sget-object v0, Le/e/a/Revision201;->WATCHES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_1e

    :cond_b
    new-instance v0, Le/e/a/Revision201$Watch;

    invoke-direct {v0, p0}, Le/e/a/Revision201$Watch;-><init>(Landroid/view/View;)V

    sget-object v1, Le/e/a/Revision201;->WATCHES:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v0}, Le/e/a/Revision201$Watch;->add()V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    :goto_1e
    return-void
.end method
