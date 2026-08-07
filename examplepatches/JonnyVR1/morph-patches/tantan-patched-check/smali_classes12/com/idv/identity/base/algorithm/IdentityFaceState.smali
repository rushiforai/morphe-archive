.class public Lcom/idv/identity/base/algorithm/IdentityFaceState;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DISTANCE_HOLD_STILL:I = 0x6e

.field public static final END_MOVING_FAR:I = 0x6

.field public static final END_MOVING_NEAR:I = 0x3

.field public static final FACE_BLINK_END:I = 0xca

.field public static final FACE_COMPLETED:I = 0x190

.field public static final FACE_COVERED:I = 0x65

.field public static final FACE_DISTANCE_TOO_CLOSE:I = 0x6a

.field public static final FACE_DISTANCE_TOO_FAR:I = 0x6b

.field public static final FACE_FOUND_FACE:I = 0x64

.field public static final FACE_HOLD_STILL:I = 0x6d

.field public static final FACE_IS_NOT_CENTERED:I = 0x6c

.field public static final FACE_LEFT_YAW_GUIDE:I = 0x1f4

.field public static final FACE_NOT_CORRECT:I = 0x6f

.field public static final FACE_NOT_COVERED:I = 0x66

.field public static final FACE_NOT_FOUND:I = 0x67

.field public static final FACE_OPEN_MOUTH:I = 0x258

.field public static final FACE_OPEN_MOUTH_DONE:I = 0x259

.field public static final FACE_PHOTINUS_DONE:I = 0x12e

.field public static final FACE_PHOTINUS_RUNNING:I = 0x12d

.field public static final FACE_PHOTINUS_STARTING:I = 0x12c

.field public static final FACE_RIGHT_YAW_GUIDE:I = 0x1f5

.field public static final FACE_START_BLINK:I = 0xc9

.field public static final FACE_TOO_LESS:I = 0x69

.field public static final FACE_TOO_MANY:I = 0x68

.field public static final MOVING_FAR:I = 0x5

.field public static final MOVING_FAR_A_BIT:I = 0x9

.field public static final MOVING_NEAR:I = 0x2

.field public static final MOVING_NEAR_A_BIT:I = 0x8

.field public static final NEAR_FAR_ACTION_DONE:I = 0x7

.field public static final START_FAR_NEAR:I = 0x0

.field public static final START_MOVING_FAR:I = 0x4

.field public static final START_MOVING_NEAR:I = 0x1


# instance fields
.field public actionState:I

.field public messageCode:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/idv/identity/base/algorithm/IdentityFaceState;->actionState:I

    .line 6
    .line 7
    return-void
.end method
