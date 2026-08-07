.class public Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->e(Ll/oql;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/oql;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ll/oql;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->b:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->a:Ll/oql;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->a:Ll/oql;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->a:Ll/oql;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object v0, v0, Ll/dkb;->h2:Ll/jxd0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/uih0;->z0()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    iget-object v0, v0, Ll/dkb;->h2:Ll/jxd0;

    .line 54
    .line 55
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->a:Ll/oql;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 67
    .line 68
    const-string v1, "female"

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    const-string v0, "\u5979"

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const-string v0, "\u4ed6"

    .line 80
    .line 81
    :goto_0
    const-string v1, "\u804a\u804a\u4f60\u4eec\u90fd\u611f\u5174\u8da3\u7684\u4f5c\u54c1\uff0c%s\u4f1a\u4f18\u5148\u770b\u5230\u4f60"

    .line 82
    .line 83
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;->b:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v2, "desc_click_bubble_tip"

    .line 100
    .line 101
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void

    .line 105
    :catch_0
    move-exception p0

    .line 106
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
