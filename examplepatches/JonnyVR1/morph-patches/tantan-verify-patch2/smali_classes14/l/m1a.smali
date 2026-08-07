.class public final synthetic Ll/m1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/t;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1a;->a:Lcom/p1/mobile/putong/core/api/t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1a;->a:Lcom/p1/mobile/putong/core/api/t;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/t;->c3(Lcom/p1/mobile/putong/core/api/t;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    move-result-object p0

    return-object p0
.end method
