.class public Lcom/momocv/BaseParams;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/BaseParams$MMBusinessType;
    }
.end annotation


# instance fields
.field public business_type_:I

.field public crop_rect:[I

.field public fliped_show_:Z

.field public restore_degree_:I

.field public rotate_degree_:I

.field public scale_factor_:F


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
    iput v0, p0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/momocv/BaseParams;->business_type_:I

    .line 12
    .line 13
    const/high16 v0, -0x40800000    # -1.0f

    .line 14
    .line 15
    iput v0, p0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 16
    .line 17
    return-void
.end method
