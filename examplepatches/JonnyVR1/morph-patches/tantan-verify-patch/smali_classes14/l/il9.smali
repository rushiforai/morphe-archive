.class public final synthetic Ll/il9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/p;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/il9;->a:Lcom/p1/mobile/putong/core/api/p;

    iput-object p2, p0, Ll/il9;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/il9;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/il9;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/il9;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/il9;->a:Lcom/p1/mobile/putong/core/api/p;

    iget-object v1, p0, Ll/il9;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/il9;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/il9;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/il9;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/p;->c3(Lcom/p1/mobile/putong/core/api/p;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
