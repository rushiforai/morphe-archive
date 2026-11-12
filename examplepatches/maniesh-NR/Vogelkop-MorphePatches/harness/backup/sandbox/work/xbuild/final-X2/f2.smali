.class public final Lf2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lf2;

.field public static final b:Lk2;

.field public static final c:Ltvk;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lf2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lf2;->a:Lf2;

    new-instance v0, Lk2;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lk2;-><init>(Ljava/lang/Integer;)V

    sput-object v0, Lf2;->b:Lk2;

    new-instance v0, Ltvk;

    new-instance v1, Lqs7;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Lqs7;-><init>(B)V

    invoke-direct {v0, v1}, Ltvk;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lf2;->c:Ltvk;

    return-void
.end method
