.class public Landroidx/profileinstaller/ProfileInstallerInitializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LM/b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LM/b;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 1

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method public final b(Landroid/content/Context;)Ljava/lang/Object;
    .locals 2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, LK/h;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, LK/h;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-static {v0}, LK/k;->a(Ljava/lang/Runnable;)V

    new-instance p1, LF/d;

    const/4 v0, 0x6

    invoke-direct {p1, v0}, LF/d;-><init>(I)V

    return-object p1
.end method
