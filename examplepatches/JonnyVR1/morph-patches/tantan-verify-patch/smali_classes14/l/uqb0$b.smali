.class public Ll/uqb0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f5e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uqb0;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uqb0;


# direct methods
.method public constructor <init>(Ll/uqb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uqb0$b;->a:Ll/uqb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(JLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->URGENT_ALERT:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 2
    .line 3
    if-ne p3, p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/app/Activity;

    .line 24
    .line 25
    :goto_0
    new-instance p1, Ll/u4e;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/u4e;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ll/u4e;->j(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
