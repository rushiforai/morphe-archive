.class public final Ll/s6r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wl50;


# instance fields
.field public final synthetic a:Ll/xtd;


# direct methods
.method public constructor <init>(Ll/xtd;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s6r0;->a:Ll/xtd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ll/her;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s6r0;->a:Ll/xtd;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/xtd;->r(Ll/xtd;Ll/her;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/s6r0;->a:Ll/xtd;

    .line 7
    .line 8
    invoke-static {p1}, Ll/xtd;->q(Ll/xtd;)Ljava/util/LinkedList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/z7r0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/s6r0;->a:Ll/xtd;

    .line 29
    .line 30
    invoke-static {v1}, Ll/xtd;->p(Ll/xtd;)Ll/her;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v1}, Ll/z7r0;->a(Ll/her;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p1, p0, Ll/s6r0;->a:Ll/xtd;

    .line 39
    .line 40
    invoke-static {p1}, Ll/xtd;->q(Ll/xtd;)Ljava/util/LinkedList;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ljava/util/LinkedList;->clear()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/s6r0;->a:Ll/xtd;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p0, p1}, Ll/xtd;->s(Ll/xtd;Landroid/os/Bundle;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
