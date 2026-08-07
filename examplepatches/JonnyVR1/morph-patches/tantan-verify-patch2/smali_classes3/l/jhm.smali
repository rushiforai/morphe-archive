.class public final synthetic Ll/jhm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jhm;->a:Lcom/p1/mobile/android/app/Dialog;

    iput-object p2, p0, Ll/jhm;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jhm;->a:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/jhm;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->c(Lcom/p1/mobile/android/app/Dialog;Ll/x20;Landroid/content/DialogInterface;)V

    return-void
.end method
