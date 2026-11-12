.class public final Ly37;
.super Ln1;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/Set;

.field public static final e:Ljava/util/Set;

.field public static final f:Ljava/util/Set;

.field public static final g:Ljava/util/Set;

.field public static final h:Lkotlin/text/Regex;


# instance fields
.field public final c:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    const-string v0, "magisk"

    const-string v1, "su"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ly37;->d:Ljava/util/Set;

    const-string v13, "/system/usr/we-need-root"

    const-string v14, "/system/xbin"

    const-string v1, "/cache"

    const-string v2, "/data"

    const-string v3, "/data/local"

    const-string v4, "/data/local/bin"

    const-string v5, "/data/local/xbin"

    const-string v6, "/dev"

    const-string v7, "/sbin"

    const-string v8, "/su/bin"

    const-string v9, "/system/bin"

    const-string v10, "/system/bin/.ext"

    const-string v11, "/system/bin/failsafe"

    const-string v12, "/system/sd/xbin"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ly37;->e:Ljava/util/Set;

    const-string v6, "/system/xbin"

    const-string v7, "/vendor/bin"

    const-string v1, "/etc"

    const-string v2, "/sbin"

    const-string v3, "/system"

    const-string v4, "/system/bin"

    const-string v5, "/system/sbin"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ly37;->f:Ljava/util/Set;

    const-string v11, "com.zhiqupk.root.global"

    const-string v12, "eu.chainfire.supersu"

    const-string v1, "com.alephzain.framaroot"

    const-string v2, "com.kingo.root"

    const-string v3, "com.kingroot.kinguser"

    const-string v4, "com.koushikdutta.superuser"

    const-string v5, "com.noshufou.android.su"

    const-string v6, "com.noshufou.android.su.elite"

    const-string v7, "com.smedialink.oneclickroot"

    const-string v8, "com.thirdparty.superuser"

    const-string v9, "com.topjohnwu.magisk"

    const-string v10, "com.yellowes.su"

    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ly37;->g:Ljava/util/Set;

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "\\[([^]]+)]: \\[([^]]*)]"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Ly37;->h:Lkotlin/text/Regex;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/16 v0, 0x1b

    invoke-direct {p0, p2, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ly37;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final b0()Lz37;
    .registers 13

    sget-object v0, Ly37;->g:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Ly37;->c:Landroid/content/Context;

    invoke-static {v2, v1}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto/16 :goto_156

    :cond_1c
    new-instance p0, Lkotlin/Pair;

    const-string v0, "ro.debuggable"

    const-string v1, "1"

    invoke-direct {p0, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lkotlin/Pair;

    const-string v1, "ro.secure"

    const-string v2, "0"

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {p0, v0}, [Lkotlin/Pair;

    move-result-object p0

    invoke-static {p0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    new-instance v0, Lw37;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lw37;-><init>(Ljava/util/Map;B)V

    const-string p0, "getprop"

    invoke-static {p0, v0}, Lsgb;->R(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Z

    move-result p0

    if-nez p0, :cond_156

    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    sget-object v0, Ly37;->e:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    sget-object v4, Ly37;->d:Ljava/util/Set;

    const-string v5, "/"

    if-eqz v3, :cond_85

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_63
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_63

    :cond_85
    const-string v2, "PATH"

    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    if-eqz v2, :cond_f3

    const/16 v6, 0x3a

    invoke-static {v1, v2, v6}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v1

    :cond_9a
    if-ge v7, v6, :cond_f3

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/lang/String;

    invoke-interface {v0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9a

    invoke-static {v8, v3}, Lkotlin/text/StringsKt;->I(Ljava/lang/String;C)Z

    move-result v9

    if-eqz v9, :cond_d0

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_b4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p0, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_b4

    :cond_d0
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_d4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p0, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d4

    :cond_f3
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_f7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_f7

    goto :goto_156

    :cond_10f
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v0, Lx37;

    invoke-direct {v0, p0, v1}, Lx37;-><init>(Ljava/util/LinkedHashMap;B)V

    const-string v2, "mount"

    invoke-static {v2, v0}, Lsgb;->R(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Z

    sget-object v0, Ly37;->f:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_124
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_153

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_130
    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v4, :cond_13f

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_124

    goto :goto_156

    :cond_13f
    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_124

    const/4 v4, 0x6

    invoke-static {v2, v3, v1, v4}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;CII)I

    move-result v4

    if-lez v4, :cond_151

    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_130

    :cond_151
    move-object v2, v5

    goto :goto_130

    :cond_153
    sget-object p0, Lz37;->a:Lz37;

    return-object p0

    :cond_156
    :goto_156
    sget-object p0, Lz37;->b:Lz37;

    return-object p0
.end method

.method public final y(Lkotlin/jvm/functions/Function1;)V
    .registers 7

    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    if-nez v0, :cond_6

    const-string v0, ""

    :cond_6
    const/16 v1, 0x2c

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_11
    if-ge v2, v1, :cond_29

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    const-string v4, "test-keys"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    sget-object p0, Lz37;->b:Lz37;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_29
    invoke-super {p0, p1}, Ln1;->y(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
