.class public abstract Lmpo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lurj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lurj;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lurj;-><init>(B)V

    sput-object v0, Lmpo;->a:Lurj;

    return-void
.end method
