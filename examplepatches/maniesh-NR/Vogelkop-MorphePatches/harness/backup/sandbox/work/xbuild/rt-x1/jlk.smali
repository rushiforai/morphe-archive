.class public final synthetic Ljlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lplk;


# direct methods
.method public synthetic constructor <init>(Lplk;B)V
    .registers 3

    iput-byte p2, p0, Ljlk;->a:B

    iput-object p1, p0, Ljlk;->b:Lplk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ljlk;->a:B

    iget-object p0, p0, Ljlk;->b:Lplk;

    packed-switch v0, :pswitch_data_1a

    check-cast p1, Leb8;

    invoke-virtual {p0}, Lplk;->v()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lplk;->v()V

    return-void

    :pswitch_13
    check-cast p1, Lmlk;

    invoke-virtual {p0}, Lplk;->v()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
