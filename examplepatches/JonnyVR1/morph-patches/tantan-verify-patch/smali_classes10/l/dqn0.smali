.class public final synthetic Ll/dqn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eqn0;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/eqn0;Ljava/util/HashMap;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqn0;->a:Ll/eqn0;

    iput-object p2, p0, Ll/dqn0;->b:Ljava/util/HashMap;

    iput-boolean p3, p0, Ll/dqn0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dqn0;->a:Ll/eqn0;

    iget-object v1, p0, Ll/dqn0;->b:Ljava/util/HashMap;

    iget-boolean p0, p0, Ll/dqn0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/eqn0;->c(Ll/eqn0;Ljava/util/HashMap;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
