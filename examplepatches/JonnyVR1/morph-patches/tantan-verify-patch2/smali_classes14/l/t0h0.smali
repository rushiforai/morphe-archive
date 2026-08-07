.class public final synthetic Ll/t0h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/jbt;


# direct methods
.method public synthetic constructor <init>(Ll/jbt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t0h0;->a:Ll/jbt;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t0h0;->a:Ll/jbt;

    invoke-static {p0, p1}, Ll/x0h0;->W2(Ll/jbt;Landroid/content/DialogInterface;)V

    return-void
.end method
