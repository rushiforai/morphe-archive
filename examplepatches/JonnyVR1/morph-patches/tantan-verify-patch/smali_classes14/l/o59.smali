.class public final synthetic Ll/o59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/s59;


# direct methods
.method public synthetic constructor <init>(Ll/s59;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o59;->a:Ll/s59;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o59;->a:Ll/s59;

    check-cast p1, Lcom/p1/mobile/putong/core/data/OfficialAdvertEnvelope;

    invoke-static {p0, p1}, Ll/s59;->d3(Ll/s59;Lcom/p1/mobile/putong/core/data/OfficialAdvertEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
