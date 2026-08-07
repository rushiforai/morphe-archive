.class public final synthetic Ll/kk60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/mk60;


# direct methods
.method public synthetic constructor <init>(Ll/mk60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kk60;->a:Ll/mk60;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kk60;->a:Ll/mk60;

    invoke-static {p0, p1}, Ll/mk60;->c(Ll/mk60;Landroid/content/DialogInterface;)V

    return-void
.end method
