.class public final Ljxb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljxb;


# instance fields
.field public a:I

.field public b:F

.field public final c:Lqc5;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljxb;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljxb;-><init>(Lqc5;)V

    sput-object v0, Ljxb;->d:Ljxb;

    return-void
.end method

.method public constructor <init>(Lqc5;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljxb;->c:Lqc5;

    return-void
.end method
