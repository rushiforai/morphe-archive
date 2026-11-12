.class public abstract Lpdn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lx1b;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Lu1b;->c:I

    new-instance v0, Lx1b;

    const-string v1, "hk"

    invoke-direct {v0, v1}, Lx1b;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lpdn;->a:Lx1b;

    return-void
.end method
