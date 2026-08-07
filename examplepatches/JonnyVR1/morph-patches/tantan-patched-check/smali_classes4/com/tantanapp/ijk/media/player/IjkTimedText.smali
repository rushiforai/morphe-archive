.class public final Lcom/tantanapp/ijk/media/player/IjkTimedText;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mTextBounds:Landroid/graphics/Rect;

.field private mTextChars:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/IjkTimedText;->mTextBounds:Landroid/graphics/Rect;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/ijk/media/player/IjkTimedText;->mTextChars:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkTimedText;->mTextBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkTimedText;->mTextChars:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
