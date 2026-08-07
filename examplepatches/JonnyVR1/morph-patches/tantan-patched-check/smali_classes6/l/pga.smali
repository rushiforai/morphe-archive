.class public final synthetic Ll/pga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pga;->a:Ll/jka;

    iput-object p2, p0, Ll/pga;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pga;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p4, p0, Ll/pga;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p5, p0, Ll/pga;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/pga;->f:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pga;->a:Ll/jka;

    iget-object v1, p0, Ll/pga;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pga;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v3, p0, Ll/pga;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v4, p0, Ll/pga;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/pga;->f:Ll/y20;

    invoke-static/range {v0 .. v5}, Ll/jka;->N1(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
