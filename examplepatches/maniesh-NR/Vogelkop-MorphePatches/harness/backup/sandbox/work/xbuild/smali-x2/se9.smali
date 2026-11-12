.class public final synthetic Lse9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leof;


# direct methods
.method public synthetic constructor <init>(Leof;B)V
    .registers 3

    iput-byte p2, p0, Lse9;->a:B

    iput-object p1, p0, Lse9;->b:Leof;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lse9;->a:B

    iget-object p0, p0, Lse9;->b:Leof;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lq43;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_e
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
