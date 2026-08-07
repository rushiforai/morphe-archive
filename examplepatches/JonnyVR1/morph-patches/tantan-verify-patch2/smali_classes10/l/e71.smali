.class public final synthetic Ll/e71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/i71;


# direct methods
.method public synthetic constructor <init>(Ll/i71;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e71;->a:Ll/i71;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e71;->a:Ll/i71;

    invoke-static {p0, p1}, Ll/i71;->J3(Ll/i71;Landroid/content/DialogInterface;)V

    return-void
.end method
