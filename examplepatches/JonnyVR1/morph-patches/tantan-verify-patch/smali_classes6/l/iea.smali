.class public final synthetic Ll/iea;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iea;->a:Ll/jka;

    iput-boolean p2, p0, Ll/iea;->b:Z

    iput-object p3, p0, Ll/iea;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/iea;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iea;->a:Ll/jka;

    iget-boolean v1, p0, Ll/iea;->b:Z

    iget-object v2, p0, Ll/iea;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/iea;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0, p1}, Ll/jka;->c1(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
