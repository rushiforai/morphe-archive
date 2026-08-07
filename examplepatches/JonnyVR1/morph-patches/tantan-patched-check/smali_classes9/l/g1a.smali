.class public final synthetic Ll/g1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/g1a;->a:Z

    iput-object p2, p0, Ll/g1a;->b:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p3, p0, Ll/g1a;->c:Lcom/p1/mobile/putong/data/User;

    iput-boolean p4, p0, Ll/g1a;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/g1a;->a:Z

    iget-object v1, p0, Ll/g1a;->b:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v2, p0, Ll/g1a;->c:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/g1a;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/j1a;->b(ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;Z)V

    return-void
.end method
