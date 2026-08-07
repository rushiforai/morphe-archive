.class public final synthetic Ll/y8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/z8j;


# direct methods
.method public synthetic constructor <init>(Ll/z8j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8j;->a:Ll/z8j;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y8j;->a:Ll/z8j;

    invoke-static {p0, p1}, Ll/z8j;->E(Ll/z8j;Landroid/content/DialogInterface;)V

    return-void
.end method
