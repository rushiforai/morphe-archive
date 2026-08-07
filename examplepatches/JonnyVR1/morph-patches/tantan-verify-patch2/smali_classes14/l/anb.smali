.class public final synthetic Ll/anb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/enb;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;


# direct methods
.method public synthetic constructor <init>(Ll/enb;ZLcom/p1/mobile/putong/core/data/MyVisitorsShowType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/anb;->a:Ll/enb;

    iput-boolean p2, p0, Ll/anb;->b:Z

    iput-object p3, p0, Ll/anb;->c:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/anb;->a:Ll/enb;

    iget-boolean v1, p0, Ll/anb;->b:Z

    iget-object p0, p0, Ll/anb;->c:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Ll/enb;->f3(Ll/enb;ZLcom/p1/mobile/putong/core/data/MyVisitorsShowType;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
