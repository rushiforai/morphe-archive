.class public final synthetic Ll/go7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/no7;

.field public final synthetic b:Z

.field public final synthetic c:J

.field public final synthetic d:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Ll/no7;ZJLcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go7;->a:Ll/no7;

    iput-boolean p2, p0, Ll/go7;->b:Z

    iput-wide p3, p0, Ll/go7;->c:J

    iput-object p5, p0, Ll/go7;->d:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/go7;->a:Ll/no7;

    iget-boolean v1, p0, Ll/go7;->b:Z

    iget-wide v2, p0, Ll/go7;->c:J

    iget-object v4, p0, Ll/go7;->d:Lcom/p1/mobile/putong/data/Links;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Ll/no7;->r3(Ll/no7;ZJLcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
