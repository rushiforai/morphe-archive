.class public final synthetic Ll/hw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hw;->a:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hw;->a:Lcom/p1/mobile/putong/data/VerifyData;

    check-cast p1, Lkotlin/Pair;

    invoke-static {p0, p1}, Ll/pw;->r(Lcom/p1/mobile/putong/data/VerifyData;Lkotlin/Pair;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
