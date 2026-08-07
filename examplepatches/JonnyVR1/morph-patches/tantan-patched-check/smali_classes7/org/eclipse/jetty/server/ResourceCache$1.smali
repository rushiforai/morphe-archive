.class Lorg/eclipse/jetty/server/ResourceCache$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/ResourceCache;->shrinkCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lorg/eclipse/jetty/server/ResourceCache$Content;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/ResourceCache;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/ResourceCache;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/ResourceCache$1;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 37
    check-cast p1, Lorg/eclipse/jetty/server/ResourceCache$Content;

    check-cast p2, Lorg/eclipse/jetty/server/ResourceCache$Content;

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/ResourceCache$1;->compare(Lorg/eclipse/jetty/server/ResourceCache$Content;Lorg/eclipse/jetty/server/ResourceCache$Content;)I

    move-result p0

    return p0
.end method

.method public compare(Lorg/eclipse/jetty/server/ResourceCache$Content;Lorg/eclipse/jetty/server/ResourceCache$Content;)I
    .locals 5

    .line 1
    iget-wide v0, p1, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 2
    .line 3
    iget-wide v2, p2, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-gez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    iget-wide v1, p1, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 12
    .line 13
    iget-wide v3, p2, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 14
    .line 15
    cmp-long p0, v1, v3

    .line 16
    .line 17
    if-lez p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    iget p0, p1, Lorg/eclipse/jetty/server/ResourceCache$Content;->_length:I

    .line 22
    .line 23
    iget v1, p2, Lorg/eclipse/jetty/server/ResourceCache$Content;->_length:I

    .line 24
    .line 25
    if-ge p0, v1, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    iget-object p0, p1, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p1, p2, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method
