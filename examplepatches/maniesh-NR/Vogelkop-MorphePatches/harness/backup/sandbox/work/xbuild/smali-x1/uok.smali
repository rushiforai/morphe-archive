.class public final synthetic Luok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Luok;->a:B

    iput-object p1, p0, Luok;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Luok;->a:B

    iget-object p0, p0, Luok;->b:Lxbf;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_22

    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {p0}, Lxbf;->B()V

    return-void

    :pswitch_f
    iput-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    invoke-virtual {p0}, Lxbf;->B()V

    return-void

    :pswitch_15
    iput-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Lxbf;->B()V

    return-void

    :pswitch_1b
    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    invoke-virtual {p0}, Lxbf;->B()V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_15
        :pswitch_f
    .end packed-switch
.end method
