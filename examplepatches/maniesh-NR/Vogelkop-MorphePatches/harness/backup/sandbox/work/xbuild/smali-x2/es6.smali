.class public final synthetic Les6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfs6;


# direct methods
.method public synthetic constructor <init>(Lfs6;B)V
    .registers 3

    iput-byte p2, p0, Les6;->a:B

    iput-object p1, p0, Les6;->b:Lfs6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Les6;->a:B

    iget-object p0, p0, Les6;->b:Lfs6;

    check-cast p1, Ljava/lang/Boolean;

    packed-switch v0, :pswitch_data_30

    invoke-virtual {p0}, Lfs6;->c()V

    return-void

    :pswitch_d
    invoke-virtual {p0}, Lfs6;->c()V

    return-void

    :pswitch_11
    iget-object p1, p0, Lfs6;->d:Ljze;

    invoke-virtual {p0}, Lfs6;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_1f
    iget-object p1, p0, Lfs6;->e:Ljze;

    invoke-virtual {p0}, Lfs6;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lfs6;->c()V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method
