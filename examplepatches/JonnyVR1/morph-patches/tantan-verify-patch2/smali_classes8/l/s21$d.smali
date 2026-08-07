.class public final Ll/s21$d;
.super Lrx/c;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s21$d$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/c<",
        "TT;>;",
        "Ll/bb50<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/s21$d$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/s21$d$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/s21$d$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/s21$d$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s21$d;->a:Ll/s21$d$a;

    .line 5
    .line 6
    return-void
.end method

.method public static a()Ll/s21$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/s21$d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/s21$d;

    .line 2
    .line 3
    new-instance v1, Ll/s21$d$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/s21$d$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/s21$d;-><init>(Ll/s21$d$a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s21$d;->a:Ll/s21$d$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s21$d$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s21$d;->a:Ll/s21$d$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s21$d$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s21$d;->a:Ll/s21$d$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s21$d$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
