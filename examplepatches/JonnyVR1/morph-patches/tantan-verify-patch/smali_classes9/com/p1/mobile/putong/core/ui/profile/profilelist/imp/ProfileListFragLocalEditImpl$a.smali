.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->u7()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

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

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->F6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->L6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->I6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->m9(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->G6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)Ll/q7m;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->G6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)Ll/q7m;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Ll/q7m;->s()V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {}, Ll/gra;->w2()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->G6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)Ll/q7m;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->E6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_2

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->Q6()V

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-static {}, Ll/gra;->p2()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_3

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    const/4 v0, 0x1

    .line 108
    if-ne p1, v0, :cond_3

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$a;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 111
    .line 112
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->K6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method
