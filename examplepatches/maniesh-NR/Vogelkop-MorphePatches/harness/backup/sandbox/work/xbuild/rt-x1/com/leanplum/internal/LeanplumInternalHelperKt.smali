.class public final Lcom/leanplum/internal/LeanplumInternalHelperKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u000e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "isPreview",
        "",
        "actionContext",
        "Lcom/leanplum/internal/BaseActionContext;",
        "app"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final isPreview(Lcom/leanplum/internal/BaseActionContext;)Z
    .registers 1
    .param p0    # Lcom/leanplum/internal/BaseActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->isPreview()Z

    move-result p0

    return p0
.end method
