.class public Ll/gwp;
.super Ll/tin0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tin0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public J4()Ll/cqj;
    .locals 1

    .line 1
    new-instance v0, Ll/cqj$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cqj$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/znc0;->e(Ll/i6t;)Ll/coj;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/cqj$a;->d()Ll/cqj;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
