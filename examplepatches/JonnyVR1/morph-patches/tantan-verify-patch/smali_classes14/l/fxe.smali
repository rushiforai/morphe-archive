.class public final synthetic Ll/fxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gxe;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyDataV2;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fxe;->a:Ll/gxe;

    iput-object p2, p0, Ll/fxe;->b:Lcom/p1/mobile/putong/data/VerifyDataV2;

    iput-object p3, p0, Ll/fxe;->c:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fxe;->a:Ll/gxe;

    iget-object v1, p0, Ll/fxe;->b:Lcom/p1/mobile/putong/data/VerifyDataV2;

    iget-object p0, p0, Ll/fxe;->c:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/gxe;->V0(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method
