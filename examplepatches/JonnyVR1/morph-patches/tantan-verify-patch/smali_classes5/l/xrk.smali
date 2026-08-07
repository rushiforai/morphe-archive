.class public final synthetic Ll/xrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/kcg0;

.field public final synthetic b:Ll/kcg0;


# direct methods
.method public synthetic constructor <init>(Ll/kcg0;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xrk;->a:Ll/kcg0;

    iput-object p2, p0, Ll/xrk;->b:Ll/kcg0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xrk;->a:Ll/kcg0;

    iget-object p0, p0, Ll/xrk;->b:Ll/kcg0;

    invoke-static {v0, p0, p1}, Ll/qtk;->D0(Ll/kcg0;Ll/kcg0;Landroid/content/DialogInterface;)V

    return-void
.end method
