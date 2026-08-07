.class public final synthetic Ll/dlb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dlb;->a:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dlb;->a:Ll/qcj;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->O3(Ll/qcj;Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
