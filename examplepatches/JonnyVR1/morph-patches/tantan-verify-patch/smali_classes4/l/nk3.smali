.class public final synthetic Ll/nk3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(ZLl/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/nk3;->a:Z

    iput-object p2, p0, Ll/nk3;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nk3;->a:Z

    iget-object p0, p0, Ll/nk3;->b:Ll/l4g0;

    invoke-static {v0, p0, p1}, Ll/hl3;->h(ZLl/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
