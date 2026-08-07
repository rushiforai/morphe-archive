.class public Ll/lti$a;
.super Ll/r2d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lti;->i(Ll/hti;Lcom/p1/mobile/android/app/Act;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r2d0<",
        "Ll/hti;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic b:Ll/lti;


# direct methods
.method public constructor <init>(Ll/lti;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lti$a;->b:Ll/lti;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/r2d0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ll/hti;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lti$a;->b:Ll/lti;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/lti;->b(Ll/lti;Ll/hti;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/r2d0;->a()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_3

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/qwl;->isPlaying()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-interface {p0, v0}, Ll/qwl;->b(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ll/qwl;->reset()V

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    instance-of p1, p0, Ll/v91;

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    check-cast p0, Ll/v91;

    .line 55
    .line 56
    invoke-interface {p0}, Ll/v91;->exit()V

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hti;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lti$a;->b(Ll/hti;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
