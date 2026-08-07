.class public final synthetic Ll/dna;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ina;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/VipSetting;


# direct methods
.method public synthetic constructor <init>(Ll/ina;Lcom/p1/mobile/putong/core/data/VipSetting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dna;->a:Ll/ina;

    iput-object p2, p0, Ll/dna;->b:Lcom/p1/mobile/putong/core/data/VipSetting;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dna;->a:Ll/ina;

    iget-object p0, p0, Ll/dna;->b:Lcom/p1/mobile/putong/core/data/VipSetting;

    invoke-static {v0, p0}, Ll/ina;->a3(Ll/ina;Lcom/p1/mobile/putong/core/data/VipSetting;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
