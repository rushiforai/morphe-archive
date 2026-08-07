.class public final synthetic Ll/b9f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/google/android/exoplayer2/t$e;

.field public final synthetic c:Lcom/google/android/exoplayer2/t$e;


# direct methods
.method public synthetic constructor <init>(ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/b9f;->a:I

    iput-object p2, p0, Ll/b9f;->b:Lcom/google/android/exoplayer2/t$e;

    iput-object p3, p0, Ll/b9f;->c:Lcom/google/android/exoplayer2/t$e;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/b9f;->a:I

    iget-object v1, p0, Ll/b9f;->b:Lcom/google/android/exoplayer2/t$e;

    iget-object p0, p0, Ll/b9f;->c:Lcom/google/android/exoplayer2/t$e;

    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    invoke-static {v0, v1, p0, p1}, Lcom/google/android/exoplayer2/i;->w(ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$d;)V

    return-void
.end method
