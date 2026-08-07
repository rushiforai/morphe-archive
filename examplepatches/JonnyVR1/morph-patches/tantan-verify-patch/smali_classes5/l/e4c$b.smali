.class public Ll/e4c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e4c;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e4c;


# direct methods
.method public constructor <init>(Ll/e4c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e4c$b;->a:Ll/e4c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e4c$b;->a:Ll/e4c;

    .line 2
    .line 3
    iget-object p1, p1, Ll/e4c;->b:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 4
    .line 5
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->FOLLOW_SYSTEM:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Ll/e4c$b;->a:Ll/e4c;

    .line 15
    .line 16
    iget-object p1, p1, Ll/e4c;->c:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->NIGHT:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 28
    .line 29
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/android/ui/UIModeHelper;->g(Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/e4c$b;->a:Ll/e4c;

    .line 33
    .line 34
    invoke-static {p0}, Ll/e4c;->i(Ll/e4c;)Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
