.class public interface abstract Leha;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic a(Lgha;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    const/4 v0, 0x0

    if-eqz p3, :cond_6

    move-object p2, v0

    :cond_6
    invoke-virtual {p0, p1, p2, v0, v0}, Lgha;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    return-void
.end method
