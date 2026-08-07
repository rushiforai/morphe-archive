.class public final Ll/lzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# instance fields
.field public final synthetic a:Ll/pgg0;


# direct methods
.method public constructor <init>(Ll/pgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lzg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p1, Ll/ysg0;->a:Ll/twg0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x3

    .line 7
    const-string v0, "WXGame"

    .line 8
    .line 9
    const-string v1, "\u89e6\u53d1\u4e86\uff1aGameViewOnSurfaceDestroyed"

    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ltech/sud/logger/LogUtils;->file(ILjava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-boolean p1, Ll/mzg0;->m:Z

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/lzg0;->a:Ll/pgg0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/pgg0;->h:Ll/qkg0;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Ll/qkg0;->a:Ll/mzg0;

    .line 28
    .line 29
    iget-object p0, p0, Ll/mzg0;->i:Ll/iog0;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    check-cast p0, Ll/iug0;

    .line 34
    .line 35
    const-string p1, "LoadGameStatsManager"

    .line 36
    .line 37
    const-string v0, "gameViewOnSurfaceDestroyed"

    .line 38
    .line 39
    invoke-static {p1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-boolean p1, p0, Ll/iug0;->r:Z

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/iug0;->e(Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method
