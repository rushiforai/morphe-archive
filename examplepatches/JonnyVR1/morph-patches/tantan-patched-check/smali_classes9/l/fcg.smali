.class public final synthetic Ll/fcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/ocg;


# direct methods
.method public synthetic constructor <init>(Ll/ocg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fcg;->a:Ll/ocg;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcg;->a:Ll/ocg;

    invoke-static {p0, p1}, Ll/ocg;->R3(Ll/ocg;Landroid/content/DialogInterface;)V

    return-void
.end method
