.class public abstract Lij6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhj6;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhj6;

    const/high16 v1, 0x400000

    invoke-direct {v0, v1}, Ly3d;-><init>(I)V

    sget-object v1, Lzsd;->b:Lzsd;

    iget-object v1, v1, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sput-object v0, Lij6;->a:Lhj6;

    return-void
.end method
