.class public final Le/e/a/ManualQueue119;
.super Ljava/lang/Object;
.source "ManualQueue119.java"


# static fields
.field static currentVideo:Ljava/lang/String;

.field static cursor:I

.field static final history:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static opening:Z

.field static ownerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final pending:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static popup:Z

.field static sourceCursor:I

.field static sourceEnabled:Z

.field static sourceRows:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    const/4 v0, -0x1

    sput v0, Le/e/a/ManualQueue119;->cursor:I

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    const-string v0, ""

    sput-object v0, Le/e/a/ManualQueue119;->currentVideo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Landroid/app/Activity;Ljava/lang/Object;Z)V
    .registers 6

    .line 7
    invoke-static {p1}, Le/e/a/ManualQueue119;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_50

    const-string v1, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_50

    :cond_f
    sget-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x1f4

    const/4 v2, 0x0

    if-lt v0, v1, :cond_28

    const-string p1, "\u518d\u751f\u30ad\u30e5\u30fc\u306f500\u4ef6\u307e\u3067\u3067\u3059"

    :goto_1c
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_28
    sget-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3b

    sget-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-static {}, Le/e/a/ManualQueue119;->capture()V

    :cond_3b
    sget-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    if-eqz p2, :cond_41

    const/4 p2, 0x0

    goto :goto_47

    :cond_41
    sget-object p2, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_47
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-static {}, Le/e/a/ManualQueue119;->enable()V

    const-string p1, "\u518d\u751f\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0\u3057\u307e\u3057\u305f"

    goto :goto_1c

    :cond_50
    :goto_50
    return-void
.end method

.method public static attached(Ljava/lang/Object;Z)V
    .registers 7

    .line 9
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "f"

    goto :goto_7

    :cond_5
    const-string v0, "b0"

    :goto_7
    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_f} :catch_10

    goto :goto_13

    :catch_10
    move-exception v0

    const-string v0, ""

    :goto_13
    sget v1, Le/e/a/ManualQueue119;->cursor:I

    const/4 v2, 0x0

    if-ltz v1, :cond_34

    sget v1, Le/e/a/ManualQueue119;->cursor:I

    sget-object v3, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_34

    sget-object v1, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    sget v3, Le/e/a/ManualQueue119;->cursor:I

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    const/4 v1, 0x1

    goto :goto_35

    :cond_34
    const/4 v1, 0x0

    :goto_35
    sget-object v3, Le/e/a/ManualQueue119;->currentVideo:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v4, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    sput-boolean p1, Le/e/a/ManualQueue119;->popup:Z

    sget-boolean p0, Le/e/a/ManualQueue119;->opening:Z

    if-nez p0, :cond_57

    if-nez v1, :cond_57

    if-nez v3, :cond_57

    sget-object p0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    const/4 p0, -0x1

    sput p0, Le/e/a/ManualQueue119;->cursor:I

    invoke-static {}, Le/e/a/ManualQueue119;->capture()V

    :cond_57
    sput-object v0, Le/e/a/ManualQueue119;->currentVideo:Ljava/lang/String;

    invoke-static {}, Le/e/a/ManualQueue119;->enable()V

    sput-boolean v2, Le/e/a/ManualQueue119;->opening:Z

    return-void
.end method

.method static capture()V
    .registers 4

    .line 8
    sget-object v0, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    sput-object v1, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    const/4 v2, 0x0

    sput-boolean v2, Le/e/a/ManualQueue119;->sourceEnabled:Z

    sput v2, Le/e/a/ManualQueue119;->sourceCursor:I

    if-nez v0, :cond_11

    return-void

    :cond_11
    :try_start_11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    sget-boolean v3, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v3, :cond_1c

    const-string v3, "j0"

    goto :goto_1e

    :cond_1c
    const-string v3, "U0"

    :goto_1e
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sget-boolean v3, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v3, :cond_27

    goto :goto_28

    :cond_27
    move-object v1, v0

    :goto_28
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Le/e/a/ManualQueue119;->sourceEnabled:Z

    sget-boolean v1, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v1, :cond_35

    const-string v1, "O"

    goto :goto_37

    :cond_35
    const-string v1, "C1"

    :goto_37
    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    sget-boolean v1, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v1, :cond_44

    const-string v1, "P"

    goto :goto_46

    :cond_44
    const-string v1, "D1"

    :goto_46
    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    sput v0, Le/e/a/ManualQueue119;->sourceCursor:I
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_52} :catch_53

    goto :goto_54

    :catch_53
    move-exception v0

    :goto_54
    return-void
.end method

.method static changed()V
    .registers 3

    .line 22
    sget-object v0, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_36

    sget-object v1, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_36

    sget v1, Le/e/a/ManualQueue119;->cursor:I

    if-gtz v1, :cond_36

    sget-object v1, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-eqz v1, :cond_19

    goto :goto_36

    :cond_19
    :try_start_19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-boolean v2, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v2, :cond_24

    const-string v2, "j0"

    goto :goto_26

    :cond_24
    const-string v2, "U0"

    :goto_26
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sget-boolean v2, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v2, :cond_2f

    const/4 v0, 0x0

    :cond_2f
    sget-boolean v2, Le/e/a/ManualQueue119;->sourceEnabled:Z

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_34} :catch_35

    goto :goto_36

    :catch_35
    move-exception v0

    :cond_36
    :goto_36
    return-void
.end method

.method static enable()V
    .registers 3

    .line 11
    sget-object v0, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2c

    sget-object v1, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2c

    :try_start_10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-boolean v2, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v2, :cond_1b

    const-string v2, "j0"

    goto :goto_1d

    :cond_1b
    const-string v2, "U0"

    :goto_1d
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sget-boolean v2, Le/e/a/ManualQueue119;->popup:Z

    if-eqz v2, :cond_26

    const/4 v0, 0x0

    :cond_26
    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_2a} :catch_2b

    goto :goto_2c

    :catch_2b
    move-exception v0

    :cond_2c
    :goto_2c
    return-void
.end method

.method static id(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 6
    const-string v0, "videourl"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static move(Ljava/lang/Object;ZZ)Z
    .registers 22

    .line 13
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-static/range {p0 .. p0}, Le/e/a/ManualQueue119;->owns(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_c

    return v3

    :cond_c
    const/4 v2, 0x1

    if-eqz v1, :cond_12

    :try_start_f
    const-string v4, "f"

    goto :goto_14

    :cond_12
    const-string v4, "b0"

    :goto_14
    invoke-static {v0, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget v5, Le/e/a/ManualQueue119;->cursor:I

    .line 14
    sget-object v6, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2e

    sget-object v5, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sput v3, Le/e/a/ManualQueue119;->cursor:I

    const/4 v5, 0x0

    .line 15
    :cond_2e
    const/4 v4, 0x0

    if-nez p1, :cond_46

    sget v6, Le/e/a/ManualQueue119;->cursor:I

    if-gtz v6, :cond_36

    return v3

    :cond_36
    sget-object v6, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    sget v7, Le/e/a/ManualQueue119;->cursor:I

    sub-int/2addr v7, v2

    sput v7, Le/e/a/ManualQueue119;->cursor:I

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    :goto_41
    check-cast v6, Ljava/lang/String;

    move-object v7, v4

    const/4 v8, 0x0

    goto :goto_75

    :cond_46
    sget v6, Le/e/a/ManualQueue119;->cursor:I

    add-int/2addr v6, v2

    sget-object v7, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_5d

    sget-object v6, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    sget v7, Le/e/a/ManualQueue119;->cursor:I

    add-int/2addr v7, v2

    sput v7, Le/e/a/ManualQueue119;->cursor:I

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_41

    :cond_5d
    sget-object v6, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_190

    sget-object v6, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Le/e/a/ManualQueue119;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    move-object/from16 v18, v7

    move-object v7, v6

    move-object/from16 v6, v18

    .line 16
    :goto_75
    if-eqz v1, :cond_7b

    move-object v9, v0

    check-cast v9, Landroid/content/Context;

    goto :goto_83

    :cond_7b
    const-string v9, "A1"

    invoke-static {v0, v9}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/Context;

    :goto_83
    new-instance v10, Landroid/content/Intent;

    const-string v11, "android.intent.action.VIEW"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "https://www.nicovideo.jp/watch/"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz v1, :cond_a2

    const-string v11, "com.sauzask.nicoid.NicoidPopupViewService"

    goto :goto_a4

    :cond_a2
    const-string v11, "com.sauzask.nicoid.NicoidVideoActivity"

    :goto_a4
    invoke-virtual {v10, v9, v11}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    const-string v11, "url"

    invoke-virtual {v10, v11, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    const-string v11, "intentselect"

    invoke-virtual {v10, v11, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v10

    const-string v11, "nicoid_manual_queue119"

    invoke-virtual {v10, v11, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v10

    .line 17
    invoke-static {v0, v10, v1}, Le/e/a/TabPlayback110;->transfer(Ljava/lang/Object;Landroid/content/Intent;Z)V

    sget-object v11, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-nez v11, :cond_10c

    sget-boolean v11, Le/e/a/ManualQueue119;->sourceEnabled:Z

    if-eqz v11, :cond_10c

    sget-object v11, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    instance-of v11, v11, Ljava/util/ArrayList;

    if-eqz v11, :cond_10c

    const-string v11, "e.e.a.v0"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    const-string v12, "a"

    const/4 v13, 0x4

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Landroid/content/Intent;

    aput-object v15, v14, v3

    const-class v15, Ljava/util/ArrayList;

    aput-object v15, v14, v2

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x2

    aput-object v15, v14, v16

    sget-object v15, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v17, 0x3

    aput-object v15, v14, v17

    invoke-virtual {v11, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    sget v12, Le/e/a/ManualQueue119;->sourceCursor:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    new-array v13, v13, [Ljava/lang/Object;

    aput-object v10, v13, v3

    sget-object v15, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    aput-object v15, v13, v2

    aput-object v12, v13, v16

    aput-object v14, v13, v17

    invoke-virtual {v11, v4, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v11, "nicoid_explicit_queue110"

    invoke-virtual {v10, v11, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_10c
    if-eqz v1, :cond_122

    const-string v11, "isBackgroundPlay"

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v12, "p0"

    invoke-virtual {v0, v12}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v10, v11, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_144

    :cond_122
    const-string v4, "isLandscape"

    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v12, "C0"

    invoke-static {v0, v12}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v10, v4, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v4, "isFullScreen"

    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v12, "B0"

    invoke-static {v0, v12}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v10, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    :goto_144
    sput-boolean v2, Le/e/a/ManualQueue119;->opening:Z
    :try_end_146
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_146} :catch_1f2

    if-eqz v1, :cond_14c

    :try_start_148
    invoke-static {v9, v10}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_165

    :cond_14c
    move-object v0, v9

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, v10}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    move-object v0, v9

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CommentSafety110;->stop(Landroid/view/View;)V

    check-cast v9, Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->finish()V
    :try_end_165
    .catch Ljava/lang/Exception; {:try_start_148 .. :try_end_165} :catch_18a

    .line 19
    :goto_165
    if-eqz v8, :cond_189

    :try_start_167
    sget-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    sget-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x3e8

    if-le v0, v1, :cond_180

    sget-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_180
    sget-object v0, Le/e/a/ManualQueue119;->history:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    sput v0, Le/e/a/ManualQueue119;->cursor:I

    :cond_189
    return v2

    .line 18
    :catch_18a
    move-exception v0

    sput-boolean v3, Le/e/a/ManualQueue119;->opening:Z

    sput v5, Le/e/a/ManualQueue119;->cursor:I

    throw v0

    .line 15
    :cond_190
    sget v5, Le/e/a/ManualQueue119;->cursor:I

    if-lez v5, :cond_1f1

    sget-object v5, Le/e/a/TabPlayback110;->active:Le/e/a/TabPlayback110$Queue;

    if-nez v5, :cond_1f1

    sget-boolean v5, Le/e/a/ManualQueue119;->sourceEnabled:Z
    :try_end_19a
    .catch Ljava/lang/Exception; {:try_start_167 .. :try_end_19a} :catch_1f2

    const-string v6, "j0"

    const-string v7, "U0"

    if-nez v5, :cond_1b3

    :try_start_1a0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eqz v1, :cond_1a7

    goto :goto_1a8

    :cond_1a7
    move-object v6, v7

    :goto_1a8
    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    if-eqz v1, :cond_1af

    move-object v0, v4

    :cond_1af
    invoke-virtual {v5, v0, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    return v3

    :cond_1b3
    sget-object v5, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    if-eqz v5, :cond_1f1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eqz v1, :cond_1c0

    const-string v8, "O"

    goto :goto_1c2

    :cond_1c0
    const-string v8, "C1"

    :goto_1c2
    invoke-virtual {v5, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    sget-object v8, Le/e/a/ManualQueue119;->sourceRows:Ljava/lang/Object;

    invoke-virtual {v5, v0, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eqz v1, :cond_1d4

    const-string v8, "P"

    goto :goto_1d6

    :cond_1d4
    const-string v8, "D1"

    :goto_1d6
    invoke-virtual {v5, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    sget v8, Le/e/a/ManualQueue119;->sourceCursor:I

    invoke-virtual {v5, v0, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eqz v1, :cond_1e6

    goto :goto_1e7

    :cond_1e6
    move-object v6, v7

    :goto_1e7
    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    if-eqz v1, :cond_1ee

    move-object v0, v4

    :cond_1ee
    invoke-virtual {v5, v0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_1f1
    .catch Ljava/lang/Exception; {:try_start_1a0 .. :try_end_1f1} :catch_1f2

    :cond_1f1
    return v3

    .line 20
    :catch_1f2
    move-exception v0

    const-string v1, "nicoid-queue"

    const-string v3, "Cannot advance manual queue"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2
.end method

.method static owns(Ljava/lang/Object;)Z
    .registers 2

    .line 12
    sget-object v0, Le/e/a/ManualQueue119;->ownerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method static show(Landroid/app/Activity;)V
    .registers 1

    .line 21
    invoke-static {p0}, Le/e/a/QueueUi120;->show(Landroid/app/Activity;)V

    return-void
.end method
