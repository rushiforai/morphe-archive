.class public final Ltll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/LayoutInflater$Factory2;


# static fields
.field public static final e:[Ljava/lang/Class;

.field public static final f:[Ljava/lang/String;

.field public static final g:Landroidx/collection/ArrayMap;

.field public static final h:Ljava/util/HashMap;


# instance fields
.field public final a:[Ljava/lang/Object;

.field public final b:Lpp1;

.field public final c:Ldll;

.field public final d:Lqp2;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const-class v0, Landroid/content/Context;

    const-class v1, Landroid/util/AttributeSet;

    filled-new-array {v0, v1}, [Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Ltll;->e:[Ljava/lang/Class;

    const-string v0, "android.view."

    const-string v1, "android.webkit."

    const-string v2, "android.widget."

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ltll;->f:[Ljava/lang/String;

    new-instance v0, Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    sput-object v0, Ltll;->g:Landroidx/collection/ArrayMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Ltll;->h:Ljava/util/HashMap;

    const v1, 0x7f04012d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Ljp1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0401a6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Llp1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0407f7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lfq1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040545

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Landroidx/appcompat/widget/AppCompatImageButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x1010084

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lyq1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0403f4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lbq1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040084

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lgp1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Ldq1;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040841

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Landroidx/appcompat/widget/AppCompatSeekBar;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040165

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/opera/android/custom_views/CardView;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f04092e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040a1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040026

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x101006c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/opera/android/custom_views/CheckBox;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x101007e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040020

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0409d2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040687

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0401cb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f04095f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f04049c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f04089e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/slider/Slider;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Lcom/opera/android/widget/GradientSlider;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Lcom/google/android/material/slider/h;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Lcom/opera/android/widget/ScheduleRangeSlider;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f040055

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f04062f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0401d8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f0406d1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-class v2, Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpp1;Ldll;Lqp2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Ltll;->a:[Ljava/lang/Object;

    iput-object p1, p0, Ltll;->b:Lpp1;

    iput-object p2, p0, Ltll;->c:Ldll;

    iput-object p3, p0, Ltll;->d:Lqp2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .registers 6

    sget-object v0, Ltll;->g:Landroidx/collection/ArrayMap;

    invoke-virtual {v0, p2}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    if-nez v1, :cond_2d

    :try_start_a
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    if-eqz p3, :cond_15

    invoke-virtual {p3, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_16

    :cond_15
    move-object p3, p2

    :goto_16
    invoke-virtual {p1, p3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-class p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    sget-object p3, Ltll;->e:[Ljava/lang/Class;

    invoke-virtual {p1, p3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v0, p2, v1}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2d
    iget-object p0, p0, Ltll;->a:[Ljava/lang/Object;

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_35} :catch_36

    return-object p0

    :catch_36
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 39

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    iget-object v5, v0, Ltll;->b:Lpp1;

    invoke-virtual {v5, v2, v3, v4}, Lpp1;->a(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v5

    const/4 v6, 0x3

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    if-nez v5, :cond_64

    iget-object v5, v0, Ltll;->a:[Ljava/lang/Object;

    const-string v10, "view"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_26

    const-string v2, "class"

    invoke-interface {v4, v8, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_26
    :try_start_26
    aput-object v3, v5, v9

    aput-object v4, v5, v7

    const/16 v10, 0x2e

    invoke-virtual {v2, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/4 v11, -0x1

    if-ne v11, v10, :cond_4f

    move v10, v9

    :goto_34
    sget-object v11, Ltll;->f:[Ljava/lang/String;

    if-ge v10, v6, :cond_49

    aget-object v11, v11, v10

    invoke-virtual {v0, v3, v2, v11}, Ltll;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v11
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_3e} :catch_5f
    .catchall {:try_start_26 .. :try_end_3e} :catchall_59

    if-eqz v11, :cond_46

    aput-object v8, v5, v9

    aput-object v8, v5, v7

    move-object v5, v11

    goto :goto_64

    :cond_46
    add-int/lit8 v10, v10, 0x1

    goto :goto_34

    :cond_49
    aput-object v8, v5, v9

    aput-object v8, v5, v7

    :goto_4d
    move-object v5, v8

    goto :goto_64

    :cond_4f
    :try_start_4f
    invoke-virtual {v0, v3, v2, v8}, Ltll;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_53} :catch_5f
    .catchall {:try_start_4f .. :try_end_53} :catchall_59

    aput-object v8, v5, v9

    aput-object v8, v5, v7

    move-object v5, v2

    goto :goto_64

    :catchall_59
    move-exception v0

    aput-object v8, v5, v9

    aput-object v8, v5, v7

    throw v0

    :catch_5f
    aput-object v8, v5, v9

    aput-object v8, v5, v7

    goto :goto_4d

    :cond_64
    :goto_64
    if-nez v5, :cond_67

    return-object v8

    :cond_67
    sget v2, Ltpj;->a:I

    move-object v2, v3

    :goto_6a
    instance-of v10, v2, Landroid/content/ContextWrapper;

    if-eqz v10, :cond_79

    instance-of v10, v2, Ltpj;

    if-nez v10, :cond_838

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    goto :goto_6a

    :cond_79
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    :goto_7d
    const-class v10, Ljava/lang/Object;

    if-eq v2, v10, :cond_95

    sget-object v10, Ltll;->h:Ljava/util/HashMap;

    invoke-virtual {v10, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    if-eqz v10, :cond_90

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_96

    :cond_90
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_7d

    :cond_95
    move v2, v9

    :goto_96
    new-instance v10, Lzg;

    invoke-direct {v10, v5, v4, v2}, Lzg;-><init>(Landroid/view/View;Landroid/util/AttributeSet;I)V

    iget-object v11, v10, Lzg;->b:Ljava/lang/Object;

    check-cast v11, Landroid/view/View;

    sget-object v12, Lu8n;->h:[I

    invoke-static {v10, v12}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    if-eqz v12, :cond_b2

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v12, v13}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v13

    if-nez v13, :cond_b2

    move-object v12, v8

    :cond_b2
    if-eqz v1, :cond_b8

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    :cond_b8
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    new-instance v14, Ljava/util/ArrayDeque;

    invoke-direct {v14}, Ljava/util/ArrayDeque;-><init>()V

    move v15, v7

    :goto_c2
    instance-of v7, v13, Landroid/content/ContextWrapper;

    if-eqz v7, :cond_114

    if-eq v13, v3, :cond_114

    check-cast v13, Landroid/content/ContextWrapper;

    invoke-virtual {v13}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v13}, Landroid/content/ContextWrapper;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v8

    if-eq v6, v8, :cond_10f

    if-eqz v15, :cond_de

    if-eqz v12, :cond_de

    const/4 v9, 0x0

    goto :goto_10d

    :cond_de
    instance-of v6, v13, Landroid/view/ContextThemeWrapper;

    if-eqz v6, :cond_fc

    check-cast v13, Landroid/view/ContextThemeWrapper;

    new-instance v6, Lt8n;

    const-string v8, "getThemeResId"

    new-array v15, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v13, v8, v9, v15}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-direct {v6, v13, v8}, Lt8n;-><init>(Landroid/content/ContextWrapper;I)V

    invoke-virtual {v14, v6}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    goto :goto_10d

    :cond_fc
    const/4 v9, 0x0

    instance-of v6, v13, Lft5;

    if-eqz v6, :cond_10d

    check-cast v13, Lft5;

    new-instance v6, Lt8n;

    iget v8, v13, Lft5;->a:I

    invoke-direct {v6, v13, v8}, Lt8n;-><init>(Landroid/content/ContextWrapper;I)V

    invoke-virtual {v14, v6}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    :cond_10d
    :goto_10d
    const/4 v15, 0x0

    goto :goto_110

    :cond_10f
    const/4 v9, 0x0

    :goto_110
    move-object v13, v7

    move-object v8, v9

    const/4 v9, 0x0

    goto :goto_c2

    :cond_114
    move-object v9, v8

    iget-object v3, v0, Ltll;->c:Ldll;

    if-nez v12, :cond_11f

    invoke-virtual {v14}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_122

    :cond_11f
    invoke-static {v3, v5, v12, v14}, Lu8n;->f(Ldll;Landroid/view/View;Lff2;Ljava/util/ArrayDeque;)V

    :cond_122
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v6

    const v7, 0x7f0a04f0

    if-ne v6, v7, :cond_140

    instance-of v6, v11, Landroid/widget/ImageView;

    if-eqz v6, :cond_140

    move-object v6, v5

    check-cast v6, Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const v12, 0x1010214

    invoke-static {v12, v8}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_140
    instance-of v6, v5, Lcom/opera/android/custom_views/StylingTextView;

    if-nez v6, :cond_147

    invoke-static {v10}, Lxf8;->r(Lzg;)V

    :cond_147
    invoke-virtual {v5}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_168

    invoke-virtual {v5}, Landroid/view/View;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object v8

    if-nez v8, :cond_168

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    sget-object v12, Lkhh;->S:[I

    const/4 v13, 0x0

    invoke-virtual {v8, v4, v12, v2, v13}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-virtual {v2, v13, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-static {v5, v6, v4}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    :cond_168
    instance-of v2, v5, Landroid/widget/TextView;

    if-nez v2, :cond_170

    instance-of v4, v5, Lcom/opera/android/custom_views/TabCountButton;

    if-eqz v4, :cond_1ac

    :cond_170
    sget-object v4, Ly8n;->r:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v4, Ly8n;->s:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v4, Ly8n;->t:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v4, Ly8n;->u:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    invoke-static/range {v20 .. v20}, Lff2;->b(Lff2;)Z

    move-result v4

    if-eqz v4, :cond_1a0

    invoke-static/range {v21 .. v21}, Lff2;->b(Lff2;)Z

    move-result v4

    if-eqz v4, :cond_1a0

    invoke-static/range {v22 .. v22}, Lff2;->b(Lff2;)Z

    move-result v4

    if-eqz v4, :cond_1a0

    invoke-static/range {v23 .. v23}, Lff2;->b(Lff2;)Z

    move-result v4

    if-nez v4, :cond_1ac

    :cond_1a0
    new-instance v19, Ly8n;

    const/16 v24, 0x3

    invoke-direct/range {v19 .. v24}, Ly8n;-><init>(Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v4, v19

    invoke-static {v3, v10, v4}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_1ac
    instance-of v4, v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_1d1

    sget-object v4, Lv8n;->j:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v4

    sget-object v6, Lv8n;->k:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    invoke-static {v4}, Lff2;->b(Lff2;)Z

    move-result v8

    if-eqz v8, :cond_1c8

    invoke-static {v6}, Lff2;->b(Lff2;)Z

    move-result v8

    if-nez v8, :cond_1d1

    :cond_1c8
    new-instance v8, Lv8n;

    const/4 v12, 0x3

    invoke-direct {v8, v4, v6, v12}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v8}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_1d1
    instance-of v4, v5, Lcom/google/android/material/appbar/AppBarLayout;

    if-nez v4, :cond_21e

    instance-of v6, v5, Landroidx/cardview/widget/CardView;

    if-nez v6, :cond_21e

    invoke-virtual {v11}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v6, v7, :cond_1e3

    instance-of v6, v11, Landroid/widget/ImageView;

    if-nez v6, :cond_21e

    :cond_1e3
    instance-of v6, v5, Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v6, :cond_1ee

    sget-object v6, Lw8n;->e:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v8

    goto :goto_1ef

    :cond_1ee
    move-object v8, v9

    :goto_1ef
    if-nez v8, :cond_1f7

    sget-object v6, Lw8n;->f:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v8

    :cond_1f7
    if-eqz v8, :cond_21e

    sget-object v6, Lw8n;->h:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-nez v6, :cond_207

    sget-object v6, Lw8n;->g:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    :cond_207
    sget-object v7, Lw8n;->j:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    if-nez v7, :cond_215

    sget-object v7, Lw8n;->i:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    :cond_215
    new-instance v9, Lw8n;

    const/4 v13, 0x0

    invoke-direct {v9, v8, v6, v7, v13}, Lw8n;-><init>(Lff2;Lff2;Lff2;B)V

    invoke-static {v3, v10, v9}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_21e
    sget-object v6, Lv8n;->l:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    const/4 v7, 0x4

    if-eqz v6, :cond_235

    sget-object v8, Lv8n;->m:[I

    invoke-static {v10, v8}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v8

    new-instance v9, Lv8n;

    invoke-direct {v9, v6, v8, v7}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v9}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_235
    sget-object v6, Lx8n;->f:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-eqz v6, :cond_246

    new-instance v8, Lx8n;

    const/4 v12, 0x3

    invoke-direct {v8, v6, v12}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v8}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_246
    sget-object v6, Lx8n;->c:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    invoke-static {v6}, Lff2;->b(Lff2;)Z

    move-result v8

    if-nez v8, :cond_25b

    new-instance v8, Lx8n;

    const/4 v13, 0x0

    invoke-direct {v8, v6, v13}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v8}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_25b
    instance-of v6, v5, Lcom/opera/android/custom_views/CardView;

    if-nez v6, :cond_263

    instance-of v8, v5, Landroidx/cardview/widget/CardView;

    if-eqz v8, :cond_274

    :cond_263
    sget-object v8, Lx8n;->d:[I

    invoke-static {v10, v8}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v8

    if-eqz v8, :cond_274

    new-instance v9, Lx8n;

    const/4 v11, 0x1

    invoke-direct {v9, v8, v11}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v9}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_274
    const/4 v8, 0x2

    if-eqz v6, :cond_287

    sget-object v6, Lx8n;->e:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-eqz v6, :cond_287

    new-instance v9, Lx8n;

    invoke-direct {v9, v6, v8}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v9}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_287
    instance-of v6, v5, Landroidx/appcompat/widget/SwitchCompat;

    const/16 v9, 0x9

    if-eqz v6, :cond_2e2

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v11, v10, Lzg;->c:Ljava/lang/Object;

    check-cast v11, Landroid/util/AttributeSet;

    sget-object v12, Lzhh;->x:[I

    iget v13, v10, Lzg;->a:I

    const/4 v14, 0x0

    invoke-virtual {v6, v11, v12, v13, v14}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v6

    new-instance v11, Landroid/util/TypedValue;

    invoke-direct {v11}, Landroid/util/TypedValue;-><init>()V

    const/16 v12, 0xb

    invoke-virtual {v6, v12, v11}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v12

    if-eqz v12, :cond_2ae

    iget v12, v11, Landroid/util/TypedValue;->resourceId:I

    goto :goto_2af

    :cond_2ae
    const/4 v12, 0x0

    :goto_2af
    invoke-virtual {v6, v8, v11}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v13

    if-eqz v13, :cond_2b8

    iget v13, v11, Landroid/util/TypedValue;->resourceId:I

    goto :goto_2b9

    :cond_2b8
    const/4 v13, 0x0

    :goto_2b9
    const/16 v14, 0xc

    invoke-virtual {v6, v14, v11}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v14

    if-eqz v14, :cond_2c4

    iget v14, v11, Landroid/util/TypedValue;->resourceId:I

    goto :goto_2c5

    :cond_2c4
    const/4 v14, 0x0

    :goto_2c5
    invoke-virtual {v6, v9, v11}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v15

    if-eqz v15, :cond_2ce

    iget v11, v11, Landroid/util/TypedValue;->resourceId:I

    goto :goto_2cf

    :cond_2ce
    const/4 v11, 0x0

    :goto_2cf
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    if-nez v12, :cond_2da

    if-nez v13, :cond_2da

    if-nez v14, :cond_2da

    if-eqz v11, :cond_2e2

    :cond_2da
    new-instance v6, Lc9n;

    invoke-direct {v6, v13, v12, v11, v14}, Lc9n;-><init>(IIII)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_2e2
    instance-of v6, v5, Landroid/widget/ScrollView;

    if-nez v6, :cond_2ee

    instance-of v6, v5, Landroid/widget/AbsListView;

    if-nez v6, :cond_2ee

    instance-of v6, v5, Ltpi;

    if-eqz v6, :cond_2fb

    :cond_2ee
    instance-of v6, v5, Lcom/opera/android/theme/ThemeableRecyclerView;

    if-nez v6, :cond_2fb

    new-instance v6, Lrpm;

    const/4 v11, 0x1

    invoke-direct {v6, v10, v11}, Lrpm;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_2fb
    instance-of v6, v5, Landroidx/appcompat/widget/AppCompatSeekBar;

    if-eqz v6, :cond_32f

    new-instance v19, La9n;

    sget-object v6, La9n;->z:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, La9n;->A:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, La9n;->B:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, La9n;->C:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v6, La9n;->D:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v6, La9n;->E:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    const/16 v26, 0x3

    invoke-direct/range {v19 .. v26}, La9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_32f
    instance-of v6, v5, Landroidx/appcompat/widget/Toolbar;

    if-eqz v6, :cond_365

    sget-object v6, Lg9n;->j:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-nez v6, :cond_341

    sget-object v6, Lg9n;->k:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    :cond_341
    move-object/from16 v24, v6

    new-instance v19, Lg9n;

    sget-object v6, Lg9n;->f:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, Lg9n;->g:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, Lg9n;->h:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, Lg9n;->i:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    invoke-direct/range {v19 .. v24}, Lg9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_365
    instance-of v6, v5, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    if-nez v6, :cond_36b

    const/4 v14, 0x1

    goto :goto_386

    :cond_36b
    new-instance v6, Lw8n;

    sget-object v11, Lw8n;->k:[I

    invoke-static {v10, v11}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v11

    sget-object v12, Lw8n;->l:[I

    invoke-static {v10, v12}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    sget-object v13, Lw8n;->m:[I

    invoke-static {v10, v13}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v13

    const/4 v14, 0x1

    invoke-direct {v6, v11, v12, v13, v14}, Lw8n;-><init>(Lff2;Lff2;Lff2;B)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :goto_386
    instance-of v6, v5, Landroid/widget/ImageView;

    if-eqz v6, :cond_3b0

    sget-object v11, Lz8n;->d:[I

    invoke-static {v10, v11}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v11

    if-eqz v11, :cond_39b

    new-instance v12, Lz8n;

    invoke-direct {v12, v11, v14}, Lz8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    goto :goto_3b0

    :cond_39b
    instance-of v11, v5, Landroidx/appcompat/widget/AppCompatImageView;

    if-eqz v11, :cond_3b0

    sget-object v11, Lz8n;->c:[I

    invoke-static {v10, v11}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v11

    if-eqz v11, :cond_3b0

    new-instance v12, Lz8n;

    const/4 v13, 0x0

    invoke-direct {v12, v11, v13}, Lz8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_3b0
    :goto_3b0
    sget-object v11, Lx8n;->g:[I

    invoke-static {v10, v11}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v11

    sget-object v12, Lx8n;->h:[I

    invoke-static {v10, v12}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    sget-object v13, Lx8n;->i:[I

    invoke-static {v10, v13}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v13

    invoke-static {v11}, Lff2;->b(Lff2;)Z

    move-result v14

    if-eqz v14, :cond_3d4

    invoke-static {v12}, Lff2;->b(Lff2;)Z

    move-result v14

    if-eqz v14, :cond_3d4

    invoke-static {v13}, Lff2;->b(Lff2;)Z

    move-result v14

    if-nez v14, :cond_3ed

    :cond_3d4
    invoke-static {v11}, Lff2;->b(Lff2;)Z

    move-result v14

    if-eqz v14, :cond_3e3

    invoke-static {v12}, Lff2;->b(Lff2;)Z

    move-result v11

    if-nez v11, :cond_3e2

    move-object v11, v12

    goto :goto_3e3

    :cond_3e2
    move-object v11, v13

    :cond_3e3
    :goto_3e3
    if-eqz v6, :cond_3ed

    new-instance v6, Lx8n;

    invoke-direct {v6, v11, v7}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_3ed
    instance-of v6, v5, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v6, :cond_41d

    sget-object v6, Ly8n;->h:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, Ly8n;->i:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, Ly8n;->f:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, Ly8n;->g:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    if-nez v20, :cond_411

    if-nez v21, :cond_411

    if-nez v22, :cond_411

    if-eqz v23, :cond_41d

    :cond_411
    new-instance v19, Ly8n;

    const/16 v24, 0x0

    invoke-direct/range {v19 .. v24}, Ly8n;-><init>(Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_41d
    instance-of v6, v5, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v6, :cond_47d

    sget-object v6, Ld9n;->m:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, Ld9n;->x:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v26

    sget-object v6, Ld9n;->y:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v27

    sget-object v6, Ld9n;->z:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v28

    sget-object v6, Ld9n;->A:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v29

    sget-object v6, Ld9n;->B:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v30

    sget-object v6, Ld9n;->C:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v31

    sget-object v6, Ld9n;->n:[I

    sget-object v7, Ld9n;->o:[I

    invoke-static {v10, v6, v7}, Ld9n;->b(Lzg;[I[I)Lmgh;

    move-result-object v21

    sget-object v6, Ld9n;->p:[I

    sget-object v7, Ld9n;->q:[I

    invoke-static {v10, v6, v7}, Ld9n;->b(Lzg;[I[I)Lmgh;

    move-result-object v22

    sget-object v6, Ld9n;->r:[I

    sget-object v7, Ld9n;->s:[I

    invoke-static {v10, v6, v7}, Ld9n;->b(Lzg;[I[I)Lmgh;

    move-result-object v23

    sget-object v6, Ld9n;->t:[I

    sget-object v7, Ld9n;->u:[I

    invoke-static {v10, v6, v7}, Ld9n;->b(Lzg;[I[I)Lmgh;

    move-result-object v24

    sget-object v6, Ld9n;->v:[I

    sget-object v7, Ld9n;->w:[I

    invoke-static {v10, v6, v7}, Ld9n;->b(Lzg;[I[I)Lmgh;

    move-result-object v25

    new-instance v19, Ld9n;

    invoke-direct/range {v19 .. v31}, Ld9n;-><init>(Lff2;Lmgh;Lmgh;Lmgh;Lmgh;Lmgh;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_47d
    instance-of v6, v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v6, :cond_4ad

    sget-object v6, Ly8n;->j:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, Ly8n;->k:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, Ly8n;->l:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, Ly8n;->m:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    if-nez v20, :cond_4a1

    if-nez v21, :cond_4a1

    if-nez v22, :cond_4a1

    if-eqz v23, :cond_4ad

    :cond_4a1
    new-instance v19, Ly8n;

    const/16 v24, 0x1

    invoke-direct/range {v19 .. v24}, Ly8n;-><init>(Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_4ad
    instance-of v6, v5, Lcom/google/android/material/checkbox/MaterialCheckBox;

    const/4 v7, 0x7

    if-eqz v6, :cond_4ca

    sget-object v6, Lv8n;->r:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    sget-object v11, Lv8n;->s:[I

    invoke-static {v10, v11}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v11

    if-nez v6, :cond_4c2

    if-eqz v11, :cond_4ca

    :cond_4c2
    new-instance v12, Lv8n;

    invoke-direct {v12, v6, v11, v7}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_4ca
    instance-of v6, v5, Lwdd;

    const/4 v11, 0x5

    if-eqz v6, :cond_4df

    sget-object v6, Lx8n;->j:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-eqz v6, :cond_4df

    new-instance v12, Lx8n;

    invoke-direct {v12, v6, v11}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_4df
    instance-of v6, v5, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v6, :cond_4eb

    new-instance v6, Lf9n;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_4eb
    instance-of v6, v5, Lcom/opera/android/custom_views/PageDotIndicator;

    if-eqz v6, :cond_4ff

    sget-object v6, Lx8n;->l:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-eqz v6, :cond_4ff

    new-instance v12, Lx8n;

    invoke-direct {v12, v6, v7}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_4ff
    instance-of v6, v5, Lcom/google/android/material/chip/Chip;

    if-eqz v6, :cond_53f

    sget-object v6, La9n;->h:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, La9n;->i:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, La9n;->j:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, La9n;->k:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v6, La9n;->l:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v6, La9n;->m:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    if-nez v20, :cond_533

    if-nez v21, :cond_533

    if-nez v22, :cond_533

    if-nez v23, :cond_533

    if-nez v24, :cond_533

    if-eqz v25, :cond_53f

    :cond_533
    new-instance v19, La9n;

    const/16 v26, 0x0

    invoke-direct/range {v19 .. v26}, La9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_53f
    instance-of v6, v5, Lcom/google/android/material/tabs/TabLayout;

    if-eqz v6, :cond_573

    sget-object v6, La9n;->F:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, La9n;->G:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, La9n;->H:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, La9n;->I:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v6, La9n;->J:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v6, La9n;->K:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    new-instance v19, La9n;

    const/16 v26, 0x4

    invoke-direct/range {v19 .. v26}, La9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_573
    instance-of v6, v5, Landroid/widget/AutoCompleteTextView;

    if-eqz v6, :cond_598

    sget-object v6, Lv8n;->f:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    sget-object v7, Lv8n;->g:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    invoke-static {v6}, Lff2;->b(Lff2;)Z

    move-result v12

    if-eqz v12, :cond_58f

    invoke-static {v7}, Lff2;->b(Lff2;)Z

    move-result v12

    if-nez v12, :cond_598

    :cond_58f
    new-instance v12, Lv8n;

    const/4 v14, 0x1

    invoke-direct {v12, v6, v7, v14}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_598
    instance-of v6, v5, Lcom/opera/android/widget/MenuSettingsListItem;

    const/16 v7, 0x8

    if-eqz v6, :cond_5b6

    sget-object v6, Lv8n;->t:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    sget-object v12, Lv8n;->u:[I

    invoke-static {v10, v12}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    if-nez v6, :cond_5ae

    if-eqz v12, :cond_5b6

    :cond_5ae
    new-instance v13, Lv8n;

    invoke-direct {v13, v6, v12, v7}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v13}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_5b6
    instance-of v6, v5, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v6, :cond_5c8

    sget-object v6, Lx8n;->m:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    new-instance v12, Lx8n;

    invoke-direct {v12, v6, v7}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_5c8
    instance-of v6, v5, Lcom/opera/android/StatusBarDrawingFrameLayout;

    if-eqz v6, :cond_5ee

    sget-object v6, Lv8n;->x:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    sget-object v7, Lv8n;->y:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    invoke-static {v6}, Lff2;->b(Lff2;)Z

    move-result v12

    if-eqz v12, :cond_5e4

    invoke-static {v7}, Lff2;->b(Lff2;)Z

    move-result v12

    if-nez v12, :cond_5ee

    :cond_5e4
    new-instance v12, Lv8n;

    const/16 v13, 0xa

    invoke-direct {v12, v6, v7, v13}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v12}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_5ee
    instance-of v6, v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v6, :cond_62e

    sget-object v6, La9n;->n:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, La9n;->o:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, La9n;->p:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, La9n;->q:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v6, La9n;->r:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v6, La9n;->s:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    if-nez v20, :cond_622

    if-nez v21, :cond_622

    if-nez v22, :cond_622

    if-nez v23, :cond_622

    if-nez v24, :cond_622

    if-eqz v25, :cond_62e

    :cond_622
    new-instance v19, La9n;

    const/16 v26, 0x1

    invoke-direct/range {v19 .. v26}, La9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_62e
    instance-of v6, v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_662

    new-instance v19, La9n;

    sget-object v6, La9n;->t:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v6, La9n;->u:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v6, La9n;->v:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v6, La9n;->w:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v6, La9n;->x:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v6, La9n;->y:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    const/16 v26, 0x2

    invoke-direct/range {v19 .. v26}, La9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;B)V

    move-object/from16 v6, v19

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_662
    instance-of v6, v5, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v6, :cond_67a

    new-instance v6, Lv8n;

    sget-object v7, Lv8n;->v:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    sget-object v12, Lv8n;->w:[I

    invoke-static {v10, v12}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    invoke-direct {v6, v7, v12, v9}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_67a
    instance-of v6, v5, Lcom/google/android/material/slider/Slider;

    if-nez v6, :cond_682

    instance-of v7, v5, Lcom/google/android/material/slider/h;

    if-eqz v7, :cond_6e0

    :cond_682
    new-instance v19, Lb9n;

    sget-object v7, Lb9n;->o:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v20

    sget-object v7, Lb9n;->p:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v21

    sget-object v7, Lb9n;->q:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v22

    sget-object v7, Lb9n;->r:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v23

    sget-object v7, Lb9n;->s:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v24

    sget-object v7, Lb9n;->t:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v25

    sget-object v7, Lb9n;->u:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v26

    sget-object v7, Lb9n;->v:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v27

    sget-object v7, Lb9n;->w:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v28

    sget-object v7, Lb9n;->x:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v29

    sget-object v7, Lb9n;->y:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v30

    sget-object v7, Lb9n;->z:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v31

    sget-object v7, Lb9n;->A:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v32

    sget-object v7, Lb9n;->B:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v33

    invoke-direct/range {v19 .. v33}, Lb9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V

    move-object/from16 v7, v19

    invoke-static {v3, v10, v7}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_6e0
    if-eqz v6, :cond_6f6

    new-instance v6, Lv8n;

    sget-object v7, Lv8n;->n:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    sget-object v9, Lv8n;->o:[I

    invoke-static {v10, v9}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v9

    invoke-direct {v6, v7, v9, v11}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v6}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_6f6
    if-eqz v4, :cond_711

    sget-object v4, Lv8n;->d:[I

    invoke-static {v10, v4}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v4

    sget-object v6, Lv8n;->e:[I

    invoke-static {v10, v6}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    if-nez v4, :cond_708

    if-eqz v6, :cond_711

    :cond_708
    new-instance v7, Lv8n;

    const/4 v13, 0x0

    invoke-direct {v7, v6, v4, v13}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v7}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_711
    instance-of v4, v5, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    const/4 v6, 0x6

    if-eqz v4, :cond_72a

    new-instance v4, Lv8n;

    sget-object v7, Lv8n;->p:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    sget-object v9, Lv8n;->q:[I

    invoke-static {v10, v9}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v9

    invoke-direct {v4, v7, v9, v6}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v4}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_72a
    instance-of v4, v5, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v4, :cond_742

    new-instance v4, Lv8n;

    sget-object v7, Lv8n;->h:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    sget-object v9, Lv8n;->i:[I

    invoke-static {v10, v9}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v9

    invoke-direct {v4, v7, v9, v8}, Lv8n;-><init>(Lff2;Lff2;B)V

    invoke-static {v3, v10, v4}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_742
    instance-of v4, v5, Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz v4, :cond_754

    new-instance v4, Lx8n;

    sget-object v7, Lx8n;->k:[I

    invoke-static {v10, v7}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    invoke-direct {v4, v7, v6}, Lx8n;-><init>(Lff2;B)V

    invoke-static {v3, v10, v4}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_754
    if-eqz v2, :cond_7b2

    sget-object v2, Le9n;->h:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    sget-object v2, Le9n;->i:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v13

    sget-object v2, Le9n;->j:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v14

    sget-object v2, Le9n;->k:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v15

    sget-object v2, Le9n;->l:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v16

    sget-object v2, Le9n;->m:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v17

    sget-object v2, Le9n;->n:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v18

    invoke-static {v12}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static {v13}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static {v14}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static {v15}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static/range {v16 .. v16}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static/range {v17 .. v17}, Lff2;->b(Lff2;)Z

    move-result v2

    if-eqz v2, :cond_7aa

    invoke-static/range {v18 .. v18}, Lff2;->b(Lff2;)Z

    move-result v2

    if-nez v2, :cond_7b2

    :cond_7aa
    new-instance v11, Le9n;

    invoke-direct/range {v11 .. v18}, Le9n;-><init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V

    invoke-static {v3, v10, v11}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_7b2
    instance-of v2, v5, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v2, :cond_7e0

    sget-object v2, Ly8n;->n:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v12

    sget-object v2, Ly8n;->o:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v13

    sget-object v2, Ly8n;->p:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v14

    sget-object v2, Ly8n;->q:[I

    invoke-static {v10, v2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v15

    if-nez v12, :cond_7d6

    if-nez v13, :cond_7d6

    if-nez v14, :cond_7d6

    if-eqz v15, :cond_7e0

    :cond_7d6
    new-instance v11, Ly8n;

    const/16 v16, 0x2

    invoke-direct/range {v11 .. v16}, Ly8n;-><init>(Lff2;Lff2;Lff2;Lff2;B)V

    invoke-static {v3, v10, v11}, Lu8n;->a(Ldll;Lzg;Lr8n;)V

    :cond_7e0
    iget-object v0, v0, Ltll;->d:Lqp2;

    if-eqz v0, :cond_838

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    instance-of v0, v5, Landroid/widget/TextView;

    if-eqz v0, :cond_811

    move-object v0, v5

    check-cast v0, Landroid/widget/TextView;

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/widget/TextView;->isTextSelectable()Z

    move-result v2

    if-nez v2, :cond_7f9

    instance-of v2, v0, Landroid/widget/EditText;

    if-eqz v2, :cond_838

    :cond_7f9
    new-instance v2, Lwe;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x7f0a0c65

    if-ne v3, v4, :cond_809

    sget v3, Lhrj;->f:I

    and-int/lit8 v3, v3, -0x2

    goto :goto_80b

    :cond_809
    sget v3, Lhrj;->f:I

    :goto_80b
    invoke-direct {v2, v0, v3}, Lwe;-><init>(Landroid/widget/TextView;I)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    :cond_811
    instance-of v0, v5, Landroidx/appcompat/view/menu/ListMenuItemView;

    if-eqz v0, :cond_838

    instance-of v0, v1, Lgud;

    if-eqz v0, :cond_838

    move-object v0, v1

    check-cast v0, Lim7;

    invoke-static {v0}, Lq9n;->m(Lim7;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_838

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    move-object v1, v5

    check-cast v1, Landroidx/appcompat/view/menu/ListMenuItemView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    invoke-virtual {v1, v0}, Lqwe;->b(Landroid/view/View;)V

    :cond_838
    return-object v5
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 4

    .line 2105
    const/4 p0, 0x0

    return-object p0
.end method
