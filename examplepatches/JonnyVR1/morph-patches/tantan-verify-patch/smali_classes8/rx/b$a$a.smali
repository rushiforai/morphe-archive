.class public Lrx/b$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/b$a;->a(Lrx/b$j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Lrx/b$j;

.field public final synthetic f:Lrx/b$a;


# direct methods
.method public constructor <init>(Lrx/b$a;Lrx/b$j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/b$a$a;->f:Lrx/b$a;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/b$a$a;->e:Lrx/b$j;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$a$a;->e:Lrx/b$j;

    .line 2
    .line 3
    invoke-interface {p0}, Lrx/b$j;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/b$a$a;->e:Lrx/b$j;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lrx/b$j;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method
