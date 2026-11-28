.class public Landroidx/appcompat/app/AppCompatDelegateImpl$j;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/AppCompatDelegateImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# static fields
.field public static a:Ljava/lang/reflect/Field;

.field public static b:Z

.field public static c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static d:Z

.field public static e:Ljava/lang/reflect/Field;

.field public static f:Z

.field public static g:Ljava/lang/reflect/Field;

.field public static h:Z

.field public static i:Ljava/lang/reflect/Method;

.field public static j:Z

.field public static k:Ljava/lang/reflect/Method;

.field public static l:Z

.field public static m:Ljava/lang/reflect/Method;

.field public static n:Z

.field public static o:Ljava/lang/reflect/Method;

.field public static p:Z

.field public static q:Ljava/lang/reflect/Field;

.field public static r:Z

.field public static s:Ljava/lang/reflect/Field;

.field public static t:Z

.field public static u:Ljava/lang/reflect/Method;

.field public static v:Z

.field public static w:Ljava/lang/reflect/Field;

.field public static x:Z

.field public static y:Ljava/lang/String;

.field public static z:Le/d/b/a/p0/e;


# direct methods
.method public static a(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 2

    invoke-static {p0, p1}, Landroidx/appcompat/widget/TooltipCompat;->setTooltipText(Landroid/view/View;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static a(Landroid/widget/PopupWindow;I)V
    .registers 7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1}, Landroidx/core/widget/PopupWindowCompat;->setWindowLayoutType(Landroid/widget/PopupWindow;I)V

    return-void

    :cond_0
    sget-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->v:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    :try_start_0
    const-class v0, Landroid/widget/PopupWindow;

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "setWindowLayoutType"

    :try_start_1
    invoke-virtual {v0, v4, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->u:Ljava/lang/reflect/Method;

    sget-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->u:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    sput-boolean v2, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->v:Z

    :cond_1
    sget-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->u:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2

    :try_start_2
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_2
    return-void
.end method

.method public static a(Landroid/widget/PopupWindow;Z)V
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1}, Landroidx/core/widget/PopupWindowCompat;->setOverlapAnchor(Landroid/widget/PopupWindow;Z)V

    goto :goto_1

    :cond_0
    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    sget-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->x:Z

    const-string v1, "PopupWindowCompatApi21"

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :try_start_0
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "mOverlapAnchor"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->w:Ljava/lang/reflect/Field;

    sget-object v2, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->w:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "Could not fetch mOverlapAnchor field from PopupWindow"

    invoke-static {v1, v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    sput-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->x:Z

    :cond_1
    sget-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->w:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2

    :try_start_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    const-string p1, "Could not set overlap anchor field in PopupWindow"

    invoke-static {v1, p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_1
    return-void
.end method
