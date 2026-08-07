.class public Lcom/p1/mobile/putong/core/ui/settings/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/settings/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a$a;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a$a;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E1(Lcom/p1/mobile/putong/core/ui/settings/a;)Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a$a;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E1(Lcom/p1/mobile/putong/core/ui/settings/a;)Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const-string v1, "filter_min_age"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a$a;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E1(Lcom/p1/mobile/putong/core/ui/settings/a;)Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const-string v1, "filter_max_age"

    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {v0, p0}, [Ll/sfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v0, "e_edit_age_filter"

    .line 55
    .line 56
    const-string v1, "p_settings_view"

    .line 57
    .line 58
    invoke-static {v0, v1, p0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
