.class public abstract Lct8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lbt8;

.field public static final b:Lbt8;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbt8;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lbt8;-><init>(B)V

    sput-object v0, Lct8;->a:Lbt8;

    new-instance v0, Lbt8;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lbt8;-><init>(B)V

    sput-object v0, Lct8;->b:Lbt8;

    return-void
.end method
