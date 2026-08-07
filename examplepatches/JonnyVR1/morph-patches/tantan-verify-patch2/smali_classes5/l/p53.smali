.class public final synthetic Ll/p53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/w53;


# direct methods
.method public synthetic constructor <init>(Ll/w53;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p53;->a:Ll/w53;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p53;->a:Ll/w53;

    invoke-static {p0, p1}, Ll/w53;->n(Ll/w53;Landroid/content/DialogInterface;)V

    return-void
.end method
