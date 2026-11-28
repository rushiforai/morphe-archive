.class final Le/e/a/CommentSource280;
.super Ljava/lang/Object;
.source "CommentSource280.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentSource280$Item;
    }
.end annotation


# static fields
.field private static final BY_SOURCE:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field

.field private static final BY_TIME:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private batchOpen:Z

.field private buildCutoff:F

.field private building:Z

.field private cursor:I

.field final due:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field

.field private filteredFixed:Ljava/util/ArrayList;

.field private filteredFixedLimit:I

.field private filteredFixedSnapshot:[Ljava/lang/Object;

.field final fixed:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field private fixedDuration:I

.field private generation:J

.field private final originalOrder:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field

.field private scrolling:[Le/e/a/CommentSource280$Item;

.field private snapshot:[Ljava/lang/Object;

.field private source:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation
.end field

.field private sourceSorted:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 11
    new-instance v0, Le/e/a/CommentSource280$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Le/e/a/CommentSource280$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Le/e/a/CommentSource280;->BY_TIME:Ljava/util/Comparator;

    .line 12
    new-instance v0, Le/e/a/CommentSource280$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Le/e/a/CommentSource280$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Le/e/a/CommentSource280;->BY_SOURCE:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    .line 28
    new-array v0, v0, [Le/e/a/CommentSource280$Item;

    iput-object v0, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSource280;->sourceSorted:Z

    .line 32
    new-instance v0, Ljava/util/PriorityQueue;

    sget-object v1, Le/e/a/CommentSource280;->BY_SOURCE:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    .line 39
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/CommentSource280;->generation:J

    .line 10
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/CommentSource280$Item;)I
    .registers 1

    .line 11
    iget p0, p0, Le/e/a/CommentSource280$Item;->timestamp:I

    return p0
.end method

.method static synthetic lambda$1(Le/e/a/CommentSource280$Item;)I
    .registers 1

    .line 12
    iget p0, p0, Le/e/a/CommentSource280$Item;->index:I

    return p0
.end method

.method private lowerBound(F)I
    .registers 6

    .line 165
    nop

    .line 166
    iget-object v0, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length v0, v0

    .line 167
    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    .line 172
    return v1

    .line 168
    :cond_0
    add-int v2, v1, v0

    ushr-int/lit8 v2, v2, 0x1

    .line 169
    iget-object v3, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    aget-object v3, v3, v2

    iget v3, v3, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float v3, v3

    cmpg-float v3, v3, p1

    if-gez v3, :cond_1

    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    .line 170
    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method private sameEntries(Ljava/util/ArrayList;)Z
    .registers 11

    const/4 v0, 0x0

    iget-object v1, p0, Le/e/a/CommentSource280;->source:Ljava/util/ArrayList;

    if-ne v1, p1, :cond_3

    iget-object v1, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    array-length v2, v1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v3, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_0
    :try_start_0
    if-ge v5, v4, :cond_1

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/q;

    iget-object v7, v6, Le/e/a/q;->j:Ljava/lang/Integer;

    invoke-static {v7, v0}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v7

    if-nez v7, :cond_0

    iget-object v6, v6, Le/e/a/q;->l:Ljava/lang/Integer;

    invoke-static {v6, v0}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v6

    if-eqz v6, :cond_3

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v4, :cond_3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v2, :cond_2

    aget-object v6, v1, v5

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-ne v6, v7, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v3, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    if-ne v1, v3, :cond_3

    iget-object v3, p0, Le/e/a/CommentSource280;->source:Ljava/util/ArrayList;

    if-ne p1, v3, :cond_3
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    :cond_3
    return v0

    :catch_0
    move-exception v1

    return v0
.end method

.method static value(Ljava/lang/Integer;I)I
    .registers 2

    .line 176
    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    return p1
.end method


# virtual methods
.method due(JZFF)V
    .registers 13

    .line 110
    const v6, 0x7fffffff

    move-object v0, p0

    move-wide v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Le/e/a/CommentSource280;->due(JZFFI)V

    .line 111
    return-void
.end method

.method due(JZFFI)V
    .registers 10

    .line 121
    const/4 v0, 0x0

    if-nez p3, :cond_0

    iget-wide v1, p0, Le/e/a/CommentSource280;->generation:J

    cmp-long p3, v1, p1

    if-eqz p3, :cond_1

    .line 122
    :cond_0
    iput-wide p1, p0, Le/e/a/CommentSource280;->generation:J

    .line 123
    invoke-direct {p0, p4}, Le/e/a/CommentSource280;->lowerBound(F)I

    move-result p1

    iput p1, p0, Le/e/a/CommentSource280;->cursor:I

    .line 124
    iput-boolean v0, p0, Le/e/a/CommentSource280;->batchOpen:Z

    .line 125
    iput-boolean v0, p0, Le/e/a/CommentSource280;->building:Z

    .line 126
    iget-object p1, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    invoke-virtual {p1}, Ljava/util/PriorityQueue;->clear()V

    .line 128
    :cond_1
    iget-object p1, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 129
    invoke-static {v0, p6}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 130
    if-nez p1, :cond_2

    return-void

    .line 131
    :cond_2
    iget-boolean p2, p0, Le/e/a/CommentSource280;->batchOpen:Z

    const/4 p3, 0x1

    if-nez p2, :cond_5

    .line 132
    iget p2, p0, Le/e/a/CommentSource280;->cursor:I

    iget-object p4, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length p4, p4

    if-ge p2, p4, :cond_4

    iget-object p2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p4, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p2, p2, p4

    iget p2, p2, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float p2, p2

    cmpl-float p2, p2, p5

    if-lez p2, :cond_3

    goto :goto_0

    .line 133
    :cond_3
    iput-boolean p3, p0, Le/e/a/CommentSource280;->batchOpen:Z

    .line 134
    iput p5, p0, Le/e/a/CommentSource280;->buildCutoff:F

    .line 135
    iget-boolean p2, p0, Le/e/a/CommentSource280;->sourceSorted:Z

    xor-int/2addr p2, p3

    iput-boolean p2, p0, Le/e/a/CommentSource280;->building:Z

    goto :goto_1

    .line 132
    :cond_4
    :goto_0
    return-void

    .line 137
    :cond_5
    :goto_1
    iget-boolean p2, p0, Le/e/a/CommentSource280;->sourceSorted:Z

    if-eqz p2, :cond_9

    .line 138
    nop

    :goto_2
    iget-object p2, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p2, p1, :cond_7

    iget p2, p0, Le/e/a/CommentSource280;->cursor:I

    iget-object p4, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length p4, p4

    if-ge p2, p4, :cond_7

    .line 139
    iget-object p2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p4, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p2, p2, p4

    iget p2, p2, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float p2, p2

    iget p4, p0, Le/e/a/CommentSource280;->buildCutoff:F

    .line 138
    cmpg-float p2, p2, p4

    if-lez p2, :cond_6

    goto :goto_3

    .line 140
    :cond_6
    iget-object p2, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    iget-object p4, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p5, p0, Le/e/a/CommentSource280;->cursor:I

    add-int/lit8 p6, p5, 0x1

    iput p6, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p4, p4, p5

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 142
    :cond_7
    :goto_3
    iget p1, p0, Le/e/a/CommentSource280;->cursor:I

    iget-object p2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length p2, p2

    if-ge p1, p2, :cond_8

    iget-object p1, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p2, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p1, p1, p2

    iget p1, p1, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float p1, p1

    iget p2, p0, Le/e/a/CommentSource280;->buildCutoff:F

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_8

    move v0, p3

    :cond_8
    iput-boolean v0, p0, Le/e/a/CommentSource280;->batchOpen:Z

    .line 143
    return-void

    .line 146
    :cond_9
    iget-boolean p2, p0, Le/e/a/CommentSource280;->building:Z

    if-eqz p2, :cond_e

    .line 147
    const p2, 0x7fffffff

    if-ne p1, p2, :cond_a

    goto :goto_4

    .line 148
    :cond_a
    mul-int/lit8 p2, p1, 0x10

    const/16 p4, 0x40

    invoke-static {p4, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/16 p4, 0x300

    invoke-static {p4, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 147
    :goto_4
    nop

    .line 149
    nop

    .line 150
    move p4, v0

    :goto_5
    if-ge p4, p2, :cond_c

    iget p5, p0, Le/e/a/CommentSource280;->cursor:I

    iget-object p6, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length p6, p6

    if-ge p5, p6, :cond_c

    .line 151
    iget-object p5, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p6, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p5, p5, p6

    iget p5, p5, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float p5, p5

    iget p6, p0, Le/e/a/CommentSource280;->buildCutoff:F

    .line 150
    cmpg-float p5, p5, p6

    if-lez p5, :cond_b

    goto :goto_6

    .line 152
    :cond_b
    iget-object p5, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    iget-object p6, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget v1, p0, Le/e/a/CommentSource280;->cursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p6, p6, v1

    invoke-virtual {p5, p6}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 153
    add-int/lit8 p4, p4, 0x1

    goto :goto_5

    .line 155
    :cond_c
    :goto_6
    iget p2, p0, Le/e/a/CommentSource280;->cursor:I

    iget-object p4, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    array-length p4, p4

    if-ge p2, p4, :cond_d

    iget-object p2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    iget p4, p0, Le/e/a/CommentSource280;->cursor:I

    aget-object p2, p2, p4

    iget p2, p2, Le/e/a/CommentSource280$Item;->timestamp:I

    int-to-float p2, p2

    iget p4, p0, Le/e/a/CommentSource280;->buildCutoff:F

    cmpg-float p2, p2, p4

    if-gtz p2, :cond_d

    return-void

    .line 156
    :cond_d
    iput-boolean v0, p0, Le/e/a/CommentSource280;->building:Z

    .line 158
    nop

    :cond_e
    :goto_7
    iget-object p2, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p2, p1, :cond_10

    iget-object p2, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    invoke-virtual {p2}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_f

    goto :goto_8

    .line 159
    :cond_f
    iget-object p2, p0, Le/e/a/CommentSource280;->due:Ljava/util/ArrayList;

    iget-object p4, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    invoke-virtual {p4}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Le/e/a/CommentSource280$Item;

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 161
    :cond_10
    :goto_8
    iget-object p1, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    invoke-virtual {p1}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, p3

    iput-boolean p1, p0, Le/e/a/CommentSource280;->batchOpen:Z

    .line 162
    return-void
.end method

.method fixedDuration(I)V
    .registers 5

    .line 103
    iget v0, p0, Le/e/a/CommentSource280;->fixedDuration:I

    if-ne v0, p1, :cond_0

    return-void

    .line 104
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 105
    iget-object v1, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 106
    iput p1, p0, Le/e/a/CommentSource280;->fixedDuration:I

    .line 107
    return-void

    .line 105
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/q;

    iput-object v0, v2, Le/e/a/q;->k:Ljava/lang/Integer;

    goto :goto_0
.end method

.method fixedForLength(I)Ljava/util/ArrayList;
    .registers 9

    iget-object v0, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    if-gtz p1, :cond_0

    const/4 v1, 0x0

    iput-object v1, p0, Le/e/a/CommentSource280;->filteredFixed:Ljava/util/ArrayList;

    iput-object v1, p0, Le/e/a/CommentSource280;->filteredFixedSnapshot:[Ljava/lang/Object;

    return-object v0

    :cond_0
    iget-object v1, p0, Le/e/a/CommentSource280;->filteredFixed:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    iget v2, p0, Le/e/a/CommentSource280;->filteredFixedLimit:I

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    iget-object v3, p0, Le/e/a/CommentSource280;->filteredFixedSnapshot:[Ljava/lang/Object;

    if-ne v2, v3, :cond_1

    return-object v1

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/q;

    iget-object v5, v4, Le/e/a/q;->a:Ljava/lang/String;

    invoke-static {v5, p1}, Le/e/a/NgCommentSettings;->exceedsLength(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    iput-object v1, p0, Le/e/a/CommentSource280;->filteredFixed:Ljava/util/ArrayList;

    iput p1, p0, Le/e/a/CommentSource280;->filteredFixedLimit:I

    iget-object v3, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    iput-object v3, p0, Le/e/a/CommentSource280;->filteredFixedSnapshot:[Ljava/lang/Object;

    return-object v1
.end method

.method hasBatch()Z
    .registers 2

    .line 114
    iget-boolean v0, p0, Le/e/a/CommentSource280;->batchOpen:Z

    return v0
.end method

.method update(Ljava/util/ArrayList;)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "*>;)Z"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1}, Le/e/a/CommentSource280;->sameEntries(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 64
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 65
    array-length v2, v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_9

    .line 66
    move v2, v1

    :goto_0
    array-length v3, v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v2, v3, :cond_7

    .line 69
    nop

    .line 72
    nop

    .line 73
    nop

    .line 74
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 75
    iget-object v2, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 76
    const/4 v4, 0x1

    const/high16 v2, -0x80000000

    move v5, v1

    move v6, v4

    :goto_1
    array-length v7, v0

    if-lt v5, v7, :cond_2

    .line 89
    new-array v2, v1, [Le/e/a/CommentSource280$Item;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Le/e/a/CommentSource280$Item;

    iput-object v2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    .line 90
    iput-boolean v6, p0, Le/e/a/CommentSource280;->sourceSorted:Z

    .line 91
    if-nez v6, :cond_1

    iget-object v2, p0, Le/e/a/CommentSource280;->scrolling:[Le/e/a/CommentSource280$Item;

    sget-object v3, Le/e/a/CommentSource280;->BY_TIME:Ljava/util/Comparator;

    invoke-static {v2, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 92
    :cond_1
    iget-object v2, p0, Le/e/a/CommentSource280;->originalOrder:Ljava/util/PriorityQueue;

    invoke-virtual {v2}, Ljava/util/PriorityQueue;->clear()V

    .line 93
    iput-boolean v1, p0, Le/e/a/CommentSource280;->batchOpen:Z

    .line 94
    iput-boolean v1, p0, Le/e/a/CommentSource280;->building:Z

    .line 95
    iput-object v0, p0, Le/e/a/CommentSource280;->snapshot:[Ljava/lang/Object;

    const/4 v2, 0x0

    iput-object v2, p0, Le/e/a/CommentSource280;->filteredFixed:Ljava/util/ArrayList;

    iput-object v2, p0, Le/e/a/CommentSource280;->filteredFixedSnapshot:[Ljava/lang/Object;

    .line 96
    iput-object p1, p0, Le/e/a/CommentSource280;->source:Ljava/util/ArrayList;

    .line 97
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Le/e/a/CommentSource280;->generation:J

    .line 98
    iput v1, p0, Le/e/a/CommentSource280;->fixedDuration:I

    .line 99
    return v4

    .line 77
    :cond_2
    aget-object v7, v0, v5

    .line 78
    instance-of v8, v7, Le/e/a/q;

    if-nez v8, :cond_3

    goto :goto_4

    .line 79
    :cond_3
    check-cast v7, Le/e/a/q;

    .line 80
    iget-object v8, v7, Le/e/a/q;->j:Ljava/lang/Integer;

    invoke-static {v8, v1}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v8

    if-nez v8, :cond_6

    iget-object v8, v7, Le/e/a/q;->l:Ljava/lang/Integer;

    invoke-static {v8, v1}, Le/e/a/CommentSource280;->value(Ljava/lang/Integer;I)I

    move-result v8

    if-eqz v8, :cond_4

    goto :goto_3

    .line 83
    :cond_4
    new-instance v8, Le/e/a/CommentSource280$Item;

    invoke-direct {v8, v7, v5}, Le/e/a/CommentSource280$Item;-><init>(Le/e/a/q;I)V

    .line 84
    iget v7, v8, Le/e/a/CommentSource280$Item;->timestamp:I

    if-lt v7, v2, :cond_5

    move v2, v4

    goto :goto_2

    :cond_5
    move v2, v1

    :goto_2
    and-int/2addr v6, v2

    .line 85
    iget v2, v8, Le/e/a/CommentSource280$Item;->timestamp:I

    .line 86
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 81
    :cond_6
    :goto_3
    iget-object v8, p0, Le/e/a/CommentSource280;->fixed:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    nop

    .line 76
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 67
    :cond_7
    :try_start_1
    aget-object v3, v0, v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-ne v3, v4, :cond_8

    .line 66
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 67
    :cond_8
    new-instance p1, Ljava/util/ConcurrentModificationException;

    invoke-direct {p1}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p1

    .line 65
    :cond_9
    new-instance p1, Ljava/util/ConcurrentModificationException;

    invoke-direct {p1}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p1
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/ConcurrentModificationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    :catch_0
    move-exception p1

    goto :goto_5

    :catch_1
    move-exception p1

    .line 70
    :goto_5
    return v1
.end method
