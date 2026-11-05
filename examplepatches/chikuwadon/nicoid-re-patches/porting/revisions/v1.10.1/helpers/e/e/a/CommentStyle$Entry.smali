.class final Le/e/a/CommentStyle$Entry;
.super Ljava/lang/Object;
.source "CommentStyle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field base:Landroid/graphics/Typeface;

.field original:Landroid/graphics/Typeface;

.field result:Landroid/graphics/Typeface;

.field weight:I


# direct methods
.method constructor <init>(Landroid/graphics/Typeface;)V
    .registers 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentStyle$Entry;->original:Landroid/graphics/Typeface;

    iput-object p1, p0, Le/e/a/CommentStyle$Entry;->base:Landroid/graphics/Typeface;

    return-void
.end method
