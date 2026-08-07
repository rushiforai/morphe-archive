.class public final synthetic Ll/uy80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/az80;


# direct methods
.method public synthetic constructor <init>(Ll/az80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uy80;->a:Ll/az80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uy80;->a:Ll/az80;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    invoke-static {p0, p1}, Ll/az80;->p0(Ll/az80;Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)V

    return-void
.end method
