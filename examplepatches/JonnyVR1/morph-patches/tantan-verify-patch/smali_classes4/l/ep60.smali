.class public final synthetic Ll/ep60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ll/hp60;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(IIILl/hp60;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/ep60;->a:I

    iput p2, p0, Ll/ep60;->b:I

    iput p3, p0, Ll/ep60;->c:I

    iput-object p4, p0, Ll/ep60;->d:Ll/hp60;

    iput-object p5, p0, Ll/ep60;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p6, p0, Ll/ep60;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Ll/ep60;->a:I

    iget v1, p0, Ll/ep60;->b:I

    iget v2, p0, Ll/ep60;->c:I

    iget-object v3, p0, Ll/ep60;->d:Ll/hp60;

    iget-object v4, p0, Ll/ep60;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object v5, p0, Ll/ep60;->f:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/android/app/Act$r;

    invoke-static/range {v0 .. v6}, Ll/fp60;->k(IIILl/hp60;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;Lcom/p1/mobile/android/app/Act$r;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
