.class public abstract Ll/dxi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ns2;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a(Ll/ns2;II)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)V"
        }
    .end annotation
.end method

.method public abstract b(ILandroid/view/ViewGroup;I)Ll/ns2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/view/ViewGroup;",
            "I)TT;"
        }
    .end annotation
.end method

.method public abstract d(I)Ljava/lang/String;
.end method

.method public abstract m()I
.end method

.method public abstract p(I)I
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dxi0;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->Q()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w(Ll/ns2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dxi0;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;

    .line 2
    .line 3
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
