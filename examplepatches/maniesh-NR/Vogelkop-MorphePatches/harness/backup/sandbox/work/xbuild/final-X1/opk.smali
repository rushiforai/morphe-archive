.class public final synthetic Lopk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljs6;


# direct methods
.method public synthetic constructor <init>(Ljs6;B)V
    .registers 3

    iput-byte p2, p0, Lopk;->a:B

    iput-object p1, p0, Lopk;->b:Ljs6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lopk;->a:B

    iget-object p0, p0, Lopk;->b:Ljs6;

    packed-switch v0, :pswitch_data_2c

    invoke-virtual {p0}, Ljs6;->a()V

    return-void

    :pswitch_b
    iget-boolean v0, p0, Ljs6;->b:Z

    if-nez v0, :cond_19

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljs6;->b:Z

    iget-object p0, p0, Ljs6;->j:Ljava/lang/Object;

    check-cast p0, Lopk;

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_19
    return-void

    :pswitch_1a
    iget-object v0, p0, Ljs6;->c:Ljava/lang/Object;

    check-cast v0, Lcpk;

    new-instance v1, Lzzh;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lcpk;->b:Lzzh;

    invoke-virtual {p0, v1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_b
    .end packed-switch
.end method
