.class public final synthetic Ll/upp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Ll/eqp;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/eqp;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/upp;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/upp;->b:Z

    iput-object p3, p0, Ll/upp;->c:Ll/eqp;

    iput-boolean p4, p0, Ll/upp;->d:Z

    iput-object p5, p0, Ll/upp;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/upp;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/upp;->b:Z

    iget-object v2, p0, Ll/upp;->c:Ll/eqp;

    iget-boolean v3, p0, Ll/upp;->d:Z

    iget-object v4, p0, Ll/upp;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Ll/eqp;->e0(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/eqp;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
