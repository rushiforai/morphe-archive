.class public final synthetic Ll/zg4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/bh4;


# direct methods
.method public synthetic constructor <init>(Ll/bh4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zg4;->a:Ll/bh4;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zg4;->a:Ll/bh4;

    invoke-static {p0, p1}, Ll/bh4;->e(Ll/bh4;Landroid/content/DialogInterface;)V

    return-void
.end method
