.class public final synthetic Ll/aj50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/OMSData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/OMSData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aj50;->a:Lcom/p1/mobile/putong/data/OMSData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aj50;->a:Lcom/p1/mobile/putong/data/OMSData;

    invoke-static {p0}, Ll/dj50;->B(Lcom/p1/mobile/putong/data/OMSData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
