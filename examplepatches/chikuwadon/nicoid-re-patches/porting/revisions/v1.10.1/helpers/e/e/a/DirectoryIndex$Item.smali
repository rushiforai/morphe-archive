.class final Le/e/a/DirectoryIndex$Item;
.super Ljava/lang/Object;
.source "DirectoryIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectoryIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Item"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final directory:Z

.field final name:Ljava/lang/String;

.field final ref:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final size:J

.field final time:J


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Object;ZJJ)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;ZJJ)V"
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DirectoryIndex$Item;->name:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/DirectoryIndex$Item;->ref:Ljava/lang/Object;

    iput-boolean p3, p0, Le/e/a/DirectoryIndex$Item;->directory:Z

    iput-wide p4, p0, Le/e/a/DirectoryIndex$Item;->size:J

    iput-wide p6, p0, Le/e/a/DirectoryIndex$Item;->time:J

    return-void
.end method
