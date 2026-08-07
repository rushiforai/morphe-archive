.class public final synthetic Ll/fj4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/qk4;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ll/qk4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fj4;->a:Landroid/view/View;

    iput-object p2, p0, Ll/fj4;->b:Ll/qk4;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fj4;->a:Landroid/view/View;

    iget-object p0, p0, Ll/fj4;->b:Ll/qk4;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->q(Landroid/view/View;Ll/qk4;)V

    return-void
.end method
