.class public final Lmln;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lmln;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lmln;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-direct {v0, v1, v1, v2}, Lmln;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)V

    sput-object v0, Lmln;->d:Lmln;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmln;->a:Ljava/util/List;

    iput-object p2, p0, Lmln;->b:Ljava/util/List;

    iput-object p3, p0, Lmln;->c:Ljava/util/Set;

    return-void
.end method
