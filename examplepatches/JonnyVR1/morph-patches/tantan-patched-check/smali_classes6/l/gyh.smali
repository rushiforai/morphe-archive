.class public final synthetic Ll/gyh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Z

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gyh;->a:Lcom/p1/mobile/putong/data/User;

    iput-boolean p2, p0, Ll/gyh;->b:Z

    iput-object p3, p0, Ll/gyh;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gyh;->a:Lcom/p1/mobile/putong/data/User;

    iget-boolean v1, p0, Ll/gyh;->b:Z

    iget-object p0, p0, Ll/gyh;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/hyh;->b(Lcom/p1/mobile/putong/data/User;ZLl/y20;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
