.class public final synthetic Ll/sxo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/zxo;


# direct methods
.method public synthetic constructor <init>(Ll/zxo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sxo;->a:Ll/zxo;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxo;->a:Ll/zxo;

    invoke-static {p0, p1}, Ll/zxo;->P(Ll/zxo;Landroid/content/DialogInterface;)V

    return-void
.end method
