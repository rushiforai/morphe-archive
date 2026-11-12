.class public final Lnlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lnlk;->a:B

    iput-object p1, p0, Lnlk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method

.method private final d()V
    .registers 1

    return-void
.end method

.method private final e()V
    .registers 1

    return-void
.end method

.method private final f()V
    .registers 1

    return-void
.end method

.method private final g()V
    .registers 1

    return-void
.end method

.method private final h()V
    .registers 1

    return-void
.end method

.method private final i()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 3

    iget-byte v0, p0, Lnlk;->a:B

    iget-object p0, p0, Lnlk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_70

    check-cast p0, Lggn;

    invoke-virtual {p0}, Lggn;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lc1a;

    iget-object v0, p0, Lc1a;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    invoke-virtual {v0}, Lydn;->p()Lwdn;

    move-result-object v1

    invoke-virtual {v1}, Lwdn;->a()Z

    move-result v1

    if-eqz v1, :cond_39

    iget-object v1, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast v1, Lnlk;

    if-eqz v1, :cond_26

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    :cond_26
    const/4 v0, 0x0

    iput-object v0, p0, Lc1a;->h:Ljava/lang/Object;

    iget-object v0, p0, Lc1a;->e:Ljava/lang/Object;

    check-cast v0, Lz77;

    invoke-virtual {p0}, Lc1a;->R()Lb23;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_39
    return-void

    :pswitch_3a
    check-cast p0, Lklk;

    iget-object v0, p0, Lklk;->m:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_4e
    check-cast p0, Li9c;

    invoke-virtual {p0}, Li9c;->c()V

    return-void

    :pswitch_54
    check-cast p0, Locn;

    iget-object v0, p0, Locn;->e:Li9c;

    iget-object p0, p0, Locn;->c:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    iget-boolean v1, v0, Li9c;->b:Z

    if-eq p0, v1, :cond_69

    iput-boolean p0, v0, Li9c;->b:Z

    invoke-virtual {v0}, Li9c;->a()V

    :cond_69
    return-void

    :pswitch_6a
    check-cast p0, Lolk;

    invoke-virtual {p0}, Lolk;->s()V

    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_54
        :pswitch_4e
        :pswitch_3a
        :pswitch_d
    .end packed-switch
.end method

.method public final s()V
    .registers 2

    iget-byte v0, p0, Lnlk;->a:B

    iget-object p0, p0, Lnlk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Li9c;

    invoke-virtual {p0}, Li9c;->c()V

    return-void

    :pswitch_e
    check-cast p0, Locn;

    invoke-virtual {p0}, Locn;->T()V

    return-void

    :pswitch_14
    check-cast p0, Lolk;

    invoke-virtual {p0}, Lolk;->s()V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_14
        :pswitch_e
        :pswitch_8
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method

.method public final t()V
    .registers 1

    iget-byte p0, p0, Lnlk;->a:B

    return-void
.end method
