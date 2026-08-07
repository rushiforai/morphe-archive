.class public final synthetic Ll/lm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lm9;->a:Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lm9;->a:Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/r;->f3(Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;Ll/uxj0;)Lcom/p1/mobile/putong/core/data/LoveBuzzEnvelope;

    move-result-object p0

    return-object p0
.end method
