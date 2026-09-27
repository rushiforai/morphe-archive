.class final Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;
.super Ljava/lang/Object;
.source "CaptionSettingsDialogs.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static confirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/Dialog;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    const/4 v5, 0x0

    .line 20
    :try_start_b
    const-string v6, "app.morphe.extension.shared.ui.CustomDialog"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "create"

    const/16 v8, 0xb

    new-array v9, v8, [Ljava/lang/Class;

    const-class v10, Landroid/content/Context;

    const/4 v11, 0x0

    aput-object v10, v9, v11

    const-class v10, Ljava/lang/CharSequence;

    const/4 v12, 0x1

    aput-object v10, v9, v12

    const/4 v13, 0x2

    aput-object v10, v9, v13

    const-class v14, Landroid/widget/EditText;

    const/4 v15, 0x3

    aput-object v14, v9, v15

    const/4 v14, 0x4

    aput-object v10, v9, v14

    const-class v16, Ljava/lang/Runnable;

    const/16 v17, 0x5

    aput-object v16, v9, v17

    const/16 v18, 0x6

    aput-object v16, v9, v18

    const/16 v19, 0x7

    aput-object v10, v9, v19

    const/16 v10, 0x8

    aput-object v16, v9, v10

    sget-object v16, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v20, 0x9

    aput-object v16, v9, v20

    const/16 v21, 0xa

    aput-object v16, v9, v21

    .line 21
    invoke-virtual {v6, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-instance v7, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda0;-><init>()V

    .line 25
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v0, v8, v11

    aput-object v1, v8, v12

    aput-object v2, v8, v13

    aput-object v5, v8, v15

    aput-object v3, v8, v14

    aput-object v4, v8, v17

    aput-object v7, v8, v18

    aput-object v5, v8, v19

    aput-object v5, v8, v10

    aput-object v9, v8, v20

    aput-object v16, v8, v21

    .line 24
    invoke-virtual {v6, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 26
    check-cast v6, Landroid/util/Pair;

    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Landroid/app/Dialog;

    .line 27
    invoke-virtual {v6}, Landroid/app/Dialog;->show()V
    :try_end_7e
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_b .. :try_end_7e} :catch_7f
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_7e} :catch_7f
    .catch Ljava/lang/LinkageError; {:try_start_b .. :try_end_7e} :catch_7f

    return-object v6

    .line 29
    :catch_7f
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "cancel"

    .line 30
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda1;

    invoke-direct {v1, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Runnable;)V

    .line 31
    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-object v0
.end method

.method static synthetic lambda$confirm$0()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$confirm$1(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 31
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$show$2()V
    .registers 0

    return-void
.end method

.method static show(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;)Landroid/app/Dialog;
    .registers 5

    const/4 v0, 0x0

    .line 37
    invoke-static {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;->show(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method static show(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)Landroid/app/Dialog;
    .registers 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    .line 41
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;

    invoke-direct {v4, v0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    const/4 v5, 0x0

    .line 59
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 50
    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 51
    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v7, v8, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v10, p2

    invoke-virtual {v4, v10, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v7, 0x1

    const/4 v10, 0x0

    .line 54
    :try_start_23
    const-string v11, "app.morphe.extension.shared.ui.CustomDialog"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    const-string v12, "create"

    const/16 v13, 0xb

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Landroid/content/Context;

    aput-object v15, v14, v5

    const-class v15, Ljava/lang/CharSequence;

    aput-object v15, v14, v7

    const/16 v16, 0x2

    aput-object v15, v14, v16

    const-class v17, Landroid/widget/EditText;

    const/16 v18, 0x3

    aput-object v17, v14, v18

    const/16 v17, 0x4

    aput-object v15, v14, v17

    const-class v19, Ljava/lang/Runnable;

    const/16 v20, 0x5

    aput-object v19, v14, v20

    const/16 v21, 0x6

    aput-object v19, v14, v21

    const/16 v22, 0x7

    aput-object v15, v14, v22

    const/16 v15, 0x8

    aput-object v19, v14, v15

    sget-object v19, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v23, 0x9

    aput-object v19, v14, v23

    const/16 v24, 0xa

    aput-object v19, v14, v24

    .line 55
    invoke-virtual {v11, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda2;

    invoke-direct {v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$$ExternalSyntheticLambda2;-><init>()V

    .line 59
    new-array v13, v13, [Ljava/lang/Object;

    aput-object v0, v13, v5

    aput-object v1, v13, v7

    aput-object v10, v13, v16

    aput-object v10, v13, v18

    aput-object v2, v13, v17

    aput-object v12, v13, v20

    aput-object v10, v13, v21

    aput-object v10, v13, v22

    aput-object v10, v13, v15

    aput-object v6, v13, v23

    aput-object v6, v13, v24

    .line 58
    invoke-virtual {v11, v10, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 60
    check-cast v6, Landroid/util/Pair;

    .line 61
    iget-object v11, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v11, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_a6

    .line 63
    invoke-virtual {v11}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v12

    sub-int/2addr v12, v7

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 64
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v13, 0x41800000    # 16.0f

    .line 65
    invoke-static {v0, v13}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v13

    iput v13, v12, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 66
    invoke-virtual {v11, v3, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    :cond_a6
    invoke-virtual {v11}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v12

    sub-int/2addr v12, v7

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v13, v8, v9, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v4, v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 69
    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Landroid/app/Dialog;
    :try_end_b9
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_23 .. :try_end_b9} :catch_ba
    .catch Ljava/lang/ClassCastException; {:try_start_23 .. :try_end_b9} :catch_ba
    .catch Ljava/lang/LinkageError; {:try_start_23 .. :try_end_b9} :catch_ba

    goto :goto_df

    .line 71
    :catch_ba
    invoke-virtual {v4}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    instance-of v6, v6, Landroid/view/ViewGroup;

    if-eqz v6, :cond_cb

    invoke-virtual {v4}, Landroid/widget/ScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_cb
    if-eqz v3, :cond_de

    .line 72
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    instance-of v6, v6, Landroid/view/ViewGroup;

    if-eqz v6, :cond_de

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_de
    move-object v6, v10

    :goto_df
    if-nez v6, :cond_135

    const/high16 v6, 0x41a00000    # 20.0f

    .line 75
    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-virtual {v4, v11, v5, v12, v5}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 76
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-nez v3, :cond_101

    .line 77
    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_131

    .line 79
    :cond_101
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 80
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x41400000    # 12.0f

    invoke-static {v0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {v0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {v3, v4, v7, v6, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 82
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 84
    :goto_131
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 86
    :cond_135
    invoke-virtual {v6}, Landroid/app/Dialog;->show()V

    return-object v6
.end method
