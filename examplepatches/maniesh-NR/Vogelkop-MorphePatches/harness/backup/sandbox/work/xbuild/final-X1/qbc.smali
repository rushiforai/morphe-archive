.class public final Lqbc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lrn2;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lrn2;

    invoke-direct {v1, v0}, Lrn2;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lqbc;->b:Lrn2;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lqbc;->a:Z

    return-void
.end method
