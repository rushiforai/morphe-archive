.class public final synthetic Ll/cx60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/ex60;


# direct methods
.method public synthetic constructor <init>(Ll/ex60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx60;->a:Ll/ex60;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cx60;->a:Ll/ex60;

    invoke-static {p0, p1}, Ll/ex60;->j(Ll/ex60;Landroid/content/DialogInterface;)V

    return-void
.end method
