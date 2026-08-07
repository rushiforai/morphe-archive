.class public final synthetic Ll/s68;
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
    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/g;->N6(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method
