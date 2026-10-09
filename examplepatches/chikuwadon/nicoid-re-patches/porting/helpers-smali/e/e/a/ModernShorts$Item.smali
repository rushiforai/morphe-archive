.class final Le/e/a/ModernShorts$Item;
.super Ljava/lang/Object;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ModernShorts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Item"
.end annotation


# instance fields
.field final channel:Ljava/lang/String;

.field final id:Ljava/lang/String;

.field final paid:Z

.field final thumbnail:Ljava/lang/String;

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .line 80
    const-string v0, ""

    invoke-direct {p0, p1, p2, v0}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "thumbnail"    # Ljava/lang/String;

    .line 82
    const-string v0, ""

    invoke-direct {p0, p1, p2, p3, v0}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "thumbnail"    # Ljava/lang/String;
    .param p4, "channel"    # Ljava/lang/String;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    if-nez p3, :cond_c

    const-string v0, ""

    goto :goto_d

    :cond_c
    move-object v0, p3

    :goto_d
    iput-object v0, p0, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    .line 86
    iput-object p4, p0, Le/e/a/ModernShorts$Item;->channel:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/PaidVideos;->required(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/ModernShorts$Item;->paid:Z

    .line 87
    return-void
.end method
