.class public Ll/jr20$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qol$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jr20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jr20;


# direct methods
.method public constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20$b;->a:Ll/jr20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jr20$b;->a:Ll/jr20;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jr20;->q:Ll/f90;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/jr20$b;->a:Ll/jr20;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jr20;->q:Ll/f90;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, p1, v0}, Ll/f90;->A(Ljava/util/List;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jr20$b;->a:Ll/jr20;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/jr20$b;->a:Ll/jr20;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
