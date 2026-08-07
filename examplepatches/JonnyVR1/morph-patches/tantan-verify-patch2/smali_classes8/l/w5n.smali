.class public final synthetic Ll/w5n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/x5n;


# direct methods
.method public synthetic constructor <init>(Ll/x5n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w5n;->a:Ll/x5n;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w5n;->a:Ll/x5n;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;

    invoke-static {p0, p1}, Ll/x5n;->e0(Ll/x5n;Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
