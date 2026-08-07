.class public final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;
.super Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "\u01c3"
.end annotation


# static fields
.field private static ˎ:I = 0x1

.field private static ˏ:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic ˋ(Z)V
    .locals 1

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;->ˏ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4d

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;->ˎ:I

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;->ˋ(Z)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;->ˏ:I

    .line 13
    .line 14
    and-int/lit8 p1, p0, 0x65

    .line 15
    .line 16
    or-int/lit8 p0, p0, 0x65

    .line 17
    .line 18
    add-int/2addr p1, p0

    .line 19
    rem-int/lit16 p1, p1, 0x80

    .line 20
    .line 21
    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;->ˎ:I

    .line 22
    .line 23
    return-void
.end method
