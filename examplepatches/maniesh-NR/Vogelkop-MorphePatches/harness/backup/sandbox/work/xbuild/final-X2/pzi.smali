.class public final synthetic Lpzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Lpzi;->a:B

    iput-object p1, p0, Lpzi;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lpzi;->a:B

    iget-object p0, p0, Lpzi;->b:Lxbf;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lqyi;

    invoke-virtual {p0}, Lxbf;->d()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Lxbf;->d()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
