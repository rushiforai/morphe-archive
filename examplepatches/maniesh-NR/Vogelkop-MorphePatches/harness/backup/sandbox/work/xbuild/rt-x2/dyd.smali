.class public final synthetic Ldyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxm5;

.field public final synthetic c:Legd;


# direct methods
.method public synthetic constructor <init>(Lxm5;Legd;B)V
    .registers 4

    iput-byte p3, p0, Ldyd;->a:B

    iput-object p1, p0, Ldyd;->b:Lxm5;

    iput-object p2, p0, Ldyd;->c:Legd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ldyd;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Ldyd;->c:Legd;

    iget-object p0, p0, Ldyd;->b:Lxm5;

    check-cast p1, Landroid/media/MediaMetadata;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0, v2, p1}, Lxm5;->D(Legd;Landroid/media/MediaMetadata;)V

    return-object v1

    :pswitch_10
    invoke-virtual {p0, v2, p1}, Lxm5;->D(Legd;Landroid/media/MediaMetadata;)V

    return-object v1

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
