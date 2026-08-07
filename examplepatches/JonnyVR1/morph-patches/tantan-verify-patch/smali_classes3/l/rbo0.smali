.class public final synthetic Ll/rbo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/xbo0;


# direct methods
.method public synthetic constructor <init>(Ll/xbo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rbo0;->a:Ll/xbo0;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rbo0;->a:Ll/xbo0;

    invoke-static {p0, p1}, Ll/xbo0;->H(Ll/xbo0;Landroid/content/DialogInterface;)V

    return-void
.end method
