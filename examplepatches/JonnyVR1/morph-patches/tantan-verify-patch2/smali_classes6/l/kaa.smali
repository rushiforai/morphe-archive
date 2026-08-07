.class public final synthetic Ll/kaa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kaa;->a:Ll/jka;

    iput-object p2, p0, Ll/kaa;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p3, p0, Ll/kaa;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kaa;->a:Ll/jka;

    iget-object v1, p0, Ll/kaa;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean p0, p0, Ll/kaa;->c:Z

    invoke-static {v0, v1, p0}, Ll/jka;->i6(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Z)Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method
