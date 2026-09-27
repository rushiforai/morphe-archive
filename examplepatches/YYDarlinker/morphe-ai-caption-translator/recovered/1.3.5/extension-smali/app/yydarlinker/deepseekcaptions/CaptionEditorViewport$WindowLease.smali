.class final Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;
.super Ljava/lang/Object;
.source "CaptionEditorViewport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WindowLease"
.end annotation


# instance fields
.field changed:Z

.field originalAdjustment:I

.field users:I


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport-IA;)V
    .registers 2

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport$WindowLease;-><init>()V

    return-void
.end method
