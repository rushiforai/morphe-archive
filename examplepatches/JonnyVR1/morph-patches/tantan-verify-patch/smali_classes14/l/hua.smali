.class public final synthetic Ll/hua;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kua;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Ll/kua;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hua;->a:Ll/kua;

    iput-object p2, p0, Ll/hua;->b:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hua;->a:Ll/kua;

    iget-object p0, p0, Ll/hua;->b:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0}, Ll/kua;->d3(Ll/kua;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
