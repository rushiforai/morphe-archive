.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/h80;->j(Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    const-string p0, "topic_id"

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_profile_moment_tag"

    .line 17
    .line 18
    const-string p2, "p_suggest_user_profile_info_view"

    .line 19
    .line 20
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
