.class public final synthetic Ll/f1f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/q1e;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/q1e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f1f0;->a:Ll/q1e;

    iput-object p2, p0, Ll/f1f0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f1f0;->a:Ll/q1e;

    iget-object p0, p0, Ll/f1f0;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->v(Ll/q1e;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
