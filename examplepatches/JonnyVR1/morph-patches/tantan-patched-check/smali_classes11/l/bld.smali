.class public final synthetic Ll/bld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:I

.field public final synthetic c:Lcom/google/android/exoplayer2/t$e;

.field public final synthetic d:Lcom/google/android/exoplayer2/t$e;


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bld;->a:Ll/hk0$a;

    iput p2, p0, Ll/bld;->b:I

    iput-object p3, p0, Ll/bld;->c:Lcom/google/android/exoplayer2/t$e;

    iput-object p4, p0, Ll/bld;->d:Lcom/google/android/exoplayer2/t$e;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bld;->a:Ll/hk0$a;

    iget v1, p0, Ll/bld;->b:I

    iget-object v2, p0, Ll/bld;->c:Lcom/google/android/exoplayer2/t$e;

    iget-object p0, p0, Ll/bld;->d:Lcom/google/android/exoplayer2/t$e;

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/wld;->B1(Ll/hk0$a;ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;Ll/hk0;)V

    return-void
.end method
