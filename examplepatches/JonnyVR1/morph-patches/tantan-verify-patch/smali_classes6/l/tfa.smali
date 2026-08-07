.class public final synthetic Ll/tfa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfa;->a:Ll/jka;

    iput-object p2, p0, Ll/tfa;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/tfa;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p4, p0, Ll/tfa;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/tfa;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tfa;->a:Ll/jka;

    iget-object v1, p0, Ll/tfa;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/tfa;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v3, p0, Ll/tfa;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/tfa;->e:Ll/y20;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static/range {v0 .. v5}, Ll/jka;->A2(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
