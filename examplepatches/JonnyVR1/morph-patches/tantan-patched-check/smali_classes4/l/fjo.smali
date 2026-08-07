.class public final synthetic Ll/fjo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ojo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/TribeSubset;


# direct methods
.method public synthetic constructor <init>(Ll/ojo;Lcom/p1/mobile/putong/core/data/TribeSubset;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjo;->a:Ll/ojo;

    iput-object p2, p0, Ll/fjo;->b:Lcom/p1/mobile/putong/core/data/TribeSubset;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fjo;->a:Ll/ojo;

    iget-object p0, p0, Ll/fjo;->b:Lcom/p1/mobile/putong/core/data/TribeSubset;

    check-cast p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;

    invoke-static {v0, p0, p1}, Ll/ojo;->h0(Ll/ojo;Lcom/p1/mobile/putong/core/data/TribeSubset;Lcom/p1/mobile/putong/core/data/TribeSubsetContent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
