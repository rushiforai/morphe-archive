.class public final Lulg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;


# instance fields
.field public final a:Lii;

.field public final b:Lbml;

.field public final c:Lm9c;

.field public final d:Lji;

.field public final e:Lxt3;

.field public f:Lokhttp3/internal/connection/RealCall;


# direct methods
.method public constructor <init>(Lii;Lbml;Lm9c;Lji;Lxt3;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lulg;->a:Lii;

    iput-object p2, p0, Lulg;->b:Lbml;

    iput-object p3, p0, Lulg;->c:Lm9c;

    iput-object p4, p0, Lulg;->d:Lji;

    iput-object p5, p0, Lulg;->e:Lxt3;

    return-void
.end method


# virtual methods
.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 4

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "I/O error: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    iput-object p2, p0, Lulg;->f:Lokhttp3/internal/connection/RealCall;

    new-instance p2, Lq2g;

    const/4 v0, 0x6

    invoke-direct {p2, p0, p1, v0}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 4

    iget p1, p2, Lpzh;->d:I

    invoke-virtual {p2}, Lpzh;->close()V

    div-int/lit8 p2, p1, 0x64

    const/4 v0, 0x2

    if-ne p2, v0, :cond_d

    const-string p1, "Success"

    goto :goto_11

    :cond_d
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    :goto_11
    const/4 p2, 0x0

    iput-object p2, p0, Lulg;->f:Lokhttp3/internal/connection/RealCall;

    new-instance p2, Lq2g;

    const/4 v0, 0x6

    invoke-direct {p2, p0, p1, v0}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
