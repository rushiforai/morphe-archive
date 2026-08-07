.class public final synthetic Ll/xoz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xoz;->a:Ll/tvz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xoz;->a:Ll/tvz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Ll/tvz;->xb(Ll/tvz;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
