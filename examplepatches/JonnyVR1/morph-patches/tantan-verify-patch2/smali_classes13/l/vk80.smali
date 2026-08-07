.class public final Ll/vk80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

.field public b:Z

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vk80;->a:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/vk80;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Ll/vk80;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;
    .locals 1

    .line 1
    new-instance v0, Ll/vk80;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/vk80;-><init>(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/vk80;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/vk80;

    .line 18
    .line 19
    iget-object v2, p0, Ll/vk80;->a:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 20
    .line 21
    iget-object v3, p1, Ll/vk80;->a:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 22
    .line 23
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-boolean v2, p0, Ll/vk80;->b:Z

    .line 30
    .line 31
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-boolean v3, p1, Ll/vk80;->b:Z

    .line 36
    .line 37
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/vk80;->c:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p1, Ll/vk80;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    return v0

    .line 58
    :cond_2
    :goto_0
    return v1
.end method
