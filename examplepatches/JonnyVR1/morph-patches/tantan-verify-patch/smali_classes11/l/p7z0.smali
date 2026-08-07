.class public final Ll/p7z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ycr0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/cbr0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/cbr0;Ll/drt0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzdl;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p7z0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p7z0;->b:Ll/cbr0;

    .line 7
    .line 8
    sget p0, Ll/mpw0;->a:I

    .line 9
    .line 10
    const/16 p2, 0x1d

    .line 11
    .line 12
    if-lt p0, p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 19
    .line 20
    if-lt p1, p2, :cond_1

    .line 21
    .line 22
    const/16 p1, 0x1e

    .line 23
    .line 24
    if-ne p0, p1, :cond_1

    .line 25
    .line 26
    sget-object p0, Ll/mpw0;->d:Ljava/lang/String;

    .line 27
    .line 28
    const-string p1, "moto g(20)"

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/wnw0;->c(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "rmx3231"

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/wnw0;->c(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 43
    throw p0
.end method
