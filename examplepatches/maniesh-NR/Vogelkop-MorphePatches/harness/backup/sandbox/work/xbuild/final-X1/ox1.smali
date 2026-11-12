.class public abstract Lox1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/ArrayList;

.field public static final b:Lnx1;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lox1;->a:Ljava/util/ArrayList;

    new-instance v0, Lnx1;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Lox1;->b:Lnx1;

    return-void
.end method
