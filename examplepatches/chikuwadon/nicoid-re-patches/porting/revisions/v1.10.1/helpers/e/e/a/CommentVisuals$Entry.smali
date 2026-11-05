.class Le/e/a/CommentVisuals$Entry;
.super Ljava/lang/Object;
.source "CommentVisuals.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentVisuals;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Entry"
.end annotation


# instance fields
.field color:I

.field comment:Ljava/lang/Object;

.field height:F

.field row:I

.field speed:F

.field start:F

.field text:Ljava/lang/String;

.field width:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/CommentVisuals$1;)V
    .registers 2

    .line 14
    invoke-direct {p0}, Le/e/a/CommentVisuals$Entry;-><init>()V

    return-void
.end method
