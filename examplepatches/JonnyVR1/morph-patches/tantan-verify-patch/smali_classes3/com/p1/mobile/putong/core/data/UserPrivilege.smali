.class public Lcom/p1/mobile/putong/core/data/UserPrivilege;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final CONTENT_BEGINTIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONTENT_EXPIREDTIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONTENT_INEXPERIENCE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONTENT_REFRESHMAXREMAINING:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONTENT_REMAINING:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONTENT_UNLIMIT:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "userprivilege"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$5;

    .line 34
    .line 35
    const-string v1, "content_expiredTime_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_EXPIREDTIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$6;

    .line 43
    .line 44
    const-string v1, "content_inExperience_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_INEXPERIENCE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$7;

    .line 52
    .line 53
    const-string v1, "content_remaining_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_REMAINING:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$8;

    .line 61
    .line 62
    const-string v1, "content_unlimit_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_UNLIMIT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$9;

    .line 70
    .line 71
    const-string v1, "content_beginTime_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_BEGINTIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$10;

    .line 79
    .line 80
    const-string v1, "content_refreshMaxRemaining_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->CONTENT_REFRESHMAXREMAINING:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege$11;

    .line 88
    .line 89
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege$11;-><init>()V

    .line 90
    .line 91
    .line 92
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->DB_ADAPTER:Ll/vzf0;

    .line 93
    .line 94
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilege;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 23
    .line 24
    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilege;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    return v1

    .line 11
    :cond_1
    move-object v0, p1

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 22
    .line 23
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "userprivilege"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    add-int/2addr v0, v1

    .line 22
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 23
    .line 24
    :cond_1
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "content"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->isFieldParsed(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 25
    .line 26
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->parseFieldSet:Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->mergeData(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->new_()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 9
    .line 10
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 17
    .line 18
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 19
    .line 20
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
