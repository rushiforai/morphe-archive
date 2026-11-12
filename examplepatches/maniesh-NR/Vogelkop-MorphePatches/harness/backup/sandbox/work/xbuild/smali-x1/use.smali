.class public final synthetic Luse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwse;

.field public final synthetic c:Late;


# direct methods
.method public synthetic constructor <init>(Lwse;Late;B)V
    .registers 4

    iput-byte p3, p0, Luse;->a:B

    iput-object p1, p0, Luse;->b:Lwse;

    iput-object p2, p0, Luse;->c:Late;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Luse;->a:B

    iget-object v1, p0, Luse;->c:Late;

    iget-object p0, p0, Luse;->b:Lwse;

    packed-switch v0, :pswitch_data_6a

    iget-object p0, p0, Lwse;->p:Lzse;

    iget-object v0, p0, Lzse;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lt73;

    invoke-virtual {v0}, Lt73;->a()I

    move-result v0

    invoke-static {v0}, Lij0;->a(I)Lij0;

    move-result-object v0

    iget-object v1, v1, Late;->f:Ll0c;

    invoke-virtual {p0, v0, v1}, Lzse;->H0(Lij0;Ll0c;)V

    return-void

    :pswitch_21
    iget-object p0, p0, Lwse;->p:Lzse;

    iget-object v0, p0, Lzse;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lt73;

    invoke-virtual {v0}, Lt73;->a()I

    move-result v0

    invoke-static {v0}, Lij0;->a(I)Lij0;

    move-result-object v0

    iget-object v1, v1, Late;->f:Ll0c;

    invoke-virtual {p0, v0, v1}, Lzse;->H0(Lij0;Ll0c;)V

    return-void

    :pswitch_39
    iget-object p0, p0, Lwse;->p:Lzse;

    iget-object v0, p0, Lzse;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lt73;

    invoke-virtual {v0}, Lt73;->a()I

    move-result v0

    invoke-static {v0}, Lij0;->a(I)Lij0;

    move-result-object v0

    iget-object v1, v1, Late;->f:Ll0c;

    invoke-virtual {p0, v0, v1}, Lzse;->H0(Lij0;Ll0c;)V

    return-void

    :pswitch_51
    iget-object p0, p0, Lwse;->p:Lzse;

    iget-object v0, p0, Lzse;->x:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lt73;

    invoke-virtual {v0}, Lt73;->a()I

    move-result v0

    invoke-static {v0}, Lij0;->a(I)Lij0;

    move-result-object v0

    iget-object v1, v1, Late;->f:Ll0c;

    invoke-virtual {p0, v0, v1}, Lzse;->H0(Lij0;Ll0c;)V

    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_51
        :pswitch_39
        :pswitch_21
    .end packed-switch
.end method
