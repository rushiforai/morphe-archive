.class public final Ll7f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnjb;

.field public final b:[I

.field public final c:[Ljava/lang/String;

.field public final d:Ljava/util/Set;


# direct methods
.method public constructor <init>(Lnjb;[I[Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll7f;->a:Lnjb;

    iput-object p2, p0, Ll7f;->b:[I

    iput-object p3, p0, Ll7f;->c:[Ljava/lang/String;

    array-length p1, p2

    array-length p2, p3

    if-ne p1, p2, :cond_22

    array-length p1, p3

    const/4 p2, 0x0

    if-nez p1, :cond_13

    const/4 p1, 0x1

    goto :goto_14

    :cond_13
    move p1, p2

    :goto_14
    if-nez p1, :cond_1d

    aget-object p1, p3, p2

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    goto :goto_1f

    :cond_1d
    sget-object p1, Lv08;->a:Lv08;

    :goto_1f
    iput-object p1, p0, Ll7f;->d:Ljava/util/Set;

    return-void

    :cond_22
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method
