.class public final synthetic Lgmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljmn;


# direct methods
.method public synthetic constructor <init>(Ljmn;B)V
    .registers 3

    iput-byte p2, p0, Lgmn;->a:B

    iput-object p1, p0, Lgmn;->b:Ljmn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lgmn;->a:B

    iget-object p0, p0, Lgmn;->b:Ljmn;

    packed-switch v0, :pswitch_data_14

    iget-object p1, p0, Ljmn;->x:Laln;

    if-eqz p1, :cond_e

    invoke-virtual {p0, p1}, Ljmn;->N0(Laln;)V

    :cond_e
    return-void

    :pswitch_f
    invoke-virtual {p0, p1}, Ljmn;->I0(Landroid/view/View;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
