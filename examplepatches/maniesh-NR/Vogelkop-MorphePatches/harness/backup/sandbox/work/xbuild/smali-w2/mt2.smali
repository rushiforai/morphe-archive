.class public final synthetic Lmt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqh;


# direct methods
.method public synthetic constructor <init>(Llqh;B)V
    .registers 3

    iput-byte p2, p0, Lmt2;->a:B

    iput-object p1, p0, Lmt2;->b:Llqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-byte v0, p0, Lmt2;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lmt2;->b:Llqh;

    packed-switch v0, :pswitch_data_16

    iput-boolean v2, p0, Llqh;->a:Z

    return-void

    :pswitch_c
    iput-boolean v1, p0, Llqh;->a:Z

    return-void

    :pswitch_f
    iput-boolean v2, p0, Llqh;->a:Z

    return-void

    :pswitch_12
    iput-boolean v1, p0, Llqh;->a:Z

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
        :pswitch_f
        :pswitch_c
    .end packed-switch
.end method
