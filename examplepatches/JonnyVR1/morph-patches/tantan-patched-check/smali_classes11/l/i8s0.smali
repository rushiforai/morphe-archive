.class public final Ll/i8s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public constructor <init>(Ll/k8s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Ll/o8s0;

    .line 2
    .line 3
    check-cast p2, Ll/o8s0;

    .line 4
    .line 5
    iget p0, p1, Ll/o8s0;->c:I

    .line 6
    .line 7
    iget v0, p2, Ll/o8s0;->c:I

    .line 8
    .line 9
    sub-int/2addr p0, v0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    iget-wide p0, p1, Ll/o8s0;->a:J

    .line 14
    .line 15
    iget-wide v0, p2, Ll/o8s0;->a:J

    .line 16
    .line 17
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method
