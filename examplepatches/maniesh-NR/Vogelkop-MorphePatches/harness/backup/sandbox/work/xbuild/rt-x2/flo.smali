.class public abstract Lflo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lavj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lavj;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lavj;-><init>(B)V

    sput-object v0, Lflo;->a:Lavj;

    return-void
.end method
