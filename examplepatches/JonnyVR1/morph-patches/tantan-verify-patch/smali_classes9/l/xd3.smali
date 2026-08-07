.class public final synthetic Ll/xd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/fe3;


# direct methods
.method public synthetic constructor <init>(Ll/fe3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xd3;->a:Ll/fe3;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xd3;->a:Ll/fe3;

    invoke-static {p0, p1}, Ll/fe3;->o(Ll/fe3;Landroid/content/DialogInterface;)V

    return-void
.end method
