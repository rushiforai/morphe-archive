.class public final synthetic Ll/c9f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/n;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9f;->a:Lcom/google/android/exoplayer2/n;

    iput p2, p0, Ll/c9f;->b:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c9f;->a:Lcom/google/android/exoplayer2/n;

    iget p0, p0, Ll/c9f;->b:I

    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    invoke-static {v0, p0, p1}, Lcom/google/android/exoplayer2/i;->B(Lcom/google/android/exoplayer2/n;ILcom/google/android/exoplayer2/t$d;)V

    return-void
.end method
