.class public final Ldjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc7d;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lg9k;Lorg/chromium/base/CommandLine;Lxi5;)V
    .registers 4

    const/4 p2, 0x1

    iput-byte p2, p0, Ldjf;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Ldjf;->b:Ljava/lang/Object;

    iput-object p1, p0, Ldjf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lix5;Lll4;Lvr9;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ldjf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldjf;->b:Ljava/lang/Object;

    iput-object p3, p0, Ldjf;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 3

    iget-byte v0, p0, Ldjf;->a:B

    iget-object p0, p0, Ldjf;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16

    check-cast p0, Lg9k;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lg9k;->k:Z

    invoke-virtual {p0, p1}, Lg9k;->I(I)V

    return-void

    :pswitch_10
    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final onSuccess()V
    .registers 3

    iget-byte v0, p0, Ldjf;->a:B

    iget-object v1, p0, Ldjf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Ldjf;->c:Ljava/lang/Object;

    check-cast p0, Lg9k;

    check-cast v1, Lxi5;

    invoke-static {p0, v1}, Lfsp;->u(Landroid/app/Activity;Lxi5;)V

    return-void

    :pswitch_11
    check-cast v1, Lll4;

    invoke-virtual {v1}, Lll4;->run()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
