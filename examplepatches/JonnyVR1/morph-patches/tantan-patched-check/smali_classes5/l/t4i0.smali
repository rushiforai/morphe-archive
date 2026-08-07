.class public final synthetic Ll/t4i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:[Z

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;[ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t4i0;->a:Ll/l4g0;

    iput-object p2, p0, Ll/t4i0;->b:[Z

    iput-object p3, p0, Ll/t4i0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t4i0;->a:Ll/l4g0;

    iget-object v1, p0, Ll/t4i0;->b:[Z

    iget-object p0, p0, Ll/t4i0;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Ll/a5i0;->o(Ll/l4g0;[ZLl/x20;Landroid/content/DialogInterface;)V

    return-void
.end method
