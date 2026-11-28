.class final Le/e/a/ScrollingTimeline267$Entry;
.super Ljava/lang/Object;
.source "ScrollingTimeline267.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ScrollingTimeline267;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field ascent:F

.field baseline:F

.field final channel:Ljava/lang/Object;

.field final color:I

.field height:F

.field leftAtStart:F

.field final lines:[Ljava/lang/String;

.field final padding:F

.field size:F

.field speed:F

.field start:F

.field top:F

.field final waitOrigin:F

.field width:F


# direct methods
.method constructor <init>(Ljava/lang/Object;[Ljava/lang/String;IFFFFFFFFF)V
    .registers 13

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Le/e/a/ScrollingTimeline267$Entry;->channel:Ljava/lang/Object;

    .line 50
    iput-object p2, p0, Le/e/a/ScrollingTimeline267$Entry;->lines:[Ljava/lang/String;

    .line 51
    iput p3, p0, Le/e/a/ScrollingTimeline267$Entry;->color:I

    .line 52
    iput p7, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    .line 53
    iput p8, p0, Le/e/a/ScrollingTimeline267$Entry;->size:F

    .line 54
    iput p10, p0, Le/e/a/ScrollingTimeline267$Entry;->ascent:F

    .line 55
    iput p11, p0, Le/e/a/ScrollingTimeline267$Entry;->height:F

    .line 56
    iput p12, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    .line 57
    iput p5, p0, Le/e/a/ScrollingTimeline267$Entry;->waitOrigin:F

    .line 58
    invoke-virtual {p0, p4, p5, p6, p9}, Le/e/a/ScrollingTimeline267$Entry;->place(FFFF)V

    .line 59
    return-void
.end method


# virtual methods
.method left(F)F
    .registers 4

    .line 70
    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->leftAtStart:F

    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->start:F

    sub-float/2addr p1, v1

    iget v1, p0, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    mul-float/2addr p1, v1

    sub-float/2addr v0, p1

    return v0
.end method

.method place(FFFF)V
    .registers 5

    .line 63
    iput p1, p0, Le/e/a/ScrollingTimeline267$Entry;->leftAtStart:F

    .line 64
    iput p2, p0, Le/e/a/ScrollingTimeline267$Entry;->start:F

    .line 65
    iput p3, p0, Le/e/a/ScrollingTimeline267$Entry;->speed:F

    .line 66
    iput p4, p0, Le/e/a/ScrollingTimeline267$Entry;->top:F

    .line 67
    iget p1, p0, Le/e/a/ScrollingTimeline267$Entry;->ascent:F

    sub-float/2addr p4, p1

    iput p4, p0, Le/e/a/ScrollingTimeline267$Entry;->baseline:F

    .line 68
    return-void
.end method

.method right(F)F
    .registers 3

    .line 71
    invoke-virtual {p0, p1}, Le/e/a/ScrollingTimeline267$Entry;->left(F)F

    move-result p1

    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->width:F

    add-float/2addr p1, v0

    iget v0, p0, Le/e/a/ScrollingTimeline267$Entry;->padding:F

    add-float/2addr p1, v0

    return p1
.end method
