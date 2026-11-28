.class public final Le/e/a/NativeMylistMove215;
.super Ljava/lang/Object;
.source "NativeMylistMove215.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "nicoid-mylist-move"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;
    .registers 7

    .line 41
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 42
    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 43
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 44
    :catch_0
    move-exception v0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private static executeOriginal(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;ILandroid/app/AlertDialog;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/ArrayList<",
            "*>;",
            "Ljava/lang/String;",
            "I",
            "Landroid/app/AlertDialog;",
            ")V"
        }
    .end annotation

    .line 64
    const/4 v1, 0x0

    :try_start_0
    const-string v0, "e.e.a.i2$c"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 65
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-class v3, Ljava/util/ArrayList;

    const/4 v5, 0x2

    aput-object v3, v2, v5

    const-class v3, Ljava/util/ArrayList;

    const/4 v6, 0x3

    aput-object v3, v2, v6

    const-class v3, Ljava/lang/String;

    const/4 v6, 0x4

    aput-object v3, v2, v6

    const-class v3, Landroid/app/AlertDialog;

    const/4 v6, 0x5

    aput-object v3, v2, v6

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 67
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 69
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object v6, p0

    move-object v9, p1

    move-object v8, p2

    move-object v10, p3

    move-object/from16 v11, p5

    filled-new-array/range {v6 .. v11}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 70
    move-object v2, p0

    check-cast v2, Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v4, 0x0

    move/from16 v5, p4

    int-to-long v6, v5

    const/4 v3, 0x0

    invoke-interface/range {v2 .. v7}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    goto :goto_0

    .line 71
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 72
    const-string p1, "nicoid-mylist-move"

    const-string p2, "Native authenticated move failed to start"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    invoke-virtual/range {p5 .. p5}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 74
    const-string p1, "Could not start moving videos"

    const-string/jumbo p2, "\u7121\u6cd5\u958b\u59cb\u79fb\u52d5\u5f71\u7247"

    const-string p3, "\u52d5\u753b\u306e\u79fb\u52d5\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p3, p1, p2}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 75
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 77
    :goto_0
    return-void
.end method

.method static synthetic lambda$show$0(Ljava/util/ArrayList;Landroid/app/Activity;[Ljava/lang/CharSequence;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/String;[Landroid/app/AlertDialog;Landroid/content/DialogInterface;I)V
    .registers 18

    .line 130
    move/from16 v6, p8

    if-ltz v6, :cond_1

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 131
    :cond_0
    aget-object p2, p2, v6

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    .line 132
    invoke-static {p1}, Le/e/a/NativeMylistMove215;->themed(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NativeMylistMove215;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Move selected videos?"

    const-string/jumbo v2, "\u79fb\u52d5\u5df2\u9078\u53d6\u5f71\u7247\uff1f"

    const-string/jumbo v3, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u79fb\u52d5\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p1, v3, v1, v2}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    const-string/jumbo v2, "\u79fb\u52d5\u3059\u308b\u52d5\u753b\uff1a"

    const-string v3, "Videos: "

    const-string/jumbo v4, "\u5f71\u7247\u6578\uff1a"

    invoke-static {p1, v2, v3, v4}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 135
    const-string/jumbo v2, "\u79fb\u52d5\u5148\uff1a"

    const-string v3, "Destination: "

    const-string/jumbo v4, "\u76ee\u7684\u5730\uff1a"

    invoke-static {p1, v2, v3, v4}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 134
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    .line 136
    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    invoke-static {p1, v0, v1, v2}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    .line 137
    const-string/jumbo v0, "\u79fb\u52d5"

    const-string v1, "Move"

    invoke-static {p1, v0, v1, v0}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v0, Le/e/a/NativeMylistMove215$1;

    move-object v3, p0

    move-object v1, p1

    move-object v4, p3

    move-object v2, p4

    move-object v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Le/e/a/NativeMylistMove215$1;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;I[Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 142
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 143
    return-void

    .line 130
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$show$1(Landroid/app/Activity;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;I[Landroid/app/AlertDialog;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 139
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p7

    if-nez p7, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_0

    .line 140
    const/4 p0, 0x0

    aget-object p6, p6, p0

    invoke-static/range {p1 .. p6}, Le/e/a/NativeMylistMove215;->executeOriginal(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;ILandroid/app/AlertDialog;)V

    .line 141
    :cond_0
    return-void
.end method

.method public static show(Ljava/lang/Object;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)Z
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/util/ArrayList<",
            "*>;",
            "Ljava/util/ArrayList<",
            "*>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 87
    const-string v0, "deflist"

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq p1, v1, :cond_0

    return v2

    .line 89
    :cond_0
    const/4 p1, 0x1

    if-eqz p0, :cond_d

    if-eqz p3, :cond_d

    :try_start_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_d

    if-eqz p2, :cond_d

    .line 91
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    const-string v1, "b"

    invoke-virtual {p3, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p3

    .line 93
    invoke-virtual {p3, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 94
    invoke-virtual {p3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v5, p3

    check-cast v5, Landroid/app/Activity;

    .line 95
    if-eqz v5, :cond_c

    invoke-virtual {v5}, Landroid/app/Activity;->isFinishing()Z

    move-result p3

    if-nez p3, :cond_c

    invoke-virtual {v5}, Landroid/app/Activity;->isDestroyed()Z

    move-result p3

    if-eqz p3, :cond_1

    goto/16 :goto_3

    .line 96
    :cond_1
    invoke-static {v5}, Le/e/a/NativeMylistMove215;->themed(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object p3

    .line 97
    if-nez p4, :cond_2

    const-string p4, ""

    :cond_2
    move-object v9, p4

    .line 98
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 99
    new-instance p4, Ljava/util/HashSet;

    invoke-direct {p4}, Ljava/util/HashSet;-><init>()V

    .line 100
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "id"

    if-eqz v1, :cond_8

    :try_start_1
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 101
    instance-of v6, v1, Ljava/util/Map;

    if-nez v6, :cond_4

    goto :goto_0

    .line 102
    :cond_4
    check-cast v1, Ljava/util/Map;

    .line 103
    invoke-static {v1, v3}, Le/e/a/NativeMylistMove215;->text(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-interface {p4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_0

    .line 105
    :cond_5
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 106
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Ljava/lang/String;

    if-eqz v8, :cond_6

    .line 107
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 108
    :cond_7
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    goto :goto_0

    .line 112
    :cond_8
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9

    invoke-interface {p4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 113
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 114
    invoke-virtual {p2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string p4, "title"

    const-string v0, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    const-string v1, "Watch Later"

    const-string/jumbo v3, "\u7a0d\u5f8c\u89c0\u770b"

    invoke-static {p3, v0, v1, v3}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_9
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_a

    .line 120
    const-string/jumbo p0, "\u79fb\u52d5\u3067\u304d\u308b\u30de\u30a4\u30ea\u30b9\u30c8\u304c\u3042\u308a\u307e\u305b\u3093"

    const-string p2, "No eligible destination"

    const-string/jumbo p4, "\u6c92\u6709\u53ef\u79fb\u52d5\u7684\u6e05\u55ae"

    invoke-static {p3, p0, p2, p4}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v5, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 121
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 122
    return p1

    .line 124
    :cond_a
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p2

    new-array v6, p2, [Ljava/lang/CharSequence;

    .line 125
    move p4, v2

    :goto_2
    if-ge p4, p2, :cond_b

    invoke-virtual {v4, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {p3, v0}, Le/e/a/NativeMylistMove215;->title(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, p4

    add-int/lit8 p4, p4, 0x1

    goto :goto_2

    .line 126
    :cond_b
    new-array v10, p1, [Landroid/app/AlertDialog;

    .line 127
    invoke-static {p3}, Le/e/a/NativeMylistMove215;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string/jumbo p4, "\u79fb\u52d5\u5148\u306e\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u9078\u629e"

    const-string v0, "Choose destination Mylist"

    const-string/jumbo v1, "\u9078\u64c7\u76ee\u7684\u5730\u6e05\u55ae"

    invoke-static {p3, p4, v0, v1}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v3, Le/e/a/NativeMylistMove215$0;

    move-object v8, p0

    invoke-direct/range {v3 .. v10}, Le/e/a/NativeMylistMove215$0;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;[Ljava/lang/CharSequence;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/String;[Landroid/app/AlertDialog;)V

    .line 129
    invoke-virtual {p2, v6, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string p4, "Cancel"

    const-string v0, "\u53d6\u6d88"

    .line 144
    invoke-static {p3, p2, p4, v0}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p0, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 145
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    aput-object p0, v10, v2

    .line 146
    aget-object p0, v10, v2

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    .line 147
    return p1

    .line 95
    :cond_c
    :goto_3
    return p1

    .line 90
    :cond_d
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p2, "Missing move selection/destination"

    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 148
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 149
    const-string p2, "nicoid-mylist-move"

    const-string p3, "Unable to create safe move picker"

    invoke-static {p2, p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 150
    return p1
.end method

.method private static text(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 54
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static themed(Landroid/app/Activity;)Landroid/content/Context;
    .registers 7

    .line 48
    :try_start_0
    const-string v0, "e.e.a.PlaybackSession"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 49
    const-string v1, "dialogContext"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 51
    :catch_0
    move-exception v0

    return-object p0
.end method

.method private static title(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 57
    const-string v0, "title"

    invoke-static {p1, v0}, Le/e/a/NativeMylistMove215;->text(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    .line 59
    :cond_0
    const-string p1, "Unnamed Mylist"

    const-string/jumbo v0, "\u672a\u547d\u540d\u6e05\u55ae"

    const-string v1, "\u540d\u79f0\u672a\u8a2d\u5b9a"

    invoke-static {p0, v1, p1, v0}, Le/e/a/NativeMylistMove215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 30
    :try_start_0
    const-string v0, "e.e.a.PanelUi"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 31
    const-string v1, "tr"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x2

    aput-object v3, v2, v5

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 32
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 33
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 34
    :catch_0
    move-exception v0

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 36
    const-string v0, "ja"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "zh"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    move-object p1, p3

    goto :goto_0

    :cond_1
    move-object p1, p2

    :goto_0
    return-object p1
.end method
