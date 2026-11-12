.class public final Lz3b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2e

    const/4 v1, 0x0

    invoke-static {v1, p1, v0}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lz3b;->a:Ljava/util/List;

    iput-object p2, p0, Lz3b;->b:Ljava/lang/String;

    return-void
.end method
