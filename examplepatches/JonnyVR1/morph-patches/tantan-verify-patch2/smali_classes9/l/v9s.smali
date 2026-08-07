.class public Ll/v9s;
.super Ll/jsv;
.source "SourceFile"


# static fields
.field public static final e:Ll/v9s;


# instance fields
.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/v9s;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/v9s;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/v9s;->e:Ll/v9s;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x4

    .line 10
    invoke-direct {p0, v0}, Ll/jsv;-><init>(I)V

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/v9s;->c:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/v9s;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/v9s;->c:Z

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/v9s;->o(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v9s;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v9s;->d:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v9s;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v9s;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v9s;->d:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 2
    .line 3
    return-void
.end method
