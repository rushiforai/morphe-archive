.class public final synthetic Lko4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loyl;
.implements Lfjc;


# instance fields
.field public final synthetic a:Lzo4;


# direct methods
.method public synthetic constructor <init>(Lzo4;)V
    .registers 2

    iput-object p1, p0, Lko4;->a:Lzo4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Leig;

    iget-object p0, p0, Lko4;->a:Lzo4;

    iget-object p0, p0, Lzo4;->J:Lcig;

    invoke-interface {p1, p0}, Leig;->N(Lcig;)V

    return-void
.end method

.method public final onTrackSelectionsInvalidated()V
    .registers 4

    iget-object p0, p0, Lko4;->a:Lzo4;

    iget-object v0, p0, Lzo4;->i:Landroid/os/Handler;

    new-instance v1, Llb4;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
