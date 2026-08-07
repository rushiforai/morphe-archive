.class public Ll/d79$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d79;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(ILcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/d79$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/d79$a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    return-void
.end method
