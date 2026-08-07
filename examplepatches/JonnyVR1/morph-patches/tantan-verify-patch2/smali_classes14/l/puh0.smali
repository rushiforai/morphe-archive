.class public final synthetic Ll/puh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/puh0;->a:Ll/z20;

    iput-object p2, p0, Ll/puh0;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puh0;->a:Ll/z20;

    iget-object p0, p0, Ll/puh0;->b:Lcom/p1/mobile/putong/data/Media;

    check-cast p1, Lcom/p1/mobile/putong/data/CustomEnvelope;

    invoke-static {v0, p0, p1}, Ll/zuh0;->k(Ll/z20;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/CustomEnvelope;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
