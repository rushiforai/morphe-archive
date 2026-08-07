.class public final synthetic Ll/hpe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ope0;


# direct methods
.method public synthetic constructor <init>(Ll/ope0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hpe0;->a:Ll/ope0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hpe0;->a:Ll/ope0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    invoke-static {p0, p1}, Ll/ope0;->n0(Ll/ope0;Lcom/p1/mobile/putong/core/data/RedPacket;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
