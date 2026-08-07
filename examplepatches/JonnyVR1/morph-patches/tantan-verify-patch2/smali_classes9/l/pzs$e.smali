.class public Ll/pzs$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eti;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pzs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pzs;


# direct methods
.method public constructor <init>(Ll/pzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzs$e;->a:Ll/pzs;

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
    iget-object p0, p0, Ll/pzs$e;->a:Ll/pzs;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pzs;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzs$e;->a:Ll/pzs;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1, p1, p1}, Ll/pzs;->l(Ll/pzs;ZZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzs$e;->a:Ll/pzs;

    .line 2
    .line 3
    invoke-static {v0}, Ll/pzs;->g(Ll/pzs;)Ll/jxd0;

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
    iget-object p1, p0, Ll/pzs$e;->a:Ll/pzs;

    .line 17
    .line 18
    invoke-static {p1}, Ll/pzs;->h(Ll/pzs;)Ll/qid0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/pzs$e;->a:Ll/pzs;

    .line 23
    .line 24
    invoke-static {p0}, Ll/pzs;->g(Ll/pzs;)Ll/jxd0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, Ll/qid0;->y0(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
