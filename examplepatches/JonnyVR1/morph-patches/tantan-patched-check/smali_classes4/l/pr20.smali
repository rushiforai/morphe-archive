.class public final synthetic Ll/pr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/as20;

.field public final synthetic b:Ll/pf60;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pr20;->a:Ll/as20;

    iput-object p2, p0, Ll/pr20;->b:Ll/pf60;

    iput-object p3, p0, Ll/pr20;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pr20;->a:Ll/as20;

    iget-object v1, p0, Ll/pr20;->b:Ll/pf60;

    iget-object p0, p0, Ll/pr20;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0}, Ll/as20;->q(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
