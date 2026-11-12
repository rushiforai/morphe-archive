.class public final synthetic Lwvn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lewn;


# direct methods
.method public synthetic constructor <init>(Lewn;B)V
    .registers 3

    iput-byte p2, p0, Lwvn;->a:B

    iput-object p1, p0, Lwvn;->b:Lewn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lwvn;->a:B

    iget-object p0, p0, Lwvn;->b:Lewn;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lewn;->g()V

    return-void

    :pswitch_b
    const/4 v0, 0x0

    iput-object v0, p0, Lewn;->c:Lokhttp3/internal/ws/RealWebSocket;

    invoke-virtual {p0}, Lewn;->g()V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
