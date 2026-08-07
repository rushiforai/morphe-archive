.class public final synthetic Ll/d7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore;

.field public final synthetic b:Z

.field public final synthetic c:Ll/pcj;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore;ZLl/pcj;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore;

    iput-boolean p2, p0, Ll/d7c;->b:Z

    iput-object p3, p0, Ll/d7c;->c:Ll/pcj;

    iput-object p4, p0, Ll/d7c;->d:Ll/y20;

    iput-object p5, p0, Ll/d7c;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore;

    iget-boolean v1, p0, Ll/d7c;->b:Z

    iget-object v2, p0, Ll/d7c;->c:Ll/pcj;

    iget-object v3, p0, Ll/d7c;->d:Ll/y20;

    iget-object p0, p0, Ll/d7c;->e:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->d(Lcom/tantanapp/common/data/orm/DatabaseStore;ZLl/pcj;Ll/y20;Ll/x20;)V

    return-void
.end method
