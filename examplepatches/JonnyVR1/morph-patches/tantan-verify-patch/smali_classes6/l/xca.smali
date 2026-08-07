.class public final synthetic Ll/xca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/data/MatchScData;


# direct methods
.method public synthetic constructor <init>(Ll/jka;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MatchScData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xca;->a:Ll/jka;

    iput-boolean p2, p0, Ll/xca;->b:Z

    iput-object p3, p0, Ll/xca;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/xca;->d:Lcom/p1/mobile/putong/data/MatchScData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xca;->a:Ll/jka;

    iget-boolean v1, p0, Ll/xca;->b:Z

    iget-object v2, p0, Ll/xca;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/xca;->d:Lcom/p1/mobile/putong/data/MatchScData;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0, p1}, Ll/jka;->d5(Ll/jka;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MatchScData;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Followship;

    move-result-object p0

    return-object p0
.end method
