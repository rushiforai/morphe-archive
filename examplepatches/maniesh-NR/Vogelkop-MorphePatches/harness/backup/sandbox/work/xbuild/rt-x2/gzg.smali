.class public final Lgzg;
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

    iput-byte p2, p0, Lgzg;->a:B

    iput-object p1, p0, Lgzg;->b:Ljava/lang/Object;

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


# virtual methods
.method public final s()V
    .registers 3

    iget-byte v0, p0, Lgzg;->a:B

    iget-object p0, p0, Lgzg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Lken;

    iget-object v0, p0, Lken;->c:Lydn;

    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_1f

    :cond_19
    sget-object v0, Lhjm;->b:Lhjm;

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lo93;->b(Lhjm;I)V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p0, Lcdn;

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :pswitch_26
    check-cast p0, Ly4g;

    invoke-virtual {p0}, Ly4g;->R()V

    return-void

    :pswitch_2c
    check-cast p0, Ldaj;

    invoke-virtual {p0}, Ldaj;->g()V

    return-void

    :pswitch_32
    check-cast p0, Lhzg;

    invoke-virtual {p0}, Lhzg;->g()V

    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_32
        :pswitch_2c
        :pswitch_26
        :pswitch_20
    .end packed-switch
.end method

.method public final t()V
    .registers 3

    iget-byte v0, p0, Lgzg;->a:B

    iget-object p0, p0, Lgzg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c

    check-cast p0, Lken;

    iget-object v0, p0, Lken;->c:Lydn;

    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_1f

    :cond_19
    sget-object v0, Lhjm;->b:Lhjm;

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lo93;->b(Lhjm;I)V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p0, Lcdn;

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :pswitch_26
    check-cast p0, Ly4g;

    invoke-virtual {p0}, Ly4g;->R()V

    :pswitch_2b
    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_2b
        :pswitch_26
        :pswitch_20
    .end packed-switch
.end method
