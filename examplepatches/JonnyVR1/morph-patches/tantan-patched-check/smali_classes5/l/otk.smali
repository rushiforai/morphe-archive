.class public final synthetic Ll/otk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/kcg0;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Ll/kcg0;ZZLl/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/otk;->a:Ll/kcg0;

    iput-boolean p2, p0, Ll/otk;->b:Z

    iput-boolean p3, p0, Ll/otk;->c:Z

    iput-object p4, p0, Ll/otk;->d:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/otk;->a:Ll/kcg0;

    iget-boolean v1, p0, Ll/otk;->b:Z

    iget-boolean v2, p0, Ll/otk;->c:Z

    iget-object p0, p0, Ll/otk;->d:Ll/l4g0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qtk;->n0(Ll/kcg0;ZZLl/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
