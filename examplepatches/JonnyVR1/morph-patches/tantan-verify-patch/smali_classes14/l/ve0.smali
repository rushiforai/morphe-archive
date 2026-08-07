.class public final synthetic Ll/ve0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ye0;


# direct methods
.method public synthetic constructor <init>(Ll/ye0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ve0;->a:Ll/ye0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ve0;->a:Ll/ye0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;

    invoke-static {p0, p1}, Ll/ye0;->F(Ll/ye0;Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V

    return-void
.end method
