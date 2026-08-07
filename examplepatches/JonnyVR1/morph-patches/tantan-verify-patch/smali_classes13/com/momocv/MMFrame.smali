.class public Lcom/momocv/MMFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/MMFrame$MMFormat;
    }
.end annotation


# instance fields
.field public data_len_:I

.field public data_ptr_:[B

.field public format_:I

.field public height_:I

.field public step_:I

.field public width_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/MMFrame;->width_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/MMFrame;->height_:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momocv/MMFrame;->step_:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momocv/MMFrame;->format_:I

    .line 12
    .line 13
    iput v0, p0, Lcom/momocv/MMFrame;->data_len_:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 17
    .line 18
    return-void
.end method
