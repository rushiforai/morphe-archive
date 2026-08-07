.class public Ll/pzs$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pzs;->x(Ll/hti;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/a30<",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/pzs;


# direct methods
.method public constructor <init>(Ll/pzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzs$a;->a:Ll/pzs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 4
    .line 5
    check-cast p3, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/pzs$a;->b(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string p1, "PhotoAlbumFeedPreviewAdapter"

    .line 4
    .line 5
    invoke-virtual {p3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p1, "NewMeetAct"

    .line 12
    .line 13
    invoke-virtual {p3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    iget-object p0, p0, Ll/pzs$a;->a:Ll/pzs;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-static {p0, p1}, Ll/pzs;->m(Ll/pzs;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
