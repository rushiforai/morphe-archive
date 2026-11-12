.class public abstract Lba3;
.super Lfya;
.source "SourceFile"


# static fields
.field public static final i:Ly55;

.field public static final synthetic j:[Lxtb;


# instance fields
.field public final e:Laa3;

.field public final f:Laa3;

.field public final g:Laa3;

.field public final h:Laa3;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lpee;

    const-class v1, Lba3;

    const-string v2, "value"

    const-string v3, "getValue()Ljava/lang/String;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Lpee;

    const-string v3, "location"

    const-string v5, "getLocation()Landroid/graphics/PointF;"

    invoke-direct {v2, v1, v3, v5, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v3, Lpee;

    const-string v5, "scale"

    const-string v6, "getScale()F"

    invoke-direct {v3, v1, v5, v6, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v5, Lpee;

    const-string v6, "rotation"

    const-string v7, "getRotation()F"

    invoke-direct {v5, v1, v6, v7, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x4

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v5, v1, v0

    sput-object v1, Lba3;->j:[Lxtb;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lba3;->i:Ly55;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/PointF;FFLeya;)V
    .registers 7

    invoke-direct {p0, p5}, Lfya;-><init>(Leya;)V

    new-instance p5, Laa3;

    const/4 v0, 0x0

    invoke-direct {p5, p1, p0, v0}, Laa3;-><init>(Ljava/lang/Object;Lba3;B)V

    iput-object p5, p0, Lba3;->e:Laa3;

    new-instance p1, Laa3;

    const/4 p5, 0x1

    invoke-direct {p1, p2, p0, p5}, Laa3;-><init>(Ljava/lang/Object;Lba3;B)V

    iput-object p1, p0, Lba3;->f:Laa3;

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    new-instance p2, Laa3;

    const/4 p3, 0x2

    invoke-direct {p2, p1, p0, p3}, Laa3;-><init>(Ljava/lang/Object;Lba3;B)V

    iput-object p2, p0, Lba3;->g:Laa3;

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    new-instance p2, Laa3;

    const/4 p3, 0x3

    invoke-direct {p2, p1, p0, p3}, Laa3;-><init>(Ljava/lang/Object;Lba3;B)V

    iput-object p2, p0, Lba3;->h:Laa3;

    return-void
.end method


# virtual methods
.method public a(Lcya;)V
    .registers 5

    iget v0, p1, Lcya;->b:I

    iget-object p1, p1, Lcya;->d:Ljava/lang/Object;

    const v1, 0x7f0a055e

    sget-object v2, Lba3;->j:[Lxtb;

    if-ne v0, v1, :cond_16

    check-cast p1, Ljava/lang/String;

    const/4 v0, 0x0

    aget-object v0, v2, v0

    iget-object p0, p0, Lba3;->e:Laa3;

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_16
    const v1, 0x7f0a0559

    if-ne v0, v1, :cond_26

    check-cast p1, Landroid/graphics/PointF;

    const/4 v0, 0x1

    aget-object v0, v2, v0

    iget-object p0, p0, Lba3;->f:Laa3;

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_26
    const v1, 0x7f0a055b

    if-ne v0, v1, :cond_39

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    const/4 v0, 0x2

    aget-object v0, v2, v0

    iget-object p0, p0, Lba3;->g:Laa3;

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_39
    const v1, 0x7f0a055a

    if-ne v0, v1, :cond_4b

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    const/4 v0, 0x3

    aget-object v0, v2, v0

    iget-object p0, p0, Lba3;->h:Laa3;

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    :cond_4b
    return-void
.end method

.method public final e()F
    .registers 3

    sget-object v0, Lba3;->j:[Lxtb;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget-object p0, p0, Lba3;->g:Laa3;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    return p0
.end method

.method public final f()Ljava/lang/String;
    .registers 3

    sget-object v0, Lba3;->j:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Lba3;->e:Laa3;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public g()F
    .registers 1

    const/high16 p0, 0x40800000    # 4.0f

    return p0
.end method

.method public h(Lcom/opera/hype/image/editor/TextBoxEditText;)V
    .registers 4

    invoke-virtual {p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_15
    const/high16 p0, -0x1000000

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    invoke-super {p0, p1, p2}, Lfya;->writeToParcel(Landroid/os/Parcel;I)V

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 v0, 0x1

    sget-object v1, Lba3;->j:[Lxtb;

    aget-object v0, v1, v0

    iget-object v0, p0, Lba3;->f:Laa3;

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    invoke-virtual {p0}, Lba3;->e()F

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    const/4 p2, 0x3

    aget-object p2, v1, p2

    iget-object p0, p0, Lba3;->h:Laa3;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
