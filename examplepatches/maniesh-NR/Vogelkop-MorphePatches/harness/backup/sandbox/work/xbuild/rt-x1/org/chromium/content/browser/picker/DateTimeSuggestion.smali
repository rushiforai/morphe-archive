.class public final Lorg/chromium/content/browser/picker/DateTimeSuggestion;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:D

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;DLjava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->a:D

    iput-object p1, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->b:Ljava/lang/String;

    iput-object p4, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 8

    instance-of v0, p1, Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p1, Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    iget-wide v2, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->a:D

    iget-wide v4, p1, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->a:D

    cmpl-double v0, v2, v4

    if-nez v0, :cond_26

    iget-object v0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->b:Ljava/lang/String;

    iget-object v2, p1, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->b:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->c:Ljava/lang/String;

    iget-object p1, p1, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    return v1
.end method

.method public final hashCode()I
    .registers 4

    iget-wide v0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->a:D

    double-to-int v0, v0

    const/16 v1, 0x47b

    add-int/2addr v1, v0

    const/16 v0, 0x25

    mul-int/2addr v1, v0

    iget-object v2, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->b:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->c:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
