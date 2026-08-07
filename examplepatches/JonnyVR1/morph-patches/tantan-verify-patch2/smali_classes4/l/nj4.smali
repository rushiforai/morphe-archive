.class public final synthetic Ll/nj4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;

.field public final synthetic b:Ll/qk4;

.field public final synthetic c:Ll/qk4;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Ll/qk4;Ll/qk4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nj4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;

    iput-object p2, p0, Ll/nj4;->b:Ll/qk4;

    iput-object p3, p0, Ll/nj4;->c:Ll/qk4;

    iput-boolean p4, p0, Ll/nj4;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nj4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;

    iget-object v1, p0, Ll/nj4;->b:Ll/qk4;

    iget-object v2, p0, Ll/nj4;->c:Ll/qk4;

    iget-boolean p0, p0, Ll/nj4;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;Ll/qk4;Ll/qk4;Z)V

    return-void
.end method
