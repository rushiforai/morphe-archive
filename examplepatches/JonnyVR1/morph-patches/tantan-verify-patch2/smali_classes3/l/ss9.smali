.class public Ll/ss9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/ss9;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ss9;->a:Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static a()Ll/ss9;
    .locals 2

    .line 1
    sget-object v0, Ll/ss9;->b:Ll/ss9;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ss9;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ss9;->b:Ll/ss9;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ss9;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ss9;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ss9;->b:Ll/ss9;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/ss9;->b:Ll/ss9;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ss9;->a:Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/member/module/CoreMemberInnerServiceHolder;->coreMemberInnerService:Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 4
    .line 5
    return-object p0
.end method
