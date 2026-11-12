.class public final Levj;
.super Lou9;
.source "SourceFile"


# static fields
.field public static final d:Ldvj;


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldvj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldvj;-><init>(B)V

    sput-object v0, Levj;->d:Ldvj;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Levj;->b:Ljava/lang/String;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Levj;->c:Ljava/util/List;

    return-void
.end method
