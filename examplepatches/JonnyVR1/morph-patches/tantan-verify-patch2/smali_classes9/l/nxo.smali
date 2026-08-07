.class public final synthetic Ll/nxo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zxo;


# direct methods
.method public synthetic constructor <init>(Ll/zxo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxo;->a:Ll/zxo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxo;->a:Ll/zxo;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/zxo;->H(Ll/zxo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
