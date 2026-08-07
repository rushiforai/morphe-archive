.class public Ll/sj1;
.super Ll/eij0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eij0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/sj1;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final x()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/eij0;->t(I)Ll/eij0;

    .line 3
    .line 4
    .line 5
    new-instance v1, Ll/nxf;

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-direct {v1, v2}, Ll/nxf;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v1, Ll/bs4;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/bs4;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v1, Ll/nxf;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Ll/nxf;-><init>(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
