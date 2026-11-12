.class public final synthetic La5b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lx5f;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, La5b;->a:B

    iput-object p1, p0, La5b;->b:Lx5f;

    iput-object p2, p0, La5b;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lvb0;)V
    .registers 4

    iget-byte v0, p0, La5b;->a:B

    iget-object v1, p0, La5b;->c:Ljava/lang/String;

    iget-object p0, p0, La5b;->b:Lx5f;

    packed-switch v0, :pswitch_data_16

    sget-object v0, Laa0;->c:Laa0;

    invoke-virtual {p0, p1, v0, v1}, Lx5f;->G(Lvb0;Laa0;Ljava/lang/String;)V

    return-void

    :pswitch_f
    sget-object v0, Laa0;->b:Laa0;

    invoke-virtual {p0, p1, v0, v1}, Lx5f;->G(Lvb0;Laa0;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
