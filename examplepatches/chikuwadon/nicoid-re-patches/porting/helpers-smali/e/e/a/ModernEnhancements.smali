.class public final Le/e/a/ModernEnhancements;
.super Ljava/lang/Object;
.source "ModernEnhancements.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ModernEnhancements$State;
    }
.end annotation


# static fields
.field private static final SIZES:[F

.field private static final SPEEDS:[F

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/ModernEnhancements$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    sget-object v0, Le/e/a/PlaybackSession;->SPEEDS:[F

    sput-object v0, Le/e/a/ModernEnhancements;->SPEEDS:[F

    .line 26
    const/4 v0, 0x5

    new-array v0, v0, [F

    fill-array-data v0, :array_14

    sput-object v0, Le/e/a/ModernEnhancements;->SIZES:[F

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    return-void

    :array_14
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
        0x3fb33333    # 1.4f
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 11

    .line 81
    const-string v0, "popup-modern-controls"

    const-string v1, "id"

    move-object v2, p0

    check-cast v2, Landroid/app/Service;

    .line 82
    invoke-static {v2}, Le/e/a/ModernEnhancements;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "app_lang"

    const-string v5, "0"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 84
    :try_start_16
    const-string v3, "a"

    invoke-static {p0, v3}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 85
    invoke-static {v3}, Le/e/a/PlayerIcons;->attach(Landroid/view/View;)V

    .line 86
    instance-of v4, v3, Le/e/a/PopupPinchLayout;

    if-eqz v4, :cond_2b

    move-object v4, v3

    check-cast v4, Le/e/a/PopupPinchLayout;

    invoke-virtual {v4, p0}, Le/e/a/PopupPinchLayout;->bind(Ljava/lang/Object;)V

    .line 87
    :cond_2b
    invoke-virtual {v2}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "topmenulay"

    invoke-virtual {v2}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v1, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 88
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 89
    instance-of v5, v4, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_c6

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_49

    goto/16 :goto_c6

    .line 90
    :cond_49
    new-instance v5, Le/e/a/ModernEnhancements$State;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Le/e/a/ModernEnhancements$State;-><init>(Le/e/a/ModernEnhancements$1;)V

    .line 91
    sget-object v6, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v6, p0, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 93
    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 94
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 95
    const/16 v7, 0x15

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 96
    const-string v7, "\u901f\u5ea6"

    new-instance v8, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda5;

    invoke-direct {v8, p0}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda5;-><init>(Ljava/lang/Object;)V

    invoke-static {v2, v6, v7, v8}, Le/e/a/ModernEnhancements;->button(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    iput-object v7, v5, Le/e/a/ModernEnhancements$State;->speed:Landroid/widget/Button;

    .line 97
    const-string v7, "\u753b\u8cea"

    new-instance v8, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda6;

    invoke-direct {v8, p0}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Object;)V

    invoke-static {v2, v6, v7, v8}, Le/e/a/ModernEnhancements;->button(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    iput-object v7, v5, Le/e/a/ModernEnhancements$State;->quality:Landroid/widget/Button;

    .line 98
    const-string v7, "\u30eb\u30fc\u30d7"

    new-instance v8, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda7;

    invoke-direct {v8, p0, v2}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda7;-><init>(Ljava/lang/Object;Landroid/app/Service;)V

    invoke-static {v2, v6, v7, v8}, Le/e/a/ModernEnhancements;->button(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    iput-object v7, v5, Le/e/a/ModernEnhancements$State;->loop:Landroid/widget/Button;

    .line 107
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 108
    invoke-virtual {v2}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    const/high16 v8, 0x42300000    # 44.0f

    mul-float v7, v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    const/4 v8, -0x2

    invoke-direct {v5, v8, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 109
    const/16 v7, 0xa

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 110
    invoke-virtual {v2}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "commentbutton"

    invoke-virtual {v2}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v1, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v5, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 111
    check-cast v4, Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v6, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    invoke-static {p0}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V

    .line 113
    invoke-static {v3}, Le/e/a/PopupOverlay;->attach(Landroid/view/View;)V
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_c5} :catch_c7

    .line 114
    goto :goto_cb

    .line 89
    :cond_c6
    :goto_c6
    return-void

    .line 114
    :catch_c7
    move-exception p0

    invoke-static {v2, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 115
    :goto_cb
    return-void
.end method

.method private static button(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 6

    .line 117
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 118
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 119
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 120
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextColor(I)V

    .line 121
    const/high16 p2, 0x41600000    # 14.0f

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextSize(F)V

    .line 122
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 123
    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 124
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 125
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSingleLine(Z)V

    .line 127
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, p2}, Landroid/widget/Button;->setShadowLayer(FFFI)V

    .line 128
    invoke-virtual {v0, p2, p2, p2, p2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 129
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 130
    new-instance p2, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda2;

    invoke-direct {p2, p3}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    const/high16 p3, 0x42300000    # 44.0f

    mul-float p2, p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 132
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    const/high16 p3, 0x42600000    # 56.0f

    mul-float p0, p0, p3

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 133
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p3, p0, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    return-object v0
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
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

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static choose(Ljava/lang/Object;I)V
    .registers 14

    .line 137
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->interaction(Ljava/lang/Object;Z)V

    .line 138
    move-object v1, p0

    check-cast v1, Landroid/app/Service;

    .line 140
    const-string v2, "\u518d\u751f\u901f\u5ea6"

    if-ne p1, v0, :cond_18

    :try_start_b
    invoke-static {}, Le/e/a/ModernEnhancements;->speed()F

    move-result p1

    new-instance v3, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0, v1}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Landroid/app/Service;)V

    invoke-static {v1, v2, p1, v0, v3}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V

    return-void

    .line 142
    :cond_18
    nop

    .line 143
    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ne p1, v0, :cond_36

    .line 144
    sget-object v5, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    .line 145
    invoke-static {}, Le/e/a/ModernEnhancements;->speed()F

    move-result v6

    .line 146
    const/4 v7, 0x1

    :goto_24
    sget-object v8, Le/e/a/ModernEnhancements;->SPEEDS:[F

    array-length v8, v8

    if-ge v4, v8, :cond_35

    sget-object v8, Le/e/a/ModernEnhancements;->SPEEDS:[F

    aget v8, v8, v4

    cmpl-float v8, v8, v6

    if-nez v8, :cond_32

    move v7, v4

    :cond_32
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 147
    :cond_35
    goto :goto_7d

    .line 148
    :cond_36
    const-string v5, "e.e.a.ModernControls"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 149
    const/4 v6, 0x3

    new-array v7, v6, [Ljava/lang/String;

    .line 150
    const/4 v8, 0x0

    :goto_40
    if-ge v8, v6, :cond_61

    const-string v9, "qualityOption"

    new-array v10, v0, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v4

    invoke-virtual {v5, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    new-array v10, v0, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-virtual {v9, v3, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    aput-object v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_40

    .line 151
    :cond_61
    const-string v5, "z"

    invoke-static {p0, v5}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    const-string v8, "e"

    invoke-static {v5, v8}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 152
    const/4 v8, 0x4

    if-ne v5, v8, :cond_78

    const/4 v4, 0x2

    goto :goto_7b

    :cond_78
    if-ne v5, v6, :cond_7b

    const/4 v4, 0x1

    :cond_7b
    :goto_7b
    move-object v5, v7

    move v7, v4

    .line 154
    :goto_7d
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 155
    if-ne p1, v0, :cond_89

    goto :goto_8b

    :cond_89
    const-string v2, "\u753b\u8cea"

    :goto_8b
    invoke-virtual {v4, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1, p0, v1}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;-><init>(ILjava/lang/Object;Landroid/app/Service;)V

    .line 156
    invoke-virtual {v0, v5, v7, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    .line 166
    invoke-virtual {p0, p1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 167
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_af

    .line 168
    const/16 v0, 0x7f6

    goto :goto_b1

    :cond_af
    const/16 v0, 0x7d2

    .line 167
    :goto_b1
    invoke-virtual {p1, v0}, Landroid/view/Window;->setType(I)V

    .line 169
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    .line 170
    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V
    :try_end_ba
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_ba} :catch_bb

    .line 171
    goto :goto_bf

    :catch_bb
    move-exception p0

    invoke-static {v1, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 172
    :goto_bf
    return-void
.end method

.method public static commentSize(Landroid/content/Context;F)F
    .registers 2

    .line 49
    invoke-static {p0, p1}, Le/e/a/CommentVisuals;->font(Landroid/content/Context;F)F

    move-result p0

    return p0
.end method

.method public static destroy(Ljava/lang/Object;)V
    .registers 3

    .line 233
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->destroy(Ljava/lang/Object;Z)V

    .line 234
    sget-object v1, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ModernEnhancements$State;

    .line 235
    if-eqz p0, :cond_16

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/ModernEnhancements$State;->alive:Z

    iget v1, p0, Le/e/a/ModernEnhancements$State;->generation:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/ModernEnhancements$State;->generation:I

    .line 236
    :cond_16
    return-void
.end method

.method private static error(Landroid/content/Context;Ljava/lang/Exception;)V
    .registers 4

    .line 259
    const-string v0, "nicoid-enhancements"

    const-string v1, "Control failed"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 260
    const-string p1, "\u64cd\u4f5c\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 261
    return-void
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$attach$1(Ljava/lang/Object;)V
    .registers 2

    .line 96
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->choose(Ljava/lang/Object;I)V

    return-void
.end method

.method static synthetic lambda$attach$2(Ljava/lang/Object;)V
    .registers 2

    .line 97
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->choose(Ljava/lang/Object;I)V

    return-void
.end method

.method static synthetic lambda$attach$3(Ljava/lang/Object;Landroid/app/Service;)V
    .registers 9

    .line 100
    const-string v0, "v"

    :try_start_2
    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    .line 101
    :goto_13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p0, v0, v4}, Le/e/a/ModernEnhancements;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v4, "setRepeatMode"

    new-array v5, v2, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    new-array v6, v2, [Ljava/lang/Object;

    if-eqz v1, :cond_2d

    goto :goto_2e

    :cond_2d
    const/4 v2, 0x0

    :goto_2e
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v3

    invoke-static {v0, v4, v5, v6}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-static {p1}, Le/e/a/ModernEnhancements;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "player_isloop"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 104
    invoke-static {p0}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4b} :catch_4c

    .line 105
    goto :goto_50

    :catch_4c
    move-exception p0

    invoke-static {p1, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 106
    :goto_50
    return-void
.end method

.method static synthetic lambda$button$4(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 130
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$choose$5(Ljava/lang/Object;Landroid/app/Service;F)V
    .registers 4

    .line 140
    :try_start_0
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    invoke-static {p0}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    goto :goto_11

    :catch_d
    move-exception p0

    invoke-static {p1, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    :goto_11
    return-void
.end method

.method static synthetic lambda$choose$6(ILjava/lang/Object;Landroid/app/Service;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 157
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    .line 158
    const/4 p3, 0x1

    if-ne p0, p3, :cond_3d

    .line 160
    :try_start_6
    sget-object p0, Le/e/a/ModernEnhancements;->SPEEDS:[F

    aget p0, p0, p4

    .line 161
    const-string p4, "e.e.a.ModernControls"

    invoke-static {p4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p4

    const-string v0, "speed"

    invoke-virtual {p4, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p4

    const/4 v0, 0x0

    invoke-virtual {p4, v0, p0}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 162
    const-string p4, "e"

    invoke-static {p1, p4}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    const-string v0, "setPlaybackSpeed"

    new-array v1, p3, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array p3, p3, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    aput-object p0, p3, v3

    invoke-static {p4, v0, v1, p3}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    invoke-static {p1}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_37} :catch_38

    .line 164
    goto :goto_40

    :catch_38
    move-exception p0

    invoke-static {p2, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    goto :goto_40

    .line 165
    :cond_3d
    invoke-static {p1, p4}, Le/e/a/ModernEnhancements;->quality(Ljava/lang/Object;I)V

    .line 166
    :goto_40
    return-void
.end method

.method static synthetic lambda$quality$7(Le/e/a/ModernEnhancements$State;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;IJZLandroid/app/Service;)V
    .registers 12

    .line 200
    :try_start_0
    iget-boolean v0, p0, Le/e/a/ModernEnhancements$State;->alive:Z

    if-eqz v0, :cond_50

    iget v0, p0, Le/e/a/ModernEnhancements$State;->generation:I

    if-ne v0, p1, :cond_50

    const-string p1, "f"

    invoke-static {p3, p1}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    goto :goto_50

    .line 201
    :cond_15
    if-eqz p4, :cond_3f

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3f

    .line 202
    iput-wide p7, p0, Le/e/a/ModernEnhancements$State;->seek:J

    .line 203
    const/4 p1, 0x1

    const/4 p2, 0x0

    if-eqz p9, :cond_29

    iget-boolean p5, p0, Le/e/a/ModernEnhancements$State;->unplugged:Z

    if-nez p5, :cond_29

    const/4 p5, 0x1

    goto :goto_2a

    :cond_29
    const/4 p5, 0x0

    :goto_2a
    iput-boolean p5, p0, Le/e/a/ModernEnhancements$State;->resume:Z

    .line 204
    const-string p0, "c"

    new-array p5, p1, [Ljava/lang/Class;

    const-class p6, Ljava/lang/String;

    aput-object p6, p5, p2

    new-array p1, p1, [Ljava/lang/Object;

    aput-object p4, p1, p2

    invoke-static {p3, p0, p5, p1}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    invoke-static {p3}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V

    .line 206
    goto :goto_55

    .line 201
    :cond_3f
    const-string p0, "e"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p5, p0, p1}, Le/e/a/ModernEnhancements;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u753b\u8cea\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_50} :catch_51

    .line 200
    :cond_50
    :goto_50
    return-void

    .line 206
    :catch_51
    move-exception p0

    invoke-static {p10, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 207
    :goto_55
    return-void
.end method

.method static synthetic lambda$quality$8(Le/e/a/ModernEnhancements$State;ILjava/lang/Object;ILandroid/app/Service;Ljava/lang/Exception;)V
    .registers 6

    .line 210
    :try_start_0
    iget p0, p0, Le/e/a/ModernEnhancements$State;->generation:I

    if-ne p0, p1, :cond_f

    const-string p0, "e"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2, p0, p1}, Le/e/a/ModernEnhancements;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_f

    .line 211
    :catch_e
    move-exception p0

    :cond_f
    :goto_f
    nop

    .line 212
    invoke-static {p4, p5}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 213
    return-void
.end method

.method static synthetic lambda$quality$9(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Le/e/a/ModernEnhancements$State;IIJZLandroid/app/Service;)V
    .registers 29

    .line 196
    :try_start_0
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "stream"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    .line 197
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    aput-object p1, v1, v6

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/lang/String;

    .line 198
    const-string v0, "c"

    move-object/from16 v1, p2

    invoke-static {v1, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    new-instance v2, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda8;

    move-object v7, v2

    move-object/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v13, p0

    move/from16 v14, p5

    move-wide/from16 v15, p6

    move/from16 v17, p8

    move-object/from16 v18, p9

    invoke-direct/range {v7 .. v18}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda8;-><init>(Le/e/a/ModernEnhancements$State;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;IJZLandroid/app/Service;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4e} :catch_4f

    .line 214
    goto :goto_6d

    .line 208
    :catch_4f
    move-exception v0

    move-object v13, v0

    .line 209
    new-instance v0, Landroid/os/Handler;

    invoke-virtual/range {p9 .. p9}, Landroid/app/Service;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;

    move-object v7, v1

    move-object/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p0

    move/from16 v11, p5

    move-object/from16 v12, p9

    invoke-direct/range {v7 .. v13}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;-><init>(Le/e/a/ModernEnhancements$State;ILjava/lang/Object;ILandroid/app/Service;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 215
    :goto_6d
    return-void
.end method

.method static synthetic lambda$settings$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3

    .line 74
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.sauzask.nicoid.NicoidChormecastSenderService"

    .line 75
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->stopService(Landroid/content/Intent;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 76
    goto :goto_13

    :catch_f
    move-exception p1

    invoke-static {p0, p1}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 77
    :goto_13
    const/4 p0, 0x1

    return p0
.end method

.method public static noisy(Ljava/lang/Object;)V
    .registers 2

    .line 238
    sget-object v0, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ModernEnhancements$State;

    .line 239
    if-eqz p0, :cond_10

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernEnhancements$State;->resume:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/ModernEnhancements$State;->unplugged:Z

    .line 240
    :cond_10
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 46
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 10

    .line 219
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->prepared(Ljava/lang/Object;Z)V

    .line 221
    :try_start_4
    const-string v1, "e"

    invoke-static {p0, v1}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 222
    const-string v2, "setPlaybackSpeed"

    new-array v3, v0, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {}, Le/e/a/ModernEnhancements;->speed()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v1, v2, v3, v4}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v2, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/ModernEnhancements$State;

    .line 224
    if-eqz v2, :cond_5d

    iget-wide v3, v2, Le/e/a/ModernEnhancements$State;->seek:J

    const-wide/16 v6, 0x0

    cmp-long v8, v3, v6

    if-ltz v8, :cond_5d

    .line 225
    const-string v3, "seekTo"

    new-array v4, v0, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    new-array v0, v0, [Ljava/lang/Object;

    iget-wide v6, v2, Le/e/a/ModernEnhancements$State;->seek:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v0, v5

    invoke-static {v1, v3, v4, v0}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-wide/16 v3, -0x1

    iput-wide v3, v2, Le/e/a/ModernEnhancements$State;->seek:J

    .line 227
    iget-boolean v0, v2, Le/e/a/ModernEnhancements$State;->resume:Z

    if-eqz v0, :cond_54

    const-string v0, "start"

    goto :goto_56

    :cond_54
    const-string v0, "pause"

    :goto_56
    new-array v2, v5, [Ljava/lang/Class;

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    :cond_5d
    invoke-static {p0}, Le/e/a/ModernEnhancements;->update(Ljava/lang/Object;)V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_60} :catch_61

    .line 230
    goto :goto_67

    :catch_61
    move-exception v0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 231
    :goto_67
    return-void
.end method

.method private static quality(Ljava/lang/Object;I)V
    .registers 16

    .line 178
    const-string v0, "e"

    move-object v12, p0

    check-cast v12, Landroid/app/Service;

    .line 180
    :try_start_5
    sget-object v1, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Le/e/a/ModernEnhancements$State;

    .line 181
    if-eqz v5, :cond_8a

    iget-boolean v1, v5, Le/e/a/ModernEnhancements$State;->alive:Z

    if-nez v1, :cond_16

    goto/16 :goto_8a

    .line 182
    :cond_16
    const-string v1, "z"

    invoke-static {p0, v1}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 183
    invoke-static {p0, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 184
    const-string v3, "f"

    invoke-static {p0, v3}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 185
    if-eqz v2, :cond_89

    if-eqz v1, :cond_89

    if-nez v3, :cond_2f

    goto :goto_89

    .line 186
    :cond_2f
    const/4 v4, 0x1

    const/4 v6, 0x0

    if-nez p1, :cond_35

    const/4 p1, 0x0

    goto :goto_3a

    :cond_35
    if-ne p1, v4, :cond_39

    const/4 p1, 0x3

    goto :goto_3a

    :cond_39
    const/4 p1, 0x4

    .line 187
    :goto_3a
    invoke-static {v2, v0}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 188
    if-ne v7, p1, :cond_47

    return-void

    .line 189
    :cond_47
    const-string v8, "getCurrentPosition"

    new-array v9, v6, [Ljava/lang/Class;

    new-array v10, v6, [Ljava/lang/Object;

    invoke-static {v1, v8, v9, v10}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 190
    const-string v10, "isPlaying"

    new-array v11, v6, [Ljava/lang/Class;

    new-array v13, v6, [Ljava/lang/Object;

    invoke-static {v1, v10, v11, v13}, Le/e/a/ModernEnhancements;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    .line 191
    iput-boolean v6, v5, Le/e/a/ModernEnhancements$State;->unplugged:Z

    .line 192
    iget v1, v5, Le/e/a/ModernEnhancements$State;->generation:I

    add-int/lit8 v6, v1, 0x1

    iput v6, v5, Le/e/a/ModernEnhancements$State;->generation:I

    .line 193
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, v0, p1}, Le/e/a/ModernEnhancements;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda0;

    move-object v1, v0

    move-object v4, p0

    move-object v11, v12

    invoke-direct/range {v1 .. v11}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Le/e/a/ModernEnhancements$State;IIJZLandroid/app/Service;)V

    const-string p0, "nicoid-popup-quality"

    invoke-direct {p1, v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 215
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_88} :catch_8b

    .line 216
    goto :goto_8f

    .line 185
    :cond_89
    :goto_89
    return-void

    .line 181
    :cond_8a
    :goto_8a
    return-void

    .line 216
    :catch_8b
    move-exception p0

    invoke-static {v12, p0}, Le/e/a/ModernEnhancements;->error(Landroid/content/Context;Ljava/lang/Exception;)V

    .line 217
    :goto_8f
    return-void
.end method

.method private static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 13

    .line 52
    const-string v0, "\uff08"

    invoke-static {p0}, Le/e/a/ModernEnhancements;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "app_lang"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 53
    invoke-static {p0}, Le/e/a/PlaybackSession;->settings(Landroid/preference/PreferenceActivity;)V

    .line 54
    invoke-static {p0}, Le/e/a/LoginSupport;->settings(Landroid/preference/PreferenceActivity;)V

    .line 55
    invoke-static {p0}, Le/e/a/ContentFilter;->settings(Landroid/preference/PreferenceActivity;)V

    .line 56
    invoke-static {p0}, Le/e/a/CacheFolders;->settings(Landroid/preference/PreferenceActivity;)V

    .line 57
    const-string v1, "quality_mode"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 58
    if-eqz v1, :cond_a0

    .line 59
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/CharSequence;

    const/4 v3, 0x0

    const-string v4, "\u6700\u5927\u753b\u8cea"

    aput-object v4, v2, v3

    const-string v5, "\u9ad8\u753b\u8cea"

    const/4 v6, 0x1

    aput-object v5, v2, v6

    const/4 v5, 0x2

    const-string v7, "\u6a19\u6e96\u753b\u8cea"

    aput-object v7, v2, v5

    const-string v5, "\u4f4e\u753b\u8cea"

    const/4 v7, 0x3

    aput-object v5, v2, v7

    .line 61
    const/4 v5, 0x0

    :goto_3f
    if-ge v5, v7, :cond_97

    .line 62
    :try_start_41
    const-string v8, "e.e.a.ModernControls"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v9, "qualityOption"

    new-array v10, v6, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v3

    .line 63
    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v9, v6, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v3

    const/4 v10, 0x0

    invoke-virtual {v8, v10, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 64
    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6c

    add-int/lit8 v9, v5, 0x1

    aput-object v8, v2, v9

    .line 65
    :cond_6c
    if-nez v5, :cond_93

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_93

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v8, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v2, v3
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_93} :catch_96

    .line 61
    :cond_93
    add-int/lit8 v5, v5, 0x1

    goto :goto_3f

    .line 67
    :catch_96
    move-exception v0

    :cond_97
    nop

    .line 68
    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 69
    const-string v0, "%s"

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 71
    :cond_a0
    const-string v0, "google_cast_disconnect"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 72
    if-eqz v0, :cond_b0

    new-instance v1, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 79
    :cond_b0
    return-void
.end method

.method private static speed()F
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 174
    const-string v0, "e.e.a.ModernControls"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "speed"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v0

    .line 175
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_17

    goto :goto_19

    :cond_17
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_19
    return v0
.end method

.method private static update(Ljava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 242
    sget-object v0, Le/e/a/ModernEnhancements;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernEnhancements$State;

    .line 243
    if-nez v0, :cond_b

    return-void

    .line 244
    :cond_b
    const-string v1, "z"

    invoke-static {p0, v1}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 245
    const/4 v2, 0x0

    if-nez v1, :cond_16

    const/4 v1, 0x0

    goto :goto_22

    :cond_16
    const-string v3, "e"

    invoke-static {v1, v3}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 246
    :goto_22
    const-string v3, "e.e.a.ModernControls"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v2

    const-string v6, "qualityOption"

    invoke-virtual {v3, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v5, v4, [Ljava/lang/Object;

    .line 247
    const/4 v6, 0x3

    const/4 v7, 0x4

    if-ne v1, v7, :cond_3d

    const/4 v4, 0x2

    goto :goto_41

    :cond_3d
    if-ne v1, v6, :cond_40

    goto :goto_41

    :cond_40
    const/4 v4, 0x0

    :goto_41
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v5, v2

    const/4 v2, 0x0

    invoke-virtual {v3, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 248
    const-string v3, "[0-9]{3,4}p"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 249
    iget-object v4, v0, Le/e/a/ModernEnhancements$State;->quality:Landroid/widget/Button;

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_65

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    goto :goto_71

    :cond_65
    if-ne v1, v7, :cond_6a

    const-string v1, "\u4f4e\u753b\u8cea"

    goto :goto_71

    :cond_6a
    if-ne v1, v6, :cond_6f

    const-string v1, "\u6a19\u6e96"

    goto :goto_71

    :cond_6f
    const-string v1, "\u9ad8\u753b\u8cea"

    :goto_71
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 250
    iget-object v1, v0, Le/e/a/ModernEnhancements$State;->quality:Landroid/widget/Button;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u753b\u8cea: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 251
    iget-object v1, v0, Le/e/a/ModernEnhancements$State;->speed:Landroid/widget/Button;

    invoke-static {}, Le/e/a/ModernEnhancements;->speed()F

    move-result v2

    invoke-static {v2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 252
    iget-object v1, v0, Le/e/a/ModernEnhancements$State;->speed:Landroid/widget/Button;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u518d\u751f\u901f\u5ea6: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Le/e/a/ModernEnhancements;->speed()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u500d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 253
    const-string v1, "v"

    invoke-static {p0, v1}, Le/e/a/ModernEnhancements;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    .line 254
    iget-object v1, v0, Le/e/a/ModernEnhancements$State;->loop:Landroid/widget/Button;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 255
    iget-object v1, v0, Le/e/a/ModernEnhancements$State;->loop:Landroid/widget/Button;

    if-eqz p0, :cond_d5

    const-string v2, "repeaton"

    goto :goto_d7

    :cond_d5
    const-string v2, "repeatoff"

    :goto_d7
    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V

    .line 256
    iget-object v0, v0, Le/e/a/ModernEnhancements$State;->loop:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u30eb\u30fc\u30d7\u518d\u751f: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p0, :cond_ec

    const-string p0, "ON"

    goto :goto_ee

    :cond_ec
    const-string p0, "OFF"

    :goto_ee
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 257
    return-void
.end method
