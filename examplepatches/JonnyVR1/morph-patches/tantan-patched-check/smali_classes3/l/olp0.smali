.class public final synthetic Ll/olp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/slp0;


# direct methods
.method public synthetic constructor <init>(Ll/slp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/olp0;->a:Ll/slp0;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/olp0;->a:Ll/slp0;

    invoke-static {p0, p1}, Ll/slp0;->G(Ll/slp0;Landroid/content/DialogInterface;)V

    return-void
.end method
