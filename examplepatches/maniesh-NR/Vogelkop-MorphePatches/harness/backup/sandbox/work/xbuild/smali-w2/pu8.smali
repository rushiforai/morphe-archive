.class public final Lpu8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Integer;

.field public final b:Ljava/lang/Integer;

.field public final c:Ljava/util/Map;

.field public final d:Ljava/util/Map;

.field public final e:Z

.field public final f:Z

.field public final g:Z


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;ZZZ)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpu8;->a:Ljava/lang/Integer;

    iput-object p2, p0, Lpu8;->b:Ljava/lang/Integer;

    iput-object p3, p0, Lpu8;->c:Ljava/util/Map;

    iput-object p4, p0, Lpu8;->d:Ljava/util/Map;

    iput-boolean p5, p0, Lpu8;->e:Z

    iput-boolean p6, p0, Lpu8;->f:Z

    iput-boolean p7, p0, Lpu8;->g:Z

    return-void
.end method
