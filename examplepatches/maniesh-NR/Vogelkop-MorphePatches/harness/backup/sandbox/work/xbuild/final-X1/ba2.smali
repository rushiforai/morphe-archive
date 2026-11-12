.class public abstract Lba2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfa2;
.implements Laa2;
.implements Lea2;


# instance fields
.field public final a:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lba2;->a:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final S()Laa2;
    .registers 1

    return-object p0
.end method

.method public final g()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lba2;->a:Ljava/lang/Class;

    return-object p0
.end method

.method public final j()Lea2;
    .registers 1

    return-object p0
.end method

.method public onDestroy()V
    .registers 1

    return-void
.end method
