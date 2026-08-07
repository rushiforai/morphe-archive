.class public final synthetic Ll/hfp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/kfp;


# direct methods
.method public synthetic constructor <init>(Ll/kfp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hfp;->a:Ll/kfp;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hfp;->a:Ll/kfp;

    invoke-static {p0, p1}, Ll/kfp;->a(Ll/kfp;Landroid/content/DialogInterface;)V

    return-void
.end method
