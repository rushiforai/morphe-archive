.class public final synthetic Ll/gd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/ld3;


# direct methods
.method public synthetic constructor <init>(Ll/ld3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gd3;->a:Ll/ld3;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gd3;->a:Ll/ld3;

    invoke-static {p0, p1}, Ll/ld3;->c(Ll/ld3;Landroid/content/DialogInterface;)V

    return-void
.end method
