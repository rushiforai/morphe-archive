.class public final synthetic Ll/rpp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Ll/eqp;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Ll/eqp;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rpp;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/rpp;->b:Ll/eqp;

    iput-boolean p3, p0, Ll/rpp;->c:Z

    iput-object p4, p0, Ll/rpp;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rpp;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object v1, p0, Ll/rpp;->b:Ll/eqp;

    iget-boolean v2, p0, Ll/rpp;->c:Z

    iget-object p0, p0, Ll/rpp;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0}, Ll/eqp;->E0(Lcom/p1/mobile/putong/core/newui/home/d;Ll/eqp;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
