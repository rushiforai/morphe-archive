.class public final Lcom/opera/android/utilities/CryptoBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lt1;


# direct methods
.method public static a(Z)V
    .registers 1
    .annotation build Lcom/opera/android/annotations/RequiredForTest;
    .end annotation

    xor-int/lit8 p0, p0, 0x1

    sput-boolean p0, Lc36;->d:Z

    return-void
.end method

.method public static decrypt([B)[B
    .registers 2
    .param p0    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/utilities/CryptoBridge;->a:Lt1;

    invoke-virtual {v0}, Lt1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    invoke-virtual {v0, p0}, Lc36;->b([B)[B

    move-result-object p0

    return-object p0
.end method

.method public static encrypt([B)[B
    .registers 2
    .param p0    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/utilities/CryptoBridge;->a:Lt1;

    invoke-virtual {v0}, Lt1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc36;

    invoke-virtual {v0, p0}, Lc36;->d([B)[B

    move-result-object p0

    return-object p0
.end method
