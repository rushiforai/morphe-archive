.class final Le/e/a/CacheFolders$Entry;
.super Ljava/lang/Object;
.source "CacheFolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CacheFolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field mime:Ljava/lang/String;

.field name:Ljava/lang/String;

.field size:J

.field time:J

.field uri:Landroid/net/Uri;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
