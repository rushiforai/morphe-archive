.class public final synthetic Ll/cpb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lqb;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cpb;->a:Ll/lqb;

    iput-object p2, p0, Ll/cpb;->b:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cpb;->a:Ll/lqb;

    iget-object p0, p0, Ll/cpb;->b:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0}, Ll/lqb;->C3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
