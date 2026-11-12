.class public final Ldjm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Ltcc;

.field public final b:Loje;

.field public c:Z


# direct methods
.method public constructor <init>(Ltcc;Loje;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldjm;->a:Ltcc;

    iput-object p2, p0, Ldjm;->b:Loje;

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Ldjm;->a:Ltcc;

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_2f

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2c

    const/4 v1, 0x2

    if-eq v0, v1, :cond_29

    const/4 v1, 0x3

    if-eq v0, v1, :cond_26

    const/4 v1, 0x4

    if-ne v0, v1, :cond_22

    iget-boolean v0, p0, Ldjm;->c:Z

    if-eqz v0, :cond_1f

    sget-object v0, Lqcc;->e:Lqcc;

    goto :goto_31

    :cond_1f
    sget-object v0, Lqcc;->c:Lqcc;

    goto :goto_31

    :cond_22
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_26
    sget-object v0, Lqcc;->c:Lqcc;

    goto :goto_31

    :cond_29
    sget-object v0, Lqcc;->c:Lqcc;

    goto :goto_31

    :cond_2c
    sget-object v0, Lqcc;->b:Lqcc;

    goto :goto_31

    :cond_2f
    sget-object v0, Lqcc;->a:Lqcc;

    :goto_31
    iget-object p0, p0, Ldjm;->b:Loje;

    iget-object p0, p0, Loje;->d:Lqdc;

    iget-object v1, p0, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->b:Lqcc;

    if-ne v1, v2, :cond_44

    sget-object v1, Lqcc;->a:Lqcc;

    if-ne v0, v1, :cond_44

    sget-object v1, Lqcc;->c:Lqcc;

    invoke-virtual {p0, v1}, Lqdc;->g(Lqcc;)V

    :cond_44
    invoke-virtual {p0, v0}, Lqdc;->g(Lqcc;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    iget-object p1, p0, Ldjm;->a:Ltcc;

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    invoke-virtual {p0}, Ldjm;->a()V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    invoke-virtual {p0}, Ldjm;->a()V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    invoke-virtual {p0}, Ldjm;->a()V

    return-void
.end method
