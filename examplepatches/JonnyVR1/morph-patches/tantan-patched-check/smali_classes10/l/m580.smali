.class public final synthetic Ll/m580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/q580;


# direct methods
.method public synthetic constructor <init>(Ll/q580;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m580;->a:Ll/q580;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m580;->a:Ll/q580;

    invoke-static {p0, p1}, Ll/q580;->J3(Ll/q580;Landroid/content/DialogInterface;)V

    return-void
.end method
