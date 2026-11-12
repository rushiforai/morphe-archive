.class public final Lcom/opera/android/browser/SessionRestore$State;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ln9g;


# direct methods
.method public constructor <init>(Ln9g;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;

    iput-wide p2, p0, Lcom/opera/android/browser/SessionRestore$State;->a:J

    return-void
.end method

.method public static a(Ljava/io/DataInputStream;Ld5o;Lc5o;)Lcom/opera/android/browser/SessionRestore$State;
    .registers 17

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    const/4 v3, 0x0

    const-string v4, "Unhandled version "

    const/4 v5, 0x1

    if-ne v2, v5, :cond_a3

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v6

    const/4 v7, 0x3

    if-gt v6, v7, :cond_99

    const/4 v4, 0x2

    if-le v6, v4, :cond_20

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readLong()J

    :cond_20
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v7

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    if-lez v8, :cond_8f

    const/4 v9, 0x0

    move v11, v7

    move v10, v9

    :goto_2d
    if-ge v10, v8, :cond_70

    if-le v6, v5, :cond_3c

    invoke-static {v4}, Lvep;->B(I)[I

    move-result-object v12

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v13

    aget v12, v12, v13

    goto :goto_3d

    :cond_3c
    move v12, v5

    :goto_3d
    invoke-static {v12}, Lvep;->A(I)I

    move-result v12

    if-eqz v12, :cond_5d

    if-ne v12, v5, :cond_5b

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v12

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move v13, v9

    :goto_4d
    if-ge v13, v12, :cond_5b

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    add-int/lit8 v13, v13, 0x1

    goto :goto_4d

    :cond_5b
    move-object v12, v3

    goto :goto_61

    :cond_5d
    invoke-static/range {p0 .. p2}, Lcom/opera/android/browser/BrowserTabState;->b(Ljava/io/DataInputStream;Ld5o;Lc5o;)Lcom/opera/android/browser/BrowserTabState;

    move-result-object v12

    :goto_61
    if-eqz v12, :cond_67

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6d

    :cond_67
    if-gt v10, v7, :cond_6d

    if-lez v11, :cond_6d

    add-int/lit8 v11, v11, -0x1

    :cond_6d
    :goto_6d
    add-int/lit8 v10, v10, 0x1

    goto :goto_2d

    :cond_70
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_7f

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v5

    invoke-static {v11, v9, p0}, Lcs5;->t(III)I

    move-result v11

    :cond_7f
    new-instance p0, Ln9g;

    invoke-direct {p0, v11, v2}, Ln9g;-><init>(ILjava/util/List;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    new-instance p1, Lcom/opera/android/browser/SessionRestore$State;

    invoke-direct {p1, p0, v2, v3}, Lcom/opera/android/browser/SessionRestore$State;-><init>(Ln9g;J)V

    return-object p1

    :cond_8f
    const-string p0, "Invalid tab count: "

    invoke-static {v8, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_99
    const-string p0, ", expected 3"

    invoke-static {v6, v4, p0}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3

    :cond_a3
    const-string p0, ", expected 1"

    invoke-static {v2, v4, p0}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v3
.end method

.method public static b()Lcom/opera/android/browser/SessionRestore$State;
    .registers 4

    new-instance v0, Lcom/opera/android/browser/SessionRestore$State;

    new-instance v1, Ln9g;

    const/4 v2, 0x0

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v1, v2, v3}, Ln9g;-><init>(ILjava/util/List;)V

    const-wide/16 v2, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/opera/android/browser/SessionRestore$State;-><init>(Ln9g;J)V

    return-object v0
.end method
