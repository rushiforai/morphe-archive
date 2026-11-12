.class public final Ltpm;
.super Landroid/text/style/CharacterStyle;
.source "SourceFile"

# interfaces
.implements Landroid/text/style/UpdateAppearance;


# instance fields
.field public a:Landroid/content/res/ColorStateList;

.field public b:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    sget-object v0, Landroid/util/StateSet;->WILD_CARD:[I

    iput-object v0, p0, Ltpm;->b:[I

    return-void
.end method


# virtual methods
.method public final updateDrawState(Landroid/text/TextPaint;)V
    .registers 4

    iget-object v0, p0, Ltpm;->a:Landroid/content/res/ColorStateList;

    iget-object p0, p0, Ltpm;->b:[I

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method
