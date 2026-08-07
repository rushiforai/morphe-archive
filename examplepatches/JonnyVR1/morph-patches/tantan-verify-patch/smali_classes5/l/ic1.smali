.class public final synthetic Ll/ic1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/lc1;


# direct methods
.method public synthetic constructor <init>(Ll/lc1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ic1;->a:Ll/lc1;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic1;->a:Ll/lc1;

    invoke-static {p0, p1}, Ll/lc1;->E(Ll/lc1;Landroid/content/DialogInterface;)V

    return-void
.end method
