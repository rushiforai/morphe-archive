.class public Ll/rrf0;
.super Ll/ogk;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/jt2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/prf0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/prf0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getTextOutID()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/jt2;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    return v0
.end method
