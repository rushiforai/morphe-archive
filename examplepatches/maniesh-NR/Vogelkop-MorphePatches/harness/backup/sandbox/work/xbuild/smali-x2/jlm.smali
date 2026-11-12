.class public abstract Ljlm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lnx1;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Ljlm;->a:Lnx1;

    return-void
.end method
