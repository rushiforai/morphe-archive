.class public final synthetic Ll/vz7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/vz7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/vz7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/vz7;->d:Z

    iput-object p5, p0, Ll/vz7;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/vz7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/vz7;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/vz7;->d:Z

    iget-object v4, p0, Ll/vz7;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->v9(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method
