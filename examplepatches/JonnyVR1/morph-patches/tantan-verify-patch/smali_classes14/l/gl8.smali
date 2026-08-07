.class public final synthetic Ll/gl8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/il8;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/CoreData;

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/il8;ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gl8;->a:Ll/il8;

    iput-boolean p2, p0, Ll/gl8;->b:Z

    iput-boolean p3, p0, Ll/gl8;->c:Z

    iput-object p4, p0, Ll/gl8;->d:Lcom/p1/mobile/putong/core/data/CoreData;

    iput-object p5, p0, Ll/gl8;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/gl8;->a:Ll/il8;

    iget-boolean v1, p0, Ll/gl8;->b:Z

    iget-boolean v2, p0, Ll/gl8;->c:Z

    iget-object v3, p0, Ll/gl8;->d:Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v4, p0, Ll/gl8;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/User;

    move-object v6, p2

    check-cast v6, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v6}, Ll/il8;->E(Ll/il8;ZZLcom/p1/mobile/putong/core/data/CoreData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
