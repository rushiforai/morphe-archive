.class public final synthetic Ljdb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li9c;

.field public final synthetic c:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Li9c;Landroid/net/Uri;B)V
    .registers 4

    iput-byte p3, p0, Ljdb;->a:B

    iput-object p1, p0, Ljdb;->b:Li9c;

    iput-object p2, p0, Ljdb;->c:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ljdb;->a:B

    iget-object v1, p0, Ljdb;->c:Landroid/net/Uri;

    iget-object p0, p0, Ljdb;->b:Li9c;

    packed-switch v0, :pswitch_data_68

    check-cast p1, Lt0i;

    const/4 v0, 0x0

    iput-boolean v0, p0, Li9c;->b:Z

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_24

    check-cast p1, [B

    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Li32;

    new-instance v0, Lldb;

    invoke-direct {v0, v1, p1}, Lldb;-><init>(Landroid/net/Uri;[B)V

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    :cond_24
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p0, Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    new-instance p1, Lfvh;

    invoke-direct {p1}, Lfvh;-><init>()V

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lfvh;->h(Ljava/lang/String;)V

    const-string v0, "Accept"

    const-string v1, "application/x-protobuf"

    invoke-virtual {p1, v0, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, p1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p0, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    new-instance v2, Lgbb;

    const/4 p0, 0x6

    invoke-direct {v2, p0}, Lgbb;-><init>(B)V

    new-instance v3, Lgbb;

    const/4 p0, 0x7

    invoke-direct {v3, p0}, Lgbb;-><init>(B)V

    const-wide/16 v5, 0x0

    const/16 v7, 0x78

    const/4 v4, 0x0

    invoke-static/range {v1 .. v7}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    return-object p0

    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
