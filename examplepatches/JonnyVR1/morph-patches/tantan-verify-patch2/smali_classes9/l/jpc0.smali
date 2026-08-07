.class public final synthetic Ll/jpc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/i6t;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/i6t;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jpc0;->a:Ll/i6t;

    iput-boolean p2, p0, Ll/jpc0;->b:Z

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jpc0;->a:Ll/i6t;

    iget-boolean p0, p0, Ll/jpc0;->b:Z

    invoke-static {v0, p0, p1}, Ll/lpc0;->a(Ll/i6t;ZLandroid/content/DialogInterface;)V

    return-void
.end method
