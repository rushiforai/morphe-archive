.class public final synthetic Ll/jbq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignInData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jbq0;->a:Lcom/p1/mobile/putong/data/SignInData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbq0;->a:Lcom/p1/mobile/putong/data/SignInData;

    check-cast p1, Lcom/p1/mobile/putong/data/MobileRespInfo;

    invoke-static {p0, p1}, Ll/ccq0;->m0(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
