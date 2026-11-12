.class public final synthetic Lymk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcnk;


# direct methods
.method public synthetic constructor <init>(Lcnk;B)V
    .registers 3

    iput-byte p2, p0, Lymk;->a:B

    iput-object p1, p0, Lymk;->b:Lcnk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lymk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lymk;->b:Lcnk;

    packed-switch v0, :pswitch_data_20

    goto :goto_1b

    :pswitch_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lsle;->d()Z

    move-result v0

    if-nez v0, :cond_1a

    new-instance v0, Lzmk;

    invoke-direct {v0, p0}, Lzmk;-><init>(Lcnk;)V

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->addConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    :cond_1a
    return-object v1

    :goto_1b
    :pswitch_1b
    invoke-virtual {p0}, Lcnk;->b()V

    return-object v1

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_9
    .end packed-switch
.end method
