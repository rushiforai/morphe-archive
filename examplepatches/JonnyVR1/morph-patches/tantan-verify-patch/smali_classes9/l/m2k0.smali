.class public final synthetic Ll/m2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/p2k0;


# direct methods
.method public synthetic constructor <init>(Ll/p2k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m2k0;->a:Ll/p2k0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2k0;->a:Ll/p2k0;

    invoke-static {p0, p1}, Ll/p2k0;->K3(Ll/p2k0;Landroid/content/DialogInterface;)V

    return-void
.end method
