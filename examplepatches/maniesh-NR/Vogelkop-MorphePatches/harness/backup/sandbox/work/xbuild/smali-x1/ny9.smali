.class public final synthetic Lny9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpy9;

.field public final synthetic c:Lu3k;

.field public final synthetic d:Ls2g;


# direct methods
.method public synthetic constructor <init>(Lpy9;Lu3k;Ls2g;B)V
    .registers 5

    iput-byte p4, p0, Lny9;->a:B

    iput-object p1, p0, Lny9;->b:Lpy9;

    iput-object p2, p0, Lny9;->c:Lu3k;

    iput-object p3, p0, Lny9;->d:Ls2g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lny9;->a:B

    iget-object v1, p0, Lny9;->d:Ls2g;

    iget-object v2, p0, Lny9;->c:Lu3k;

    iget-object p0, p0, Lny9;->b:Lpy9;

    check-cast p1, Lz3k;

    packed-switch v0, :pswitch_data_18

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2, p1, v1}, Lpy9;->e(ZLu3k;Lz3k;Ls2g;)V

    return-void

    :pswitch_12
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v2, p1, v1}, Lpy9;->e(ZLu3k;Lz3k;Ls2g;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
