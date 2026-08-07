.class public final Lcom/clevertap/android/sdk/inapp/InAppController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/arm;
.implements Ll/ec60;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/InAppController$a;,
        Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;,
        Lcom/clevertap/android/sdk/inapp/InAppController$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00a8\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0010 \n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u00086\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0000\u0018\u0000 \u00d4\u00012\u00020\u00012\u00020\u0002:\u0004\u00d5\u0001\u009d\u0001B\u00ab\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0006\u0010\u0012\u001a\u00020\u0011\u0012\u0006\u0010\u0014\u001a\u00020\u0013\u0012\u0006\u0010\u0016\u001a\u00020\u0015\u0012\u0006\u0010\u0018\u001a\u00020\u0017\u0012\u0006\u0010\u001a\u001a\u00020\u0019\u0012\u0006\u0010\u001c\u001a\u00020\u001b\u0012\u0006\u0010\u001e\u001a\u00020\u001d\u0012\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020 0\u001f\u0012\u000c\u0010#\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001f\u0012\u0006\u0010%\u001a\u00020$\u0012\u0006\u0010\'\u001a\u00020&\u0012\u0006\u0010)\u001a\u00020(\u00a2\u0006\u0004\u0008*\u0010+J\u000f\u0010-\u001a\u00020,H\u0002\u00a2\u0006\u0004\u0008-\u0010.J\u0017\u00101\u001a\u00020,2\u0006\u00100\u001a\u00020/H\u0002\u00a2\u0006\u0004\u00081\u00102J\u0019\u00106\u001a\u0002052\u0008\u00104\u001a\u0004\u0018\u000103H\u0002\u00a2\u0006\u0004\u00086\u00107J\u000f\u00108\u001a\u000205H\u0002\u00a2\u0006\u0004\u00088\u00109J\u0017\u0010<\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008<\u0010=J\u0017\u0010>\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008>\u0010=J\u0017\u0010@\u001a\u00020,2\u0006\u0010?\u001a\u00020/H\u0002\u00a2\u0006\u0004\u0008@\u00102J\u001d\u0010C\u001a\u0008\u0012\u0004\u0012\u00020B0A2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008C\u0010DJ\u000f\u0010E\u001a\u000205H\u0002\u00a2\u0006\u0004\u0008E\u00109J\u0017\u0010F\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008F\u0010=J\u001f\u0010G\u001a\u00020,2\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008G\u0010HJ\u0017\u0010I\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008I\u0010=J\u0017\u0010J\u001a\u0002052\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008J\u0010KJ\u0017\u0010L\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0003\u00a2\u0006\u0004\u0008L\u0010=J\u0017\u0010M\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008M\u0010=J#\u0010P\u001a\u0008\u0012\u0004\u0012\u00020/0N2\u000c\u0010O\u001a\u0008\u0012\u0004\u0012\u00020/0NH\u0002\u00a2\u0006\u0004\u0008P\u0010QJ\u0017\u0010R\u001a\u0002052\u0006\u00100\u001a\u00020/H\u0002\u00a2\u0006\u0004\u0008R\u0010SJ!\u0010W\u001a\u00020,2\u0006\u0010T\u001a\u00020:2\u0008\u0010V\u001a\u0004\u0018\u00010UH\u0002\u00a2\u0006\u0004\u0008W\u0010XJ\u0017\u0010[\u001a\u00020,2\u0006\u0010Z\u001a\u00020YH\u0003\u00a2\u0006\u0004\u0008[\u0010\\J\u0017\u0010]\u001a\u00020/2\u0006\u0010Z\u001a\u00020YH\u0002\u00a2\u0006\u0004\u0008]\u0010^J\u0019\u0010a\u001a\u0004\u0018\u00010B2\u0006\u0010`\u001a\u00020_H\u0002\u00a2\u0006\u0004\u0008a\u0010bJ\u0015\u0010e\u001a\u00020,2\u0006\u0010d\u001a\u00020c\u00a2\u0006\u0004\u0008e\u0010fJ\r\u0010g\u001a\u00020,\u00a2\u0006\u0004\u0008g\u0010.J\'\u0010j\u001a\u00020,2\u000c\u0010h\u001a\u0008\u0012\u0004\u0012\u00020/0N2\u0008\u0008\u0002\u0010i\u001a\u000205H\u0007\u00a2\u0006\u0004\u0008j\u0010kJ\u001d\u0010m\u001a\u00020,2\u000c\u0010l\u001a\u0008\u0012\u0004\u0012\u00020/0NH\u0007\u00a2\u0006\u0004\u0008m\u0010nJ\r\u0010p\u001a\u00020o\u00a2\u0006\u0004\u0008p\u0010qJ\u0015\u0010s\u001a\u00020,2\u0006\u0010r\u001a\u000205\u00a2\u0006\u0004\u0008s\u0010tJ;\u0010y\u001a\u00020v2\u0006\u0010;\u001a\u00020:2\u0006\u0010`\u001a\u00020_2\u0006\u0010u\u001a\u00020B2\u0008\u0010w\u001a\u0004\u0018\u00010v2\u0008\u0010x\u001a\u0004\u0018\u00010\u0003H\u0016\u00a2\u0006\u0004\u0008y\u0010zJ+\u0010}\u001a\u0004\u0018\u00010v2\u0006\u0010;\u001a\u00020:2\u0006\u0010|\u001a\u00020{2\u0008\u0010x\u001a\u0004\u0018\u00010\u0003H\u0016\u00a2\u0006\u0004\u0008}\u0010~J$\u0010\u0080\u0001\u001a\u00020,2\u0006\u0010;\u001a\u00020:2\u0008\u0010\u007f\u001a\u0004\u0018\u00010vH\u0016\u00a2\u0006\u0006\u0008\u0080\u0001\u0010\u0081\u0001J$\u0010\u0082\u0001\u001a\u00020,2\u0006\u0010;\u001a\u00020:2\u0008\u0010\u007f\u001a\u0004\u0018\u00010vH\u0016\u00a2\u0006\u0006\u0008\u0082\u0001\u0010\u0081\u0001J \u0010\u0084\u0001\u001a\u00020,2\r\u0010\u0083\u0001\u001a\u0008\u0012\u0004\u0012\u00020/0NH\u0007\u00a2\u0006\u0005\u0008\u0084\u0001\u0010nJ>\u0010\u008b\u0001\u001a\u00020,2\u0007\u0010\u0085\u0001\u001a\u00020B2\u0015\u0010\u0088\u0001\u001a\u0010\u0012\u0004\u0012\u00020B\u0012\u0005\u0012\u00030\u0087\u00010\u0086\u00012\n\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0089\u0001H\u0007\u00a2\u0006\u0006\u0008\u008b\u0001\u0010\u008c\u0001JR\u0010\u008f\u0001\u001a\u00020,2\u0015\u0010\u008d\u0001\u001a\u0010\u0012\u0004\u0012\u00020B\u0012\u0005\u0012\u00030\u0087\u00010\u0086\u00012\u001b\u0010\u008e\u0001\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020B\u0012\u0005\u0012\u00030\u0087\u00010\u0086\u00010N2\n\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0089\u0001H\u0007\u00a2\u0006\u0006\u0008\u008f\u0001\u0010\u0090\u0001JD\u0010\u0093\u0001\u001a\u00020,2$\u0010\u0091\u0001\u001a\u001f\u0012\u0004\u0012\u00020B\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020B\u0012\u0007\u0012\u0005\u0018\u00010\u0087\u00010\u0086\u00010\u0086\u00012\n\u0010\u0092\u0001\u001a\u0005\u0018\u00010\u0089\u0001H\u0007\u00a2\u0006\u0006\u0008\u0093\u0001\u0010\u0094\u0001J+\u0010\u0096\u0001\u001a\u00020,2\r\u0010\u0095\u0001\u001a\u0008\u0012\u0004\u0012\u00020/0N2\n\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0089\u0001\u00a2\u0006\u0006\u0008\u0096\u0001\u0010\u0097\u0001J+\u0010\u0099\u0001\u001a\u00020,2\r\u0010\u0098\u0001\u001a\u0008\u0012\u0004\u0012\u00020/0N2\n\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0089\u0001\u00a2\u0006\u0006\u0008\u0099\u0001\u0010\u0097\u0001J+\u0010\u009b\u0001\u001a\u00020,2\r\u0010\u009a\u0001\u001a\u0008\u0012\u0004\u0012\u00020/0N2\n\u0010\u008a\u0001\u001a\u0005\u0018\u00010\u0089\u0001\u00a2\u0006\u0006\u0008\u009b\u0001\u0010\u0097\u0001J\u000f\u0010\u009c\u0001\u001a\u00020,\u00a2\u0006\u0005\u0008\u009c\u0001\u0010.J\u0019\u0010\u009d\u0001\u001a\u00020,2\u0006\u0010;\u001a\u00020:H\u0016\u00a2\u0006\u0005\u0008\u009d\u0001\u0010=J\u0011\u0010\u009e\u0001\u001a\u00020,H\u0007\u00a2\u0006\u0005\u0008\u009e\u0001\u0010.R\u0016\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u009d\u0001\u0010\u009f\u0001R\u0016\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a0\u0001\u0010\u00a1\u0001R\u0016\u0010\u0008\u001a\u00020\u00078\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a2\u0001\u0010\u00a3\u0001R\u0016\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a4\u0001\u0010\u00a5\u0001R\u0016\u0010\u000c\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a6\u0001\u0010\u00a7\u0001R\u0016\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a8\u0001\u0010\u00a9\u0001R\u0016\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00aa\u0001\u0010\u00ab\u0001R\u0016\u0010\u0014\u001a\u00020\u00138\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00ac\u0001\u0010\u00ad\u0001R\u0016\u0010\u0016\u001a\u00020\u00158\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00ae\u0001\u0010\u00af\u0001R\u0016\u0010\u0018\u001a\u00020\u00178\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b0\u0001\u0010\u00b1\u0001R\u0016\u0010\u001a\u001a\u00020\u00198\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b2\u0001\u0010\u00b3\u0001R\u0016\u0010\u001c\u001a\u00020\u001b8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b4\u0001\u0010\u00b5\u0001R\u0016\u0010\u001e\u001a\u00020\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b6\u0001\u0010\u00b7\u0001R\u001b\u0010!\u001a\u0008\u0012\u0004\u0012\u00020 0\u001f8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008-\u0010\u00b8\u0001R\u001c\u0010#\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001f8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b9\u0001\u0010\u00b8\u0001R\u0016\u0010%\u001a\u00020$8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00ba\u0001\u0010\u00bb\u0001R\u0016\u0010\'\u001a\u00020&8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00bc\u0001\u0010\u00bd\u0001R\u0016\u0010)\u001a\u00020(8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00be\u0001\u0010\u00bf\u0001R\"\u0010\u00c3\u0001\u001a\u000b\u0012\u0004\u0012\u00020c\u0018\u00010\u00c0\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00c1\u0001\u0010\u00c2\u0001R\"\u0010\u00c8\u0001\u001a\t\u0012\u0004\u0012\u00020,0\u00c4\u00018\u0006\u00a2\u0006\u000f\n\u0005\u00081\u0010\u00c5\u0001\u001a\u0006\u0008\u00c6\u0001\u0010\u00c7\u0001R\"\u0010\u00cc\u0001\u001a\r \u00ca\u0001*\u0005\u0018\u00010\u00c9\u00010\u00c9\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0084\u0001\u0010\u00cb\u0001R\u001f\u0010\u00ce\u0001\u001a\u000b \u00ca\u0001*\u0004\u0018\u00010B0B8\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u00086\u0010\u00cd\u0001R\u0019\u0010\u00d1\u0001\u001a\u00030\u00cf\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u00088\u0010\u00d0\u0001R\u001d\u0010\u00d3\u0001\u001a\u0008\u0012\u0004\u0012\u00020B0A8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u009e\u0001\u0010\u00d2\u0001\u00a8\u0006\u00d6\u0001"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/InAppController;",
        "Ll/arm;",
        "Ll/ec60;",
        "Landroid/content/Context;",
        "context",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "config",
        "Ll/su3;",
        "executors",
        "Ll/w36;",
        "controllerManager",
        "Ll/ch2;",
        "callbackManager",
        "Ll/sk0;",
        "analyticsManager",
        "Ll/bu9;",
        "coreMetaData",
        "Lcom/clevertap/android/sdk/ManifestInfo;",
        "manifestInfo",
        "Ll/uzd;",
        "deviceInfo",
        "Ll/csm;",
        "inAppQueue",
        "Ll/s3f;",
        "evaluationManager",
        "Ll/cqi0;",
        "templatesManager",
        "Lcom/clevertap/android/sdk/inapp/a;",
        "inAppActionHandler",
        "Lcom/clevertap/android/sdk/inapp/b;",
        "inAppNotificationInflater",
        "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "inAppDelayManager",
        "Ll/zpm;",
        "inAppInActionManager",
        "Ll/oa5;",
        "clock",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "networkMonitor",
        "Ll/ab60;",
        "pipManager",
        "<init>",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/su3;Ll/w36;Ll/ch2;Ll/sk0;Ll/bu9;Lcom/clevertap/android/sdk/ManifestInfo;Ll/uzd;Ll/csm;Ll/s3f;Ll/cqi0;Lcom/clevertap/android/sdk/inapp/a;Lcom/clevertap/android/sdk/inapp/b;Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ll/oa5;Lcom/clevertap/android/sdk/network/NetworkMonitor;Ll/ab60;)V",
        "",
        "n",
        "()V",
        "Lorg/json/JSONObject;",
        "inApp",
        "t",
        "(Lorg/json/JSONObject;)V",
        "Landroid/app/Activity;",
        "activity",
        "",
        "v",
        "(Landroid/app/Activity;)Z",
        "w",
        "()Z",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
        "inAppNotification",
        "C",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V",
        "N",
        "jsonObject",
        "U",
        "",
        "",
        "H",
        "(Lcom/clevertap/android/sdk/ManifestInfo;)Ljava/util/Set;",
        "A",
        "J",
        "L",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V",
        "z",
        "y",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Z",
        "c0",
        "W",
        "",
        "inAppNotifications",
        "F",
        "(Ljava/util/List;)Ljava/util/List;",
        "M",
        "(Lorg/json/JSONObject;)Z",
        "notification",
        "Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;",
        "templateInAppData",
        "e0",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V",
        "",
        "targetId",
        "E",
        "(J)V",
        "B",
        "(J)Lorg/json/JSONObject;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppAction;",
        "action",
        "D",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppAction;)Ljava/lang/String;",
        "Ll/qqm;",
        "display",
        "Y",
        "(Ll/qqm;)V",
        "f0",
        "delayedInApps",
        "shouldUpdateTTL",
        "Z",
        "(Ljava/util/List;Z)V",
        "inActionMetadata",
        "b0",
        "(Ljava/util/List;)V",
        "",
        "G",
        "()I",
        "showFallbackSettings",
        "X",
        "(Z)V",
        "callToAction",
        "Landroid/os/Bundle;",
        "additionalData",
        "activityContext",
        "A0",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/CTInAppAction;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/Context;)Landroid/os/Bundle;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;",
        "button",
        "V",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;Landroid/content/Context;)Landroid/os/Bundle;",
        "formData",
        "K",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Landroid/os/Bundle;)V",
        "t0",
        "inappNotifs",
        "u",
        "eventName",
        "",
        "",
        "eventProperties",
        "Landroid/location/Location;",
        "userLocation",
        "S",
        "(Ljava/lang/String;Ljava/util/Map;Landroid/location/Location;)V",
        "chargeDetails",
        "items",
        "R",
        "(Ljava/util/Map;Ljava/util/List;Landroid/location/Location;)V",
        "userAttributeChangedProperties",
        "location",
        "T",
        "(Ljava/util/Map;Landroid/location/Location;)V",
        "appLaunchServerSideInApps",
        "P",
        "(Ljava/util/List;Landroid/location/Location;)V",
        "appLaunchServerSideInactionInApps",
        "Q",
        "appLaunchServerSideDelayedInApps",
        "O",
        "d0",
        "a",
        "x",
        "Landroid/content/Context;",
        "b",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "c",
        "Ll/su3;",
        "d",
        "Ll/w36;",
        "e",
        "Ll/ch2;",
        "f",
        "Ll/sk0;",
        "g",
        "Ll/bu9;",
        "h",
        "Ll/uzd;",
        "i",
        "Ll/csm;",
        "j",
        "Ll/s3f;",
        "k",
        "Ll/cqi0;",
        "l",
        "Lcom/clevertap/android/sdk/inapp/a;",
        "m",
        "Lcom/clevertap/android/sdk/inapp/b;",
        "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "o",
        "p",
        "Ll/oa5;",
        "q",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "r",
        "Ll/ab60;",
        "Ljava/lang/ref/WeakReference;",
        "s",
        "Ljava/lang/ref/WeakReference;",
        "inAppDisplayListener",
        "Lkotlin/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "I",
        "()Lkotlin/jvm/functions/Function0;",
        "onAppLaunchEventSent",
        "Lcom/clevertap/android/sdk/Logger;",
        "kotlin.jvm.PlatformType",
        "Lcom/clevertap/android/sdk/Logger;",
        "logger",
        "Ljava/lang/String;",
        "defaultLogTag",
        "Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;",
        "Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;",
        "inAppState",
        "Ljava/util/Set;",
        "inAppExcludedActivityNames",
        "Companion",
        "InAppState",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/clevertap/android/sdk/inapp/InAppController$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/su3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ll/w36;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ll/ch2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ll/sk0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Ll/bu9;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final h:Ll/uzd;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final i:Ll/csm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final j:Ll/s3f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final k:Ll/cqi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final l:Lcom/clevertap/android/sdk/inapp/a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final m:Lcom/clevertap/android/sdk/inapp/b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final n:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final o:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Ll/zpm;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final p:Ll/oa5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final q:Lcom/clevertap/android/sdk/network/NetworkMonitor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final r:Ll/ab60;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private s:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/qqm;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final t:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final u:Lcom/clevertap/android/sdk/Logger;

.field private final v:Ljava/lang/String;

.field private volatile w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final x:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/InAppController$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->Companion:Lcom/clevertap/android/sdk/inapp/InAppController$a;

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/su3;Ll/w36;Ll/ch2;Ll/sk0;Ll/bu9;Lcom/clevertap/android/sdk/ManifestInfo;Ll/uzd;Ll/csm;Ll/s3f;Ll/cqi0;Lcom/clevertap/android/sdk/inapp/a;Lcom/clevertap/android/sdk/inapp/b;Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ll/oa5;Lcom/clevertap/android/sdk/network/NetworkMonitor;Ll/ab60;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/su3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/w36;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/ch2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ll/sk0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Ll/bu9;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Lcom/clevertap/android/sdk/ManifestInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Ll/uzd;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p10    # Ll/csm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p11    # Ll/s3f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p12    # Ll/cqi0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p13    # Lcom/clevertap/android/sdk/inapp/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p14    # Lcom/clevertap/android/sdk/inapp/b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p15    # Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p16    # Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p17    # Ll/oa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p18    # Lcom/clevertap/android/sdk/network/NetworkMonitor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p19    # Ll/ab60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
            "Ll/su3;",
            "Ll/w36;",
            "Ll/ch2;",
            "Ll/sk0;",
            "Ll/bu9;",
            "Lcom/clevertap/android/sdk/ManifestInfo;",
            "Ll/uzd;",
            "Ll/csm;",
            "Ll/s3f;",
            "Ll/cqi0;",
            "Lcom/clevertap/android/sdk/inapp/a;",
            "Lcom/clevertap/android/sdk/inapp/b;",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
            ">;",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Ll/zpm;",
            ">;",
            "Ll/oa5;",
            "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
            "Ll/ab60;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p16 .. p16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p17 .. p17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p18 .. p18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p19 .. p19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->a:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 4
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 5
    iput-object p4, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->d:Ll/w36;

    .line 6
    iput-object p5, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 7
    iput-object p6, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->f:Ll/sk0;

    .line 8
    iput-object p7, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->g:Ll/bu9;

    .line 9
    iput-object p9, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 10
    iput-object p10, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->i:Ll/csm;

    .line 11
    iput-object p11, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 12
    iput-object p12, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 13
    iput-object p13, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->l:Lcom/clevertap/android/sdk/inapp/a;

    .line 14
    iput-object p14, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->m:Lcom/clevertap/android/sdk/inapp/b;

    .line 15
    iput-object p15, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->n:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    move-object/from16 p1, p16

    .line 16
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->o:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    move-object/from16 p1, p17

    .line 17
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->p:Ll/oa5;

    move-object/from16 p1, p18

    .line 18
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->q:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    move-object/from16 p1, p19

    .line 19
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->r:Ll/ab60;

    .line 20
    new-instance p1, Ll/gqm;

    invoke-direct {p1, p0}, Ll/gqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->t:Lkotlin/jvm/functions/Function0;

    .line 21
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    move-result-object p1

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 22
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 23
    sget-object p1, Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;->RESUMED:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 24
    invoke-direct {p0, p8}, Lcom/clevertap/android/sdk/inapp/InAppController;->H(Lcom/clevertap/android/sdk/ManifestInfo;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->x:Ljava/util/Set;

    return-void
.end method

.method private final A()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "checking Pending Notifications"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return v2

    .line 25
    :cond_0
    :try_start_1
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->z(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    monitor-exit v0

    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    monitor-exit v0

    .line 42
    throw p0
.end method

.method private final B(J)Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "evtName"

    .line 7
    .line 8
    const-string v1, "wzrk_fetch"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "t"

    .line 19
    .line 20
    const/4 v2, 0x6

    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v1, "tgtId"

    .line 25
    .line 26
    invoke-virtual {v0, v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 30
    .line 31
    const-string p1, "evtData"

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method private final C(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/su3;->c()Lcom/clevertap/android/sdk/task/Task;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/eqm;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/eqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "InAppController:displayNotification"

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->R()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->l:Lcom/clevertap/android/sdk/inapp/a;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/a;->b()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 49
    .line 50
    const-string v1, "Not showing push permission request, permission is already granted"

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->l:Lcom/clevertap/android/sdk/inapp/a;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/a;->h()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->z(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-direct {p0, v0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->L(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private final D(Lcom/clevertap/android/sdk/inapp/CTInAppAction;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->g()Lcom/clevertap/android/sdk/inapp/InAppActionType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppActionType;->OPEN_URL:Lcom/clevertap/android/sdk/inapp/InAppActionType;

    .line 6
    .line 7
    if-ne p0, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-object p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method private final E(J)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "Fetching in-action in-app content for targetId: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->B(J)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->f:Ll/sk0;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/sk0;->S(Lorg/json/JSONObject;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private final F(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;)",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Ljava/lang/Iterable;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    move-object v2, v1

    .line 23
    check-cast v2, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {p0, v2}, Lcom/clevertap/android/sdk/inapp/InAppController;->M(Lorg/json/JSONObject;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method

.method private final H(Lcom/clevertap/android/sdk/ManifestInfo;)Ljava/util/Set;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/ManifestInfo;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/ManifestInfo;->i()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    const-string p1, ","

    .line 13
    .line 14
    filled-new-array {p1}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v5, 0x6

    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_0

    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 63
    .line 64
    new-instance v9, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v1, "In-app notifications will not be shown on "

    .line 67
    .line 68
    invoke-direct {v9, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const/16 v7, 0x3f

    .line 72
    .line 73
    const/4 v8, 0x0

    .line 74
    const/4 v1, 0x0

    .line 75
    const/4 v2, 0x0

    .line 76
    const/4 v3, 0x0

    .line 77
    const/4 v4, 0x0

    .line 78
    const/4 v5, 0x0

    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-static/range {v0 .. v8}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p1, p0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method private final J(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "Running inAppDidDismiss"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object v0, v1

    .line 25
    :goto_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    sput-object v1, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->A()Z

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private final L(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->P()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/uzd;->a0()V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/su3;->a()Lcom/clevertap/android/sdk/task/Task;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/fqm;

    .line 19
    .line 20
    invoke-direct {v0, p1, p0}, Ll/fqm;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/InAppController;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "InAppController#incrementLocalInAppCountInPersistentStore"

    .line 24
    .line 25
    invoke-virtual {p2, p0, v0}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private final M(Lorg/json/JSONObject;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->CREATOR:Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData$a;->a(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->e()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/cqi0;->f(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_1
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "Template with name \""

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p1, "\" is not registered and cannot be presented"

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v1, "CustomTemplates"

    .line 52
    .line 53
    invoke-virtual {p0, v1, p1}, Lcom/clevertap/android/sdk/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return v0
.end method

.method private final N(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "Unable to process inapp notification "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->i()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->e()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/cqi0;->e(Ljava/lang/String;)Ll/c0c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 v0, 0x0

    .line 53
    :goto_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 56
    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v4, "Notification ready: "

    .line 60
    .line 61
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v1, v2, v3}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/c0c;->g()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->W(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->C(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private final U(Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "Preparing In-App for display: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->m:Lcom/clevertap/android/sdk/inapp/b;

    .line 23
    .line 24
    new-instance v1, Lcom/clevertap/android/sdk/inapp/InAppController$c;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/clevertap/android/sdk/inapp/InAppController$c;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "InappController#prepareNotificationForDisplay"

    .line 30
    .line 31
    invoke-virtual {v0, p1, p0, v1}, Lcom/clevertap/android/sdk/inapp/b;->d(Lorg/json/JSONObject;Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/b$a;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private final W(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 2
    .line 3
    sget-object v1, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->Companion:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 8
    .line 9
    invoke-virtual {v1, v2, v3}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;->a(Landroid/content/Context;Ll/axl;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, p1, p0, v1}, Ll/cqi0;->g(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ll/arm;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a0(Lcom/clevertap/android/sdk/inapp/InAppController;Ljava/util/List;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->Z(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/InAppController;Ll/zpm;)Lkotlin/Unit;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    instance-of v0, p1, Ll/zpm$d;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v3, "[InAppController]: In-action duration expired for targetId: "

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p1, Ll/zpm$d;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/zpm$d;->a()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, ", calling fetch API"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ll/zpm$d;->a()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    invoke-direct {p0, v0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->E(J)V

    .line 48
    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_0
    instance-of v0, p1, Ll/zpm$c;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "[InAppController]Error scheduling in-action in-app: "

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    check-cast p1, Ll/zpm$c;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/zpm$c;->a()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v2, " for targetId: "

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ll/zpm$c;->b()J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    instance-of v0, p1, Ll/zpm$a;

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 103
    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v2, "[InAppController]In-action in-app cancelled for targetId: "

    .line 107
    .line 108
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    check-cast p1, Ll/zpm$a;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/zpm$a;->a()J

    .line 114
    .line 115
    .line 116
    move-result-wide v2

    .line 117
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_2
    instance-of v0, p1, Ll/zpm$b;

    .line 129
    .line 130
    if-eqz v0, :cond_3

    .line 131
    .line 132
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v2, "[InAppController]In-action: in-app discarded "

    .line 139
    .line 140
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    check-cast p1, Ll/zpm$b;

    .line 144
    .line 145
    invoke-virtual {p1}, Ll/zpm$b;->b()J

    .line 146
    .line 147
    .line 148
    move-result-wide v2

    .line 149
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v2, ": "

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Ll/zpm$b;->a()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 172
    .line 173
    return-object p0

    .line 174
    :cond_3
    invoke-static {}, Ll/nbr;->a()V

    .line 175
    .line 176
    .line 177
    const/4 p0, 0x0

    .line 178
    return-object p0
.end method

.method public static c(Lcom/clevertap/android/sdk/inapp/InAppController;ZLcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)Lkotlin/Unit;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    instance-of v0, p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "[InAppController]: Successfully retrieved delayed in-app "

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v3, p2

    .line 27
    check-cast v3, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 44
    .line 45
    const-string v1, "TAG_FEATURE_IN_APPS"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "InAppController#executeDelayedInAppCallback-"

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;->b()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v2, Ll/mqm;

    .line 70
    .line 71
    invoke-direct {v2, p1, p0, p2}, Ll/mqm;-><init>(ZLcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    instance-of p1, p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;

    .line 79
    .line 80
    const-string v0, ": "

    .line 81
    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v2, "[InAppController]: Error for delayed in-app "

    .line 95
    .line 96
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    check-cast p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;

    .line 100
    .line 101
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;->a()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;->b()Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;->c()Ljava/lang/Throwable;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p1, p0, v0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    instance-of p1, p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;

    .line 131
    .line 132
    if-eqz p1, :cond_2

    .line 133
    .line 134
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v2, "[InAppController]: in-app discarded "

    .line 145
    .line 146
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    check-cast p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;

    .line 150
    .line 151
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;->a()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$a;->b()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 176
    .line 177
    return-object p0

    .line 178
    :cond_2
    invoke-static {}, Ll/nbr;->a()V

    .line 179
    .line 180
    .line 181
    const/4 p0, 0x0

    .line 182
    return-object p0
.end method

.method private final c0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 8
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const-string v0, "Displaying PIP In-App: "

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->y(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "Application has decided to not show this in-app notification: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, v1, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 39
    .line 40
    sget-object v2, Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;->DISCARDED:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 41
    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "InApp Notifications are set to be discarded at main thread check, not showing the InApp Notification"

    .line 49
    .line 50
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-static {}, Ll/bu9;->x()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 68
    .line 69
    const-string v0, "Not in foreground, queueing this In App"

    .line 70
    .line 71
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    sget-object v1, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 87
    .line 88
    const-string v0, "In App already displaying, queueing this In App"

    .line 89
    .line 90
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    invoke-static {}, Ll/bu9;->i()Landroid/app/Activity;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-direct {p0, v3}, Lcom/clevertap/android/sdk/inapp/InAppController;->v(Landroid/app/Activity;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_4

    .line 103
    .line 104
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 112
    .line 113
    const-string v0, "Not showing In App on blacklisted activity, queuing this In App"

    .line 114
    .line 115
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_4
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 120
    .line 121
    sget-object v2, Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;->SUSPENDED:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 122
    .line 123
    if-ne v1, v2, :cond_5

    .line 124
    .line 125
    sget-object v0, Lcom/clevertap/android/sdk/inapp/InAppController;->y:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 133
    .line 134
    const-string v0, "InApp Notifications are set to be suspended at main thread check, queuing the In App"

    .line 135
    .line 136
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_5
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->p:Ll/oa5;

    .line 141
    .line 142
    invoke-interface {v1}, Ll/oa5;->currentTimeMillis()J

    .line 143
    .line 144
    .line 145
    move-result-wide v1

    .line 146
    const-wide/16 v4, 0x3e8

    .line 147
    .line 148
    div-long/2addr v1, v4

    .line 149
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->A()J

    .line 150
    .line 151
    .line 152
    move-result-wide v4

    .line 153
    cmp-long v1, v1, v4

    .line 154
    .line 155
    if-lez v1, :cond_6

    .line 156
    .line 157
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 158
    .line 159
    const-string p1, "InApp has elapsed its time to live, not showing the InApp"

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_6
    const-string v1, "custom-html"

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->F()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_7

    .line 176
    .line 177
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->q:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 178
    .line 179
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->n()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-nez v1, :cond_7

    .line 184
    .line 185
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 186
    .line 187
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 188
    .line 189
    const-string v1, "Not showing HTML InApp due to no internet. An active internet connection is required to display the HTML InApp"

    .line 190
    .line 191
    invoke-virtual {p1, v0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_7
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 199
    .line 200
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 201
    .line 202
    const-string v4, "Attempting to show next In-App"

    .line 203
    .line 204
    invoke-virtual {v1, v2, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    sput-object p1, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 208
    .line 209
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->r()Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    if-nez v1, :cond_8

    .line 214
    .line 215
    const/4 v2, -0x1

    .line 216
    goto :goto_0

    .line 217
    :cond_8
    sget-object v2, Lcom/clevertap/android/sdk/inapp/InAppController$b;->b:[I

    .line 218
    .line 219
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    aget v2, v2, v4

    .line 224
    .line 225
    :goto_0
    const/4 v7, 0x0

    .line 226
    const-string v4, "Displaying In-App: "

    .line 227
    .line 228
    packed-switch v2, :pswitch_data_0

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 234
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    .line 236
    .line 237
    const-string v2, "Unknown InApp Type found: "

    .line 238
    .line 239
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 253
    .line 254
    return-void

    .line 255
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->W(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :pswitch_1
    if-eqz v3, :cond_a

    .line 260
    .line 261
    :try_start_0
    new-instance v1, Lcom/clevertap/android/sdk/inapp/d;

    .line 262
    .line 263
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 264
    .line 265
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 266
    .line 267
    .line 268
    invoke-direct {v1, p1, p0, p0, v2}, Lcom/clevertap/android/sdk/inapp/d;-><init>(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ll/arm;Ll/ec60;Ll/axl;)V

    .line 269
    .line 270
    .line 271
    sget-object v2, Lcom/clevertap/android/sdk/inapp/c;->INSTANCE:Lcom/clevertap/android/sdk/inapp/c;

    .line 272
    .line 273
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 274
    .line 275
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v2, p1, v1, v4}, Lcom/clevertap/android/sdk/inapp/c;->a(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ll/m960;Ll/axl;)Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 279
    .line 280
    .line 281
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 283
    .line 284
    if-nez v1, :cond_9

    .line 285
    .line 286
    :try_start_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 287
    .line 288
    const-string v0, "Failed to create PIPConfig, skipping"

    .line 289
    .line 290
    invoke-virtual {v2, p1, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 294
    .line 295
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :catchall_0
    move-exception v0

    .line 300
    move-object p1, v0

    .line 301
    goto :goto_1

    .line 302
    :cond_9
    new-instance v4, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-virtual {v2, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->r:Ll/ab60;

    .line 322
    .line 323
    invoke-virtual {p1, v3, v1, v7}, Ll/ab60;->F(Landroid/app/Activity;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/ker;)V

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 328
    .line 329
    const-string v0, "Current activity reference not found for PIP"

    .line 330
    .line 331
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 335
    :goto_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 336
    .line 337
    const-string v1, "Failed to show PIP in-app"

    .line 338
    .line 339
    invoke-virtual {v0, v1, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 340
    .line 341
    .line 342
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 343
    .line 344
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :pswitch_2
    new-instance v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;

    .line 349
    .line 350
    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;-><init>()V

    .line 351
    .line 352
    .line 353
    :goto_2
    move-object v2, v0

    .line 354
    goto :goto_3

    .line 355
    :pswitch_3
    new-instance v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;

    .line 356
    .line 357
    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;-><init>()V

    .line 358
    .line 359
    .line 360
    goto :goto_2

    .line 361
    :pswitch_4
    new-instance v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppHtmlHeaderFragment;

    .line 362
    .line 363
    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppHtmlHeaderFragment;-><init>()V

    .line 364
    .line 365
    .line 366
    goto :goto_2

    .line 367
    :pswitch_5
    new-instance v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppHtmlFooterFragment;

    .line 368
    .line 369
    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppHtmlFooterFragment;-><init>()V

    .line 370
    .line 371
    .line 372
    goto :goto_2

    .line 373
    :goto_3
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 374
    .line 375
    if-nez v3, :cond_b

    .line 376
    .line 377
    const-string p0, "Unable to display In-App: Activity/Fragment is null"

    .line 378
    .line 379
    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 383
    .line 384
    return-void

    .line 385
    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    sget-object v1, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->Companion:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment$b;

    .line 405
    .line 406
    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 407
    .line 408
    iget-object v6, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 411
    .line 412
    .line 413
    move-object v4, p1

    .line 414
    invoke-virtual/range {v1 .. v6}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment$b;->a(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;Landroid/app/Activity;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;)Z

    .line 415
    .line 416
    .line 417
    move-result p0

    .line 418
    if-nez p0, :cond_c

    .line 419
    .line 420
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 421
    .line 422
    :cond_c
    return-void

    .line 423
    :pswitch_6
    if-eqz v3, :cond_d

    .line 424
    .line 425
    :try_start_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 426
    .line 427
    new-instance v1, Ljava/lang/StringBuilder;

    .line 428
    .line 429
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 433
    .line 434
    .line 435
    move-result-object v2

    .line 436
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 447
    .line 448
    invoke-static {v3, p1, v0}, Lcom/clevertap/android/sdk/InAppNotificationActivity;->S0(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 449
    .line 450
    .line 451
    return-void

    .line 452
    :catchall_1
    move-exception v0

    .line 453
    move-object p1, v0

    .line 454
    goto :goto_4

    .line 455
    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 456
    .line 457
    const-string v0, "Current activity reference not found"

    .line 458
    .line 459
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 463
    :goto_4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 464
    .line 465
    const-string v0, "Please verify the integration of your app. It is not setup to support in-app notifications yet."

    .line 466
    .line 467
    invoke-virtual {p0, v0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 468
    .line 469
    .line 470
    sput-object v7, Lcom/clevertap/android/sdk/inapp/InAppController;->z:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 471
    .line 472
    return-void

    .line 473
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->J(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->n()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static e(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->C(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    return-object p0
.end method

.method private final e0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/cqi0;->e(Ljava/lang/String;)Ll/c0c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->a()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {p2, v2}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->g(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->b(Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 34
    .line 35
    const-string p1, "Failed to present custom template with name: "

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {v1}, Ll/c0c;->g()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->t(Lorg/json/JSONObject;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->U(Lorg/json/JSONObject;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 68
    .line 69
    const-string p1, "Cannot present non-registered template with name: "

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 80
    .line 81
    const-string p1, "Cannot present template without name."

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public static f(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->J(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->n()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static g(Lcom/clevertap/android/sdk/inapp/InAppController;Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/fsm;->Companion:Ll/fsm$a;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/fsm$a;->a(Lorg/json/JSONObject;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/s3f;->C(Ljava/util/List;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    xor-int/lit8 p0, p0, 0x1

    .line 23
    .line 24
    return p0
.end method

.method public static h(Lcom/clevertap/android/sdk/inapp/InAppController;)Lkotlin/Unit;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->g:Ll/bu9;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/bu9;->p()Landroid/location/Location;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v0, v2}, Ll/s3f;->n(Ljava/util/Map;Landroid/location/Location;)Ll/ha5;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/ha5;->b()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/util/Collection;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/ha5;->b()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {v0}, Ll/ha5;->a()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/util/Collection;

    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/ha5;->a()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x2

    .line 65
    const/4 v2, 0x0

    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-static {p0, v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/InAppController;->a0(Lcom/clevertap/android/sdk/inapp/InAppController;Ljava/util/List;ZILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 71
    .line 72
    return-object p0
.end method

.method public static i(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->c0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static j(ZLcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)Lkotlin/Unit;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "updating ttl for delayed in-apps"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 23
    .line 24
    move-object v0, p2

    .line 25
    check-cast v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;->a()Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x2

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {p0, v0, v2, v1, v2}, Ll/s3f;->N(Ll/s3f;Lorg/json/JSONObject;Ll/oa5;ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    check-cast p2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$b;->a()Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->t(Lorg/json/JSONObject;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 46
    .line 47
    return-object p0
.end method

.method public static k(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/InAppController;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/v5g0;->INSTANCE:Ll/v5g0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/uzd;->N()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const-string v1, "local_in_app_count"

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1, p1}, Ll/v5g0;->s(Landroid/content/Context;Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 21
    .line 22
    return-object p0
.end method

.method public static l(Lcom/clevertap/android/sdk/inapp/InAppController;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->n()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static m(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->d:Ll/w36;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/w36;->i()Ll/vqm;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v1, Ll/nqm;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/nqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1, v1}, Ll/vqm;->d(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lkotlin/jvm/functions/Function2;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "InApp has been rejected by FC, not showing "

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 60
    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v2, "InAppFCManager() is null, not showing "

    .line 64
    .line 65
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 83
    .line 84
    return-object p0
.end method

.method private final n()V
    .locals 3

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 8
    .line 9
    const-string v1, "Not showing notification on blacklisted activity"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 18
    .line 19
    sget-object v1, Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;->SUSPENDED:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 20
    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "InApp Notifications are set to be suspended, not showing the InApp Notification"

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->A()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->i:Ll/csm;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/csm;->b()Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    :goto_0
    return-void

    .line 49
    :cond_3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->w:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 50
    .line 51
    sget-object v2, Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;->DISCARDED:Lcom/clevertap/android/sdk/inapp/InAppController$InAppState;

    .line 52
    .line 53
    if-eq v1, v2, :cond_4

    .line 54
    .line 55
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->U(Lorg/json/JSONObject;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 62
    .line 63
    const-string v2, "InApp Notifications are set to be discarded, dropping the InApp Notification"

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :goto_1
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "InApp: Couldn\'t parse JSON array string from prefs"

    .line 74
    .line 75
    invoke-virtual {v1, p0, v2, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static final synthetic o(Lcom/clevertap/android/sdk/inapp/InAppController;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic p(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->n:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic q(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->o:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic r(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/Logger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic s(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->N(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final t(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->M(Lorg/json/JSONObject;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->i:Ll/csm;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/csm;->c(Lorg/json/JSONObject;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private final v(Landroid/app/Activity;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->x:Ljava/util/Set;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/String;

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    const/4 v3, 0x0

    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-static {p1, v1, v4, v2, v3}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    return v4

    .line 40
    :cond_2
    return v0
.end method

.method private final w()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/bu9;->i()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->v(Landroid/app/Activity;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final y(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ch2;->m()Ll/nrm;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method private final z(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/su3;->a()Lcom/clevertap/android/sdk/task/Task;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/kqm;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/kqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/task/Task;->f(Ll/vo50;)Lcom/clevertap/android/sdk/task/Task;

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/lqm;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/lqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "checkLimitsBeforeShowing"

    .line 21
    .line 22
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public A0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/CTInAppAction;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/Context;)Landroid/os/Bundle;
    .locals 2
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/CTInAppAction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    if-eqz p4, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-direct {v0, p4}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .line 22
    .line 23
    :goto_0
    const-string p4, "wzrk_id"

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, p4, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p4, "wzrk_c2a"

    .line 33
    .line 34
    invoke-virtual {v0, p4, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->D(Lcom/clevertap/android/sdk/inapp/CTInAppAction;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    if-eqz p3, :cond_2

    .line 42
    .line 43
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-nez p4, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const-string p4, "wzrk_dl"

    .line 51
    .line 52
    invoke-virtual {v0, p4, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->P()Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    const/4 p4, 0x1

    .line 60
    if-nez p3, :cond_3

    .line 61
    .line 62
    iget-object p3, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->f:Ll/sk0;

    .line 63
    .line 64
    invoke-virtual {p3, p4, p1, v0}, Ll/sk0;->I(ZLcom/clevertap/android/sdk/inapp/CTInAppNotification;Landroid/os/Bundle;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->g()Lcom/clevertap/android/sdk/inapp/InAppActionType;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    if-nez p3, :cond_4

    .line 72
    .line 73
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 74
    .line 75
    const-string p1, "Triggered in-app action without type"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_4
    sget-object v1, Lcom/clevertap/android/sdk/inapp/InAppController$b;->a:[I

    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    aget p3, v1, p3

    .line 88
    .line 89
    if-eq p3, p4, :cond_b

    .line 90
    .line 91
    const/4 v1, 0x2

    .line 92
    if-eq p3, v1, :cond_9

    .line 93
    .line 94
    const/4 p1, 0x3

    .line 95
    if-eq p3, p1, :cond_7

    .line 96
    .line 97
    const/4 p1, 0x4

    .line 98
    if-eq p3, p1, :cond_5

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_5
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->f()Ljava/util/HashMap;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    xor-int/2addr p2, p4

    .line 112
    if-ne p2, p4, :cond_6

    .line 113
    .line 114
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 115
    .line 116
    invoke-virtual {p2}, Ll/ch2;->l()Ll/krm;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    if-eqz p2, :cond_a

    .line 121
    .line 122
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/ch2;->l()Ll/krm;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-interface {p0, p1}, Ll/krm;->a(Ljava/util/HashMap;)V

    .line 129
    .line 130
    .line 131
    :cond_6
    return-object v0

    .line 132
    :cond_7
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->d()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-eqz p1, :cond_8

    .line 137
    .line 138
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->l:Lcom/clevertap/android/sdk/inapp/a;

    .line 139
    .line 140
    invoke-virtual {p0, p1, p5}, Lcom/clevertap/android/sdk/inapp/a;->i(Ljava/lang/String;Landroid/content/Context;)Z

    .line 141
    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_8
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 145
    .line 146
    const-string p1, "Cannot trigger open url action without url value"

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v0

    .line 152
    :cond_9
    sget-object p2, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeCustomCodeTemplate:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 153
    .line 154
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->r()Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    if-ne p2, p3, :cond_a

    .line 159
    .line 160
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->k:Ll/cqi0;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Ll/cqi0;->c(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 163
    .line 164
    .line 165
    :cond_a
    :goto_2
    return-object v0

    .line 166
    :cond_b
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->e()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->e0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;)V

    .line 171
    .line 172
    .line 173
    return-object v0
.end method

.method public final G()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->n:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final I()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->t:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->d:Ll/w36;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/w36;->i()Ll/vqm;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->i()Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/customtemplates/CustomTemplateInAppData;->e()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    :cond_0
    const-string p2, ""

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "InApp Dismissed: "

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const/16 v3, 0x20

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {v0, v1, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v2, "Not calling InApp Dismissed: "

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v2, " because InAppFCManager is null"

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p2, v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    :try_start_0
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 91
    .line 92
    invoke-virtual {p2}, Ll/ch2;->m()Ll/nrm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :catchall_0
    move-exception p2

    .line 97
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 100
    .line 101
    const-string v2, "Failed to call the in-app notification listener"

    .line 102
    .line 103
    invoke-virtual {v0, v1, v2, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    :goto_1
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 107
    .line 108
    const-string v0, "TAG_FEATURE_IN_APPS"

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance v0, Ll/dqm;

    .line 115
    .line 116
    invoke-direct {v0, p0, p1}, Ll/dqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 117
    .line 118
    .line 119
    const-string p0, "InappController#inAppNotificationDidDismiss"

    .line 120
    .line 121
    invoke-virtual {p2, p0, v0}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final O(Ljava/util/List;Landroid/location/Location;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1, v0, p2}, Ll/s3f;->o(Ljava/util/List;Ljava/util/Map;Landroid/location/Location;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    move-object p2, p1

    .line 24
    check-cast p2, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->Z(Ljava/util/List;Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final P(Ljava/util/List;Landroid/location/Location;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1, v0, p2}, Ll/s3f;->p(Ljava/util/List;Ljava/util/Map;Landroid/location/Location;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    move-object p2, p1

    .line 24
    check-cast p2, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final Q(Ljava/util/List;Landroid/location/Location;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1, v0, p2}, Ll/s3f;->p(Ljava/util/List;Ljava/util/Map;Landroid/location/Location;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    move-object p2, p1

    .line 24
    check-cast p2, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b0(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final R(Ljava/util/Map;Ljava/util/List;Landroid/location/Location;)V
    .locals 2
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;",
            "Landroid/location/Location;",
            ")V"
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
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 21
    .line 22
    invoke-virtual {p1, v0, p2, p3}, Ll/s3f;->q(Ljava/util/Map;Ljava/util/List;Landroid/location/Location;)Ll/l3f;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Ljava/util/Collection;

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    check-cast p2, Ljava/util/Collection;

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const/4 p3, 0x2

    .line 62
    const/4 v0, 0x0

    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-static {p0, p2, v1, p3, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->a0(Lcom/clevertap/android/sdk/inapp/InAppController;Ljava/util/List;ZILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    check-cast p2, Ljava/util/Collection;

    .line 72
    .line 73
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b0(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public final S(Ljava/lang/String;Ljava/util/Map;Landroid/location/Location;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/location/Location;",
            ")V"
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
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 21
    .line 22
    invoke-virtual {p2, p1, v0, p3}, Ll/s3f;->r(Ljava/lang/String;Ljava/util/Map;Landroid/location/Location;)Ll/l3f;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Ljava/util/Collection;

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    check-cast p2, Ljava/util/Collection;

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const/4 p3, 0x2

    .line 62
    const/4 v0, 0x0

    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-static {p0, p2, v1, p3, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->a0(Lcom/clevertap/android/sdk/inapp/InAppController;Ljava/util/List;ZILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    check-cast p2, Ljava/util/Collection;

    .line 72
    .line 73
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b0(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public final T(Ljava/util/Map;Landroid/location/Location;)V
    .locals 3
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/location/Location;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->h:Ll/uzd;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/uzd;->u()Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/wrq;->f(Lorg/json/JSONObject;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->j:Ll/s3f;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1, p2, v0}, Ll/s3f;->s(Ljava/util/Map;Landroid/location/Location;Ljava/util/Map;)Ll/l3f;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Ljava/util/Collection;

    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/l3f;->b()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p0, p2}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ljava/util/Collection;

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/l3f;->a()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const/4 v0, 0x2

    .line 59
    const/4 v1, 0x0

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-static {p0, p2, v2, v0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->a0(Lcom/clevertap/android/sdk/inapp/InAppController;Ljava/util/List;ZILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    check-cast p2, Ljava/util/Collection;

    .line 69
    .line 70
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_2

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/l3f;->c()Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b0(Ljava/util/List;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public V(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;Landroid/content/Context;)Landroid/os/Bundle;
    .locals 6
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
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
    iget-object v2, p2, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->action:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->d()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/4 v4, 0x0

    .line 18
    move-object v0, p0

    .line 19
    move-object v1, p1

    .line 20
    move-object v5, p3

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/clevertap/android/sdk/inapp/InAppController;->A0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Lcom/clevertap/android/sdk/inapp/CTInAppAction;Ljava/lang/String;Landroid/os/Bundle;Landroid/content/Context;)Landroid/os/Bundle;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final X(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->l:Lcom/clevertap/android/sdk/inapp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/a;->e(Z)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Y(Ll/qqm;)V
    .locals 1
    .param p1    # Ll/qqm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->s:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method

.method public final Z(Ljava/util/List;Z)V
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "[InAppController]: Scheduling "

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " delayed in-apps"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->n:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 39
    .line 40
    new-instance v1, Ll/iqm;

    .line 41
    .line 42
    invoke-direct {v1, p0, p2}, Ll/iqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1, v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public a(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v3, "PIP failed to show: "

    .line 11
    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->g()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 30
    .line 31
    const-string v1, "TAG_FEATURE_IN_APPS"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/oqm;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/oqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "InAppController#onPIPShowFailed"

    .line 43
    .line 44
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final b0(Ljava/util/List;)V
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "[InAppController]: Scheduling "

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " in-action in-apps"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->o:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 39
    .line 40
    new-instance v1, Ll/jqm;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/jqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1, v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->c:Ll/su3;

    .line 10
    .line 11
    const-string v1, "TAG_FEATURE_IN_APPS"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/hqm;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/hqm;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "InappController#showNotificationIfAvailable"

    .line 23
    .line 24
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    const-string v1, "Unregistering InAppDisplay Listener"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->s:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method

.method public t0(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->d:Ll/w36;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/w36;->i()Ll/vqm;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->a:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1}, Ll/vqm;->f(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->f:Ll/sk0;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1, p1, p2}, Ll/sk0;->I(ZLcom/clevertap/android/sdk/inapp/CTInAppNotification;Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    :try_start_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->e:Ll/ch2;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/ch2;->m()Ll/nrm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "Failed to call the in-app notification listener"

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final u(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->F(Ljava/util/List;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->i:Ll/csm;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/csm;->a(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->d0()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p1

    .line 18
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "InAppController: : InApp notification handling error."

    .line 23
    .line 24
    invoke-virtual {v0, p0, v1, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final x()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lkotlin/coroutines/Continuation;)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v1, v0, v2, v1}, Ll/vh3;->f(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->u:Lcom/clevertap/android/sdk/Logger;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController;->v:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "[InAppController]: Error cancelling scheduled in-apps"

    .line 18
    .line 19
    invoke-virtual {v1, p0, v2, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
