.class public final synthetic Ll/ld80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/md80;


# direct methods
.method public synthetic constructor <init>(Ll/md80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ld80;->a:Ll/md80;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld80;->a:Ll/md80;

    invoke-static {p0, p1}, Ll/md80;->F(Ll/md80;Landroid/content/DialogInterface;)V

    return-void
.end method
