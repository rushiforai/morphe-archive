.class public abstract Li0i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lnx1;

.field public static final b:Lnx1;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Li0i;->a:Lnx1;

    new-instance v0, Lnx1;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Li0i;->b:Lnx1;

    return-void
.end method
