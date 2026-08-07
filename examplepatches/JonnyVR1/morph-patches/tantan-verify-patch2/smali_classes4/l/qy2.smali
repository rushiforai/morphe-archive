.class public final synthetic Ll/qy2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/mz2;


# direct methods
.method public synthetic constructor <init>(Ll/mz2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qy2;->a:Ll/mz2;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qy2;->a:Ll/mz2;

    invoke-static {p0, p1}, Ll/mz2;->q(Ll/mz2;Landroid/content/DialogInterface;)V

    return-void
.end method
