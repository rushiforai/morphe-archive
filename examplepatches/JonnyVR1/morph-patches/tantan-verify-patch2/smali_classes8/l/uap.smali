.class public final synthetic Ll/uap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/vap;


# direct methods
.method public synthetic constructor <init>(Ll/vap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uap;->a:Ll/vap;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uap;->a:Ll/vap;

    invoke-static {p0, p1}, Ll/vap;->c(Ll/vap;Landroid/content/DialogInterface;)V

    return-void
.end method
