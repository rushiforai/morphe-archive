.class public final Ll/gfw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "Application Context cannot be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/tgw0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/gfw0;->a:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/gfw0;->a:Z

    .line 12
    .line 13
    invoke-static {}, Ll/egw0;->c()Ll/egw0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Ll/egw0;->d(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/sfw0;->i()Ll/sfw0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Ll/vfw0;->d(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/pgw0;->b(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/qgw0;->d(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/u1;->a(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/xfw0;->b()Ll/xfw0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Ll/xfw0;->c(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/rfw0;->b()Ll/rfw0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p1}, Ll/rfw0;->d(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gfw0;->a:Z

    .line 2
    .line 3
    return p0
.end method
