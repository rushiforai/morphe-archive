.class public final Le/e/a/TabPlayback110;
.super Ljava/lang/Object;
.source "TabPlayback110.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TabPlayback110$Queue;
    }
.end annotation


# static fields
.field static final EXPLICIT:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static final REQUESTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/SavedTabs227$Tab;",
            ">;"
        }
    .end annotation
.end field

.field static final REUSE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static final TOKEN:Ljava/lang/String; = "nicoid_tab_queue"

.field static active:Le/e/a/TabPlayback110$Queue;

.field static serial:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabPlayback110;->EXPLICIT:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabPlayback110;->REUSE:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabPlayback110;->REQUESTS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static actions(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 14

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget v2, p1, Le/e/a/SavedTabs227$Tab;->kind:I

    if-nez v2, :cond_25

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v3, "Edit search"

    const-string v4, "\u7de8\u8f2f\u641c\u5c0b"

    const-string v5, "\u691c\u7d22\u30ef\u30fc\u30c9\u3092\u5909\u66f4"

    invoke-static {v2, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/TabPlayback110$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, p1}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda7;-><init>(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_25
    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2, p1}, Le/e/a/TabPlayback110;->mode(Landroid/content/Context;Le/e/a/SavedTabs227$Tab;)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x1

    :goto_2d
    const/4 v5, 0x2

    if-le v4, v5, :cond_c6

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v2, v2, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    const/4 v2, -0x1

    filled-new-array {v2, v3}, [I

    move-result-object v7

    const/4 v8, 0x0

    const/4 v2, 0x0

    :goto_41
    if-lt v2, v5, :cond_8a

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v3, "Close tab"

    const-string v4, "\u95dc\u9589\u5206\u9801"

    const-string v5, "\u30bf\u30d6\u3092\u9589\u3058\u308b"

    invoke-static {v2, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Le/e/a/TabPlayback110$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, p1}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda10;-><init>(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-array p1, v8, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    new-instance v0, Le/e/a/TabPlayback110$$ExternalSyntheticLambda11;

    invoke-direct {v0, v1}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda11;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_8a
    aget v3, v7, v2

    add-int v4, v6, v3

    if-ltz v4, :cond_c2

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v9

    iget-object v9, v9, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v4, v9, :cond_c2

    iget-object v4, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    if-gez v3, :cond_a3

    const-string v9, "\u5de6\u306b\u79fb\u52d5"

    goto :goto_a5

    :cond_a3
    const-string v9, "\u53f3\u306b\u79fb\u52d5"

    :goto_a5
    if-gez v3, :cond_aa

    const-string v10, "Move left"

    goto :goto_ac

    :cond_aa
    const-string v10, "Move right"

    :goto_ac
    if-gez v3, :cond_b1

    const-string v11, "\u5411\u5de6\u79fb\u52d5"

    goto :goto_b3

    :cond_b1
    const-string v11, "\u5411\u53f3\u79fb\u52d5"

    :goto_b3
    invoke-static {v4, v9, v10, v11}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Le/e/a/TabPlayback110$$ExternalSyntheticLambda9;

    invoke-direct {v4, p1, v3, p0}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda9;-><init>(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_c2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_41

    :cond_c6
    new-instance v5, Ljava/lang/StringBuilder;

    if-ne v2, v4, :cond_cd

    const-string v6, "\u2713 "

    goto :goto_cf

    :cond_cd
    const-string v6, ""

    :goto_cf
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v6, v4}, Le/e/a/TabPlayback110;->label(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v5, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;

    invoke-direct {v5, p1, v2, v4, p0}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda8;-><init>(Le/e/a/SavedTabs227$Tab;IILe/e/a/MultiTabs227$Host;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2d
.end method

.method static apply(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 7

    .line 9
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-virtual {v0, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    if-nez p1, :cond_12

    return-void

    :cond_12
    invoke-static {p0, p1}, Le/e/a/TabPlayback110;->mode(Landroid/content/Context;Le/e/a/SavedTabs227$Tab;)I

    move-result p1

    invoke-static {p0}, Le/e/a/TabPlayback110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_24

    const/4 v2, 0x1

    goto :goto_25

    :cond_24
    const/4 v2, 0x0

    :goto_25
    const-string v3, "continuous_play"

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 v2, 0x2

    if-ne p1, v2, :cond_30

    const/4 v3, 0x2

    goto :goto_31

    :cond_30
    const/4 v3, 0x0

    :goto_31
    const-string v4, "continuous_play_mode"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :try_start_3a
    const-string p0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v3, "I"

    invoke-virtual {p0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    if-eqz p1, :cond_49

    goto :goto_4a

    :cond_49
    const/4 v0, 0x0

    :goto_4a
    const/4 v4, 0x0

    invoke-virtual {v3, v4, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const-string v0, "J"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    if-ne p1, v2, :cond_57

    const/4 v1, 0x2

    :cond_57
    invoke-virtual {p0, v4, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_5a} :catch_5b

    goto :goto_63

    :catch_5b
    move-exception p0

    const-string p1, "nicoid-queue"

    const-string v0, "Cannot synchronize tab mode"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_63
    return-void
.end method

.method public static attach(Ljava/lang/Object;Z)V
    .registers 2

    .line 17
    invoke-static {p0, p1}, Le/e/a/TabPlayback110;->attachTab(Ljava/lang/Object;Z)V

    invoke-static {p0, p1}, Le/e/a/ManualQueue119;->attached(Ljava/lang/Object;Z)V

    return-void
.end method

.method static attachTab(Ljava/lang/Object;Z)V
    .registers 20

    .line 18
    move-object/from16 v0, p0

    if-eqz p1, :cond_8

    :try_start_4
    move-object v1, v0

    check-cast v1, Landroid/content/Context;

    goto :goto_10

    :cond_8
    const-string v1, "A1"

    invoke-static {v0, v1}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    :goto_10
    if-eqz p1, :cond_15

    const-string v2, "f"

    goto :goto_17

    :cond_15
    const-string v2, "b0"

    :goto_17
    invoke-static {v0, v2}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz p1, :cond_28

    move-object v4, v3

    goto :goto_2f

    :cond_28
    move-object v4, v1

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_2f} :catch_1d8

    :goto_2f
    const-string v5, "P"

    const-string v6, "D1"

    const-string v7, "O"

    const-string v8, "C1"

    const/4 v9, 0x0

    if-eqz v4, :cond_65

    :try_start_3a
    const-string v10, "nicoid_manual_queue119"

    invoke-virtual {v4, v10, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_65

    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-eqz v1, :cond_64

    if-eqz p1, :cond_49

    goto :goto_4a

    :cond_49
    move-object v7, v8

    :goto_4a
    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-object v1, v1, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-static {v0, v7, v1}, Le/e/a/TabPlayback110;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_58

    goto :goto_59

    :cond_58
    move-object v5, v6

    :goto_59
    invoke-virtual {v1, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sget-object v2, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget v2, v2, Le/e/a/TabPlayback110$Queue;->cursor:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    :cond_64
    return-void

    :cond_65
    const/4 v10, 0x1

    if-eqz v4, :cond_82

    const-string v11, "nicoid_tab_queue"

    invoke-virtual {v4, v11}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_80

    const-string v11, "nicoid_popup_return_244"

    invoke-virtual {v4, v11}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_80

    const-string v11, "nicoid_playback_transfer"

    invoke-virtual {v4, v11}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_82

    :cond_80
    const/4 v11, 0x1

    goto :goto_83

    :cond_82
    const/4 v11, 0x0

    :goto_83
    if-eqz p1, :cond_87

    move-object v12, v7

    goto :goto_88

    :cond_87
    move-object v12, v8

    :goto_88
    invoke-static {v0, v12}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 19
    sget-object v13, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_8e} :catch_1d8

    const-string v14, "j0"

    const-string v15, "U0"

    if-eqz v13, :cond_e8

    if-eqz p1, :cond_a5

    :try_start_96
    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v13, Le/e/a/TabPlayback110;->REUSE:Ljava/util/WeakHashMap;

    invoke-virtual {v13, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e8

    goto :goto_a7

    :cond_a5
    if-eqz v11, :cond_e8

    :goto_a7
    sget-object v11, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-object v11, v11, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v11

    new-instance v13, Le/e/a/TabPlayback110$$ExternalSyntheticLambda6;

    invoke-direct {v13, v2}, Le/e/a/TabPlayback110$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;)V

    invoke-interface {v11, v13}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v11

    if-nez v11, :cond_c2

    sget-object v11, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e8

    :cond_c2
    :goto_c2
    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-object v1, v1, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v9, v1, :cond_ce

    :goto_cc
    goto/16 :goto_181

    :cond_ce
    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-object v1, v1, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e5

    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iput v9, v1, Le/e/a/TabPlayback110$Queue;->cursor:I

    goto :goto_cc

    :cond_e5
    add-int/lit8 v9, v9, 0x1

    goto :goto_c2

    .line 20
    :cond_e8
    if-eqz p1, :cond_f9

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v11, Le/e/a/TabPlayback110;->EXPLICIT:Ljava/util/WeakHashMap;

    invoke-virtual {v11, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1d4

    goto :goto_103

    :cond_f9
    if-eqz v4, :cond_103

    const-string v11, "nicoid_explicit_queue110"

    invoke-virtual {v4, v11, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1d4

    :cond_103
    :goto_103
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v4

    if-eqz v4, :cond_1d4

    instance-of v4, v12, Ljava/util/ArrayList;

    if-nez v4, :cond_10f

    goto/16 :goto_1d4

    :cond_10f
    sget-object v4, Le/e/a/TabPlayback110;->REQUESTS:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/SavedTabs227$Tab;

    if-nez v4, :cond_127

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v4

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v11

    iget-object v11, v11, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v4, v11}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v4

    :cond_127
    if-nez v4, :cond_12a

    return-void

    :cond_12a
    invoke-static {v1, v4}, Le/e/a/TabPlayback110;->mode(Landroid/content/Context;Le/e/a/SavedTabs227$Tab;)I

    move-result v1

    if-nez v1, :cond_145

    sput-object v3, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_139

    goto :goto_13a

    :cond_139
    move-object v14, v15

    :goto_13a
    invoke-virtual {v1, v14}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    if-eqz p1, :cond_141

    move-object v0, v3

    :cond_141
    invoke-virtual {v1, v0, v9}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    return-void

    :cond_145
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    check-cast v12, Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object v9, v3

    :goto_156
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_1b3

    if-eqz v9, :cond_1b2

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_165

    goto :goto_1b2

    :cond_165
    const/4 v2, 0x2

    if-ne v1, v2, :cond_16a

    const/4 v2, 0x1

    goto :goto_16b

    :cond_16a
    const/4 v2, 0x0

    :goto_16b
    new-instance v12, Ljava/util/Random;

    invoke-direct {v12}, Ljava/util/Random;-><init>()V

    invoke-static {v11, v9, v2, v12}, Le/e/a/PlaybackOrder110;->order(Ljava/util/List;Ljava/lang/Object;ZLjava/util/Random;)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v11, Le/e/a/TabPlayback110$Queue;

    iget-object v4, v4, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v9

    invoke-direct {v11, v4, v2, v9, v1}, Le/e/a/TabPlayback110$Queue;-><init>(Ljava/lang/String;Ljava/util/ArrayList;II)V

    sput-object v11, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    .line 21
    :goto_181
    if-eqz p1, :cond_184

    goto :goto_185

    :cond_184
    move-object v7, v8

    :goto_185
    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-object v1, v1, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-static {v0, v7, v1}, Le/e/a/TabPlayback110;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_193

    goto :goto_194

    :cond_193
    move-object v5, v6

    :goto_194
    invoke-virtual {v1, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sget-object v2, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget v2, v2, Le/e/a/TabPlayback110$Queue;->cursor:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_1a6

    goto :goto_1a7

    :cond_1a6
    move-object v14, v15

    :goto_1a7
    invoke-virtual {v1, v14}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    if-eqz p1, :cond_1ae

    move-object v0, v3

    :cond_1ae
    invoke-virtual {v1, v0, v10}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 22
    goto :goto_1e0

    .line 20
    :cond_1b2
    :goto_1b2
    return-void

    :cond_1b3
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1c2

    move-object v9, v10

    :cond_1c2
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_1d1

    invoke-virtual {v13, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d1

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1d1
    const/4 v3, 0x0

    const/4 v10, 0x1

    goto :goto_156

    :cond_1d4
    :goto_1d4
    const/4 v0, 0x0

    sput-object v0, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;
    :try_end_1d7
    .catch Ljava/lang/Exception; {:try_start_96 .. :try_end_1d7} :catch_1d8

    return-void

    .line 22
    :catch_1d8
    move-exception v0

    const-string v1, "nicoid-queue"

    const-string v2, "Cannot bind playback queue"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1e0
    return-void
.end method

.method public static begin(Ljava/lang/Object;Landroid/content/Intent;)V
    .registers 10

    .line 16
    if-eqz p1, :cond_b

    const-string v0, "MediaButtonCode"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-static {p0}, Le/e/a/TabPlayback110;->request(Ljava/lang/Object;)V

    sget-object v0, Le/e/a/TabPlayback110;->EXPLICIT:Ljava/util/WeakHashMap;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_1e

    const-string v3, "nicoid_explicit_queue110"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1e

    const/4 v3, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v3, 0x0

    :goto_1f
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/TabPlayback110;->REUSE:Ljava/util/WeakHashMap;

    if-eqz p1, :cond_47

    sget-object v3, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-eqz v3, :cond_47

    const-string v3, "nicoid_tab_queue"

    const-wide/16 v4, -0x1

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    sget-object v5, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    iget-wide v5, v5, Le/e/a/TabPlayback110$Queue;->token:J

    cmp-long v7, v3, v5

    if-eqz v7, :cond_46

    const-string v3, "nicoid_playback_transfer"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_47

    :cond_46
    goto :goto_48

    :cond_47
    const/4 v1, 0x0

    :goto_48
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static changed(Landroid/app/Activity;ZZ)V
    .registers 4

    .line 10
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/MultiTabs227$Host;

    if-nez p0, :cond_12

    return-void

    :cond_12
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v0, p0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p0

    if-eqz p0, :cond_2c

    if-eqz p1, :cond_26

    if-eqz p2, :cond_24

    const/4 p1, 0x2

    goto :goto_27

    :cond_24
    const/4 p1, 0x1

    goto :goto_27

    :cond_26
    const/4 p1, 0x0

    :goto_27
    iput p1, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    :cond_2c
    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static id(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 14
    const-string v0, "videourl"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static label(Landroid/content/Context;I)Ljava/lang/String;
    .registers 6

    .line 11
    const-string v0, "OFF"

    const/4 v1, 0x1

    if-nez p1, :cond_7

    move-object v2, v0

    goto :goto_e

    :cond_7
    if-ne p1, v1, :cond_c

    const-string v2, "\u9023\u7d9a\u518d\u751f"

    goto :goto_e

    :cond_c
    const-string v2, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    :goto_e
    if-nez p1, :cond_12

    move-object v3, v0

    goto :goto_19

    :cond_12
    if-ne p1, v1, :cond_17

    const-string v3, "Continuous playback"

    goto :goto_19

    :cond_17
    const-string v3, "Shuffle playback"

    :goto_19
    if-nez p1, :cond_1c

    goto :goto_23

    :cond_1c
    if-ne p1, v1, :cond_21

    const-string v0, "\u9023\u7e8c\u64ad\u653e"

    goto :goto_23

    :cond_21
    const-string v0, "\u96a8\u6a5f\u64ad\u653e"

    :goto_23
    invoke-static {p0, v2, v3, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 2

    .line 12
    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->query(Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/SavedTabs227$Tab;IILe/e/a/MultiTabs227$Host;)V
    .registers 4

    .line 12
    if-ne p1, p2, :cond_3

    const/4 p2, 0x0

    :cond_3
    iput p2, p0, Le/e/a/SavedTabs227$Tab;->mode:I

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    iget-object p1, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iget-object p2, p3, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    iget-object p1, p3, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object p0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-static {p1, p0}, Le/e/a/TabPlayback110;->apply(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object p0, p3, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    :cond_1e
    return-void
.end method

.method static synthetic lambda$2(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;)V
    .registers 4

    .line 12
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-ltz p0, :cond_2d

    add-int/2addr p1, p0

    if-ltz p1, :cond_2d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-static {v0, p0, p1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    const/4 p0, 0x1

    iput-boolean p0, p2, Le/e/a/MultiTabs227$Host;->preserveStrip:Z

    invoke-virtual {p2}, Le/e/a/MultiTabs227$Host;->bar()V

    :cond_2d
    return-void
.end method

.method static synthetic lambda$3(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 2

    .line 12
    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->close(Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 12
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 2

    .line 19
    invoke-static {p1}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static mode(Landroid/content/Context;Le/e/a/SavedTabs227$Tab;)I
    .registers 6

    .line 8
    iget v0, p1, Le/e/a/SavedTabs227$Tab;->mode:I

    if-ltz v0, :cond_7

    iget p0, p1, Le/e/a/SavedTabs227$Tab;->mode:I

    return p0

    :cond_7
    invoke-static {p0}, Le/e/a/TabPlayback110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "tab_playback_default"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_34

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "continuous_play"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2c

    const-string v2, "continuous_play_mode"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2a

    goto :goto_2d

    :cond_2a
    const/4 v3, 0x1

    goto :goto_2d

    :cond_2c
    const/4 v3, 0x0

    :goto_2d
    invoke-interface {v0, p1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_34
    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static move(Ljava/lang/Object;ZZ)Z
    .registers 12

    .line 24
    invoke-static {p0, p1, p2}, Le/e/a/ManualQueue119;->move(Ljava/lang/Object;ZZ)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    sget-object v0, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    const/4 v2, 0x0

    if-nez v0, :cond_e

    return v2

    :cond_e
    if-eqz p2, :cond_13

    :try_start_10
    const-string v3, "O"

    goto :goto_15

    :cond_13
    const-string v3, "C1"

    :goto_15
    invoke-static {p0, v3}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    if-eq v3, v4, :cond_1e

    return v2

    :cond_1e
    iget-object v3, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v4, v3, [Z

    const/4 v5, 0x0

    :goto_27
    if-lt v5, v3, :cond_104

    iget v3, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    invoke-static {v3, p1, v4}, Le/e/a/PlaybackOrder110;->next(IZ[Z)I

    move-result p1

    const/4 v3, 0x0

    if-gez p1, :cond_48

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    if-eqz p2, :cond_3b

    const-string v0, "j0"

    goto :goto_3d

    :cond_3b
    const-string v0, "U0"

    :goto_3d
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    if-eqz p2, :cond_44

    move-object p0, v3

    :cond_44
    invoke-virtual {p1, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    return v2

    :cond_48
    iget v2, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    iput p1, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    if-eqz p2, :cond_52

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    goto :goto_5a

    :cond_52
    const-string v4, "A1"

    invoke-static {p0, v4}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    :goto_5a
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "https://www.nicovideo.jp/watch/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz p2, :cond_83

    const-string v6, "com.sauzask.nicoid.NicoidPopupViewService"

    goto :goto_85

    :cond_83
    const-string v6, "com.sauzask.nicoid.NicoidVideoActivity"

    :goto_85
    invoke-virtual {v5, v4, v6}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v6, "url"

    iget-object v7, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v6, "intentselect"

    invoke-virtual {p1, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p2, :cond_b3

    const-string p1, "isBackgroundPlay"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "p0"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    :goto_af
    invoke-virtual {v5, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_d3

    :cond_b3
    const-string p1, "isLandscape"

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v6, "C0"

    invoke-static {p0, v6}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v5, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "isFullScreen"

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v6, "B0"

    invoke-static {p0, v6}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_af

    :goto_d3
    invoke-static {p0, v5, p2}, Le/e/a/TabPlayback110;->transfer(Ljava/lang/Object;Landroid/content/Intent;Z)V
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_d6} :catch_131

    if-eqz p2, :cond_e6

    :try_start_d8
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p1, 0x1a

    if-lt p0, p1, :cond_e2

    invoke-static {v4, v5}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_ff

    :cond_e2
    invoke-static {v4, v5}, Le/e/a/CacheFolders;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_ff

    :cond_e6
    move-object p0, v4

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    move-object p0, v4

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CommentSafety110;->stop(Landroid/view/View;)V

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->finish()V
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_ff} :catch_100

    :goto_ff
    return v1

    :catch_100
    move-exception p0

    :try_start_101
    iput v2, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    throw p0

    :cond_104
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v7, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "j"

    invoke-static {v7, v8}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_12a

    iget-object v6, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Le/e/a/TabPlayback110;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_12a

    const/4 v6, 0x0

    goto :goto_12b

    :cond_12a
    const/4 v6, 0x1

    :goto_12b
    aput-boolean v6, v4, v5
    :try_end_12d
    .catch Ljava/lang/Exception; {:try_start_101 .. :try_end_12d} :catch_131

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_27

    :catch_131
    move-exception p0

    const-string p1, "nicoid-queue"

    const-string p2, "Queue navigation failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 7
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static request(Ljava/lang/Object;)V
    .registers 3

    .line 15
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-eqz v0, :cond_1c

    sget-object v1, Le/e/a/TabPlayback110;->REQUESTS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-static {p0, p1, p2}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static transfer(Ljava/lang/Object;Landroid/content/Intent;Z)V
    .registers 11

    .line 23
    sget-object v0, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-nez v0, :cond_5

    return-void

    :cond_5
    if-eqz p2, :cond_a

    :try_start_7
    const-string p2, "O"

    goto :goto_c

    :cond_a
    const-string p2, "C1"

    :goto_c
    invoke-static {p0, p2}, Le/e/a/TabPlayback110;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    iget-object p2, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    if-eq p0, p2, :cond_15

    return-void

    :cond_15
    const-string p0, "e.e.a.v0"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string p2, "a"

    const/4 v1, 0x4

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Intent;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/util/ArrayList;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x3

    aput-object v3, v2, v7

    invoke-virtual {p0, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    iget-object p2, v0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    iget v2, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    aput-object p2, v1, v5

    aput-object v2, v1, v6

    aput-object v3, v1, v7

    const/4 p2, 0x0

    invoke-virtual {p0, p2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "nicoid_tab_queue"

    iget-wide v1, v0, Le/e/a/TabPlayback110$Queue;->token:J

    invoke-virtual {p1, p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "isContinuousPlay"

    invoke-virtual {p0, p1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "playlistposition"

    iget p2, v0, Le/e/a/TabPlayback110$Queue;->cursor:I

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_67} :catch_68

    goto :goto_70

    :catch_68
    move-exception p0

    const-string p1, "nicoid-queue"

    const-string p2, "Cannot transfer playback queue"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_70
    return-void
.end method
