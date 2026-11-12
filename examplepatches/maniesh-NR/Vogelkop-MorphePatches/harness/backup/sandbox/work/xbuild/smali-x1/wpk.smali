.class public final synthetic Lwpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhqk;


# direct methods
.method public synthetic constructor <init>(Lhqk;B)V
    .registers 3

    iput-byte p2, p0, Lwpk;->a:B

    iput-object p1, p0, Lwpk;->b:Lhqk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lwpk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lwpk;->b:Lhqk;

    packed-switch v0, :pswitch_data_16

    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lhqk;->H(Lpvb;Z)V

    return-void

    :pswitch_d
    const/16 v0, 0x9

    sget-object v2, Lxpk;->i:Lxpk;

    invoke-virtual {p0, v1, v0, v2}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
