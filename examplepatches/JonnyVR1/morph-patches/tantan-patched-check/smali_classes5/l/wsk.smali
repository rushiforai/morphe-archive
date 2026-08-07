.class public final synthetic Ll/wsk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsk;->a:Ll/l4g0;

    iput-object p2, p0, Ll/wsk;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wsk;->a:Ll/l4g0;

    iget-object p0, p0, Ll/wsk;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0, p1}, Ll/qtk;->h0(Ll/l4g0;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
