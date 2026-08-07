.class public final Lrx/subjects/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/subjects/a;->d(Ljava/lang/Object;Z)Lrx/subjects/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lrx/subjects/SubjectSubscriptionManager$c<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lrx/subjects/SubjectSubscriptionManager;


# direct methods
.method public constructor <init>(Lrx/subjects/SubjectSubscriptionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/subjects/a$a;->a:Lrx/subjects/SubjectSubscriptionManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/subjects/SubjectSubscriptionManager$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/SubjectSubscriptionManager$c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/subjects/a$a;->a:Lrx/subjects/SubjectSubscriptionManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/SubjectSubscriptionManager;->getLatest()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lrx/subjects/a$a;->a:Lrx/subjects/SubjectSubscriptionManager;

    .line 8
    .line 9
    iget-object p0, p0, Lrx/subjects/SubjectSubscriptionManager;->nl:Lrx/internal/operators/NotificationLite;

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Lrx/subjects/SubjectSubscriptionManager$c;->b(Ljava/lang/Object;Lrx/internal/operators/NotificationLite;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/subjects/SubjectSubscriptionManager$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a$a;->a(Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
