.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ce\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u001a\n\u0002\u0018\u0002\n\u0002\u0008\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0008\u0003\n\u0002\u0008\t*\u0004\u00b2\u0001\u00b5\u0001\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u000f\u0010\u0006\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J\u000f\u0010\u0007\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0003J\u0019\u0010\n\u001a\u00020\u00042\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJG\u0010\u0017\u001a\u00020\u00162\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u000c2\u0006\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001a\u001a\u00020\u000e2\u0006\u0010\u0019\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001c\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0017\u0010\"\u001a\u00020\u00042\u0006\u0010!\u001a\u00020 H\u0002\u00a2\u0006\u0004\u0008\"\u0010#JO\u0010+\u001a\u00020\u00042\u0006\u0010%\u001a\u00020$2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00040&2\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00040&2\u0006\u0010\u0019\u001a\u00020\u000c2\u0012\u0010*\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000c0)\"\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008+\u0010,J\u000f\u0010-\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008-\u0010.J\u000f\u0010/\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008/\u0010.J\u000f\u00100\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u00080\u0010\u0003J\r\u00101\u001a\u00020\u0004\u00a2\u0006\u0004\u00081\u0010\u0003J-\u00107\u001a\u00020\u00042\u0006\u00103\u001a\u0002022\u0006\u00105\u001a\u0002042\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u00106\u001a\u00020\u000c\u00a2\u0006\u0004\u00087\u00108J\u0015\u00109\u001a\u00020\u00042\u0006\u0010\u0019\u001a\u00020\u000c\u00a2\u0006\u0004\u00089\u0010:J\r\u0010;\u001a\u00020\u0014\u00a2\u0006\u0004\u0008;\u0010<J=\u0010=\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u000c2\u0006\u0010\u0013\u001a\u00020\u000c\u00a2\u0006\u0004\u0008=\u0010>J\r\u0010?\u001a\u00020\u0004\u00a2\u0006\u0004\u0008?\u0010\u0003J\u0017\u0010@\u001a\u00020\u00042\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008@\u0010\u000bJ\r\u0010A\u001a\u00020\u0004\u00a2\u0006\u0004\u0008A\u0010\u0003J\r\u0010B\u001a\u00020\u0004\u00a2\u0006\u0004\u0008B\u0010\u0003J\u0015\u0010D\u001a\u00020\u00042\u0006\u0010C\u001a\u00020\u0014\u00a2\u0006\u0004\u0008D\u0010EJ\u0015\u0010G\u001a\u00020\u00042\u0006\u0010F\u001a\u00020\u0014\u00a2\u0006\u0004\u0008G\u0010EJ\r\u0010H\u001a\u00020\u0004\u00a2\u0006\u0004\u0008H\u0010\u0003J\r\u0010I\u001a\u00020\u0004\u00a2\u0006\u0004\u0008I\u0010\u0003J\u000f\u0010J\u001a\u00020\u0004H\u0000\u00a2\u0006\u0004\u0008J\u0010\u0003J\u001d\u0010M\u001a\u0002022\u0006\u0010K\u001a\u00020\u000c2\u0006\u0010L\u001a\u00020\u000c\u00a2\u0006\u0004\u0008M\u0010NJ\u0017\u0010Q\u001a\u00020\u00042\u0008\u0010P\u001a\u0004\u0018\u00010O\u00a2\u0006\u0004\u0008Q\u0010RJ\u001d\u0010U\u001a\u00020\u00042\u0006\u0010S\u001a\u00020\u00082\u0006\u0010T\u001a\u00020\u0008\u00a2\u0006\u0004\u0008U\u0010VJ\r\u0010W\u001a\u00020\u0004\u00a2\u0006\u0004\u0008W\u0010\u0003J1\u0010X\u001a\u00020\u00042\u0006\u0010%\u001a\u00020$2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00040&2\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00040&\u00a2\u0006\u0004\u0008X\u0010YJ1\u0010Z\u001a\u00020\u00042\u0006\u0010%\u001a\u00020$2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00040&2\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00040&\u00a2\u0006\u0004\u0008Z\u0010YJ1\u0010[\u001a\u00020\u00042\u0006\u0010%\u001a\u00020$2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u00040&2\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00040&\u00a2\u0006\u0004\u0008[\u0010YJ1\u0010\\\u001a\u00020\u00142\u0006\u0010%\u001a\u00020$2\u0006\u0010\u0019\u001a\u00020\u000c2\u0012\u0010*\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000c0)\"\u00020\u000c\u00a2\u0006\u0004\u0008\\\u0010]J\u0017\u0010_\u001a\u00020\u00142\u0008\u0008\u0002\u0010^\u001a\u00020\u0014\u00a2\u0006\u0004\u0008_\u0010`J\r\u0010a\u001a\u00020\u0014\u00a2\u0006\u0004\u0008a\u0010<J\r\u0010b\u001a\u00020\u0014\u00a2\u0006\u0004\u0008b\u0010<J\r\u0010c\u001a\u00020\u0014\u00a2\u0006\u0004\u0008c\u0010<J\r\u0010d\u001a\u00020\u0014\u00a2\u0006\u0004\u0008d\u0010<J\r\u0010e\u001a\u00020\u0014\u00a2\u0006\u0004\u0008e\u0010<J\r\u0010f\u001a\u00020\u0004\u00a2\u0006\u0004\u0008f\u0010\u0003J\r\u0010g\u001a\u00020\u0004\u00a2\u0006\u0004\u0008g\u0010\u0003J\u0017\u0010i\u001a\u00020\u000c2\u0008\u0008\u0002\u0010h\u001a\u00020\u0014\u00a2\u0006\u0004\u0008i\u0010jJ\r\u0010k\u001a\u00020\u0014\u00a2\u0006\u0004\u0008k\u0010<R\u001d\u0010r\u001a\u0008\u0012\u0004\u0012\u00020m0l8\u0006\u00a2\u0006\u000c\n\u0004\u0008n\u0010o\u001a\u0004\u0008p\u0010qR\u001d\u0010u\u001a\u0008\u0012\u0004\u0012\u00020\u00140l8\u0006\u00a2\u0006\u000c\n\u0004\u0008s\u0010o\u001a\u0004\u0008t\u0010qR\"\u0010y\u001a\u00020\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008v\u0010J\u001a\u0004\u0008w\u0010<\"\u0004\u0008x\u0010ER\"\u0010}\u001a\u00020\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008z\u0010J\u001a\u0004\u0008{\u0010<\"\u0004\u0008|\u0010ER\u0017\u0010\u0080\u0001\u001a\u00020\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008~\u0010\u007fR\u0018\u0010\u0082\u0001\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0081\u0001\u0010JR\u001c\u0010\u0086\u0001\u001a\u0005\u0018\u00010\u0083\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0084\u0001\u0010\u0085\u0001R,\u0010\u008e\u0001\u001a\u0005\u0018\u00010\u0087\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0018\n\u0006\u0008\u0088\u0001\u0010\u0089\u0001\u001a\u0006\u0008\u008a\u0001\u0010\u008b\u0001\"\u0006\u0008\u008c\u0001\u0010\u008d\u0001R\u001c\u0010\u0092\u0001\u001a\u0005\u0018\u00010\u008f\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0090\u0001\u0010\u0091\u0001R\u001b\u0010\u0095\u0001\u001a\u0005\u0018\u00010\u0093\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0007\u0010\u0094\u0001R\u0018\u0010\u0097\u0001\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0096\u0001\u0010JR\u001a\u0010\u009b\u0001\u001a\u00030\u0098\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0099\u0001\u0010\u009a\u0001R?\u0010\u00a2\u0001\u001a&\u0012\u0005\u0012\u00030\u009d\u0001\u0012\u0006\u0012\u0004\u0018\u00010O0\u009c\u0001j\u0012\u0012\u0005\u0012\u00030\u009d\u0001\u0012\u0006\u0012\u0004\u0018\u00010O`\u009e\u00018\u0006\u00a2\u0006\u000f\n\u0005\u0008\u0005\u0010\u009f\u0001\u001a\u0006\u0008\u00a0\u0001\u0010\u00a1\u0001R%\u0010\u00a5\u0001\u001a\u00020\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0014\n\u0004\u0008_\u0010J\u001a\u0005\u0008\u00a3\u0001\u0010<\"\u0005\u0008\u00a4\u0001\u0010ER&\u0010\u00a9\u0001\u001a\u00020\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0015\n\u0005\u0008\u00a6\u0001\u0010J\u001a\u0005\u0008\u00a7\u0001\u0010<\"\u0005\u0008\u00a8\u0001\u0010ER%\u0010\u00ac\u0001\u001a\u00020\u00148\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0014\n\u0004\u0008+\u0010J\u001a\u0005\u0008\u00aa\u0001\u0010<\"\u0005\u0008\u00ab\u0001\u0010ER\"\u0010\u00b1\u0001\u001a\t\u0012\u0004\u0012\u00020\u00140\u00ad\u00018\u0006\u00a2\u0006\u000f\n\u0005\u0008\\\u0010\u00ae\u0001\u001a\u0006\u0008\u00af\u0001\u0010\u00b0\u0001R\u0016\u00106\u001a\u00020\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u007fR\u0017\u0010\u00b4\u0001\u001a\u00030\u00b2\u00018\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008I\u0010\u00b3\u0001R\u0017\u0010\u00b7\u0001\u001a\u00030\u00b5\u00018\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008=\u0010\u00b6\u0001R)\u0010\u00bc\u0001\u001a\u00030\u0098\u00018\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0017\n\u0005\u0008@\u0010\u009a\u0001\u001a\u0006\u0008\u00b8\u0001\u0010\u00b9\u0001\"\u0006\u0008\u00ba\u0001\u0010\u00bb\u0001\u00a8\u0006\u00bd\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;",
        "",
        "<init>",
        "()V",
        "",
        "m",
        "a0",
        "j",
        "",
        "errorCode",
        "M",
        "(I)V",
        "",
        "userId",
        "Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;",
        "lintType",
        "channel",
        "channelKey",
        "appId",
        "userSign",
        "",
        "onlyAudio",
        "Lcom/immomo/momomediaext/utils/MMLiveRoomParams;",
        "r",
        "(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;",
        "type",
        "F",
        "(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;",
        "userVideo",
        "Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;",
        "D",
        "(Z)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;",
        "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
        "conflictBusinessType",
        "i0",
        "(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lkotlin/Function0;",
        "func",
        "fail",
        "",
        "permission",
        "p",
        "(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;[Ljava/lang/String;)V",
        "A",
        "()I",
        "z",
        "o0",
        "K",
        "Lcom/immomo/momomediaext/utils/MMLiveUserConfig;",
        "config",
        "Landroid/content/Context;",
        "context",
        "provider",
        "L",
        "(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V",
        "b0",
        "(Ljava/lang/String;)V",
        "R",
        "()Z",
        "t",
        "(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "k0",
        "u",
        "V",
        "W",
        "mute",
        "f0",
        "(Z)V",
        "enable",
        "d0",
        "c0",
        "s",
        "Z",
        "pubId",
        "roomId",
        "E",
        "(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;",
        "Landroid/view/SurfaceView;",
        "surface",
        "l0",
        "(Landroid/view/SurfaceView;)V",
        "width",
        "height",
        "g0",
        "(II)V",
        "n0",
        "q0",
        "(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V",
        "p0",
        "X",
        "q",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[Ljava/lang/String;)Z",
        "toast",
        "n",
        "(Z)Z",
        "P",
        "S",
        "O",
        "Q",
        "U",
        "m0",
        "j0",
        "video",
        "x",
        "(Z)Ljava/lang/String;",
        "Y",
        "Lrx/subjects/a;",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;",
        "a",
        "Lrx/subjects/a;",
        "y",
        "()Lrx/subjects/a;",
        "callState",
        "b",
        "C",
        "inMediaBuzzCallState",
        "c",
        "w",
        "setAudioMute",
        "audioMute",
        "d",
        "H",
        "setSpeakerPhone",
        "speakerPhone",
        "e",
        "Ljava/lang/String;",
        "mediaCallType",
        "f",
        "enablePreview",
        "Lcom/immomo/momomediaext/MMLiveEngine;",
        "g",
        "Lcom/immomo/momomediaext/MMLiveEngine;",
        "mLiveEngine",
        "Ll/pq3;",
        "h",
        "Ll/pq3;",
        "getFloatManager$buzz_intlGmsRelease",
        "()Ll/pq3;",
        "setFloatManager$buzz_intlGmsRelease",
        "(Ll/pq3;)V",
        "floatManager",
        "Landroid/media/AudioManager;",
        "i",
        "Landroid/media/AudioManager;",
        "audioManager",
        "Landroid/media/AudioManager$OnAudioFocusChangeListener;",
        "Landroid/media/AudioManager$OnAudioFocusChangeListener;",
        "afChangeListener",
        "k",
        "audioFocusChangeListenerRun",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "l",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "registerCount",
        "Ljava/util/HashMap;",
        "",
        "Lkotlin/collections/HashMap;",
        "Ljava/util/HashMap;",
        "J",
        "()Ljava/util/HashMap;",
        "userSurfaceInfoMap",
        "B",
        "e0",
        "hadVocal",
        "o",
        "T",
        "h0",
        "isShowFace",
        "I",
        "setStartLint",
        "startLint",
        "Lrx/subjects/b;",
        "Lrx/subjects/b;",
        "G",
        "()Lrx/subjects/b;",
        "selfShowFaceSub",
        "com/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;",
        "phoneStateReceiver",
        "com/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;",
        "pusherListener",
        "getAddMask",
        "()Ljava/util/concurrent/atomic/AtomicInteger;",
        "setAddMask",
        "(Ljava/util/concurrent/atomic/AtomicInteger;)V",
        "addMask",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static c:Z

.field public static d:Z

.field public static volatile e:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static f:Z

.field public static g:Lcom/immomo/momomediaext/MMLiveEngine;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static h:Ll/pq3;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static i:Landroid/media/AudioManager;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static j:Landroid/media/AudioManager$OnAudioFocusChangeListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static k:Z

.field public static l:Ljava/util/concurrent/atomic/AtomicInteger;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Landroid/view/SurfaceView;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static n:Z

.field public static o:Z

.field public static p:Z

.field public static final q:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static r:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final s:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final t:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static u:Ljava/util/concurrent/atomic/AtomicInteger;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->UN_INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 9
    .line 10
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->b:Lrx/subjects/a;

    .line 29
    .line 30
    const-string v0, "voiceBuzz"

    .line 31
    .line 32
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    .line 42
    new-instance v0, Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->m:Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->q:Lrx/subjects/b;

    .line 57
    .line 58
    const-string v0, "1"

    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->r:Ljava/lang/String;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;

    .line 63
    .line 64
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;-><init>()V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->s:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;

    .line 70
    .line 71
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;-><init>()V

    .line 72
    .line 73
    .line 74
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->t:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;

    .line 75
    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    const/4 v1, -0x1

    .line 79
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 80
    .line 81
    .line 82
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 83
    .line 84
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;IILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->M(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static a(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 25
    .line 26
    .line 27
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->j0(Z)V

    .line 32
    .line 33
    .line 34
    :cond_3
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->d:Z

    .line 35
    .line 36
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v5, v1, [Ljava/lang/String;

    .line 5
    .line 6
    const-string v4, "memojiBuzz"

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-object v2, p1

    .line 10
    move-object v3, p2

    .line 11
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 15
    .line 16
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v5, v1, [Ljava/lang/String;

    .line 5
    .line 6
    const-string v4, "videoBuzz"

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-object v2, p1

    .line 10
    move-object v3, p2

    .line 11
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 15
    .line 16
    return-object p0
.end method

.method public static d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static e(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->t(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static f(I)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->R()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    const/4 v0, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->v(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;IILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static g()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->Z()V

    .line 8
    .line 9
    .line 10
    sget-object v2, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    sub-long/2addr v3, v0

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "ioLeave----consume "

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "BuzzMediaCallManager"

    .line 32
    .line 33
    invoke-virtual {v2, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static h()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->L()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static i(ZLjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 12

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    sget-object v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 10
    .line 11
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->D(Z)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v11

    .line 15
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->F(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    xor-int/lit8 v10, p0, 0x1

    .line 20
    .line 21
    move-object v4, p1

    .line 22
    move-object v6, p3

    .line 23
    move-object/from16 v7, p4

    .line 24
    .line 25
    move-object/from16 v8, p5

    .line 26
    .line 27
    move-object/from16 v9, p6

    .line 28
    .line 29
    invoke-virtual/range {v3 .. v10}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->r(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    move-object/from16 p1, p7

    .line 34
    .line 35
    invoke-virtual {v2, v11, p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->w(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    :catch_0
    :cond_0
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide p1

    .line 44
    sub-long/2addr p1, v0

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "enter room consume "

    .line 54
    .line 55
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, " callState is "

    .line 62
    .line 63
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "BuzzMediaCallManager"

    .line 74
    .line 75
    invoke-virtual {p0, p2, p1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->PREPARE_JOINING_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 83
    .line 84
    if-ne p0, p1, :cond_1

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->JOINING_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public static final synthetic k()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic l(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i0(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;ZILjava/lang/Object;)Z
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    and-int/2addr p2, p3

    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    move p1, p3

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n(Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;IILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final A()I
    .locals 3

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x1e0

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/core/data/BuzzResolution;->width:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move p0, v0

    .line 23
    :goto_0
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v0, p0

    .line 27
    :goto_1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "getCameraWidth, width "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "BuzzMediaCallManager"

    .line 44
    .line 45
    invoke-virtual {p0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return v0
.end method

.method public final B()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final C()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final D(Z)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const v1, 0xfa00

    .line 7
    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 13
    .line 14
    const v1, 0xac44

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->z()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->A()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 30
    .line 31
    const v1, 0x124f80

    .line 32
    .line 33
    .line 34
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 35
    .line 36
    const/16 v1, 0xf

    .line 37
    .line 38
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->x(Z)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->r:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 57
    .line 58
    return-object v0
.end method

.method public final E(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ih()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Hh()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 26
    .line 27
    invoke-static {p0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 32
    .line 33
    invoke-static {p0}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    const/4 v7, 0x0

    .line 38
    move-object v3, p1

    .line 39
    move-object v4, p2

    .line 40
    invoke-direct/range {v0 .. v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method

.method public final F(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_4

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_3

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_2

    .line 9
    .line 10
    const/4 p0, 0x4

    .line 11
    if-eq p1, p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    if-eq p1, p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_2
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfWL:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_3
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_4
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 32
    .line 33
    return-object p0
.end method

.method public final G()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->q:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final H()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final I()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final J()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Landroid/view/SurfaceView;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->m:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final K()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ll/pq3;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/pq3;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o0()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->m()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final declared-synchronized L(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Lcom/immomo/momomediaext/utils/MMLiveUserConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "initEngine, config is "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    sget-object v1, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 17
    .line 18
    const-string v2, "BuzzMediaCallManager"

    .line 19
    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v1, v2, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine;

    .line 43
    .line 44
    invoke-direct {v0, p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 48
    .line 49
    sput-object p3, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 50
    .line 51
    sput-object p4, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->r:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :catchall_0
    move-exception p1

    .line 56
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p1
.end method

.method public final M(I)V
    .locals 6

    .line 1
    sget-object v0, Ll/f8w;->INSTANCE:Ll/f8w;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/f8w;->a(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/f8w;->b(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 25
    .line 26
    const-string v3, "voiceBuzz"

    .line 27
    .line 28
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget-boolean v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 38
    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    move v5, v4

    .line 42
    :cond_2
    :goto_0
    sget-boolean v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n:Z

    .line 43
    .line 44
    xor-int/2addr v2, v4

    .line 45
    invoke-virtual {v0, v1, v5, v2, p1}, Ll/haw;->K0(Ljava/lang/String;ZZI)V

    .line 46
    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n0()V

    .line 57
    .line 58
    .line 59
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j()V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ll/kp3;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/kp3;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final O()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->LEAVE_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->MEMBER_LEAVE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->UN_INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 22
    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->CONNECTION_LOST:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 26
    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->RECEIVE_PHONE_CALL:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 30
    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final P()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public final Q()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->P()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public final R()Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 3
    .line 4
    const-string v1, "phone"

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v1, v0, Landroid/telephony/TelephonyManager;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    if-nez v0, :cond_1

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    :catch_0
    :cond_2
    return p0
.end method

.method public final S()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->PREPARE_JOINING_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final T()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public final U()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "voiceBuzz"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public final V()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/op3;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/op3;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final W()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "BuzzMediaCallManager"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "leaveRoom, but status is "

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->LEAVE_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-static {p0, v3, v0, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->N(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;IILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 49
    .line 50
    const-string v2, "leaveRoom----"

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c0()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final X(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/qn3;->INSTANCE:Ll/qn3;

    .line 11
    .line 12
    new-instance v0, Ll/sp3;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, Ll/sp3;-><init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 15
    .line 16
    .line 17
    const-string p2, "memojiBuzz"

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/qn3;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final Y()Z
    .locals 3

    .line 1
    sget-object p0, Ll/do3;->INSTANCE:Ll/do3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/do3;->F()Lcom/momo/mcamera/mask/MaskModel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->V(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->t(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-ne p0, v2, :cond_2

    .line 49
    .line 50
    return v2

    .line 51
    :cond_2
    return v1
.end method

.method public final declared-synchronized Z()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 3
    .line 4
    const-string v1, "BuzzMediaCallManager"

    .line 5
    .line 6
    const-string v2, "releaseRtc"

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->UN_INIT_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->S()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw v0
.end method

.method public final a0()V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->k:Z

    .line 18
    .line 19
    if-nez p0, :cond_3

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    const/4 v2, 0x2

    .line 29
    invoke-virtual {p0, v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    :goto_0
    if-nez p0, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const/4 v0, 0x1

    .line 47
    if-ne p0, v0, :cond_2

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 51
    :goto_2
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->k:Z

    .line 52
    .line 53
    :cond_3
    return-void
.end method

.method public final b0(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final c0()V
    .locals 2

    .line 1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v0, "BuzzMediaCallManager"

    .line 4
    .line 5
    const-string v1, "resetState"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->t0(Ll/enw;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c:Z

    .line 20
    .line 21
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->d:Z

    .line 22
    .line 23
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n:Z

    .line 24
    .line 25
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 26
    .line 27
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p:Z

    .line 28
    .line 29
    const-string v0, "voiceBuzz"

    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->setMode(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    sget-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->d:Z

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 47
    .line 48
    .line 49
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->m:Ljava/util/HashMap;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    .line 56
    const/4 v0, -0x1

    .line 57
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/haw;->n0()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-class v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 74
    .line 75
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Lkotlin/reflect/KClass;->s()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final d0(Z)V
    .locals 0

    .line 1
    new-instance p0, Ll/pp3;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/pp3;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e0(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public final f0(Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->o0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    sput-boolean p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public final g0(II)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->A()Ll/zmw;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/zmw;->M(II)Ll/zmw;

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->O0(Ll/zmw;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final h0(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public final i0(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 1

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->W0:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    aget p1, v0, p1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    if-eq p1, v0, :cond_0

    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->W0:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->b1:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :goto_0
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->k:Z

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->k:Z

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final j0()V
    .locals 2

    .line 1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v0, "BuzzMediaCallManager"

    .line 4
    .line 5
    const-string v1, "startFloatMgr"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/pq3;->h()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final k0()V
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p:Z

    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;-><init>()V

    .line 7
    .line 8
    .line 9
    const/16 v1, 0x3e8

    .line 10
    .line 11
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 15
    .line 16
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->report_vad:I

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h0(Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final declared-synchronized l0(Landroid/view/SurfaceView;)V
    .locals 8
    .param p1    # Landroid/view/SurfaceView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "startPreview surface is "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    sget-object v1, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 5
    .line 6
    const-string v2, "BuzzMediaCallManager"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v1, v2, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->f:Z

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "memojiBuzz"

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 35
    .line 36
    const-string v3, "voiceBuzz"

    .line 37
    .line 38
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    const/16 v3, 0x19

    .line 47
    .line 48
    if-le v2, v3, :cond_0

    .line 49
    .line 50
    :try_start_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 51
    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    sget-object v3, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_ENGINE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Lcom/immomo/momomediaext/MMLiveEngine;->e0(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 57
    .line 58
    .line 59
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    move-object p1, v0

    .line 64
    goto :goto_2

    .line 65
    :catch_0
    :try_start_2
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 66
    .line 67
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o:Z

    .line 71
    .line 72
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 73
    .line 74
    sget-object v0, Ll/do3;->INSTANCE:Ll/do3;

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ll/do3;->C(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    new-instance v2, Ll/zmw;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->A()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->z()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    const/16 v6, 0xf

    .line 92
    .line 93
    const/4 v3, 0x1

    .line 94
    move-object v7, p1

    .line 95
    invoke-direct/range {v2 .. v7}, Ll/zmw;-><init>(IIIILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 99
    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->C0(Ll/zmw;)V

    .line 103
    .line 104
    .line 105
    :cond_3
    if-eqz v1, :cond_5

    .line 106
    .line 107
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->u:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_4

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_4
    sget-object p1, Ll/do3;->INSTANCE:Ll/do3;

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/do3;->E(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Ll/do3;->m()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    new-instance v0, Ll/mp3;

    .line 128
    .line 129
    invoke-direct {v0}, Ll/mp3;-><init>()V

    .line 130
    .line 131
    .line 132
    new-instance v1, Ll/np3;

    .line 133
    .line 134
    invoke-direct {v1}, Ll/np3;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 142
    .line 143
    .line 144
    monitor-exit p0

    .line 145
    return-void

    .line 146
    :cond_5
    :goto_1
    monitor-exit p0

    .line 147
    return-void

    .line 148
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 149
    throw p1
.end method

.method public final m()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/media/AudioManager;

    .line 13
    .line 14
    sput-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i:Landroid/media/AudioManager;

    .line 15
    .line 16
    new-instance p0, Ll/qp3;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/qp3;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 22
    .line 23
    return-void
.end method

.method public final m0()V
    .locals 2

    .line 1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v0, "BuzzMediaCallManager"

    .line 4
    .line 5
    const-string v1, "stopFloatMgr"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/pq3;->i()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final n(Z)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->b:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return v1

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->P()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->G0:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return v1

    .line 32
    :cond_3
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_5

    .line 45
    .line 46
    if-eqz p1, :cond_4

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->i0(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    return v1

    .line 55
    :cond_5
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method public final declared-synchronized n0()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 3
    .line 4
    const-string v1, "BuzzMediaCallManager"

    .line 5
    .line 6
    const-string v2, "stopPreview"

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->f:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->f:Z

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->G0()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw v0
.end method

.method public final o0()V
    .locals 2

    .line 1
    :try_start_0
    new-instance p0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "android.intent.action.PHONE_STATE"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const v0, 0x7fffffff

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->s:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Ll/jj5;->k(Landroid/app/Application;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final varargs p(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/k8w;->a(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->o(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;ZILjava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    array-length v0, p5

    .line 27
    invoke-static {p5, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p5

    .line 31
    check-cast p5, [Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p4, p5}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-class p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object p4, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->BUZZ:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 54
    .line 55
    sget p5, Lcom/p1/mobile/putong/core/buzz/R$string;->W0:I

    .line 56
    .line 57
    invoke-static {p5}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p5

    .line 61
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->setBusinessMsg(Ljava/lang/String;)Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    new-instance p5, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$b;

    .line 66
    .line 67
    invoke-direct {p5, p2, p3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$b;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1, p4, p5}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final p0(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/qn3;->INSTANCE:Ll/qn3;

    .line 11
    .line 12
    new-instance v0, Ll/rp3;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, Ll/rp3;-><init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 15
    .line 16
    .line 17
    const-string p2, "videoBuzz"

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/qn3;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final varargs q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    array-length p0, p3

    .line 11
    invoke-static {p3, p0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, [Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x1

    .line 22
    const/4 v1, 0x0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    array-length p2, p3

    .line 30
    invoke-static {p3, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, [Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 49
    .line 50
    .line 51
    return v1

    .line 52
    :cond_0
    const-string p0, "memojiBuzz"

    .line 53
    .line 54
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    sget-object p0, Ll/gp3;->INSTANCE:Ll/gp3;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/gp3;->e()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/gp3;->f()V

    .line 69
    .line 70
    .line 71
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->x:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0, v0}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    return v1

    .line 81
    :cond_1
    invoke-static {}, Ll/jpd0;->c()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_2

    .line 86
    .line 87
    invoke-static {}, Ll/jpd0;->d()V

    .line 88
    .line 89
    .line 90
    sget p0, Lcom/p1/mobile/putong/core/buzz/R$string;->l1:I

    .line 91
    .line 92
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0, v0}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 97
    .line 98
    .line 99
    return v1

    .line 100
    :cond_2
    return v0
.end method

.method public final q0(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/wzx;->k()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    new-array v0, v3, [Ljava/lang/String;

    .line 21
    .line 22
    aput-object v1, v0, v2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x2

    .line 26
    new-array v0, v0, [Ljava/lang/String;

    .line 27
    .line 28
    aput-object v1, v0, v2

    .line 29
    .line 30
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 31
    .line 32
    aput-object v1, v0, v3

    .line 33
    .line 34
    :goto_0
    array-length v1, v0

    .line 35
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    move-object v6, v0

    .line 40
    check-cast v6, [Ljava/lang/String;

    .line 41
    .line 42
    const-string v5, "voiceBuzz"

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    move-object v2, p1

    .line 46
    move-object v3, p2

    .line 47
    move-object v4, p3

    .line 48
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->p(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final r(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
    .locals 0

    .line 1
    new-instance p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p5, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 15
    .line 16
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 19
    .line 20
    iput-object p6, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userSig:Ljava/lang/String;

    .line 21
    .line 22
    iput-boolean p7, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->onlyAudio:Z

    .line 23
    .line 24
    return-object p0
.end method

.method public final s()V
    .locals 3

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v1, "BuzzMediaCallManager"

    .line 4
    .line 5
    const-string v2, "dispose"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->h:Ll/pq3;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/pq3;->e()V

    .line 22
    .line 23
    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    if-lez v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 36
    .line 37
    .line 38
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 39
    .line 40
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->s:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$phoneStateReceiver$1;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :catch_0
    :cond_1
    const/4 v0, 0x1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-static {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->v(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;IILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final t(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v3, "enterRoom, mediaCallType "

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " userId "

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, " lintType "

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v5, " channel "

    .line 47
    .line 48
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v5, " appId "

    .line 55
    .line 56
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v5, " userSign "

    .line 63
    .line 64
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v5, "BuzzMediaCallManager"

    .line 75
    .line 76
    invoke-virtual {v0, v5, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 89
    .line 90
    const-string v2, "videoBuzz"

    .line 91
    .line 92
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const-string v2, "memojiBuzz"

    .line 100
    .line 101
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->e:Ljava/lang/String;

    .line 105
    .line 106
    const-string v2, "voiceBuzz"

    .line 107
    .line 108
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    xor-int/lit8 v1, v0, 0x1

    .line 113
    .line 114
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 115
    .line 116
    if-eqz v2, :cond_1

    .line 117
    .line 118
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 119
    .line 120
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 121
    .line 122
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v5, p3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->E(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v2, v5}, Lcom/immomo/momomediaext/MMLiveEngine;->y0(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 136
    .line 137
    .line 138
    :cond_1
    new-instance v8, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 139
    .line 140
    invoke-direct {v8}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 141
    .line 142
    .line 143
    if-nez v0, :cond_2

    .line 144
    .line 145
    const v0, 0x124f80

    .line 146
    .line 147
    .line 148
    iput v0, v8, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 149
    .line 150
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->g:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 151
    .line 152
    if-eqz v0, :cond_3

    .line 153
    .line 154
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->t:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager$c;

    .line 155
    .line 156
    invoke-virtual {v0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->t0(Ll/enw;)V

    .line 157
    .line 158
    .line 159
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 160
    .line 161
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;->PREPARE_JOINING_STATE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a0()V

    .line 167
    .line 168
    .line 169
    new-instance v0, Ll/lp3;

    .line 170
    .line 171
    move-object v2, p1

    .line 172
    move v3, p2

    .line 173
    move-object v4, p3

    .line 174
    move-object v5, p4

    .line 175
    move-object v6, p5

    .line 176
    move-object v7, p6

    .line 177
    invoke-direct/range {v0 .. v8}, Ll/lp3;-><init>(ZLjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public final u(I)V
    .locals 3

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v1, "BuzzMediaCallManager"

    .line 4
    .line 5
    const-string v2, "forceLeaveRoom"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->M(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final w()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final x(Z)Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "200"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "201"

    .line 7
    .line 8
    :goto_0
    sget-object p1, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 9
    .line 10
    const-string v0, "getBusinessType "

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "BuzzMediaCallManager"

    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public final y()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final z()I
    .locals 3

    .line 1
    sget-object p0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x280

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/core/data/BuzzResolution;->height:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move p0, v0

    .line 23
    :goto_0
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v0, p0

    .line 27
    :goto_1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "getCameraHeight, height "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "BuzzMediaCallManager"

    .line 44
    .line 45
    invoke-virtual {p0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return v0
.end method
