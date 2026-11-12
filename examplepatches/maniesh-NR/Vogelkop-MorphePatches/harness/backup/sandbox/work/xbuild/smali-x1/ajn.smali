.class public final Lajn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/util/Map;

.field public final c:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 125
    iput v0, p0, Lajn;->a:I

    .line 126
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Lajn;->b:Ljava/util/Map;

    .line 127
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 128
    const-string v1, "0x5fda93982ffb2b9035dd65edbcf9c0bcdcd46012"

    sget-object v2, Lb85;->c:Lb85;

    .line 129
    invoke-static {v1, v2}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v1

    const/4 v2, 0x1

    .line 130
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 131
    iput-object v0, p0, Lajn;->c:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Lizd;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lajn;->a:I

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lajn;->b:Ljava/util/Map;

    :goto_14
    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x0

    if-lez v0, :cond_35

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    int-to-long v3, v0

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v2, p0, Lajn;->b:Ljava/util/Map;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    goto :goto_14

    :cond_2f
    const-string p0, "Empty node url"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    throw v2

    :cond_35
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    const-string v1, "0x5fda93982ffb2b9035dd65edbcf9c0bcdcd46012"

    sget-object v3, Lb85;->c:Lb85;

    invoke-static {v1, v3}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    iput-object v0, p0, Lajn;->c:Landroid/util/SparseArray;

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_7b

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    :goto_52
    add-int/lit8 v1, v0, -0x1

    if-lez v0, :cond_7b

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    invoke-virtual {p1}, Lizd;->h()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lb85;->c:Lb85;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6b

    :try_start_66
    invoke-static {v3, v4}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v3
    :try_end_6a
    .catch Ljava/lang/NumberFormatException; {:try_start_66 .. :try_end_6a} :catch_6b

    goto :goto_6c

    :catch_6b
    :cond_6b
    move-object v3, v2

    :goto_6c
    if-eqz v3, :cond_75

    iget-object v4, p0, Lajn;->c:Landroid/util/SparseArray;

    invoke-virtual {v4, v0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v0, v1

    goto :goto_52

    :cond_75
    const-string p0, "Empty or invalid proxy address"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    throw v2

    :cond_7b
    return-void
.end method
