.class public final synthetic Ll/raa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic e:Z

.field public final synthetic f:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/raa;->a:Ll/jka;

    iput-boolean p2, p0, Ll/raa;->b:Z

    iput-object p3, p0, Ll/raa;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/raa;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p5, p0, Ll/raa;->e:Z

    iput-object p6, p0, Ll/raa;->f:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/raa;->a:Ll/jka;

    iget-boolean v1, p0, Ll/raa;->b:Z

    iget-object v2, p0, Ll/raa;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v3, p0, Ll/raa;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean v4, p0, Ll/raa;->e:Z

    iget-object v5, p0, Ll/raa;->f:Ll/y20;

    invoke-static/range {v0 .. v5}, Ll/jka;->Z0(Ll/jka;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;ZLl/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
