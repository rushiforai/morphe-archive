.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ozk0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->k0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(F)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    float-to-int p1, p1

    .line 2
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    int-to-float v0, p1

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->m:Lv/VSlider;

    .line 12
    .line 13
    invoke-virtual {v1}, Lv/VSlider;->getValueTo()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr v1, v2

    .line 20
    cmpg-float v0, v0, v1

    .line 21
    .line 22
    if-gez v0, :cond_0

    .line 23
    .line 24
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->f2:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    add-int/lit8 p1, p1, 0x1

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->b2:I

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method
