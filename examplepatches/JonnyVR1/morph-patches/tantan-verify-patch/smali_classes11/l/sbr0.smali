.class public final Ll/sbr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rbr0;


# instance fields
.field public final a:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/view/WindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sbr0;->a:Landroid/view/WindowManager;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Landroid/content/Context;)Ll/rbr0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "window"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/sbr0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/sbr0;-><init>(Landroid/view/WindowManager;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final a(Ll/obr0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sbr0;->a:Landroid/view/WindowManager;

    .line 2
    .line 3
    iget-object p1, p1, Ll/obr0;->a:Ll/vbr0;

    .line 4
    .line 5
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/vbr0;->b(Ll/vbr0;Landroid/view/Display;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zza()V
    .locals 0

    .line 1
    return-void
.end method
