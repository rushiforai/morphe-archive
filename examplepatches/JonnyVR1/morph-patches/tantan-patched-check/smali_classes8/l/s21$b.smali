.class public Ll/s21$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s21;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lrx/c<",
        "TT;>;",
        "Lrx/c<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/s21;


# direct methods
.method public constructor <init>(Ll/s21;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s21$b;->a:Ll/s21;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lrx/c;->onBackpressureBuffer()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s21$b;->a(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
