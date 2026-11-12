.class public final Lwl5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Lm59;

.field public final c:Ljava/util/ArrayDeque;

.field public d:Lo3j;

.field public e:Lcig;

.field public f:Z

.field public g:Lcig;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lm59;Lo3j;Lcig;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwl5;->a:Ljava/lang/Object;

    iput-object p2, p0, Lwl5;->b:Lm59;

    iput-object p3, p0, Lwl5;->d:Lo3j;

    iput-object p4, p0, Lwl5;->e:Lcig;

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lwl5;->c:Ljava/util/ArrayDeque;

    sget-object p1, Lcig;->b:Lcig;

    iput-object p1, p0, Lwl5;->g:Lcig;

    return-void
.end method
