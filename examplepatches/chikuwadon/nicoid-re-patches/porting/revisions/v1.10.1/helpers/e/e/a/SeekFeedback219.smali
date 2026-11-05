.class public final Le/e/a/SeekFeedback219;
.super Ljava/lang/Object;
.source "SeekFeedback219.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SeekFeedback219$Move;
    }
.end annotation


# static fields
.field private static final BURSTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Le/e/a/GestureRules219$Burst;",
            ">;"
        }
    .end annotation
.end field

.field private static final PENDING:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/SeekFeedback219$Move;",
            ">;"
        }
    .end annotation
.end field

.field private static shown:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/Toast;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 6
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/SeekFeedback219;->PENDING:Ljava/lang/ThreadLocal;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SeekFeedback219;->BURSTS:Ljava/util/WeakHashMap;

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/SeekFeedback219;->shown:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear(Landroid/content/Context;)V
    .registers 2

    .line 18
    sget-object v0, Le/e/a/SeekFeedback219;->BURSTS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/SeekFeedback219;->PENDING:Ljava/lang/ThreadLocal;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public static target(JJII)J
    .registers 8

    .line 9
    invoke-static/range {p0 .. p5}, Le/e/a/SeekRules;->target(JJII)J

    move-result-wide p2

    new-instance v0, Le/e/a/SeekFeedback219$Move;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/SeekFeedback219$Move;-><init>(Le/e/a/SeekFeedback219$Move;)V

    iput-wide p0, v0, Le/e/a/SeekFeedback219$Move;->before:J

    iput-wide p2, v0, Le/e/a/SeekFeedback219$Move;->target:J

    iput p4, v0, Le/e/a/SeekFeedback219$Move;->side:I

    iput p5, v0, Le/e/a/SeekFeedback219$Move;->step:I

    sget-object p0, Le/e/a/SeekFeedback219;->PENDING:Ljava/lang/ThreadLocal;

    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-wide p2
.end method

.method public static toast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .registers 15

    .line 10
    sget-object v0, Le/e/a/SeekFeedback219;->PENDING:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SeekFeedback219$Move;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    if-eqz v1, :cond_98

    .line 11
    sget-object p1, Le/e/a/SeekFeedback219;->BURSTS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/GestureRules219$Burst;

    if-nez v0, :cond_1f

    new-instance v0, Le/e/a/GestureRules219$Burst;

    invoke-direct {v0}, Le/e/a/GestureRules219$Burst;-><init>()V

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    move-object v2, v0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 12
    :try_start_41
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_52

    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v3, "b0"

    invoke-static {v0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_5a

    :cond_52
    const-string v0, "f"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_58} :catch_59

    goto :goto_5a

    :catch_59
    nop

    :goto_5a
    move-object v3, p1

    .line 13
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, v1, Le/e/a/SeekFeedback219$Move;->before:J

    iget-wide v8, v1, Le/e/a/SeekFeedback219$Move;->target:J

    iget v10, v1, Le/e/a/SeekFeedback219$Move;->side:I

    iget v11, v1, Le/e/a/SeekFeedback219$Move;->step:I

    invoke-virtual/range {v2 .. v11}, Le/e/a/GestureRules219$Burst;->add(Ljava/lang/Object;JJJII)J

    move-result-wide v0

    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_76

    const-string v2, "\u2212"

    goto :goto_78

    :cond_76
    const-string v2, "+"

    :goto_78
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Ljava/math/BigDecimal;->valueOf(JI)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SeekFeedback219$$ExternalSyntheticBackportWithForwarding1;->m(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " s"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 16
    :cond_98
    sget-object v0, Le/e/a/SeekFeedback219;->shown:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Toast;

    if-eqz v0, :cond_a5

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    :cond_a5
    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Le/e/a/SeekFeedback219;->shown:Ljava/lang/ref/WeakReference;

    return-object p0
.end method
