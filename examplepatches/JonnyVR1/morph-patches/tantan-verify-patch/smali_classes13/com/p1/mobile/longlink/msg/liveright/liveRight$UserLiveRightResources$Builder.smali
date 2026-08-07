.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResourcesOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResourcesOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->j()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/x4r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllUserLiveRights(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addUserLiveRights(ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)V

    return-object p0
.end method

.method public addUserLiveRights(ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    return-object p0
.end method

.method public addUserLiveRights(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)V

    return-object p0
.end method

.method public addUserLiveRights(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserLiveRights()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getUserLiveRights(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->getUserLiveRights(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserLiveRightsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->getUserLiveRightsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUserLiveRightsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->getUserLiveRightsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public removeUserLiveRights(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserLiveRights(ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;)V

    return-object p0
.end method

.method public setUserLiveRights(ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;ILcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
