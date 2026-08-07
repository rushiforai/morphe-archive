.class public final synthetic Ll/dnb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/enb;


# direct methods
.method public synthetic constructor <init>(Ll/enb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dnb;->a:Ll/enb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dnb;->a:Ll/enb;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/enb;->u3(Ll/enb;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/VisitorSetting;

    move-result-object p0

    return-object p0
.end method
