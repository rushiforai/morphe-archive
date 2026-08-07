.class public final synthetic Ll/kyd;
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
    check-cast p1, Lcom/p1/mobile/putong/data/DetectText;

    invoke-static {p1}, Lcom/p1/mobile/putong/data/DetectRequest;->b(Lcom/p1/mobile/putong/data/DetectText;)Lcom/p1/mobile/putong/data/DetectText;

    move-result-object p0

    return-object p0
.end method
