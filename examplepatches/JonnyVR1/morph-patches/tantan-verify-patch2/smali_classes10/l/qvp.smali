.class public final synthetic Ll/qvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/rvp;


# direct methods
.method public synthetic constructor <init>(Ll/rvp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qvp;->a:Ll/rvp;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvp;->a:Ll/rvp;

    invoke-static {p0, p1}, Ll/rvp;->a(Ll/rvp;Landroid/content/DialogInterface;)V

    return-void
.end method
