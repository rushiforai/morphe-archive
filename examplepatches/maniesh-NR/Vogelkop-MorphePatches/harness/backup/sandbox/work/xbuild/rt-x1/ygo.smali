.class public final Lygo;
.super Li7c;
.source "SourceFile"


# instance fields
.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lygo;->d:B

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Li7c;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/Object;
    .registers 3

    iget-byte p0, p0, Lygo;->d:B

    packed-switch p0, :pswitch_data_2e

    invoke-static {}, Lezo;->a()V

    sget-object p0, Lgxo;->c:Lgxo;

    const/4 p0, 0x2

    const-string v0, "omsdk_v2.js"

    invoke-static {p0, v0}, Lsjo;->c(ILjava/lang/String;)Ljava/io/File;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-static {p0}, Lmzg;->b(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    goto :goto_29

    :cond_1f
    new-instance p0, Lkoj;

    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lkoj;-><init>(B)V

    invoke-static {p0}, Lgxo;->c(Ljava/lang/Runnable;)V

    :cond_29
    :goto_29
    return-object v0

    :pswitch_2a
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method
