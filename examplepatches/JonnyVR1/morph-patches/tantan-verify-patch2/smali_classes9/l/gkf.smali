.class public final synthetic Ll/gkf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/mkf;


# direct methods
.method public synthetic constructor <init>(Ll/mkf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gkf;->a:Ll/mkf;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gkf;->a:Ll/mkf;

    invoke-static {p0, p1}, Ll/mkf;->y(Ll/mkf;Landroid/content/DialogInterface;)V

    return-void
.end method
