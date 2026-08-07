.class public Ll/cc$b;
.super Ll/cc$a;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>(Ll/cc;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cc$a;-><init>(Ll/cc;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addExtraDataToAccessibilityNodeInfo(ILandroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cc$a;->a:Ll/cc;

    .line 2
    .line 3
    invoke-static {p2}, Ll/bc;->T0(Landroid/view/accessibility/AccessibilityNodeInfo;)Ll/bc;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cc;->a(ILl/bc;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
