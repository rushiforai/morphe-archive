.class public final Lyv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgw1;


# virtual methods
.method public final onWindowFocusChanged(Landroid/app/Activity;Z)V
    .registers 3

    if-eqz p2, :cond_12

    sget-object p0, Lorg/chromium/base/ApplicationStatus;->d:Landroid/app/Activity;

    if-eq p1, p0, :cond_12

    invoke-static {p1}, Lorg/chromium/base/ApplicationStatus;->b(Landroid/app/Activity;)I

    move-result p0

    const/4 p2, 0x6

    if-eq p0, p2, :cond_12

    const/4 p2, 0x5

    if-eq p0, p2, :cond_12

    sput-object p1, Lorg/chromium/base/ApplicationStatus;->d:Landroid/app/Activity;

    :cond_12
    return-void
.end method
