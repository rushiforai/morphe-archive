.class public final synthetic Ll/dxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gxe;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyDataV2;


# direct methods
.method public synthetic constructor <init>(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dxe;->a:Ll/gxe;

    iput-object p2, p0, Ll/dxe;->b:Lcom/p1/mobile/putong/data/VerifyDataV2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dxe;->a:Ll/gxe;

    iget-object p0, p0, Ll/dxe;->b:Lcom/p1/mobile/putong/data/VerifyDataV2;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/gxe;->b1(Ll/gxe;Lcom/p1/mobile/putong/data/VerifyDataV2;Ll/uxj0;)V

    return-void
.end method
