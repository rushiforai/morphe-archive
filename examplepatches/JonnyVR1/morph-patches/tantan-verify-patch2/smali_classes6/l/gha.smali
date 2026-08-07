.class public final synthetic Ll/gha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gha;->a:Ll/jka;

    iput-object p2, p0, Ll/gha;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/gha;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/gha;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gha;->a:Ll/jka;

    iget-object v1, p0, Ll/gha;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/gha;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/gha;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Ll/jka;->x4(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
