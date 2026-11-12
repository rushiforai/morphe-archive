.class public final Lfqk;
.super Lgqk;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/suggestion/Suggestion;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/Suggestion;ILxpk;)V
    .registers 4

    invoke-direct {p0, p2, p3}, Lgqk;-><init>(ILxpk;)V

    iput-object p1, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

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

    const-class v0, Lfqk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    check-cast p1, Lfqk;

    iget-object p0, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->hashCode()I

    move-result p0

    return p0
.end method
