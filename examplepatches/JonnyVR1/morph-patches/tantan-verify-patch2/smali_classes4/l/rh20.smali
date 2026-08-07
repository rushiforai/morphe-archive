.class public final synthetic Ll/rh20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/th20;


# direct methods
.method public synthetic constructor <init>(Ll/th20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rh20;->a:Ll/th20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rh20;->a:Ll/th20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Ll/th20;->d(Ll/th20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
