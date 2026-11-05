.class public final Le/e/a/PopupBackground217;
.super Ljava/lang/Object;
.source "PopupBackground217.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static currentPopup(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 5

    .line 6
    const/4 v0, 0x0

    if-eqz p1, :cond_4b

    :try_start_3
    const-string v1, "e"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_4b

    if-eqz p2, :cond_4b

    const-string p1, "f"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p2, "p0"

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "n0"

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4b

    const-string p1, "a"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_46} :catch_4a

    if-eqz p0, :cond_4b

    const/4 p0, 0x1

    return p0

    :catch_4a
    move-exception p0

    :cond_4b
    return v0
.end method

.method public static enter(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 5
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_14

    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_14

    invoke-static {p0, p1}, Le/e/a/DirectBackground235;->adoptPopup(Ljava/lang/Object;Landroid/view/View;)V

    return-void

    :cond_14
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Popup is not attached"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
