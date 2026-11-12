.class public Lcom/opera/ad/entity/Macros;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public error_code:I

.field public h:I

.field public trigger_type:Ljava/lang/String;

.field public w:I

.field public x:D

.field public y:D


# direct methods
.method public constructor <init>(IIDD)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/opera/ad/entity/Macros;->h:I

    iput p2, p0, Lcom/opera/ad/entity/Macros;->w:I

    iput-wide p3, p0, Lcom/opera/ad/entity/Macros;->x:D

    iput-wide p5, p0, Lcom/opera/ad/entity/Macros;->y:D

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/ad/entity/Macros;->trigger_type:Ljava/lang/String;

    iput p2, p0, Lcom/opera/ad/entity/Macros;->error_code:I

    return-void
.end method
