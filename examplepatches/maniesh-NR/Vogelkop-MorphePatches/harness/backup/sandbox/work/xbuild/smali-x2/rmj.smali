.class public abstract Lrmj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ln9h;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ln9h;

    invoke-static {}, Lwub;->D()Lwub;

    move-result-object v1

    invoke-direct {v0, v1}, Ln9h;-><init>(Lwub;)V

    sput-object v0, Lrmj;->a:Ln9h;

    return-void
.end method
