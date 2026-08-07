.class public abstract Lcom/p1/mobile/putong/api/RemoteStore;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/RemoteStore$RemoteData;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/RemoteStore;->a:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/api/RemoteStore;->b:Lrx/subjects/a;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/api/RemoteStore;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/RemoteStore;->b:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/api/RemoteStore;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/RemoteStore;->a:Z

    return-void
.end method
