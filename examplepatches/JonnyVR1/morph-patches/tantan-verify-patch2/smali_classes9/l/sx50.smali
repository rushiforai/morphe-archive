.class public Ll/sx50;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/sx50;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/o5c;->a()Ll/o5c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/o5c;->c(Ll/oo2;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/wrv;->y0(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
