.class public final synthetic Ll/w89;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/m;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w89;->a:Lcom/p1/mobile/putong/core/api/m;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w89;->a:Lcom/p1/mobile/putong/core/api/m;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/m;->b3(Lcom/p1/mobile/putong/core/api/m;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    move-result-object p0

    return-object p0
.end method
