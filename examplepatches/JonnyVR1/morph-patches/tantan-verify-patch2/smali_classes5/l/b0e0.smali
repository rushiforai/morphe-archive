.class public final synthetic Ll/b0e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0e0;->a:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b0e0;->a:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->c(Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;)V

    return-void
.end method
