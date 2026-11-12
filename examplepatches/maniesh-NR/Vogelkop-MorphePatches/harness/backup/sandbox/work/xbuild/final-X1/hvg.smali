.class public final synthetic Lhvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Livg;

.field public final synthetic c:Lamk;


# direct methods
.method public synthetic constructor <init>(Livg;Lamk;B)V
    .registers 4

    iput-byte p3, p0, Lhvg;->a:B

    iput-object p1, p0, Lhvg;->b:Livg;

    iput-object p2, p0, Lhvg;->c:Lamk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lhvg;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lhvg;->c:Lamk;

    iget-object p0, p0, Lhvg;->b:Livg;

    packed-switch v0, :pswitch_data_3c

    iget-object p0, p0, Livg;->c:Ljava/lang/Object;

    check-cast p0, Ltah;

    iget-object v0, p0, Ltah;->e:Ljava/lang/Object;

    check-cast v0, Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    new-instance v3, Ljvg;

    invoke-direct {v3, p0, v2, v1}, Ljvg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_23
    iget-object p0, p0, Livg;->c:Ljava/lang/Object;

    check-cast p0, Ltah;

    iget-object v0, p0, Ltah;->e:Ljava/lang/Object;

    check-cast v0, Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    new-instance v3, Ljvg;

    invoke-direct {v3, p0, v2, v1}, Ljvg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
