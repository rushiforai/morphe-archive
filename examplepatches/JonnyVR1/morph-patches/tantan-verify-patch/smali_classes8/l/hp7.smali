.class public final synthetic Ll/hp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/qp7;


# direct methods
.method public synthetic constructor <init>(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hp7;->a:Ll/qp7;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hp7;->a:Ll/qp7;

    invoke-static {p0, p1}, Ll/qp7;->y(Ll/qp7;Landroid/content/DialogInterface;)V

    return-void
.end method
