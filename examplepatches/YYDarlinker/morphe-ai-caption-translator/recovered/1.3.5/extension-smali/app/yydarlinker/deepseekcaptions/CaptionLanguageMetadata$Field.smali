.class final Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;
.super Ljava/lang/Object;
.source "CaptionLanguageMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Field"
.end annotation


# instance fields
.field final number:I

.field final raw:[B

.field final value:[B

.field final wire:I


# direct methods
.method constructor <init>(II[B[B)V
    .registers 5

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->raw:[B

    return-void
.end method
