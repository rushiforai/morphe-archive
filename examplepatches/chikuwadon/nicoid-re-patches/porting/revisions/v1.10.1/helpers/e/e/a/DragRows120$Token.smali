.class final Le/e/a/DragRows120$Token;
.super Ljava/lang/Object;
.source "DragRows120.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DragRows120;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Token"
.end annotation


# instance fields
.field final index:I

.field final scope:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;I)V
    .registers 3

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DragRows120$Token;->scope:Ljava/lang/Object;

    iput p2, p0, Le/e/a/DragRows120$Token;->index:I

    return-void
.end method
