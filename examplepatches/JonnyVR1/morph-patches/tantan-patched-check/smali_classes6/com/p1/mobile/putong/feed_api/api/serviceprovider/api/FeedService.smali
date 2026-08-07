.class public interface abstract Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IProvider;
.implements Ll/qhk0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$b;,
        Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$a;
    }
.end annotation


# virtual methods
.method public abstract Af(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Ah()Z
.end method

.method public abstract At()Ljava/lang/String;
.end method

.method public abstract Bd()Z
.end method

.method public abstract Bg(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Bh(Lcom/p1/mobile/android/app/Act;Z)V
.end method

.method public abstract Bj()Z
.end method

.method public abstract C6(Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;)Ll/fog;
.end method

.method public abstract Ca(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract Co()Z
.end method

.method public abstract Cr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract D8(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract E6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract Ea()V
.end method

.method public abstract Ee(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation
.end method

.method public abstract Ek(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract Fm(Ljava/lang/String;Z)V
.end method

.method public abstract Gc()Lcom/p1/mobile/putong/data/BubbleInfo;
.end method

.method public abstract Gk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ll/skq0;
.end method

.method public abstract Gm()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract H7()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract Ha()Z
.end method

.method public abstract Hj()Z
.end method

.method public abstract Ib(Ljava/lang/String;)Z
.end method

.method public abstract In(Landroid/widget/RelativeLayout;Lv/VImage;)V
.end method

.method public abstract Jg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract K8()Z
.end method

.method public abstract Ka(Ljava/lang/String;)Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Ke()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Kk(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract Kn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Kr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Lj()Z
.end method

.method public abstract Ll(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Lq()Z
.end method

.method public abstract M8()Z
.end method

.method public abstract Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract Nh(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract Nj()Z
.end method

.method public abstract Nr(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method

.method public abstract Ns()I
.end method

.method public abstract Oh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract Oj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
.end method

.method public abstract Ol(Lcom/p1/mobile/putong/data/Music;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Music;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end method

.method public abstract P6(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract P9(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract Pf(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
.end method

.method public abstract Pm()Z
.end method

.method public abstract Pn(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Qm(Ljava/lang/String;)Z
.end method

.method public abstract Qn(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public abstract R9(Landroid/view/View;F)V
.end method

.method public abstract Rc()Z
.end method

.method public abstract Rd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
.end method

.method public abstract Re(Z)V
.end method

.method public abstract Rf(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract S6()Ll/byd0;
.end method

.method public abstract Sd()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Sg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
.end method

.method public abstract T7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Tf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method

.method public abstract Tg()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract Ti(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract Tp()Z
.end method

.method public abstract U6(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
.end method

.method public abstract Ui(Ljava/lang/String;)Z
.end method

.method public abstract Um(Ljava/lang/String;)V
.end method

.method public abstract Ur(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract V9()Ljava/lang/String;
.end method

.method public abstract Vg()Z
.end method

.method public abstract Vo()Z
.end method

.method public abstract Vp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
.end method

.method public abstract Wd(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Wm()Z
.end method

.method public abstract Yb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
.end method

.method public abstract Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V
.end method

.method public abstract Yr()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract Z6(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Zk(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
.end method

.method public abstract a6()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract argsToMomentActivitiesAct(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract argsToMomentDetailAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract argsToMomentsFeedAct(Landroid/content/Context;)Landroid/content/Intent;
.end method

.method public abstract argsToMomentsFeedPreviewAct(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract argsToMomentsInProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract argsToMomentsSimpleTextAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract argsToPhotoAlbumActivitiesAct(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;
.end method

.method public abstract argsToPhotoAlbumFansAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
.end method

.method public abstract argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract bb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract bt()Z
.end method

.method public abstract cameraSdkLoaded()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract cd()Z
.end method

.method public abstract cg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method

.method public abstract coreMomentActivityPoll()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract coreMomentCachedMoments(Ljava/lang/String;ILcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public abstract coreMomentHasMoments(Ljava/lang/String;)Z
.end method

.method public abstract coreMomentLatest(Ljava/lang/String;)V
.end method

.method public abstract coreMomentLike(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract coreMomentMoments(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public abstract coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public abstract coreMomentMutedUsers()Ll/prl;
.end method

.method public abstract coreMomentPrevious(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract cq(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "TT;>;>;>;"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/Throwable;)V
.end method

.method public abstract di(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public abstract dr()Lcom/p1/mobile/putong/newui/main/base/TabName;
.end method

.method public abstract el()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract et()V
.end method

.method public abstract f6(Lcom/p1/mobile/putong/data/DbLinks;)V
.end method

.method public abstract f9()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract fc()I
.end method

.method public abstract filter()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end method

.method public abstract followingWithExtra(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end method

.method public abstract fs()Z
.end method

.method public abstract getFeedMediaHandler(Lcom/p1/mobile/android/app/Act;)Ll/keh;
.end method

.method public abstract getMoMoVerificationAppId()Ljava/lang/String;
.end method

.method public abstract getMomentLikeChangedSub()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getMomentsPreviousSub()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTopShowingPageId(Landroidx/fragment/app/Fragment;)Ljava/lang/String;
.end method

.method public abstract gk(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract h8()I
.end method

.method public abstract hk(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract hr(Landroid/app/Activity;)Z
.end method

.method public abstract ia(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;I)Landroid/view/View;
.end method

.method public abstract ik()Landroidx/fragment/app/Fragment;
.end method

.method public abstract initCameraSdk(Ll/x20;)V
.end method

.method public abstract isCameraSdkLoaded()Z
.end method

.method public abstract isLiveNeedDisableAudio(Landroid/app/Activity;)Z
.end method

.method public abstract isMatchedByFollowship(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract isMomentDetailAct(Landroid/app/Activity;)Z
.end method

.method public abstract isMomentsFeedAct(Landroid/app/Activity;)Z
.end method

.method public abstract isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z
.end method

.method public abstract isPostingMoment()Z
.end method

.method public abstract j8(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract j9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method

.method public abstract jb()Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract jk()V
.end method

.method public abstract ke()Z
.end method

.method public abstract ko()Z
.end method

.method public abstract kq(Lcom/p1/mobile/putong/data/Relationship;)V
.end method

.method public abstract l8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract ld()Z
.end method

.method public abstract le(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract ln()Ll/jxd0;
.end method

.method public abstract mn(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract momentRefresh(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract mr()Z
.end method

.method public abstract n(Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;)V"
        }
    .end annotation
.end method

.method public abstract n7()Z
.end method

.method public abstract ni(I)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;"
        }
    .end annotation
.end method

.method public abstract nm(Lcom/p1/mobile/android/app/Act;I)V
.end method

.method public abstract nq()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract oa(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;Lcom/tantanapp/common/data/ValueObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/os/Bundle;",
            "TT;)V"
        }
    .end annotation
.end method

.method public abstract oh(Landroidx/fragment/app/Fragment;)Ljava/lang/String;
.end method

.method public abstract or(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end method

.method public abstract p6(Z)V
.end method

.method public abstract pd()Ljava/lang/String;
.end method

.method public abstract personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "TT;>;>;>;"
        }
    .end annotation
.end method

.method public abstract po(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Detect;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract processMomentLikeStatusChanged(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V
.end method

.method public abstract qg()Z
.end method

.method public abstract qn()Z
.end method

.method public abstract qo(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public abstract s9()Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract sh()Z
.end method

.method public abstract so()Z
.end method

.method public abstract startInnerCameraForResult(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
.end method

.method public abstract startInstaLikePickerAct(Landroid/app/Activity;)V
.end method

.method public abstract t6(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V
.end method

.method public abstract tf()Ll/byd0;
.end method

.method public abstract toCaptionPage(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method

.method public abstract u0(Landroid/app/Activity;)Z
.end method

.method public abstract u6()Z
.end method

.method public abstract u9(Ljava/lang/String;)V
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation
.end method

.method public abstract ua()Z
.end method

.method public abstract ud(Lcom/p1/mobile/putong/data/User;)Z
.end method

.method public abstract updateUserOnBlock(Ljava/lang/String;)V
.end method

.method public abstract us(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public varargs abstract useFeedInsertViewProxy(Lcom/p1/mobile/android/app/Act;ILjava/util/Map;[Landroid/view/View;)Z
.end method

.method public abstract va(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract vj(Z)Z
.end method

.method public abstract vm(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract xa(Ljava/lang/String;)Z
.end method

.method public abstract xl(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation
.end method

.method public abstract xm(Ljava/lang/Object;)V
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation
.end method

.method public abstract yj(Ljava/lang/String;)V
.end method

.method public abstract yq()Ljava/lang/String;
.end method

.method public abstract zd(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
