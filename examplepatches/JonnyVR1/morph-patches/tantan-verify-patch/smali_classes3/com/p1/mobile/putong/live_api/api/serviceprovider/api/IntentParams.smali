.class public Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;,
        Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public category:Ljava/lang/String;

.field public live:Lcom/p1/mobile/putong/data/Live;

.field public liveId:Ljava/lang/String;

.field public liveSchema:Ljava/lang/String;

.field public open:Ljava/lang/String;

.field public requestExtra:Ljava/lang/String;

.field public showSignInDialog:Z

.field public source:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    return-void
.end method

.method private constructor <init>(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->e:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->f:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->g:Lcom/p1/mobile/putong/data/Live;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->live:Lcom/p1/mobile/putong/data/Live;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->h:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveSchema:Ljava/lang/String;

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;Ll/tym;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;-><init>(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->clone()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 27
    .line 28
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->clone()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

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
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 22
    .line 23
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 24
    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "IntentParams{liveId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', source=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->source:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', category=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->category:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', open=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->open:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', requestExtra=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->requestExtra:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', showSignInDialog="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->showSignInDialog:Z

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x7d

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
