.class public Ll/mv80$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mv80;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mv80;


# direct methods
.method public constructor <init>(Ll/mv80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mv80$a;->a:Ll/mv80;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mv80$a;->a:Ll/mv80;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mf40;->m:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 10
    .line 11
    iget-object v1, p0, Ll/mv80$a;->a:Ll/mv80;

    .line 12
    .line 13
    iget-object v1, v1, Ll/mf40;->m:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Ll/mv80$a;->a:Ll/mv80;

    .line 24
    .line 25
    iget-object v2, v2, Ll/mf40;->m:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object p0, p0, Ll/mv80$a;->a:Ll/mv80;

    .line 36
    .line 37
    iget-object p0, p0, Ll/mf40;->m:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    sub-int/2addr v2, p0

    .line 48
    mul-int/lit16 p1, p1, 0x3e8

    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {v2, p0}, Ljava/lang/Math;->min(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    add-int/2addr v1, p0

    .line 60
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 65
    .line 66
    return-void
.end method
