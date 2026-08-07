.class public final Ll/b3v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b3v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b3v0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b3v0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/lcw0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/b3v0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p0}, Ll/ccr0;->a(Landroid/content/Context;)Landroid/webkit/CookieManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v1, Lcom/google/android/gms/internal/ads/zzflg;->zzv:Lcom/google/android/gms/internal/ads/zzflg;

    .line 26
    .line 27
    new-instance v2, Ll/y2v0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/y2v0;-><init>(Landroid/webkit/CookieManager;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v2, v1, v0}, Ll/rbw0;->a(Ljava/util/concurrent/Callable;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-wide/16 v0, 0x1

    .line 37
    .line 38
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1, v2}, Ll/dcw0;->i(JLjava/util/concurrent/TimeUnit;)Ll/dcw0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object v0, Ll/z2v0;->a:Ll/z2v0;

    .line 45
    .line 46
    new-instance v1, Ll/sbw0;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Ll/sbw0;-><init>(Ll/kbw0;)V

    .line 49
    .line 50
    .line 51
    const-class v0, Ljava/lang/Exception;

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Ll/dcw0;->c(Ljava/lang/Class;Ll/xuw0;)Ll/dcw0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method
