.class public Ll/jpd0;
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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lkotlin/Unit;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "rtc"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method

.method public static d()V
    .locals 4

    .line 1
    invoke-static {}, Ll/jpd0;->e()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hpd0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/hpd0;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/ipd0;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/ipd0;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {v1, v2, v3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static e()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->k()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "rtc"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->r(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method
