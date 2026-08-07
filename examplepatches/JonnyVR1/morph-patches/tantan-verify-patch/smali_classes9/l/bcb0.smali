.class public final synthetic Ll/bcb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bcb0;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bcb0;->a:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p2, Lcom/p1/mobile/android/app/Act;

    check-cast p3, Ljava/lang/String;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->p(Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
