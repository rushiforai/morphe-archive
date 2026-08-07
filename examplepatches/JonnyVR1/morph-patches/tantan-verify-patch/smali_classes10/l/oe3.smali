.class public final synthetic Ll/oe3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/qe3;


# direct methods
.method public synthetic constructor <init>(Ll/qe3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oe3;->a:Ll/qe3;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oe3;->a:Ll/qe3;

    invoke-static {p0, p1}, Ll/qe3;->a(Ll/qe3;Landroid/content/DialogInterface;)V

    return-void
.end method
