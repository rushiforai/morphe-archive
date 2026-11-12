.class public interface abstract Loi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static d(Landroid/content/Context;)Loi;
    .registers 2

    const-string v0, "com.opera.android.ui.ACTIVITY_STARTER_SERVICE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loi;

    if-eqz p0, :cond_b

    return-object p0

    :cond_b
    const-string p0, "Trying to use a Context without support?"

    invoke-static {p0}, Lqp2;->g(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method
