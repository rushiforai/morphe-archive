.class public final synthetic Ll/vl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/wl0;


# direct methods
.method public synthetic constructor <init>(Ll/wl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vl0;->a:Ll/wl0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vl0;->a:Ll/wl0;

    invoke-static {p0, p1}, Ll/wl0;->c(Ll/wl0;Landroid/content/DialogInterface;)V

    return-void
.end method
