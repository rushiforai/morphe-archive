.class public final synthetic Ll/krn;
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/NativeConfig;

    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->a(Lcom/p1/mobile/putong/core/data/NativeConfig;)Lcom/p1/mobile/putong/core/data/NativeConfig;

    move-result-object p0

    return-object p0
.end method
