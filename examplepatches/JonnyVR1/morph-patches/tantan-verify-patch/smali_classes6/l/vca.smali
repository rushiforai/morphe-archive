.class public final synthetic Ll/vca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vca;->a:Ll/jka;

    iput-object p2, p0, Ll/vca;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vca;->a:Ll/jka;

    iget-object p0, p0, Ll/vca;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0}, Ll/jka;->h1(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
