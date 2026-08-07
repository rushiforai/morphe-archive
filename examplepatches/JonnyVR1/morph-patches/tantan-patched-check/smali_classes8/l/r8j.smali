.class public final synthetic Ll/r8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r8j;->a:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8j;->a:Ljava/lang/Boolean;

    check-cast p1, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    invoke-static {p0, p1}, Ll/u8j;->j(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
