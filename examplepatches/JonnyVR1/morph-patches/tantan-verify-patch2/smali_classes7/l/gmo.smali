.class public final synthetic Ll/gmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Landroid/content/DialogInterface$OnDismissListener;

.field public final synthetic b:Ll/imo;


# direct methods
.method public synthetic constructor <init>(Landroid/content/DialogInterface$OnDismissListener;Ll/imo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gmo;->a:Landroid/content/DialogInterface$OnDismissListener;

    iput-object p2, p0, Ll/gmo;->b:Ll/imo;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gmo;->a:Landroid/content/DialogInterface$OnDismissListener;

    iget-object p0, p0, Ll/gmo;->b:Ll/imo;

    invoke-static {v0, p0, p1}, Ll/imo;->d(Landroid/content/DialogInterface$OnDismissListener;Ll/imo;Landroid/content/DialogInterface;)V

    return-void
.end method
