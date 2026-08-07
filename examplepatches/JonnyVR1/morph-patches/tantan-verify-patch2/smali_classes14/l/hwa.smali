.class public final synthetic Ll/hwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic e:Lcom/p1/mobile/putong/data/Relationship;


# direct methods
.method public synthetic constructor <init>(ZZZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/hwa;->a:Z

    iput-boolean p2, p0, Ll/hwa;->b:Z

    iput-boolean p3, p0, Ll/hwa;->c:Z

    iput-object p4, p0, Ll/hwa;->d:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p5, p0, Ll/hwa;->e:Lcom/p1/mobile/putong/data/Relationship;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/hwa;->a:Z

    iget-boolean v1, p0, Ll/hwa;->b:Z

    iget-boolean v2, p0, Ll/hwa;->c:Z

    iget-object v3, p0, Ll/hwa;->d:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v4, p0, Ll/hwa;->e:Lcom/p1/mobile/putong/data/Relationship;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/y;->Z2(ZZZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
