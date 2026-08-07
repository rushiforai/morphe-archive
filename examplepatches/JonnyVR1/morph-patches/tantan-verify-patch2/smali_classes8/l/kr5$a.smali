.class public Ll/kr5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kr5;->p(Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/a30<",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/kr5;


# direct methods
.method public constructor <init>(Ll/kr5;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kr5$a;->b:Ll/kr5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kr5$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    check-cast p3, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/kr5$a;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/kr5$a;->b:Ll/kr5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/kr5$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/kr5;->i(Ll/kr5;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
