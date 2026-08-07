.class public Ll/e26;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/pcj;Landroid/net/Uri;Ll/gcg0;)V
    .locals 2

    .line 1
    invoke-interface {p2, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e26$a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, p2, p0}, Ll/e26$a;-><init>(Landroid/os/Handler;Ll/gcg0;Ll/pcj;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, p1, v1, v0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/d26;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ll/d26;-><init>(Landroid/database/ContentObserver;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Landroid/database/ContentObserver;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static c(Landroid/net/Uri;ZLl/pcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Z",
            "Ll/pcj<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/pcj<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/c26;

    .line 2
    .line 3
    invoke-direct {p1, p2, p0}, Ll/c26;-><init>(Ll/pcj;Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
