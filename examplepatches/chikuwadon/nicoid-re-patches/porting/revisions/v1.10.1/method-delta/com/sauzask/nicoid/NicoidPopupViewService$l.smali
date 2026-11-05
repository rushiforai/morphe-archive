.class public Lcom/sauzask/nicoid/NicoidPopupViewService$l;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidPopupViewService;


# virtual methods
.method public onVideoSizeChanged(IIF)V
    .registers 4

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$l;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    .line 1
    iput p2, p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->g:I

    .line 2
    iput p1, p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->i:I

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p1, "Popup video frame size: "

    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$l;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget p1, p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->i:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "x"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService$l;->a:Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-static {p3}, Le/e/a/PopupAspect214;->changed(Ljava/lang/Object;)V

    return-void
.end method
