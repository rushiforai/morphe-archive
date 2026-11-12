.class public final synthetic Lfam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld1h;


# direct methods
.method public synthetic constructor <init>(Ld1h;B)V
    .registers 3

    iput-byte p2, p0, Lfam;->a:B

    iput-object p1, p0, Lfam;->b:Ld1h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lfam;->a:B

    iget-object p0, p0, Lfam;->b:Ld1h;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_16

    iput-object p1, p0, Ldca;->d:Ljava/util/List;

    invoke-virtual {p0}, Ldca;->b()V

    return-void

    :pswitch_f
    iput-object p1, p0, Ldca;->c:Ljava/util/List;

    invoke-virtual {p0}, Ldca;->b()V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
