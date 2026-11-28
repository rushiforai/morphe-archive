.class final Le/e/a/CatalogReorder98$Item;
.super Ljava/lang/Object;
.source "CatalogReorder98.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CatalogReorder98;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Item"
.end annotation


# instance fields
.field final id:Ljava/lang/String;

.field final kind:I

.field final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 4

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/CatalogReorder98$Item;->name:Ljava/lang/String;

    iput p3, p0, Le/e/a/CatalogReorder98$Item;->kind:I

    return-void
.end method
