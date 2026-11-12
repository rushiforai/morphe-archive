.class public final synthetic Lflk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhlk;


# direct methods
.method public synthetic constructor <init>(Lhlk;B)V
    .registers 3

    iput-byte p2, p0, Lflk;->a:B

    iput-object p1, p0, Lflk;->b:Lhlk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lflk;->a:B

    iget-object p0, p0, Lflk;->b:Lhlk;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Lh1b;

    invoke-virtual {p0}, Lhlk;->g()V

    return-void

    :pswitch_d
    check-cast p1, Luvg;

    invoke-virtual {p0}, Lhlk;->g()V

    return-void

    :pswitch_13
    check-cast p1, Ldpf;

    invoke-virtual {p0}, Lhlk;->g()V

    return-void

    :pswitch_19
    check-cast p1, Lwvg;

    invoke-virtual {p0}, Lhlk;->g()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
