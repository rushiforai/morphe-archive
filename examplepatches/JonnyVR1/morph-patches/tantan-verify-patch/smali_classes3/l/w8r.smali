.class public final synthetic Ll/w8r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/LabelParams;

    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/LabelStatistics;->a(Lcom/p1/mobile/putong/core/data/LabelParams;)Lcom/p1/mobile/putong/core/data/LabelParams;

    move-result-object p0

    return-object p0
.end method
