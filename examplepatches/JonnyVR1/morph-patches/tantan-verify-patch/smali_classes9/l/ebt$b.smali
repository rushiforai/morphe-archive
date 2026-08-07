.class public Ll/ebt$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eti;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ebt;->o()Ll/eti;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ebt;


# direct methods
.method public constructor <init>(Ll/ebt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ebt;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ebt;->r()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Ll/pzm;->a(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ebt;->h(Ll/ebt;)Ll/jxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 17
    .line 18
    invoke-static {p1}, Ll/ebt;->g(Ll/ebt;)Ll/hti;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Ll/ebt$b;->a:Ll/ebt;

    .line 27
    .line 28
    invoke-static {p0}, Ll/ebt;->h(Ll/ebt;)Ll/jxd0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-interface {p1, p0}, Ll/qwl;->setMute(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
