.class public Landroidx/browser/trusted/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/browser/trusted/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/browser/trusted/a$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Landroidx/browser/trusted/a$b;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/os/Bundle;)Landroidx/browser/trusted/a$b;
    .locals 3

    .line 1
    const-string v0, "android.support.customtabs.trusted.PLATFORM_TAG"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroidx/browser/trusted/a;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.support.customtabs.trusted.PLATFORM_ID"

    .line 7
    .line 8
    invoke-static {p0, v1}, Landroidx/browser/trusted/a;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Landroidx/browser/trusted/a$b;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-direct {v2, v0, p0}, Landroidx/browser/trusted/a$b;-><init>(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    return-object v2
.end method
