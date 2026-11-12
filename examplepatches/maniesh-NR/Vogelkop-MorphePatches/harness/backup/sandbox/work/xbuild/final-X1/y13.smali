.class public final Ly13;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lz13;


# direct methods
.method public synthetic constructor <init>(Lz13;B)V
    .registers 3

    iput-byte p2, p0, Ly13;->i:B

    iput-object p1, p0, Ly13;->j:Lz13;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ly13;->i:B

    packed-switch v0, :pswitch_data_2c

    iget-object v0, p0, Ly13;->j:Lz13;

    iget-boolean v0, v0, Lz13;->o:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Ly13;->j:Lz13;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lz13;->i:Z

    iget-object v0, v0, Lz13;->d:Lguo;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lguo;->a()V

    :cond_17
    iget-object p0, p0, Ly13;->j:Lz13;

    iget-object v0, p0, Lz13;->h:Lguo;

    iput-object v0, p0, Lz13;->d:Lguo;

    const/4 v0, 0x0

    iput-object v0, p0, Lz13;->h:Lguo;

    :cond_20
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    iget-object p0, p0, Ly13;->j:Lz13;

    invoke-virtual {p0}, Lz13;->e()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
