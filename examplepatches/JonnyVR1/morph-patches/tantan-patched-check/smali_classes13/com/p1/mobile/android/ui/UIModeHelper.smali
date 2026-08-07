.class public Lcom/p1/mobile/android/ui/UIModeHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;
    }
.end annotation


# static fields
.field public static final a:Landroid/graphics/PorterDuff$Mode;

.field public static final b:Landroid/graphics/ColorFilter;

.field public static c:Ll/vxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lcom/p1/mobile/android/ui/UIModeHelper;->a:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    .line 6
    .line 7
    const/high16 v2, 0x32000000

    .line 8
    .line 9
    invoke-direct {v1, v2, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 10
    .line 11
    .line 12
    sput-object v1, Lcom/p1/mobile/android/ui/UIModeHelper;->b:Landroid/graphics/ColorFilter;

    .line 13
    .line 14
    new-instance v0, Ll/vxd0;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const-string v2, "ui_mode_setting"

    .line 23
    .line 24
    invoke-direct {v0, v2, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/android/ui/UIModeHelper;->c:Ll/vxd0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->values()[Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/ui/UIModeHelper;->c:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    aget-object v0, v0, v1

    .line 18
    .line 19
    return-object v0
.end method

.method public static b()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->a()Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->NIGHT:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method public static c(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static d(Landroid/app/Dialog;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/UIModeHelper;->f(Landroid/view/Window;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static e(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p0, p1}, Ll/xo2;->a(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static f(Landroid/view/Window;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/UIModeHelper;->e(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/UIModeHelper;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    const-class v1, Landroid/app/UiModeManager;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/app/UiModeManager;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->NIGHT:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    const/4 v3, 0x2

    .line 22
    if-ne p0, v1, :cond_1

    .line 23
    .line 24
    move v4, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-object v4, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 27
    .line 28
    if-ne p0, v4, :cond_2

    .line 29
    .line 30
    move v4, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 v4, 0x0

    .line 33
    :goto_0
    invoke-static {v0, v4}, Ll/hpj0;->a(Landroid/app/UiModeManager;I)V

    .line 34
    .line 35
    .line 36
    if-ne p0, v1, :cond_3

    .line 37
    .line 38
    move v2, v3

    .line 39
    goto :goto_1

    .line 40
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 41
    .line 42
    if-ne p0, v0, :cond_4

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_4
    const/4 v2, -0x1

    .line 46
    :goto_1
    invoke-static {v2}, Landroidx/appcompat/app/b;->D(I)V

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/android/ui/UIModeHelper;->c:Ll/vxd0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static h()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method
