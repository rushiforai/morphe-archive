.class public final synthetic Ll/c0e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0e0;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c0e0;->a:Landroid/view/View;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->f(Landroid/view/View;)V

    return-void
.end method
