.class public final synthetic Ll/p05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/t05;


# direct methods
.method public synthetic constructor <init>(Ll/t05;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p05;->a:Ll/t05;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p05;->a:Ll/t05;

    invoke-static {p0, p1}, Ll/t05;->A(Ll/t05;Landroid/content/DialogInterface;)V

    return-void
.end method
