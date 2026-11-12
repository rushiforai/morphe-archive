.class public final Lzsk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Ljava/util/Map;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:B

.field public final d:I

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Lzsk;

    const v4, 0x7f140819

    const v5, 0x7f140818

    const-string v2, "premium_6month"

    const/4 v3, 0x6

    const-string v6, "p6m"

    invoke-direct/range {v1 .. v6}, Lzsk;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lzsk;

    const v6, 0x7f140d75

    const v7, 0x7f140d74

    const-string v4, "premium_3month"

    const/4 v5, 0x3

    const-string v8, "p3m"

    invoke-direct/range {v3 .. v8}, Lzsk;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lzsk;

    const v8, 0x7f140a5d

    const v9, 0x7f140a5b

    const-string v6, "premium_monthly"

    const/4 v7, 0x1

    const-string v10, "p1m"

    invoke-direct/range {v5 .. v10}, Lzsk;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lzsk;->f:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzsk;->a:Ljava/lang/String;

    iput-object p5, p0, Lzsk;->b:Ljava/lang/String;

    iput-byte p2, p0, Lzsk;->c:B

    iput p3, p0, Lzsk;->d:I

    iput p4, p0, Lzsk;->e:I

    return-void
.end method
