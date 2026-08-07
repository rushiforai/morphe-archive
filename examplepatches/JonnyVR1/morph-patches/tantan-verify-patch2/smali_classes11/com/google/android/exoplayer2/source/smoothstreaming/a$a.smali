.class public final Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/smoothstreaming/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/g6c$a;


# direct methods
.method public constructor <init>(Ll/g6c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;->a:Ll/g6c$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/vtv;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;ILl/u9f;Ll/pgj0;Ll/zb5;)Lcom/google/android/exoplayer2/source/smoothstreaming/b;
    .locals 7
    .param p5    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;->a:Ll/g6c$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c$a;->a()Ll/g6c;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    if-eqz p5, :cond_0

    .line 8
    .line 9
    invoke-interface {v5, p5}, Ll/g6c;->e(Ll/pgj0;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;

    .line 13
    .line 14
    move-object v1, p1

    .line 15
    move-object v2, p2

    .line 16
    move v3, p3

    .line 17
    move-object v4, p4

    .line 18
    move-object v6, p6

    .line 19
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/smoothstreaming/a;-><init>(Ll/vtv;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;ILl/u9f;Ll/g6c;Ll/zb5;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method
