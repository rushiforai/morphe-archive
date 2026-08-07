.class public final synthetic Ll/pim0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vim0;


# direct methods
.method public synthetic constructor <init>(Ll/vim0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pim0;->a:Ll/vim0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pim0;->a:Ll/vim0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Ll/vim0;->e(Ll/vim0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
