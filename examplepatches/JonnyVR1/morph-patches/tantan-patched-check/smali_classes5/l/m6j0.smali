.class public final synthetic Ll/m6j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o6j0;


# direct methods
.method public synthetic constructor <init>(Ll/o6j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m6j0;->a:Ll/o6j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m6j0;->a:Ll/o6j0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {p0, p1}, Ll/o6j0;->c(Ll/o6j0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
