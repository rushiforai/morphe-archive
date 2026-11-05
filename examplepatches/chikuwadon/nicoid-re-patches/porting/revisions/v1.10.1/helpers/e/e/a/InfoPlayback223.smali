.class public final Le/e/a/InfoPlayback223;
.super Ljava/lang/Object;
.source "InfoPlayback223.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afterPolicy(Ljava/lang/Object;)V
    .registers 2

    .line 10
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_c

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/InfoPlayback223;->clean(Landroid/app/Activity;)V

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V

    :cond_c
    return-void
.end method

.method public static clean(Landroid/app/Activity;)V
    .registers 2

    if-eqz p0, :cond_24

    .line 9
    invoke-static {p0}, Le/e/a/InfoPlayback223;->information(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_24

    :cond_9
    invoke-static {}, Le/e/a/InfoPlayback223;->modernBackground()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-static {p0}, Le/e/a/InfoPlayback223;->legacyBackground(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_16

    return-void

    :cond_16
    const v0, 0x7f08015b

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_24

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_24
    :goto_24
    return-void
.end method

.method static information(Landroid/app/Activity;)Z
    .registers 3

    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    :goto_4
    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const-string v0, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_4
.end method

.method static legacyBackground(Landroid/app/Activity;)Z
    .registers 6

    const/4 v0, 0x0

    .line 8
    :try_start_1
    const-string v1, "D"

    invoke-static {p0, v1}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5d

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "c"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    goto :goto_5d

    :cond_1a
    const-string v2, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "o0"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const-string v3, "p0"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const-string v3, "h0"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v1, :cond_5d

    const-string v1, "q0"

    invoke-virtual {v2, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "E"

    invoke-static {p0, v2}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {v1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_59} :catch_5d

    if-eqz p0, :cond_5d

    const/4 p0, 0x1

    return p0

    :catch_5d
    :cond_5d
    :goto_5d
    return v0
.end method

.method static modernBackground()Z
    .registers 3

    const/4 v0, 0x0

    .line 7
    :try_start_1
    invoke-static {}, Le/e/a/PlaybackBar221;->media()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_9

    const/4 v1, 0x0

    goto :goto_f

    :cond_9
    const-string v2, "owner"

    invoke-static {v1, v2}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_f
    instance-of v2, v1, Landroid/app/Service;

    if-eqz v2, :cond_22

    invoke-static {v1}, Le/e/a/PlaybackBar221;->background(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    const-string v2, "e"

    invoke-static {v1, v2}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_22

    if-eqz v1, :cond_22

    const/4 v0, 0x1

    :catch_22
    :cond_22
    return v0
.end method
