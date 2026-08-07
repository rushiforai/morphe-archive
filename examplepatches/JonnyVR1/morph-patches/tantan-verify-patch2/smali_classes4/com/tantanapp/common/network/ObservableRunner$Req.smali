.class Lcom/tantanapp/common/network/ObservableRunner$Req;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/ObservableRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Req"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public done:Z

.field public handleError:Z

.field final id:Ljava/lang/String;

.field public notifier:Lrx/subjects/a;

.field final request:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public subs:Ll/kcg0;

.field final type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILl/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 13
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/tantanapp/common/network/ObservableRunner$Req;-><init>(Ljava/lang/String;ILl/pcj;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILl/pcj;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->type:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->request:Ll/pcj;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->handleError:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public idempotent(Ljava/lang/String;I)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->type:I

    .line 4
    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner$Req;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
