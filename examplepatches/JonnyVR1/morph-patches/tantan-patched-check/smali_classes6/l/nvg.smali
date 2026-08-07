.class public final synthetic Ll/nvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/pvg;


# direct methods
.method public synthetic constructor <init>(Ll/pvg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nvg;->a:Ll/pvg;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvg;->a:Ll/pvg;

    invoke-static {p0, p1}, Ll/pvg;->b(Ll/pvg;Landroid/content/DialogInterface;)V

    return-void
.end method
