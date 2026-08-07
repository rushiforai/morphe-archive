.class public Ll/r00$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account/ui/camera/pager/AccountFilterScrollMoreViewPager$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r00;->q1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/r00;


# direct methods
.method public constructor <init>(Ll/r00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r00$b;->b:Ll/r00;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/r00$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r00;->x0(Ll/r00;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 11
    .line 12
    invoke-static {v0}, Ll/r00;->s0(Ll/r00;)Ll/ep;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/gp;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 24
    .line 25
    invoke-static {v0}, Ll/r00;->w0(Ll/r00;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_2
    const/4 v0, 0x0

    .line 33
    cmpg-float v0, p1, v0

    .line 34
    .line 35
    if-gez v0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const/4 v0, 0x0

    .line 40
    :goto_1
    iput-boolean v0, p0, Ll/r00$b;->a:Z

    .line 41
    .line 42
    iget-object p0, p0, Ll/r00$b;->b:Ll/r00;

    .line 43
    .line 44
    invoke-static {p0, v0, p1}, Ll/r00;->A0(Ll/r00;ZF)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public b(F)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r00;->x0(Ll/r00;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 11
    .line 12
    invoke-static {v0}, Ll/r00;->s0(Ll/r00;)Ll/ep;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/gp;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 24
    .line 25
    invoke-static {v0}, Ll/r00;->w0(Ll/r00;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 33
    .line 34
    invoke-static {v0}, Ll/r00;->r0(Ll/r00;)F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x0

    .line 39
    cmpl-float v0, v0, v1

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    iget-object v2, p0, Ll/r00$b;->b:Ll/r00;

    .line 44
    .line 45
    cmpl-float p0, p1, v1

    .line 46
    .line 47
    if-lez p0, :cond_3

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    :goto_0
    move v3, p0

    .line 51
    goto :goto_1

    .line 52
    :cond_3
    const/4 p0, 0x0

    .line 53
    goto :goto_0

    .line 54
    :goto_1
    const/4 v5, 0x0

    .line 55
    const-wide/16 v6, 0xc8

    .line 56
    .line 57
    const/4 v4, 0x1

    .line 58
    invoke-static/range {v2 .. v7}, Ll/r00;->B0(Ll/r00;ZZZJ)V

    .line 59
    .line 60
    .line 61
    :cond_4
    :goto_2
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onCancel()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r00;->x0(Ll/r00;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 11
    .line 12
    invoke-static {v0}, Ll/r00;->s0(Ll/r00;)Ll/ep;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/gp;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 24
    .line 25
    invoke-static {v0}, Ll/r00;->w0(Ll/r00;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    iget-object v0, p0, Ll/r00$b;->b:Ll/r00;

    .line 33
    .line 34
    invoke-static {v0}, Ll/r00;->r0(Ll/r00;)F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x0

    .line 39
    cmpl-float v0, v0, v1

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Ll/r00$b;->b:Ll/r00;

    .line 44
    .line 45
    iget-boolean p0, p0, Ll/r00$b;->a:Z

    .line 46
    .line 47
    xor-int/lit8 v2, p0, 0x1

    .line 48
    .line 49
    const/4 v4, 0x1

    .line 50
    const-wide/16 v5, 0xc8

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-static/range {v1 .. v6}, Ll/r00;->B0(Ll/r00;ZZZJ)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_0
    return-void
.end method
