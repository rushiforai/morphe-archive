.class public final synthetic Ll/nlh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nlh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    iput p2, p0, Ll/nlh0;->b:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nlh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    iget p0, p0, Ll/nlh0;->b:I

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p2, Lcom/p1/mobile/android/app/Act;

    check-cast p3, Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;ILcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
