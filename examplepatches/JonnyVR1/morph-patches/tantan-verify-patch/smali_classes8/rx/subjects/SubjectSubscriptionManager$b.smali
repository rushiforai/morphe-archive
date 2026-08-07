.class public final Lrx/subjects/SubjectSubscriptionManager$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/subjects/SubjectSubscriptionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final c:[Lrx/subjects/SubjectSubscriptionManager$c;

.field public static final d:Lrx/subjects/SubjectSubscriptionManager$b;

.field public static final e:Lrx/subjects/SubjectSubscriptionManager$b;


# instance fields
.field public final a:Z

.field public final b:[Lrx/subjects/SubjectSubscriptionManager$c;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Lrx/subjects/SubjectSubscriptionManager$c;

    .line 3
    .line 4
    sput-object v1, Lrx/subjects/SubjectSubscriptionManager$b;->c:[Lrx/subjects/SubjectSubscriptionManager$c;

    .line 5
    .line 6
    new-instance v2, Lrx/subjects/SubjectSubscriptionManager$b;

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-direct {v2, v3, v1}, Lrx/subjects/SubjectSubscriptionManager$b;-><init>(Z[Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 10
    .line 11
    .line 12
    sput-object v2, Lrx/subjects/SubjectSubscriptionManager$b;->d:Lrx/subjects/SubjectSubscriptionManager$b;

    .line 13
    .line 14
    new-instance v2, Lrx/subjects/SubjectSubscriptionManager$b;

    .line 15
    .line 16
    invoke-direct {v2, v0, v1}, Lrx/subjects/SubjectSubscriptionManager$b;-><init>(Z[Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 17
    .line 18
    .line 19
    sput-object v2, Lrx/subjects/SubjectSubscriptionManager$b;->e:Lrx/subjects/SubjectSubscriptionManager$b;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Z[Lrx/subjects/SubjectSubscriptionManager$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lrx/subjects/SubjectSubscriptionManager$b;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Lrx/subjects/SubjectSubscriptionManager$b;->b:[Lrx/subjects/SubjectSubscriptionManager$c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/subjects/SubjectSubscriptionManager$c;)Lrx/subjects/SubjectSubscriptionManager$b;
    .locals 4

    .line 1
    iget-object v0, p0, Lrx/subjects/SubjectSubscriptionManager$b;->b:[Lrx/subjects/SubjectSubscriptionManager$c;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    add-int/lit8 v2, v1, 0x1

    .line 5
    .line 6
    new-array v2, v2, [Lrx/subjects/SubjectSubscriptionManager$c;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    aput-object p1, v2, v1

    .line 13
    .line 14
    new-instance p1, Lrx/subjects/SubjectSubscriptionManager$b;

    .line 15
    .line 16
    iget-boolean p0, p0, Lrx/subjects/SubjectSubscriptionManager$b;->a:Z

    .line 17
    .line 18
    invoke-direct {p1, p0, v2}, Lrx/subjects/SubjectSubscriptionManager$b;-><init>(Z[Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public b(Lrx/subjects/SubjectSubscriptionManager$c;)Lrx/subjects/SubjectSubscriptionManager$b;
    .locals 9

    .line 1
    iget-object v0, p0, Lrx/subjects/SubjectSubscriptionManager$b;->b:[Lrx/subjects/SubjectSubscriptionManager$c;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    aget-object v2, v0, v3

    .line 9
    .line 10
    if-ne v2, p1, :cond_0

    .line 11
    .line 12
    sget-object p0, Lrx/subjects/SubjectSubscriptionManager$b;->e:Lrx/subjects/SubjectSubscriptionManager$b;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    add-int/lit8 v2, v1, -0x1

    .line 19
    .line 20
    new-array v4, v2, [Lrx/subjects/SubjectSubscriptionManager$c;

    .line 21
    .line 22
    move v5, v3

    .line 23
    move v6, v5

    .line 24
    :goto_0
    if-ge v5, v1, :cond_4

    .line 25
    .line 26
    aget-object v7, v0, v5

    .line 27
    .line 28
    if-eq v7, p1, :cond_3

    .line 29
    .line 30
    if-ne v6, v2, :cond_2

    .line 31
    .line 32
    :goto_1
    return-object p0

    .line 33
    :cond_2
    add-int/lit8 v8, v6, 0x1

    .line 34
    .line 35
    aput-object v7, v4, v6

    .line 36
    .line 37
    move v6, v8

    .line 38
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_4
    if-nez v6, :cond_5

    .line 42
    .line 43
    sget-object p0, Lrx/subjects/SubjectSubscriptionManager$b;->e:Lrx/subjects/SubjectSubscriptionManager$b;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_5
    if-ge v6, v2, :cond_6

    .line 47
    .line 48
    new-array p1, v6, [Lrx/subjects/SubjectSubscriptionManager$c;

    .line 49
    .line 50
    invoke-static {v4, v3, p1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    move-object v4, p1

    .line 54
    :cond_6
    new-instance p1, Lrx/subjects/SubjectSubscriptionManager$b;

    .line 55
    .line 56
    iget-boolean p0, p0, Lrx/subjects/SubjectSubscriptionManager$b;->a:Z

    .line 57
    .line 58
    invoke-direct {p1, p0, v4}, Lrx/subjects/SubjectSubscriptionManager$b;-><init>(Z[Lrx/subjects/SubjectSubscriptionManager$c;)V

    .line 59
    .line 60
    .line 61
    return-object p1
.end method
