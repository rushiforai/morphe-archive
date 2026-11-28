.class final Le/e/a/BulkVideoActions215$Video;
.super Ljava/lang/Object;
.source "BulkVideoActions215.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BulkVideoActions215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Video"
.end annotation


# instance fields
.field final id:Ljava/lang/String;

.field final owner:Ljava/lang/String;

.field final thumbnail:Ljava/lang/String;

.field final title:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 471
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 472
    iput-object p1, p0, Le/e/a/BulkVideoActions215$Video;->id:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/BulkVideoActions215$Video;->url:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/BulkVideoActions215$Video;->title:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/BulkVideoActions215$Video;->owner:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/BulkVideoActions215$Video;->thumbnail:Ljava/lang/String;

    .line 473
    return-void
.end method
