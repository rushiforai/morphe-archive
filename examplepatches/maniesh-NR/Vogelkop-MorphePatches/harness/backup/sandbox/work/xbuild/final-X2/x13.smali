.class public final Lx13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz13;


# direct methods
.method public synthetic constructor <init>(Lz13;B)V
    .registers 3

    iput-byte p2, p0, Lx13;->a:B

    iput-object p1, p0, Lx13;->b:Lz13;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lx13;->a:B

    iget-object p0, p0, Lx13;->b:Lz13;

    packed-switch v0, :pswitch_data_26

    invoke-virtual {p0}, Lz13;->e()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lz13;->e()V

    return-void

    :pswitch_f
    iget-object v0, p0, Lz13;->d:Lguo;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lguo;->a()V

    :cond_16
    const/4 v0, 0x0

    iput-object v0, p0, Lz13;->d:Lguo;

    iget-object v1, p0, Lz13;->h:Lguo;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Lguo;->a()V

    :cond_20
    iput-object v0, p0, Lz13;->h:Lguo;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lz13;->i:Z

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
