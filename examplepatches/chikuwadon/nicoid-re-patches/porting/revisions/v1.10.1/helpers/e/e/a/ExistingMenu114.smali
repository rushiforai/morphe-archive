.class public final Le/e/a/ExistingMenu114;
.super Ljava/lang/Object;
.source "ExistingMenu114.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ExistingMenu114$Entry;,
        Le/e/a/ExistingMenu114$Guard;
    }
.end annotation


# static fields
.field static final CONTINUOUS:I = 0x7f0f0201

.field static final MAIN:Landroid/os/Handler;

.field static final SHUFFLE:I = 0x46c8


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 13
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ExistingMenu114;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static change(Landroid/app/Activity;Landroid/view/Menu;Landroid/view/MenuItem;)Z
    .registers 12

    .line 15
    const-string v0, "continuous_play"

    invoke-static {p1}, Le/e/a/ExistingMenu114;->hold(Landroid/view/Menu;)Le/e/a/ExistingMenu114$Guard;

    move-result-object v1

    const/4 v2, 0x1

    :try_start_7
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const/16 v4, 0x46c8

    const/4 v5, 0x0

    if-ne p2, v4, :cond_16

    move p2, v2

    goto :goto_17

    :cond_16
    move p2, v5

    :goto_17
    invoke-interface {v3, v0, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_1b} :catch_98
    .catchall {:try_start_7 .. :try_end_1b} :catchall_96

    const-string v7, "continuous_play_mode"

    const/4 v8, 0x2

    if-eqz v6, :cond_2d

    :try_start_20
    invoke-interface {v3, v7, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v8, :cond_28

    move v6, v2

    goto :goto_29

    :cond_28
    move v6, v5

    :goto_29
    if-ne v6, p2, :cond_2d

    move v6, v2

    goto :goto_2e

    :cond_2d
    move v6, v5

    :goto_2e
    if-eqz v6, :cond_32

    move v6, v5

    goto :goto_33

    :cond_32
    move v6, v2

    :goto_33
    invoke-static {p0, v6, p2}, Le/e/a/TabPlayback110;->changed(Landroid/app/Activity;ZZ)V

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v0, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    if-eqz p2, :cond_42

    move v0, v8

    goto :goto_43

    :cond_42
    move v0, v5

    :goto_43
    invoke-interface {p0, v7, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string p0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v0, "I"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v6}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const-string v0, "J"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    if-eqz p2, :cond_63

    goto :goto_64

    :cond_63
    move v8, v5

    :goto_64
    invoke-virtual {p0, v3, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    const p0, 0x7f0f0201

    invoke-interface {p1, p0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p0, :cond_7e

    if-eqz v6, :cond_7a

    if-nez p2, :cond_7a

    move v0, v2

    goto :goto_7b

    :cond_7a
    move v0, v5

    :goto_7b
    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    :cond_7e
    if-eqz p1, :cond_88

    if-eqz v6, :cond_85

    if-eqz p2, :cond_85

    move v5, v2

    :cond_85
    invoke-interface {p1, v5}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_88} :catch_98
    .catchall {:try_start_20 .. :try_end_88} :catchall_96

    :cond_88
    sget-object p0, Le/e/a/ExistingMenu114;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;

    invoke-direct {p1, v1}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;-><init>(Le/e/a/ExistingMenu114$Guard;)V

    :goto_92
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return v2

    :catchall_96
    move-exception p0

    goto :goto_ab

    :catch_98
    move-exception p0

    :try_start_99
    const-string p1, "nicoid-menu"

    const-string p2, "Cannot change playback mode"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_a0
    .catchall {:try_start_99 .. :try_end_a0} :catchall_96

    sget-object p0, Le/e/a/ExistingMenu114;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;

    invoke-direct {p1, v1}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;-><init>(Le/e/a/ExistingMenu114$Guard;)V

    goto :goto_92

    :goto_ab
    sget-object p1, Le/e/a/ExistingMenu114;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;

    invoke-direct {p2, v1}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;-><init>(Le/e/a/ExistingMenu114$Guard;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p0
.end method

.method static closeMethod(Ljava/lang/reflect/Method;)Z
    .registers 4

    .line 16
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object p0

    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x0

    if-ne p0, v1, :cond_23

    array-length p0, v0

    const/4 v1, 0x2

    if-ne p0, v1, :cond_23

    const-class p0, Landroid/view/Menu;

    aget-object v1, v0, v2

    invoke-virtual {p0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_23

    const/4 p0, 0x1

    aget-object v0, v0, p0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_23

    return p0

    :cond_23
    return v2
.end method

.method static hold(Landroid/view/Menu;)Le/e/a/ExistingMenu114$Guard;
    .registers 14

    .line 19
    new-instance v0, Le/e/a/ExistingMenu114$Guard;

    invoke-direct {v0}, Le/e/a/ExistingMenu114$Guard;-><init>()V

    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_9
    if-eqz v1, :cond_93

    const-class v2, Ljava/lang/Object;

    if-ne v1, v2, :cond_11

    .line 24
    goto/16 :goto_93

    .line 19
    :cond_11
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_18
    if-lt v5, v3, :cond_1f

    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_9

    :cond_1f
    aget-object v6, v2, v5

    .line 20
    const-class v7, Ljava/util/List;

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_2e

    :goto_2d
    goto :goto_44

    :cond_2e
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v6, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Ljava/util/List;

    if-nez v7, :cond_3b

    goto :goto_2d

    :cond_3b
    check-cast v6, Ljava/util/List;

    .line 21
    move v7, v4

    :goto_3e
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-lt v7, v8, :cond_47

    .line 19
    :goto_44
    add-int/lit8 v5, v5, 0x1

    goto :goto_18

    .line 21
    :cond_47
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Ljava/lang/ref/WeakReference;

    if-nez v9, :cond_50

    :goto_4f
    goto :goto_88

    :cond_50
    move-object v9, v8

    check-cast v9, Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_5a

    goto :goto_4f

    :cond_5a
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-static {v10}, Le/e/a/ExistingMenu114;->presenterInterface(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v10

    if-nez v10, :cond_65

    goto :goto_4f

    .line 22
    :cond_65
    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    new-instance v12, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda0;

    invoke-direct {v12, v9}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;)V

    invoke-static {v11, v10, v12}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v9

    new-instance v10, Ljava/lang/ref/WeakReference;

    invoke-direct {v10, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v6, v7, v10}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v11, v0, Le/e/a/ExistingMenu114$Guard;->entries:Ljava/util/ArrayList;

    new-instance v12, Le/e/a/ExistingMenu114$Entry;

    invoke-direct {v12, v6, v8, v10, v9}, Le/e/a/ExistingMenu114$Entry;-><init>(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_88} :catch_8b

    .line 21
    :goto_88
    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    .line 24
    :catch_8b
    move-exception p0

    const-string v1, "nicoid-menu"

    const-string v2, "Cannot retain existing menu"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_93
    :goto_93
    return-object v0
.end method

.method public static install(Ljava/lang/Object;Landroid/view/Menu;)V
    .registers 4

    .line 14
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_13

    if-nez p1, :cond_7

    goto :goto_13

    :cond_7
    check-cast p0, Landroid/app/Activity;

    sget-object v0, Le/e/a/ExistingMenu114;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_13
    :goto_13
    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 6

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_2e

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_2e

    :cond_d
    const v0, 0x7f0f0201

    const/16 v1, 0x46c8

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_17
    const/4 v2, 0x2

    if-lt v1, v2, :cond_1b

    return-void

    :cond_1b
    aget v2, v0, v1

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_2b

    new-instance v3, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, p1}, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_2e
    :goto_2e
    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Landroid/view/Menu;Landroid/view/MenuItem;)Z
    .registers 3

    .line 14
    invoke-static {p0, p1, p2}, Le/e/a/ExistingMenu114;->change(Landroid/app/Activity;Landroid/view/Menu;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$3(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 22
    invoke-static {p2}, Le/e/a/ExistingMenu114;->closeMethod(Ljava/lang/reflect/Method;)Z

    move-result p1

    if-eqz p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    :try_start_8
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method static presenterInterface(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 17
    nop

    :goto_1
    if-nez p0, :cond_5

    const/4 p0, 0x0

    return-object p0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_c
    if-lt v3, v1, :cond_13

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_1

    :cond_13
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v6, v5

    move v7, v2

    :goto_1b
    if-lt v7, v6, :cond_20

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_20
    aget-object v8, v5, v7

    invoke-static {v8}, Le/e/a/ExistingMenu114;->closeMethod(Ljava/lang/reflect/Method;)Z

    move-result v8

    if-eqz v8, :cond_29

    return-object v4

    :cond_29
    add-int/lit8 v7, v7, 0x1

    goto :goto_1b
.end method
