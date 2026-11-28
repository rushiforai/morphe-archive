.class public final Le/e/a/PopupSwitch216;
.super Ljava/lang/Object;
.source "PopupSwitch216.java"


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final TAG:Ljava/lang/String; = "nicoid-popup-switch216"

.field private static closedService118:Ljava/lang/ref/WeakReference;

.field private static generation:I

.field private static pendingRetry116:Le/e/a/PopupSwitch216$0;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/PopupSwitch216;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static activeMini(Landroid/app/Service;)Ljava/lang/Object;
    .registers 5

    .line 61
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.DirectBackground235"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 62
    const-string v2, "active"

    invoke-static {v1, v2}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 63
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "service"

    invoke-static {v2, v3}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v2, p0, :cond_0

    .line 64
    move-object v0, v1

    goto :goto_0

    :cond_0
    nop

    .line 63
    :goto_0
    return-object v0

    .line 65
    :catch_0
    move-exception p0

    return-object v0
.end method

.method private static alreadyPopup119(Landroid/app/Service;)Z
    .registers 4

    const/4 v0, 0x0

    instance-of v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    if-eqz v1, :cond_0

    invoke-static {p0}, Le/e/a/PopupSwitch216;->terminal119(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v1, :cond_0

    check-cast p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v0

    :cond_0
    return v0
.end method

.method private static appIsAway()Z
    .registers 3

    .line 79
    :try_start_0
    const-string v0, "e.e.a.AppResume253"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "away"

    invoke-static {v0, v1}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 80
    :catch_0
    move-exception v0

    .line 81
    const-string v1, "nicoid-popup-switch216"

    const-string v2, "Unable to verify app background state"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method private static attempt(Landroid/content/Context;II)V
    .registers 21

    .line 96
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    const-string v3, "b"

    sget v4, Le/e/a/PopupSwitch216;->generation:I

    if-ne v1, v4, :cond_16

    invoke-static {}, Le/e/a/PopupSwitch216;->appIsAway()Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_e

    .line 97
    :cond_0
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 98
    const-string v5, "app_switch_playback"

    const-string v6, "none"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "popup"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    return-void

    .line 100
    :cond_1
    const-string v4, "power"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 101
    if-eqz v4, :cond_15

    invoke-virtual {v4}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v4

    if-nez v4, :cond_2

    goto/16 :goto_d

    .line 102
    :cond_2
    invoke-static {}, Le/e/a/PopupSwitch216;->service()Landroid/app/Service;

    move-result-object v4

    .line 103
    if-nez v4, :cond_3

    .line 104
    const-string v3, "service not bound"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PopupSwitch216;->retry(Landroid/content/Context;IILjava/lang/String;)V

    .line 105
    return-void

    .line 107
    :cond_3
    invoke-static {v4}, Le/e/a/PopupSwitch216;->closed118(Landroid/app/Service;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-static {}, Le/e/a/PopupSwitch216;->cancelPending236()V

    const-string v5, "nicoid-popup-switch216"

    const-string v6, "Retained popup request cancelled: service playback already closed"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    invoke-static {v4}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v5

    const-string v6, "nicoid-popup-switch216"

    if-nez v5, :cond_5

    .line 108
    const-string v0, "Popup overlay permission is missing"

    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return-void

    .line 112
    :cond_5
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 113
    const-string v7, "p0"

    invoke-static {v5, v7}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 114
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 115
    invoke-static {v4}, Le/e/a/PopupSwitch216;->alreadyPopup119(Landroid/app/Service;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-static {}, Le/e/a/PopupSwitch216;->cancelPending236()V

    const-string v3, "Popup request already satisfied by attached overlay"

    invoke-static {v6, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_6
    const-string v3, "service has not entered retained background mode"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PopupSwitch216;->retry(Landroid/content/Context;IILjava/lang/String;)V

    .line 116
    return-void

    .line 118
    :cond_7
    const-string v9, "a"

    invoke-static {v5, v9}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 119
    invoke-static {v5, v3}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/WindowManager;

    .line 120
    const-string v11, "U"

    .line 121
    invoke-static {v5, v11}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/WindowManager$LayoutParams;

    .line 122
    const-string v12, "e"

    invoke-static {v5, v12}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 123
    if-eqz v9, :cond_14

    if-eqz v10, :cond_14

    if-eqz v11, :cond_14

    if-nez v12, :cond_8

    goto/16 :goto_b

    .line 127
    :cond_8
    invoke-virtual {v9}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v13

    if-nez v13, :cond_13

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    if-eqz v13, :cond_9

    goto/16 :goto_a

    .line 131
    :cond_9
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    const-string v14, "getDuration"

    const/4 v15, 0x0

    new-array v8, v15, [Ljava/lang/Class;

    invoke-static {v13, v14, v8}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v13, v15, [Ljava/lang/Object;

    invoke-virtual {v8, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 132
    instance-of v13, v8, Ljava/lang/Number;

    if-eqz v13, :cond_12

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v13

    const-wide/16 v16, 0x0

    cmp-long v8, v13, v16

    if-gtz v8, :cond_a

    goto/16 :goto_9

    .line 139
    :cond_a
    sget v0, Le/e/a/PopupSwitch216;->generation:I

    if-ne v1, v0, :cond_11

    invoke-static {}, Le/e/a/PopupSwitch216;->appIsAway()Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_8

    .line 140
    :cond_b
    invoke-static {v4}, Le/e/a/PopupSwitch216;->activeMini(Landroid/app/Service;)Ljava/lang/Object;

    move-result-object v1

    .line 141
    if-nez v1, :cond_c

    const/4 v2, 0x0

    goto :goto_0

    :cond_c
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "host"

    invoke-static {v0, v2}, Le/e/a/PopupSwitch216;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    move-object v2, v0

    .line 142
    :goto_0
    nop

    .line 143
    nop

    .line 147
    const/4 v8, 0x1

    if-eqz v1, :cond_d

    .line 148
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v13, "detach"

    new-array v14, v15, [Ljava/lang/Class;

    invoke-static {v0, v13, v14}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v13, v15, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v13, "returnVideo"

    new-array v14, v15, [Ljava/lang/Class;

    invoke-static {v0, v13, v14}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v13, v15, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 150
    move v13, v8

    goto :goto_1

    .line 166
    :catch_0
    move-exception v0

    move-object v8, v0

    move v13, v15

    goto/16 :goto_2

    .line 147
    :cond_d
    move v13, v15

    .line 152
    :goto_1
    :try_start_2
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v14, "setReleaseOnDetachFromWindow"

    move/from16 v16, v15

    new-array v15, v8, [Ljava/lang/Class;

    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v17, v15, v16

    invoke-static {v0, v14, v15}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 153
    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v0, v12, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    invoke-interface {v10, v9, v11}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 155
    nop

    .line 156
    move/from16 v14, v16

    const/4 v11, 0x0

    :try_start_3
    invoke-virtual {v7, v11, v14}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 157
    new-array v0, v8, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v11, v0, v14

    invoke-static {v5, v3, v0}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v4, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v0, "com.devbrackets.android.exomedia.ExoMedia$RendererType"

    .line 159
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 160
    const-string v11, "VIDEO"

    invoke-virtual {v0, v11}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 161
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    const-string v15, "setRendererEnabled"

    move/from16 p0, v8

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object v0, v8, v16

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v0, v8, p0

    invoke-static {v14, v15, v8}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 162
    invoke-static/range {p0 .. p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    filled-new-array {v11, v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v0, v12, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v8, "close"

    move/from16 v11, p0

    new-array v12, v11, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object v11, v12, v16

    invoke-static {v0, v8, v12}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 164
    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v0, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_e
    const-string v0, "Existing background decoder presented as popup without reload"

    invoke-static {v6, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 182
    goto :goto_7

    .line 166
    :catch_1
    move-exception v0

    move-object v8, v0

    const/4 v15, 0x1

    goto :goto_2

    :catch_2
    move-exception v0

    move-object v8, v0

    const/4 v15, 0x0

    .line 168
    :goto_2
    const/4 v11, 0x1

    const/4 v14, 0x0

    :try_start_4
    invoke-virtual {v7, v14, v11}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    .line 169
    if-eqz v15, :cond_f

    :try_start_5
    invoke-interface {v10, v9}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    .line 170
    :goto_3
    goto :goto_4

    :catch_3
    move-exception v0

    goto :goto_3

    .line 171
    :cond_f
    :goto_4
    const/4 v11, 0x1

    :try_start_6
    new-array v0, v11, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object v7, v0, v16

    invoke-static {v5, v3, v0}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_5

    .line 172
    :catch_4
    move-exception v0

    :goto_5
    nop

    .line 173
    if-eqz v1, :cond_10

    if-eqz v13, :cond_10

    :try_start_7
    instance-of v0, v2, Landroid/app/Activity;

    if-eqz v0, :cond_10

    .line 174
    check-cast v2, Landroid/app/Activity;

    .line 175
    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    if-nez v0, :cond_10

    .line 176
    :try_start_8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "attach"

    const/4 v11, 0x1

    new-array v4, v11, [Ljava/lang/Class;

    const-class v5, Landroid/app/Activity;

    const/16 v16, 0x0

    aput-object v5, v4, v16

    invoke-static {v0, v3, v4}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 177
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_6

    .line 178
    :catch_5
    move-exception v0

    :goto_6
    nop

    .line 181
    :cond_10
    :try_start_9
    const-string v0, "Cannot present service playback as popup; retaining audio"

    invoke-static {v6, v0, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 185
    :goto_7
    goto :goto_c

    .line 139
    :cond_11
    :goto_8
    return-void

    .line 133
    :cond_12
    :goto_9
    const-string v3, "decoder duration not yet available"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PopupSwitch216;->retry(Landroid/content/Context;IILjava/lang/String;)V

    .line 134
    return-void

    .line 128
    :cond_13
    :goto_a
    const-string v0, "Service popup root is already attached; no duplicate window"

    invoke-static {v6, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    return-void

    .line 124
    :cond_14
    :goto_b
    const-string v3, "service presentation not prepared"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PopupSwitch216;->retry(Landroid/content/Context;IILjava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 125
    return-void

    .line 183
    :catch_6
    move-exception v0

    .line 184
    const-string v1, "Service popup transition unavailable"

    invoke-static {v6, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 186
    :goto_c
    return-void

    .line 101
    :cond_15
    :goto_d
    return-void

    .line 96
    :cond_16
    :goto_e
    return-void
.end method

.method static cancelPending236()V
    .registers 1

    invoke-static {}, Le/e/a/PopupSwitch216;->clearRetry116()V

    sget v0, Le/e/a/PopupSwitch216;->generation:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Le/e/a/PopupSwitch216;->generation:I

    return-void
.end method

.method static claimRetry116(Le/e/a/PopupSwitch216$0;)Z
    .registers 3

    sget-object v0, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    if-ne v0, p0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static clearRetry116()V
    .registers 2

    sget-object v0, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    sput-object v1, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    sget-object v1, Le/e/a/PopupSwitch216;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private static closed118(Landroid/app/Service;)Z
    .registers 4

    const/4 v0, 0x0

    sget-object v1, Le/e/a/PopupSwitch216;->closedService118:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    instance-of v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    if-eqz v1, :cond_0

    check-cast p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 29
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 30
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object v0

    .line 32
    :catch_0
    move-exception v0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 34
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic lambda$left$0(Landroid/content/Context;Landroid/content/Context;I)V
    .registers 3

    .line 74
    if-nez p0, :cond_0

    move-object p0, p1

    :cond_0
    const/4 p1, 0x0

    invoke-static {p0, p2, p1}, Le/e/a/PopupSwitch216;->attempt(Landroid/content/Context;II)V

    return-void
.end method

.method static synthetic lambda$retry$0(Landroid/content/Context;II)V
    .registers 3

    .line 92
    add-int/lit8 p2, p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/PopupSwitch216;->attempt(Landroid/content/Context;II)V

    return-void
.end method

.method public static left(Landroid/content/Context;)V
    .registers 5

    .line 69
    if-nez p0, :cond_0

    return-void

    .line 70
    :cond_0
    invoke-static {}, Le/e/a/PopupSwitch216;->clearRetry116()V

    sget v0, Le/e/a/PopupSwitch216;->generation:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Le/e/a/PopupSwitch216;->generation:I

    .line 71
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 74
    sget-object v2, Le/e/a/PopupSwitch216;->MAIN:Landroid/os/Handler;

    if-nez v1, :cond_1

    move-object v1, p0

    :cond_1
    new-instance v3, Le/e/a/PopupSwitch216$0;

    const/4 p0, -0x1

    invoke-direct {v3, v1, v0, p0}, Le/e/a/PopupSwitch216$0;-><init>(Landroid/content/Context;II)V

    sput-object v3, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    const-wide/16 v0, 0xb4

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 75
    return-void
.end method

.method private static varargs method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 40
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 41
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    return-object v0

    .line 43
    :catch_0
    move-exception v0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 45
    :cond_0
    new-instance p0, Ljava/lang/NoSuchMethodException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static retry(Landroid/content/Context;IILjava/lang/String;)V
    .registers 5

    .line 87
    sget v0, Le/e/a/PopupSwitch216;->generation:I

    if-ne p1, v0, :cond_2

    invoke-static {}, Le/e/a/PopupSwitch216;->appIsAway()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 88
    :cond_0
    const/16 v0, 0x8

    if-lt p2, v0, :cond_1

    .line 89
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Retained popup conversion not ready: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "nicoid-popup-switch216"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return-void

    .line 92
    :cond_1
    invoke-static {}, Le/e/a/PopupSwitch216;->clearRetry116()V

    sget-object p3, Le/e/a/PopupSwitch216;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/PopupSwitch216$0;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/PopupSwitch216$0;-><init>(Landroid/content/Context;II)V

    sput-object v0, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    const-wide/16 p0, 0xb4

    invoke-virtual {p3, v0, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 93
    return-void

    .line 87
    :cond_2
    :goto_0
    return-void
.end method

.method private static service()Landroid/app/Service;
    .registers 5

    .line 50
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.AppResume253"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 51
    const-string v2, "service"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-static {v1, v2, v4}, Le/e/a/PopupSwitch216;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 52
    instance-of v2, v1, Landroid/app/Service;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/app/Service;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :cond_0
    return-object v0

    .line 53
    :catch_0
    move-exception v1

    .line 54
    const-string v2, "nicoid-popup-switch216"

    const-string v3, "Current service not available"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    return-object v0
.end method

.method static serviceClosed118(Ljava/lang/Object;)V
    .registers 3

    instance-of v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/PopupSwitch216;->closedService118:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public static servicePrepared116(Ljava/lang/Object;)V
    .registers 5

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    sget-object v1, Le/e/a/PopupSwitch216;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v0, v2, :cond_0

    sget-object v0, Le/e/a/PopupSwitch216;->pendingRetry116:Le/e/a/PopupSwitch216$0;

    if-eqz v0, :cond_0

    iget v2, v0, Le/e/a/PopupSwitch216$0;->f$1:I

    sget v3, Le/e/a/PopupSwitch216;->generation:I

    if-ne v2, v3, :cond_0

    invoke-static {}, Le/e/a/PopupSwitch216;->appIsAway()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Le/e/a/PopupSwitch216;->service()Landroid/app/Service;

    move-result-object v2

    if-ne v2, p0, :cond_0

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-string v2, "nicoid-popup-switch216"

    const-string v3, "Retained popup retry advanced by service preparation"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method static serviceStarted118(Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Le/e/a/PopupSwitch216;->closedService118:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Le/e/a/PopupSwitch216;->closedService118:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method static terminal119(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    sget-object v1, Le/e/a/PopupSwitch216;->closedService118:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
