.class public Ll/mc5;
.super Ll/lqi0;
.source "SourceFile"


# instance fields
.field private N:Ll/upr;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lqi0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/mc5;->N:Ll/upr;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public R(Ll/upr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mc5;->N:Ll/upr;

    .line 2
    .line 3
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mc5;->N:Ll/upr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/upr;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-super {p0}, Ll/lqi0;->h()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
