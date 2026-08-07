.class public Ll/v4o0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v4o0;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/v4o0;


# direct methods
.method public constructor <init>(Ll/v4o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v4o0$a;->a:Ll/v4o0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v4o0$a;->a:Ll/v4o0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/v4o0;->b(Ll/v4o0;)Ll/t4o0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Ll/t4o0;->M3(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/v4o0$a;->a:Ll/v4o0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/v4o0;->c(Ll/v4o0;)[Landroid/widget/TextView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    aget-object p1, v0, p1

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-static {p0, p1, v0}, Ll/v4o0;->d(Ll/v4o0;Landroid/widget/TextView;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v4o0$a;->a:Ll/v4o0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v4o0;->c(Ll/v4o0;)[Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    aget-object p1, v0, p1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, p1, v0}, Ll/v4o0;->d(Ll/v4o0;Landroid/widget/TextView;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
