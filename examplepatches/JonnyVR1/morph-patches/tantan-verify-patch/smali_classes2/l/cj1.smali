.class public final Ll/cj1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bj1;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/cj1;",
        "Ll/bj1;",
        "<init>",
        "()V",
        "Ll/n7h0;",
        "db",
        "",
        "a",
        "(Ll/n7h0;)V",
        "work-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/n7h0;)V
    .locals 6
    .param p1    # Ll/n7h0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p0, "UPDATE workspec SET period_count = 1 WHERE last_enqueue_time <> 0 AND interval_duration <> 0"

    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/n7h0;->execSQL(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v3, Landroid/content/ContentValues;

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-direct {v3, p0}, Landroid/content/ContentValues;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "last_enqueue_time"

    .line 24
    .line 25
    invoke-virtual {v3, v0, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    new-array v5, p0, [Ljava/lang/Object;

    .line 30
    .line 31
    const-string v1, "WorkSpec"

    .line 32
    .line 33
    const/4 v2, 0x3

    .line 34
    const-string v4, "last_enqueue_time = 0 AND interval_duration <> 0 "

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    invoke-interface/range {v0 .. v5}, Ll/n7h0;->W(Ljava/lang/String;ILandroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method
