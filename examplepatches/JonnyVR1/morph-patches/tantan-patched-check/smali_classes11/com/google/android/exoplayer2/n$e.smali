.class public final Lcom/google/android/exoplayer2/n$e;
.super Lcom/google/android/exoplayer2/n$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final m:Lcom/google/android/exoplayer2/n$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$d$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$d$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$d$a;->g()Lcom/google/android/exoplayer2/n$e;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/android/exoplayer2/n$e;->m:Lcom/google/android/exoplayer2/n$e;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n$d$a;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/n$d;-><init>(Lcom/google/android/exoplayer2/n$d$a;Lcom/google/android/exoplayer2/n$a;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$d$a;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$e;-><init>(Lcom/google/android/exoplayer2/n$d$a;)V

    return-void
.end method
