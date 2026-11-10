.class public final synthetic Li/g1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Li/h1;


# direct methods
.method public synthetic constructor <init>(Li/h1;I)V
    .locals 0

    iput p2, p0, Li/g1;->a:I

    iput-object p1, p0, Li/g1;->b:Li/h1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Li/g1;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Li/g1;->b:Li/h1;

    invoke-virtual {v0}, Li/h1;->a()V

    return-void

    :pswitch_0
    const/4 v0, 0x0

    iget-object v1, p0, Li/g1;->b:Li/h1;

    invoke-virtual {v1, v0}, Li/h1;->c(Z)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
