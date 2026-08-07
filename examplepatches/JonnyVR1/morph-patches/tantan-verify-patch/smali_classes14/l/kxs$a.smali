.class public Ll/kxs$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kxs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kxs;


# direct methods
.method public constructor <init>(Ll/kxs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kxs$a;->a:Ll/kxs;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxs$a;->a:Ll/kxs;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Ll/kxs;->v(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v1, p0, Ll/kxs$a;->a:Ll/kxs;

    .line 15
    .line 16
    invoke-static {v1}, Ll/kxs;->j(Ll/kxs;)Ll/bws;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1, v2}, Ll/bws;->I3(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/kxs$a;->a:Ll/kxs;

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/kxs;->m(Ll/kxs;Lcom/google/android/material/tabs/TabLayout$Tab;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/kxs$a;->a:Ll/kxs;

    .line 33
    .line 34
    invoke-static {p0}, Ll/kxs;->n(Ll/kxs;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method
