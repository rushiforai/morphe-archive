.class public final Ll/l560$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/l560;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Ll/l560$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l560$a<",
            "**>;"
        }
    .end annotation
.end field

.field public final f:I


# direct methods
.method public constructor <init>(Ll/l560$a;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l560$a<",
            "**>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l560$b;->e:Ll/l560$a;

    .line 5
    .line 6
    iput p2, p0, Ll/l560$b;->f:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l560$b;->e:Ll/l560$a;

    .line 2
    .line 3
    iget p0, p0, Ll/l560$b;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/l560$a;->g(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l560$b;->e:Ll/l560$a;

    .line 2
    .line 3
    iget p0, p0, Ll/l560$b;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/l560$a;->h(ILjava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l560$b;->e:Ll/l560$a;

    .line 2
    .line 3
    iget p0, p0, Ll/l560$b;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/l560$a;->i(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
