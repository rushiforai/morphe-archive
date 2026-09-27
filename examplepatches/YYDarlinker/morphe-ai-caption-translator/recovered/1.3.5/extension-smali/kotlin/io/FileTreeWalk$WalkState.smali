.class abstract Lkotlin/io/FileTreeWalk$WalkState;
.super Ljava/lang/Object;
.source "FileTreeWalk.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/io/FileTreeWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "WalkState"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\"\u0018\u00002\u00020\u0001B\u0011\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000c\u0010\u0008\u001a\u0004\u0018\u00010\u0003H\u00a6\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lkotlin/io/FileTreeWalk$WalkState;",
        "",
        "root",
        "Ljava/io/File;",
        "<init>",
        "(Ljava/io/File;)V",
        "getRoot",
        "()Ljava/io/File;",
        "step",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final root:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3

    const-string v0, "root"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/io/FileTreeWalk$WalkState;->root:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final getRoot()Ljava/io/File;
    .registers 1

    .line 53
    iget-object p0, p0, Lkotlin/io/FileTreeWalk$WalkState;->root:Ljava/io/File;

    return-object p0
.end method

.method public abstract step()Ljava/io/File;
.end method
