.class public final synthetic Ll/gzf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/kcg0;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Ll/kcg0;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gzf;->a:Ll/kcg0;

    iput-object p2, p0, Ll/gzf;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gzf;->a:Ll/kcg0;

    iget-object p0, p0, Ll/gzf;->b:Ll/l4g0;

    invoke-static {v0, p0, p1}, Ll/a0g;->o(Ll/kcg0;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
