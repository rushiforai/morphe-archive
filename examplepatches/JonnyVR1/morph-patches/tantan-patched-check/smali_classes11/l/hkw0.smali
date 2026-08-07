.class public final Ll/hkw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/orv0;


# instance fields
.field public a:Landroid/os/Message;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/elw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/hjw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/os/Message;Ll/elw0;)Ll/hkw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hkw0;->a:Landroid/os/Message;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hkw0;->b:Ll/elw0;

    .line 4
    .line 5
    return-object p0
.end method

.method public final b(Landroid/os/Handler;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hkw0;->a:Landroid/os/Message;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0}, Ll/hkw0;->c()V

    .line 11
    .line 12
    .line 13
    return p1
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hkw0;->a:Landroid/os/Message;

    .line 3
    .line 4
    iput-object v0, p0, Ll/hkw0;->b:Ll/elw0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/elw0;->a(Ll/hkw0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final zza()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hkw0;->a:Landroid/os/Message;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hkw0;->c()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
