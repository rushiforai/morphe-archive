.class public Lrx/subjects/SubjectSubscriptionManager$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/subjects/SubjectSubscriptionManager;->addUnsubscriber(Ll/gcg0;Lrx/subjects/SubjectSubscriptionManager$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/subjects/SubjectSubscriptionManager$c;

.field public final synthetic b:Lrx/subjects/SubjectSubscriptionManager;


# direct methods
.method public constructor <init>(Lrx/subjects/SubjectSubscriptionManager;Lrx/subjects/SubjectSubscriptionManager$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/subjects/SubjectSubscriptionManager$a;->b:Lrx/subjects/SubjectSubscriptionManager;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/subjects/SubjectSubscriptionManager$a;->a:Lrx/subjects/SubjectSubscriptionManager$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/subjects/SubjectSubscriptionManager$a;->b:Lrx/subjects/SubjectSubscriptionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lrx/subjects/SubjectSubscriptionManager$a;->a:Lrx/subjects/SubjectSubscriptionManager$c;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lrx/subjects/SubjectSubscriptionManager;->remove(Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
