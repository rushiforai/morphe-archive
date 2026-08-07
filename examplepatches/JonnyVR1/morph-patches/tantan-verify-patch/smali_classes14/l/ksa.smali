.class public final synthetic Ll/ksa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/usa;


# direct methods
.method public synthetic constructor <init>(Ll/usa;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ksa;->a:Ll/usa;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksa;->a:Ll/usa;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-static {p0, p1}, Ll/usa;->o3(Ll/usa;Lcom/p1/mobile/putong/core/data/Coupon;)V

    return-void
.end method
