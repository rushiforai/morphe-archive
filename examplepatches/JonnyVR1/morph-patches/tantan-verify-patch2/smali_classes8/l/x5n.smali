.class public final Ll/x5n;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/f6n;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\r\u0010\n\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\n\u0010\tJ\r\u0010\u000b\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\t\u00a8\u0006\u000c"
    }
    d2 = {
        "Ll/x5n;",
        "Ll/ar2;",
        "Ll/f6n;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "destroy",
        "()V",
        "h0",
        "f0",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/x5n;Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x5n;->g0(Ll/x5n;Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final g0(Ll/x5n;Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/f6n;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;->summary:Lcom/p1/mobile/putong/core/data/IntlCampingSummaryData;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;->questions:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, p1}, Ll/f6n;->B(Lcom/p1/mobile/putong/core/data/IntlCampingSummaryData;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 26
    .line 27
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final f0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z1:Ll/m69;

    .line 10
    .line 11
    new-instance v2, Ll/w5n;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/w5n;-><init>(Ll/x5n;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0, v2}, Ll/m69;->o3(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function1;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final h0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f6n;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f6n;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
