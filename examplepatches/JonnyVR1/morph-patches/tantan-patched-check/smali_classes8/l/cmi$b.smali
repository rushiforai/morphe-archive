.class public Ll/cmi$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cmi;->s(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/cmi;


# direct methods
.method public constructor <init>(Ll/cmi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/cmi$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cmi;->h(Ll/cmi;)Ll/xvx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/xvx;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 15
    .line 16
    invoke-static {v0}, Ll/cmi;->k(Ll/cmi;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    cmpg-float v0, p1, v0

    .line 25
    .line 26
    if-gez v0, :cond_2

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_1

    .line 30
    :cond_2
    const/4 v0, 0x0

    .line 31
    :goto_1
    iput-boolean v0, p0, Ll/cmi$b;->a:Z

    .line 32
    .line 33
    iget-object p0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 34
    .line 35
    invoke-static {p0, v0, p1}, Ll/cmi;->m(Ll/cmi;ZF)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public b(F)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cmi;->h(Ll/cmi;)Ll/xvx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/xvx;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 15
    .line 16
    invoke-static {v0}, Ll/cmi;->k(Ll/cmi;)Z

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
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 24
    .line 25
    invoke-static {v0}, Ll/cmi;->g(Ll/cmi;)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v2, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 35
    .line 36
    cmpl-float p0, p1, v1

    .line 37
    .line 38
    if-lez p0, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    :goto_0
    move v3, p0

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    const/4 v5, 0x0

    .line 46
    const-wide/16 v6, 0xc8

    .line 47
    .line 48
    const/4 v4, 0x1

    .line 49
    invoke-static/range {v2 .. v7}, Ll/cmi;->n(Ll/cmi;ZZZJ)V

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_2
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cmi;->i(Ll/cmi;)Ll/azy;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/azy;->G0()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 11
    .line 12
    invoke-static {p0}, Ll/cmi;->i(Ll/cmi;)Ll/azy;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/azy;->O()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onCancel()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cmi;->h(Ll/cmi;)Ll/xvx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/xvx;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 15
    .line 16
    invoke-static {v0}, Ll/cmi;->k(Ll/cmi;)Z

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
    iget-object v0, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 24
    .line 25
    invoke-static {v0}, Ll/cmi;->g(Ll/cmi;)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Ll/cmi$b;->b:Ll/cmi;

    .line 35
    .line 36
    iget-boolean p0, p0, Ll/cmi$b;->a:Z

    .line 37
    .line 38
    xor-int/lit8 v2, p0, 0x1

    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    const-wide/16 v5, 0xc8

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    invoke-static/range {v1 .. v6}, Ll/cmi;->n(Ll/cmi;ZZZJ)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method
