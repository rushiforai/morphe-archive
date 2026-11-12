.class public final Lgqi;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lpne;

.field public final c:Lsqi;

.field public final d:Lpqi;

.field public final e:Lode;


# direct methods
.method public constructor <init>(Lpne;Lsqi;Lpqi;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lgqi;->b:Lpne;

    iput-object p2, p0, Lgqi;->c:Lsqi;

    iput-object p3, p0, Lgqi;->d:Lpqi;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lgqi;->e:Lode;

    return-void
.end method

.method public static f(Ljava/lang/Object;Ljava/lang/Object;)Leqi;
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    :cond_8
    move-object v1, v0

    :goto_9
    if-eqz p1, :cond_18

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    move-object p1, v0

    :cond_12
    if-eqz p1, :cond_18

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_18
    new-instance p0, Leqi;

    invoke-direct {p0, v1, v0}, Leqi;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method
