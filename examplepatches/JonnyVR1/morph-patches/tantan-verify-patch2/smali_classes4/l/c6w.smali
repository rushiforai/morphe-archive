.class public Ll/c6w;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/jl80;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;ZLandroid/widget/CheckBox;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :goto_0
    const-string p2, "e_positioning_authority_open_guide_cancel_click"

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, Ll/c6w;->h(Ljava/lang/String;ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Landroid/widget/CheckBox;Ll/x20;ZLl/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    sput-object p0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-static {p3}, Ll/w1e;->e(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;ZLandroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :goto_0
    const-string p2, "e_positioning_authority_open_guide_confirm_click"

    .line 10
    .line 11
    invoke-static {p0, p1, p2}, Ll/c6w;->h(Ljava/lang/String;ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/qxv;->c()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    new-instance p0, Ll/a6w;

    .line 21
    .line 22
    invoke-direct {p0, p4}, Ll/a6w;-><init>(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p3, p0}, Ll/xxv;->s(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-string p0, "android.permission.ACCESS_FINE_LOCATION"

    .line 30
    .line 31
    const-string p1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 32
    .line 33
    filled-new-array {p0, p1}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    new-instance p0, Ll/b6w;

    .line 44
    .line 45
    invoke-direct {p0, p3, p4}, Ll/b6w;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p3, p0}, Ll/xxv;->s(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Ll/xxv;->o()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    new-instance p0, Ll/c6w$a;

    .line 59
    .line 60
    const/16 p1, 0x3f2

    .line 61
    .line 62
    invoke-direct {p0, p1, p3, p4}, Ll/c6w$a;-><init>(ILcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 66
    .line 67
    .line 68
    new-instance p0, Landroid/content/Intent;

    .line 69
    .line 70
    const-string p2, "android.settings.LOCATION_SOURCE_SETTINGS"

    .line 71
    .line 72
    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p3, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_4

    .line 84
    .line 85
    invoke-interface {p4}, Ll/x20;->call()V

    .line 86
    .line 87
    .line 88
    :cond_4
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xxv;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->Y1(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public static synthetic e(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static f()V
    .locals 1

    .line 1
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/jl80;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/jl80;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static g()Z
    .locals 1

    .line 1
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/jl80;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    return v0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    return v0
.end method

.method public static h(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "on"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "off"

    .line 7
    .line 8
    :goto_0
    const-string v0, "from_exp"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "no_longer_prompt"

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "p_alert_positioning_authority_open_guide_popup"

    .line 25
    .line 26
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Z)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/c6w;->j(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V
    .locals 17

    .line 1
    move/from16 v0, p3

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p4, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/spl0;->F()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    sget-boolean v1, Ll/c6w;->b:Z

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    const/4 v1, 0x1

    .line 24
    if-eqz p4, :cond_2

    .line 25
    .line 26
    sput-boolean v1, Ll/c6w;->b:Z

    .line 27
    .line 28
    :cond_2
    const-class v2, Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "p_alert_positioning_authority_open_guide_popup"

    .line 35
    .line 36
    invoke-static {v3, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    const-string v2, "explore_tab"

    .line 41
    .line 42
    if-eqz p4, :cond_3

    .line 43
    .line 44
    move-object v3, v2

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    const-string v3, "card"

    .line 47
    .line 48
    :goto_1
    const-string v4, "swipe_page"

    .line 49
    .line 50
    if-eqz p4, :cond_4

    .line 51
    .line 52
    const-string v5, "explore_page"

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_4
    move-object v5, v4

    .line 56
    :goto_2
    move-object v6, v2

    .line 57
    if-eqz p4, :cond_5

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_5
    move-object v2, v4

    .line 61
    :goto_3
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-virtual {v8}, Ll/pk50;->f()Ll/rj50;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    const-string v9, "tooltips_trigger_mode"

    .line 70
    .line 71
    const-string v10, "passive"

    .line 72
    .line 73
    invoke-static {v9, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    const-string v9, "tooltips_type_ui"

    .line 78
    .line 79
    const-string v10, "alert_self_definition_basic"

    .line 80
    .line 81
    invoke-static {v9, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v12

    .line 85
    const-string v9, "tooltips_trigger_page"

    .line 86
    .line 87
    invoke-static {v9, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v13

    .line 91
    const-string v5, "tooltips_trigger_module"

    .line 92
    .line 93
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v14

    .line 97
    const-string v3, "tooltips_trigger_reason"

    .line 98
    .line 99
    const-string v5, "no_location_permission_tips"

    .line 100
    .line 101
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v15

    .line 105
    if-eqz p4, :cond_6

    .line 106
    .line 107
    move-object v4, v6

    .line 108
    :cond_6
    const-string v3, "from_exp"

    .line 109
    .line 110
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object v16

    .line 114
    filled-new-array/range {v11 .. v16}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    move-object/from16 v4, p5

    .line 119
    .line 120
    invoke-virtual {v8, v4, v3}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v7, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v7}, Ll/w1e;->f(Ll/l4g0;)V

    .line 128
    .line 129
    .line 130
    invoke-static/range {p0 .. p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    sget v4, Ll/kec0;->w6:I

    .line 135
    .line 136
    const/4 v5, 0x0

    .line 137
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    sget v4, Ll/adc0;->P1:I

    .line 142
    .line 143
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    check-cast v4, Landroid/widget/TextView;

    .line 148
    .line 149
    sget v5, Ll/adc0;->W8:I

    .line 150
    .line 151
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    sget v6, Ll/adc0;->V8:I

    .line 156
    .line 157
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    check-cast v6, Landroid/widget/CheckBox;

    .line 162
    .line 163
    invoke-static {}, Ll/gra;->z()Z

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    if-eqz v8, :cond_7

    .line 168
    .line 169
    sget v8, Ll/adc0;->b3:I

    .line 170
    .line 171
    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    check-cast v8, Lv/VImage;

    .line 176
    .line 177
    sget v9, Ll/dbc0;->di:I

    .line 178
    .line 179
    invoke-virtual {v8, v9}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 180
    .line 181
    .line 182
    :cond_7
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 187
    .line 188
    .line 189
    invoke-static {v5, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 190
    .line 191
    .line 192
    new-instance v1, Ll/jl80$a;

    .line 193
    .line 194
    move-object/from16 v5, p0

    .line 195
    .line 196
    invoke-direct {v1, v5}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v3}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    const/4 v3, 0x0

    .line 204
    invoke-virtual {v1, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    sget v9, Lcom/p1/mobile/putong/core/R$string;->Ih:I

    .line 209
    .line 210
    new-instance v1, Ll/x5w;

    .line 211
    .line 212
    move/from16 v3, p4

    .line 213
    .line 214
    move-object v4, v6

    .line 215
    move-object/from16 v6, p1

    .line 216
    .line 217
    invoke-direct/range {v1 .. v6}, Ll/x5w;-><init>(Ljava/lang/String;ZLandroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v8, v9, v1}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-static {}, Ll/gra;->z()Z

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    if-eqz v5, :cond_8

    .line 229
    .line 230
    sget v5, Ll/dbc0;->R:I

    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_8
    const/4 v5, -0x1

    .line 234
    :goto_4
    invoke-virtual {v1, v5}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Hh:I

    .line 239
    .line 240
    new-instance v6, Ll/y5w;

    .line 241
    .line 242
    invoke-direct {v6, v2, v3, v4}, Ll/y5w;-><init>(Ljava/lang/String;ZLandroid/widget/CheckBox;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v1, v5, v6}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    new-instance v2, Ll/z5w;

    .line 250
    .line 251
    move-object/from16 v3, p2

    .line 252
    .line 253
    invoke-direct {v2, v4, v3, v0, v7}, Ll/z5w;-><init>(Landroid/widget/CheckBox;Ll/x20;ZLl/l4g0;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v1, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 265
    .line 266
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    sput-object v1, Ll/c6w;->a:Ljava/lang/ref/WeakReference;

    .line 270
    .line 271
    return-void
.end method
