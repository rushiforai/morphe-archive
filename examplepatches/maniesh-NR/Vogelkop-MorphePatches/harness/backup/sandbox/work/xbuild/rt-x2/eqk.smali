.class public final Leqk;
.super Lgqk;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/suggestion/Suggestion;

.field public final d:Lrxh;

.field public final e:Lz4k;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/Suggestion;Lrxh;Lz4k;Lxpk;)V
    .registers 6

    const/16 v0, 0x13

    invoke-direct {p0, v0, p4}, Lgqk;-><init>(ILxpk;)V

    iput-object p1, p0, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iput-object p2, p0, Leqk;->d:Lrxh;

    iput-object p3, p0, Leqk;->e:Lz4k;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_1d

    const-class v0, Leqk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    check-cast p1, Leqk;

    iget-object p0, p0, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p1, p1, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0, p1}, Lcom/opera/android/suggestion/Suggestion;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Leqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->hashCode()I

    move-result p0

    return p0
.end method
