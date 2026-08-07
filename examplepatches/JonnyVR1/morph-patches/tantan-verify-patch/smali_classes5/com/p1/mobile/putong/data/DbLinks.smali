.class public Lcom/p1/mobile/putong/data/DbLinks;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXTRA:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final LINKS_NEXT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final LINKS_PREVIOUS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final TOTAL:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "dblinks"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public extra:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public links:Lcom/p1/mobile/putong/data/Links;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public total:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$2;

    .line 9
    .line 10
    const-string v1, "_id"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$2;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$3;

    .line 18
    .line 19
    const-string v1, "id_c"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$3;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$4;

    .line 27
    .line 28
    const-string v1, "links_previous_c"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$4;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->LINKS_PREVIOUS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$5;

    .line 36
    .line 37
    const-string v1, "links_next_c"

    .line 38
    .line 39
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$5;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->LINKS_NEXT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$6;

    .line 45
    .line 46
    const-string v1, "total_c"

    .line 47
    .line 48
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$6;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->TOTAL:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 52
    .line 53
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$7;

    .line 54
    .line 55
    const-string v1, "extra_c"

    .line 56
    .line 57
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/DbLinks$7;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->EXTRA:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks$8;

    .line 63
    .line 64
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks$8;-><init>()V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/data/DbLinks;->DB_ADAPTER:Ll/vzf0;

    .line 68
    .line 69
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/DbLinks;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/DbLinks;->nullCheck()V

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

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DbLinks;->clone()Lcom/p1/mobile/putong/data/DbLinks;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/DbLinks;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Links;->clone()Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 23
    .line 24
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 25
    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 27
    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 29
    .line 30
    iput p0, v0, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 31
    .line 32
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DbLinks;->clone()Lcom/p1/mobile/putong/data/DbLinks;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/DbLinks;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/DbLinks;

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
    return v2

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 32
    .line 33
    iget v3, v1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 34
    .line 35
    if-ne p1, v3, :cond_3

    .line 36
    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 38
    .line 39
    iget p1, v1, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 40
    .line 41
    if-ne p0, p1, :cond_3

    .line 42
    .line 43
    return v0

    .line 44
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "dblinks"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Links;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x29

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 33
    .line 34
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
