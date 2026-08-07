.class public final synthetic Ll/lj7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lj7;->a:Lcom/p1/mobile/putong/core/api/e;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lj7;->a:Lcom/p1/mobile/putong/core/api/e;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/e;->Q5(Lcom/p1/mobile/putong/core/api/e;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
