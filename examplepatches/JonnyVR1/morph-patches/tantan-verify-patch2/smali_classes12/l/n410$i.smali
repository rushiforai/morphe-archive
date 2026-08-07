.class Ll/n410$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/o$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->G0()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$i;->a:Ll/n410;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n410$i;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/n410$i;->a:Ll/n410;

    .line 10
    .line 11
    invoke-static {p0}, Ll/n410;->q(Ll/n410;)Ll/ipw;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/ipw;->l0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const-string p0, "EditProcess"

    .line 19
    .line 20
    const-string v0, "MediaSourceManager onPauseComplete !!!"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n410$i;->a:Ll/n410;

    .line 2
    .line 3
    iget-object v1, v0, Ll/n410;->d:Lcom/immomo/moment/mediautils/d;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ll/n410;->c0(Ll/n410;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/n410$i;->a:Ll/n410;

    .line 14
    .line 15
    iget-object v0, v0, Ll/n410;->d:Lcom/immomo/moment/mediautils/d;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/d;->q()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/n410$i;->a:Ll/n410;

    .line 21
    .line 22
    iget-object v0, p0, Ll/n410;->i:Ll/xcl0;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Ll/n410;->c0(Ll/n410;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {v0, p0}, Ll/xcl0;->v(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    const-string p0, "EditProcess"

    .line 34
    .line 35
    const-string v0, "MediaSourceManager onSeekComplete !!!"

    .line 36
    .line 37
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
