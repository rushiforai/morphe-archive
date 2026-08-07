.class Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/ObservableRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReqForNow"
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
.field public handleError:Z

.field final id:Ljava/lang/String;

.field public notifier:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "TT;>;"
        }
    .end annotation
.end field

.field public obs:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public subs:Ll/kcg0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lrx/c;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->obs:Lrx/c;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->handleError:Z

    .line 9
    .line 10
    return-void
.end method
