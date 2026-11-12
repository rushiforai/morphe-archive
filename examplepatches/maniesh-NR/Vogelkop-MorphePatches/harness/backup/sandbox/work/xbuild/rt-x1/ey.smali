.class public final Ley;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:I

.field public final c:J

.field public final d:Ljava/util/List;


# direct methods
.method public constructor <init>(JIJLjava/util/List;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ley;->a:J

    iput p3, p0, Ley;->b:I

    iput-wide p4, p0, Ley;->c:J

    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ley;->d:Ljava/util/List;

    return-void
.end method
