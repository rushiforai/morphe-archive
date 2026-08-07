.class public Ll/u2u;
.super Ll/w2u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/w2u<",
        "Ll/x2u;",
        ">;"
    }
.end annotation


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>(Ll/ner;Lrx/c;Ll/nus;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/nus;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/w2u;-><init>(Ll/ner;Lrx/c;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T2()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/evs;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/evs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public U2(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    sget-object v0, Ll/itd0;->d:Ll/itd0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/bk3;

    .line 10
    .line 11
    iget-object v1, v1, Ll/bk3;->a:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/bk3;

    .line 30
    .line 31
    iget-object v0, v0, Ll/bk3;->a:Ll/jxd0;

    .line 32
    .line 33
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-boolean v0, p0, Ll/u2u;->g:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput-boolean v0, p0, Ll/u2u;->g:Z

    .line 44
    .line 45
    sget-object p0, Ll/t4u;->e:Lrx/subjects/b;

    .line 46
    .line 47
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-static {p1}, Ll/t4u;->m(Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
