.class public final synthetic Ll/dsi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/gsi;


# direct methods
.method public synthetic constructor <init>(Ll/gsi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dsi;->a:Ll/gsi;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsi;->a:Ll/gsi;

    invoke-static {p0, p1}, Ll/gsi;->d(Ll/gsi;Landroid/content/DialogInterface;)V

    return-void
.end method
