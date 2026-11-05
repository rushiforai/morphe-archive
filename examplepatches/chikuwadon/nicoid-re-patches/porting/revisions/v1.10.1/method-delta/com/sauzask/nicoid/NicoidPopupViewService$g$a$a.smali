.class public Lcom/sauzask/nicoid/NicoidPopupViewService$g$a$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;->b:Lcom/sauzask/nicoid/NicoidPopupViewService$g;

    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidPopupViewService$g;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a$a;->a:Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidPopupViewService$g$a;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Lcom/sauzask/nicoid/NicoidPopupViewService;Ljava/lang/String;)V

    return-void
.end method
