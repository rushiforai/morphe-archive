.class public final synthetic Ll/wer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/xer;


# direct methods
.method public synthetic constructor <init>(Ll/xer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wer;->a:Ll/xer;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wer;->a:Ll/xer;

    invoke-static {p0, p1}, Ll/xer;->e(Ll/xer;Landroid/content/DialogInterface;)V

    return-void
.end method
