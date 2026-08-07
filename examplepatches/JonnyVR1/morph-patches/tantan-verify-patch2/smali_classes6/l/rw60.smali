.class public final synthetic Ll/rw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vw60;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:[Ljava/lang/Boolean;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rw60;->a:Ll/vw60;

    iput-object p2, p0, Ll/rw60;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/rw60;->c:[Ljava/lang/Boolean;

    iput-object p4, p0, Ll/rw60;->d:Ll/x20;

    iput-boolean p5, p0, Ll/rw60;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/rw60;->a:Ll/vw60;

    iget-object v1, p0, Ll/rw60;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/rw60;->c:[Ljava/lang/Boolean;

    iget-object v3, p0, Ll/rw60;->d:Ll/x20;

    iget-boolean v4, p0, Ll/rw60;->e:Z

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/vw60;->m(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/lang/Throwable;)V

    return-void
.end method
