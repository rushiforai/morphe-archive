.class public final Le/e/a/GestureRules110;
.super Ljava/lang/Object;
.source "GestureRules110.java"


# instance fields
.field public distance:F

.field public invalid:Z

.field public pattern:Ljava/lang/String;

.field public startX:F

.field public startY:F

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string v0, ""

    iput-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    const/high16 v0, 0x41e00000    # 28.0f

    iput v0, p0, Le/e/a/GestureRules110;->distance:F

    .line 3
    return-void
.end method

.method public static arrows(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 10
    const-string v0, "U"

    const-string v1, "\u2191 "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "D"

    const-string v1, "\u2193 "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "L"

    const-string v1, "\u2190 "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "R"

    const-string v1, "\u2192 "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static threshold(I)F
    .registers 2

    .line 5
    const/16 v0, 0x64

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-float p0, p0

    const v0, 0x3f0f5c29    # 0.56f

    mul-float/2addr p0, v0

    const/high16 v0, 0x42600000    # 56.0f

    sub-float/2addr v0, p0

    const/high16 p0, 0x41400000    # 12.0f

    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method


# virtual methods
.method public cancelled(FF)Z
    .registers 5

    .line 9
    iget-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_22

    iget v0, p0, Le/e/a/GestureRules110;->startX:F

    sub-float/2addr p1, v0

    float-to-double v0, p1

    iget p1, p0, Le/e/a/GestureRules110;->startY:F

    sub-float/2addr p2, p1

    float-to-double p1, p2

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    iget v0, p0, Le/e/a/GestureRules110;->distance:F

    const v1, 0x3f36db6e

    mul-float/2addr v0, v1

    float-to-double v0, v0

    cmpg-double p1, p1, v0

    if-gez p1, :cond_22

    const/4 p1, 0x1

    return p1

    :cond_22
    const/4 p1, 0x0

    return p1
.end method

.method public down(FF)V
    .registers 3

    .line 6
    iput p1, p0, Le/e/a/GestureRules110;->startX:F

    iput p1, p0, Le/e/a/GestureRules110;->x:F

    iput p2, p0, Le/e/a/GestureRules110;->startY:F

    iput p2, p0, Le/e/a/GestureRules110;->y:F

    const-string p1, ""

    iput-object p1, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/GestureRules110;->invalid:Z

    return-void
.end method

.method public move(FF)V
    .registers 11

    .line 7
    iget v0, p0, Le/e/a/GestureRules110;->x:F

    sub-float v0, p1, v0

    iget v1, p0, Le/e/a/GestureRules110;->y:F

    sub-float v1, p2, v1

    float-to-double v2, v0

    float-to-double v4, v1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    iget v4, p0, Le/e/a/GestureRules110;->distance:F

    float-to-double v4, v4

    cmpg-double v2, v2, v4

    if-gez v2, :cond_16

    return-void

    :cond_16
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    float-to-double v4, v4

    const-wide v6, 0x3ff4cccccccccccdL    # 1.3

    mul-double/2addr v4, v6

    cmpg-double v2, v2, v4

    if-gez v2, :cond_3b

    return-void

    :cond_3b
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v2, v2, v3

    const/4 v3, 0x0

    if-lez v2, :cond_52

    cmpl-float v0, v0, v3

    if-lez v0, :cond_4f

    const/16 v0, 0x52

    goto :goto_5b

    :cond_4f
    const/16 v0, 0x4c

    goto :goto_5b

    :cond_52
    cmpl-float v0, v1, v3

    if-lez v0, :cond_59

    const/16 v0, 0x44

    goto :goto_5b

    :cond_59
    const/16 v0, 0x55

    :goto_5b
    iget-object v1, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_73

    iget-object v1, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-eq v1, v0, :cond_93

    :cond_73
    iget-object v1, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_93

    iput-boolean v2, p0, Le/e/a/GestureRules110;->invalid:Z

    :cond_93
    iput p1, p0, Le/e/a/GestureRules110;->x:F

    iput p2, p0, Le/e/a/GestureRules110;->y:F

    return-void
.end method

.method public valid()Z
    .registers 3

    .line 8
    iget-boolean v0, p0, Le/e/a/GestureRules110;->invalid:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_18

    iget-object v0, p0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-gt v0, v1, :cond_18

    const/4 v0, 0x1

    return v0

    :cond_18
    const/4 v0, 0x0

    return v0
.end method
