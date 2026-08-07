.class public Ll/nsb0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sw0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nsb0;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


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
.method public onBack()V
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "page_id"

    .line 4
    .line 5
    invoke-static {}, Ll/nsb0;->l()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "e_active_check"

    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    invoke-static {p0}, Ll/nsb0;->i(Z)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-static {p0}, Ll/uqi;->l(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFront()V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/nsb0;->i(Z)V

    .line 3
    .line 4
    .line 5
    new-instance p0, Ll/pf60;

    .line 6
    .line 7
    const-string v0, "page_id"

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_active_check"

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/ive0;->m()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 30
    .line 31
    const/16 v0, 0x1c

    .line 32
    .line 33
    if-ne p0, v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Ll/nsb0;->r()V

    .line 37
    .line 38
    .line 39
    :goto_0
    sget-object p0, Ll/nsb0;->d:Ll/byd0;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method
