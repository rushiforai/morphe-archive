.class public final Llh4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;
.implements Lhh4;


# static fields
.field public static final c:Llh4;


# instance fields
.field public final synthetic a:B

.field public b:Lcom/opera/api/Callback;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Llh4;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    sput-object v0, Llh4;->c:Llh4;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/opera/api/Callback;B)V
    .registers 3

    iput-byte p2, p0, Llh4;->a:B

    iput-object p1, p0, Llh4;->b:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Llh4;->b:Lcom/opera/api/Callback;

    return-void
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Llh4;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_2e

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Llh4;->b:Lcom/opera/api/Callback;

    if-nez p1, :cond_10

    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_23

    :cond_10
    new-instance v0, Liy8;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Liy8;-><init>(Ljava/lang/Object;B)V

    filled-new-array {p1}, [Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {v0, p1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_23

    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_23
    :goto_23
    return-void

    :pswitch_24
    iget-object v0, p0, Llh4;->b:Lcom/opera/api/Callback;

    if-eqz v0, :cond_2d

    iput-object v1, p0, Llh4;->b:Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_2d
    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
