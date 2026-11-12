.class public abstract Lxxk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lomj;

.field public static final b:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lomj;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lomj;-><init>(B)V

    sput-object v0, Lxxk;->a:Lomj;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Lwxk;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    const v3, 0x7f0a0a04

    const v4, 0x7f1410b8

    invoke-direct {v1, v2, v3, v4}, Lwxk;-><init>(III)V

    const-string v2, "sync.passwords"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lwxk;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    const v3, 0x7f0a0a03

    const v4, 0x7f1410b1

    invoke-direct {v1, v2, v3, v4}, Lwxk;-><init>(III)V

    const-string v2, "sync.bookmarks"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lwxk;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    const v3, 0x7f0a0a06

    const v4, 0x7f1410b7

    invoke-direct {v1, v2, v3, v4}, Lwxk;-><init>(III)V

    const-string v2, "sync.typed_urls"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lwxk;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    const v3, 0x7f0a0a05

    const v4, 0x7f1410b9

    invoke-direct {v1, v2, v3, v4}, Lwxk;-><init>(III)V

    const-string v2, "sync.tabs"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sput-object v0, Lxxk;->b:Ljava/util/HashMap;

    return-void
.end method
