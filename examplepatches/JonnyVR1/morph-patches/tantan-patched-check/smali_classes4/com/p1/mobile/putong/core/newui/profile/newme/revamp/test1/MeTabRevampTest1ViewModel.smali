.class public final Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v1b0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$c;,
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/v1b0<",
        "Ll/ikx;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00c8\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008)\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u007f\n\u0002\u0018\u0002\n\u0002\u0008*\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0018\u0000 \u00d4\u00032\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0008\u00a9\u0001\u00d5\u0003\u00a4\u0001\u00b1\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\u000f\u0010\u000c\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\tJ\u000f\u0010\r\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\r\u0010\tJ\u000f\u0010\u000e\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\tJ\u0017\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001f\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u00112\u0006\u0010\u0015\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u0019J\u0019\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u001b\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0017\u0010\u001f\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u0019J\u0017\u0010 \u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008 \u0010\u0019J\u0017\u0010\"\u001a\u00020\u001c2\u0006\u0010!\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\"\u0010#J\u0015\u0010&\u001a\u0008\u0012\u0004\u0012\u00020%0$H\u0002\u00a2\u0006\u0004\u0008&\u0010\'J\u0017\u0010(\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008(\u0010\u0019J\u000f\u0010*\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008*\u0010+J\u000f\u0010,\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008,\u0010+J\u000f\u0010-\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008-\u0010\tJ\u000f\u0010.\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008.\u0010\tJ7\u00106\u001a\u0002052\u0006\u0010/\u001a\u00020%2\u0006\u00101\u001a\u0002002\u0006\u00102\u001a\u0002002\u0006\u00103\u001a\u0002002\u0006\u00104\u001a\u000200H\u0002\u00a2\u0006\u0004\u00086\u00107J]\u0010A\u001a\u00020\u00072\u0006\u00108\u001a\u00020\u00112\u0006\u00109\u001a\u00020\u00112\u0006\u0010:\u001a\u0002052\u0006\u0010;\u001a\u00020\u00112\u0006\u0010<\u001a\u0002002\u0006\u0010=\u001a\u0002052\u0006\u0010\u001b\u001a\u00020\u000f2\n\u0008\u0002\u0010?\u001a\u0004\u0018\u00010>2\u0008\u0008\u0002\u0010@\u001a\u000200H\u0002\u00a2\u0006\u0004\u0008A\u0010BJ!\u0010F\u001a\u00020E2\u0006\u0010!\u001a\u00020\u00112\u0008\u0008\u0002\u0010D\u001a\u00020CH\u0002\u00a2\u0006\u0004\u0008F\u0010GJ\u000f\u0010H\u001a\u00020EH\u0002\u00a2\u0006\u0004\u0008H\u0010IJ\u000f\u0010K\u001a\u00020JH\u0002\u00a2\u0006\u0004\u0008K\u0010LJ\u0017\u0010N\u001a\u00020\u00072\u0006\u0010M\u001a\u000200H\u0002\u00a2\u0006\u0004\u0008N\u0010OJ\u001f\u0010R\u001a\u00020\u00072\u0006\u0010P\u001a\u00020)2\u0006\u0010Q\u001a\u00020)H\u0002\u00a2\u0006\u0004\u0008R\u0010SJ\u0017\u0010V\u001a\u00020\u00072\u0006\u0010U\u001a\u00020TH\u0002\u00a2\u0006\u0004\u0008V\u0010WJ)\u0010]\u001a\u00020\u00072\u0006\u0010Y\u001a\u00020X2\u0008\u0010[\u001a\u0004\u0018\u00010Z2\u0006\u0010\u0010\u001a\u00020\\H\u0002\u00a2\u0006\u0004\u0008]\u0010^J\u000f\u0010_\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008_\u0010\tJ\u0017\u0010`\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\\H\u0002\u00a2\u0006\u0004\u0008`\u0010aJ\u001f\u0010c\u001a\u00020\u00072\u0006\u0010b\u001a\u00020X2\u0006\u0010\u0010\u001a\u00020\\H\u0002\u00a2\u0006\u0004\u0008c\u0010dJ\u001f\u0010i\u001a\u00020)2\u0006\u0010f\u001a\u00020e2\u0008\u0010h\u001a\u0004\u0018\u00010g\u00a2\u0006\u0004\u0008i\u0010jJ\r\u0010k\u001a\u00020\u0007\u00a2\u0006\u0004\u0008k\u0010\tJ\u0017\u0010m\u001a\u00020\u00072\u0006\u0010l\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008m\u0010nJ!\u0010o\u001a\u00020)2\u0006\u0010f\u001a\u00020e2\u0008\u0010h\u001a\u0004\u0018\u00010gH\u0016\u00a2\u0006\u0004\u0008o\u0010jJ\u000f\u0010p\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008p\u0010\tJ\u0015\u0010r\u001a\u00020\u00072\u0006\u0010q\u001a\u000200\u00a2\u0006\u0004\u0008r\u0010OJ\r\u0010s\u001a\u00020\u0007\u00a2\u0006\u0004\u0008s\u0010\tJ\u001b\u0010u\u001a\u00020\u00072\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020\u000f0$\u00a2\u0006\u0004\u0008u\u0010vJ\u0015\u0010w\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0011\u00a2\u0006\u0004\u0008w\u0010\u0019J\u000f\u0010x\u001a\u0004\u0018\u00010\u000f\u00a2\u0006\u0004\u0008x\u0010yJ\u0015\u0010|\u001a\u00020\u00072\u0006\u0010{\u001a\u00020z\u00a2\u0006\u0004\u0008|\u0010}J\u0018\u0010\u0080\u0001\u001a\u00020\u00072\u0006\u0010\u007f\u001a\u00020~\u00a2\u0006\u0006\u0008\u0080\u0001\u0010\u0081\u0001J\u0017\u0010\u0082\u0001\u001a\u00020\u00072\u0006\u0010{\u001a\u00020z\u00a2\u0006\u0005\u0008\u0082\u0001\u0010}J\u000f\u0010\u0083\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0083\u0001\u0010\tJ\u000f\u0010\u0084\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0084\u0001\u0010\tJ\u0017\u0010\u0085\u0001\u001a\u00020\u00072\u0006\u0010{\u001a\u00020z\u00a2\u0006\u0005\u0008\u0085\u0001\u0010}J\u0018\u0010\u0087\u0001\u001a\u00020\u00072\u0007\u0010\u0086\u0001\u001a\u000200\u00a2\u0006\u0005\u0008\u0087\u0001\u0010OJ\u000f\u0010\u0088\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0088\u0001\u0010\tJ<\u0010\u008d\u0001\u001a\u00020\u00072\u0007\u0010\u0089\u0001\u001a\u00020T2\u0007\u0010\u008a\u0001\u001a\u00020T2\u0007\u0010\u008b\u0001\u001a\u00020T2\u0006\u0010U\u001a\u00020T2\u0007\u0010\u008c\u0001\u001a\u000200\u00a2\u0006\u0006\u0008\u008d\u0001\u0010\u008e\u0001J\u000f\u0010\u008f\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u008f\u0001\u0010\tJ\u0017\u0010\u0090\u0001\u001a\u00020\u00072\u0006\u0010{\u001a\u00020z\u00a2\u0006\u0005\u0008\u0090\u0001\u0010}J\u000f\u0010\u0091\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0091\u0001\u0010\tJ\u001a\u0010\u0094\u0001\u001a\u00020\u00072\u0008\u0010\u0093\u0001\u001a\u00030\u0092\u0001\u00a2\u0006\u0006\u0008\u0094\u0001\u0010\u0095\u0001J\u0011\u0010\u0096\u0001\u001a\u00020\u0007H\u0016\u00a2\u0006\u0005\u0008\u0096\u0001\u0010\tJ\u000f\u0010\u0097\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0097\u0001\u0010\tJ\u000f\u0010\u0098\u0001\u001a\u00020\u0007\u00a2\u0006\u0005\u0008\u0098\u0001\u0010\tJ\u001c\u0010\u009b\u0001\u001a\u00020\u00072\n\u0010\u009a\u0001\u001a\u0005\u0018\u00010\u0099\u0001\u00a2\u0006\u0006\u0008\u009b\u0001\u0010\u009c\u0001J\u0011\u0010\u009d\u0001\u001a\u00020\u0007H\u0016\u00a2\u0006\u0005\u0008\u009d\u0001\u0010\tJ\u0012\u0010\u009e\u0001\u001a\u000200H\u0016\u00a2\u0006\u0006\u0008\u009e\u0001\u0010\u009f\u0001J\u0011\u0010\u00a0\u0001\u001a\u00020\u0007H\u0016\u00a2\u0006\u0005\u0008\u00a0\u0001\u0010\tJ\u0015\u0010\u00a2\u0001\u001a\u0005\u0018\u00010\u00a1\u0001H\u0016\u00a2\u0006\u0006\u0008\u00a2\u0001\u0010\u00a3\u0001R\u001b\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u0010\n\u0006\u0008\u00a4\u0001\u0010\u00a5\u0001\u001a\u0006\u0008\u00a6\u0001\u0010\u00a7\u0001R*\u0010\u00af\u0001\u001a\u00030\u00a8\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00a9\u0001\u0010\u00aa\u0001\u001a\u0006\u0008\u00ab\u0001\u0010\u00ac\u0001\"\u0006\u0008\u00ad\u0001\u0010\u00ae\u0001R*\u0010\u00b7\u0001\u001a\u00030\u00b0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00b1\u0001\u0010\u00b2\u0001\u001a\u0006\u0008\u00b3\u0001\u0010\u00b4\u0001\"\u0006\u0008\u00b5\u0001\u0010\u00b6\u0001R*\u0010\u00bf\u0001\u001a\u00030\u00b8\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00b9\u0001\u0010\u00ba\u0001\u001a\u0006\u0008\u00bb\u0001\u0010\u00bc\u0001\"\u0006\u0008\u00bd\u0001\u0010\u00be\u0001R*\u0010\u00c7\u0001\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00c1\u0001\u0010\u00c2\u0001\u001a\u0006\u0008\u00c3\u0001\u0010\u00c4\u0001\"\u0006\u0008\u00c5\u0001\u0010\u00c6\u0001R*\u0010\u00cb\u0001\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00c8\u0001\u0010\u00c2\u0001\u001a\u0006\u0008\u00c9\u0001\u0010\u00c4\u0001\"\u0006\u0008\u00ca\u0001\u0010\u00c6\u0001R*\u0010\u00d3\u0001\u001a\u00030\u00cc\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00cd\u0001\u0010\u00ce\u0001\u001a\u0006\u0008\u00cf\u0001\u0010\u00d0\u0001\"\u0006\u0008\u00d1\u0001\u0010\u00d2\u0001R)\u0010\u00da\u0001\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00d4\u0001\u0010\u00d5\u0001\u001a\u0006\u0008\u00d6\u0001\u0010\u00d7\u0001\"\u0006\u0008\u00d8\u0001\u0010\u00d9\u0001R*\u0010\u00de\u0001\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00db\u0001\u0010\u00c2\u0001\u001a\u0006\u0008\u00dc\u0001\u0010\u00c4\u0001\"\u0006\u0008\u00dd\u0001\u0010\u00c6\u0001R)\u0010\u00e5\u0001\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00df\u0001\u0010\u00e0\u0001\u001a\u0006\u0008\u00e1\u0001\u0010\u00e2\u0001\"\u0006\u0008\u00e3\u0001\u0010\u00e4\u0001R)\u0010\u00e9\u0001\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00e6\u0001\u0010\u00d5\u0001\u001a\u0006\u0008\u00e7\u0001\u0010\u00d7\u0001\"\u0006\u0008\u00e8\u0001\u0010\u00d9\u0001R*\u0010\u00ed\u0001\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00ea\u0001\u0010\u00c2\u0001\u001a\u0006\u0008\u00eb\u0001\u0010\u00c4\u0001\"\u0006\u0008\u00ec\u0001\u0010\u00c6\u0001R)\u0010\u00f1\u0001\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00ee\u0001\u0010\u00d5\u0001\u001a\u0006\u0008\u00ef\u0001\u0010\u00d7\u0001\"\u0006\u0008\u00f0\u0001\u0010\u00d9\u0001R)\u0010\u00f5\u0001\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00f2\u0001\u0010\u00e0\u0001\u001a\u0006\u0008\u00f3\u0001\u0010\u00e2\u0001\"\u0006\u0008\u00f4\u0001\u0010\u00e4\u0001R*\u0010\u00fc\u0001\u001a\u00030\u00f6\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u009e\u0001\u0010\u00f7\u0001\u001a\u0006\u0008\u00f8\u0001\u0010\u00f9\u0001\"\u0006\u0008\u00fa\u0001\u0010\u00fb\u0001R*\u0010\u0080\u0002\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00fd\u0001\u0010\u00c2\u0001\u001a\u0006\u0008\u00fe\u0001\u0010\u00c4\u0001\"\u0006\u0008\u00ff\u0001\u0010\u00c6\u0001R*\u0010\u0088\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0082\u0002\u0010\u0083\u0002\u001a\u0006\u0008\u0084\u0002\u0010\u0085\u0002\"\u0006\u0008\u0086\u0002\u0010\u0087\u0002R(\u0010\u008b\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008p\u0010\u00e0\u0001\u001a\u0006\u0008\u0089\u0002\u0010\u00e2\u0001\"\u0006\u0008\u008a\u0002\u0010\u00e4\u0001R)\u0010\u008f\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u008c\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u008d\u0002\u0010\u00e2\u0001\"\u0006\u0008\u008e\u0002\u0010\u00e4\u0001R)\u0010\u0093\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0090\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u0091\u0002\u0010\u00e2\u0001\"\u0006\u0008\u0092\u0002\u0010\u00e4\u0001R*\u0010\u0097\u0002\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0094\u0002\u0010\u00c2\u0001\u001a\u0006\u0008\u0095\u0002\u0010\u00c4\u0001\"\u0006\u0008\u0096\u0002\u0010\u00c6\u0001R)\u0010\u009b\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0098\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u0099\u0002\u0010\u00e2\u0001\"\u0006\u0008\u009a\u0002\u0010\u00e4\u0001R)\u0010\u009f\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u009c\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u009d\u0002\u0010\u00e2\u0001\"\u0006\u0008\u009e\u0002\u0010\u00e4\u0001R*\u0010\u00a3\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00a0\u0002\u0010\u0083\u0002\u001a\u0006\u0008\u00a1\u0002\u0010\u0085\u0002\"\u0006\u0008\u00a2\u0002\u0010\u0087\u0002R)\u0010\u00a7\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00a4\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00a5\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00a6\u0002\u0010\u00e4\u0001R)\u0010\u00ab\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00a8\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00a9\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00aa\u0002\u0010\u00e4\u0001R)\u0010\u00af\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00ac\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00ad\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00ae\u0002\u0010\u00d9\u0001R*\u0010\u00b3\u0002\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00b0\u0002\u0010\u00c2\u0001\u001a\u0006\u0008\u00b1\u0002\u0010\u00c4\u0001\"\u0006\u0008\u00b2\u0002\u0010\u00c6\u0001R*\u0010\u00b7\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00b4\u0002\u0010\u0083\u0002\u001a\u0006\u0008\u00b5\u0002\u0010\u0085\u0002\"\u0006\u0008\u00b6\u0002\u0010\u0087\u0002R)\u0010\u00bb\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00b8\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00b9\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00ba\u0002\u0010\u00d9\u0001R(\u0010\u00be\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008i\u0010\u00e0\u0001\u001a\u0006\u0008\u00bc\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00bd\u0002\u0010\u00e4\u0001R(\u0010\u00c1\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008k\u0010\u00e0\u0001\u001a\u0006\u0008\u00bf\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00c0\u0002\u0010\u00e4\u0001R)\u0010\u00c5\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00c2\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00c3\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00c4\u0002\u0010\u00d9\u0001R*\u0010\u00c9\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00c6\u0002\u0010\u0083\u0002\u001a\u0006\u0008\u00c7\u0002\u0010\u0085\u0002\"\u0006\u0008\u00c8\u0002\u0010\u0087\u0002R)\u0010\u00cd\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00ca\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00cb\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00cc\u0002\u0010\u00d9\u0001R)\u0010\u00d1\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00ce\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00cf\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00d0\u0002\u0010\u00e4\u0001R)\u0010\u00d5\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00d2\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00d3\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00d4\u0002\u0010\u00e4\u0001R)\u0010\u00d9\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00d6\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00d7\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00d8\u0002\u0010\u00d9\u0001R*\u0010\u00dd\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00da\u0002\u0010\u0083\u0002\u001a\u0006\u0008\u00db\u0002\u0010\u0085\u0002\"\u0006\u0008\u00dc\u0002\u0010\u0087\u0002R)\u0010\u00e1\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00de\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00df\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00e0\u0002\u0010\u00d9\u0001R(\u0010\u00e4\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008A\u0010\u00e0\u0001\u001a\u0006\u0008\u00e2\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00e3\u0002\u0010\u00e4\u0001R(\u0010\u00e7\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008\u0008\u0010\u00e0\u0001\u001a\u0006\u0008\u00e5\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00e6\u0002\u0010\u00e4\u0001R(\u0010\u00ea\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008c\u0010\u00d5\u0001\u001a\u0006\u0008\u00e8\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00e9\u0002\u0010\u00d9\u0001R)\u0010\u00ed\u0002\u001a\u00030\u0081\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008K\u0010\u0083\u0002\u001a\u0006\u0008\u00eb\u0002\u0010\u0085\u0002\"\u0006\u0008\u00ec\u0002\u0010\u0087\u0002R(\u0010\u00f0\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008m\u0010\u00d5\u0001\u001a\u0006\u0008\u00ee\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00ef\u0002\u0010\u00d9\u0001R(\u0010\u00f3\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008,\u0010\u00e0\u0001\u001a\u0006\u0008\u00f1\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00f2\u0002\u0010\u00e4\u0001R(\u0010\u00f6\u0002\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008*\u0010\u00e0\u0001\u001a\u0006\u0008\u00f4\u0002\u0010\u00e2\u0001\"\u0006\u0008\u00f5\u0002\u0010\u00e4\u0001R(\u0010\u00f9\u0002\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008\u0012\u0010\u00d5\u0001\u001a\u0006\u0008\u00f7\u0002\u0010\u00d7\u0001\"\u0006\u0008\u00f8\u0002\u0010\u00d9\u0001R)\u0010\u00fc\u0002\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008F\u0010\u00c2\u0001\u001a\u0006\u0008\u00fa\u0002\u0010\u00c4\u0001\"\u0006\u0008\u00fb\u0002\u0010\u00c6\u0001R*\u0010\u0080\u0003\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00fd\u0002\u0010\u00c2\u0001\u001a\u0006\u0008\u00fe\u0002\u0010\u00c4\u0001\"\u0006\u0008\u00ff\u0002\u0010\u00c6\u0001R)\u0010\u0087\u0003\u001a\u00030\u0081\u00038\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008H\u0010\u0082\u0003\u001a\u0006\u0008\u0083\u0003\u0010\u0084\u0003\"\u0006\u0008\u0085\u0003\u0010\u0086\u0003R)\u0010\u008a\u0003\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008 \u0010\u00c2\u0001\u001a\u0006\u0008\u0088\u0003\u0010\u00c4\u0001\"\u0006\u0008\u0089\u0003\u0010\u00c6\u0001R)\u0010\u008d\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u008b\u0003\u0010\u00e0\u0001\u001a\u0006\u0008\u008b\u0003\u0010\u00e2\u0001\"\u0006\u0008\u008c\u0003\u0010\u00e4\u0001R)\u0010\u0090\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00cf\u0001\u0010\u00e0\u0001\u001a\u0006\u0008\u008e\u0003\u0010\u00e2\u0001\"\u0006\u0008\u008f\u0003\u0010\u00e4\u0001R)\u0010\u0093\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00e5\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u0091\u0003\u0010\u00e2\u0001\"\u0006\u0008\u0092\u0003\u0010\u00e4\u0001R*\u0010\u0097\u0003\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0094\u0003\u0010\u00c2\u0001\u001a\u0006\u0008\u0095\u0003\u0010\u00c4\u0001\"\u0006\u0008\u0096\u0003\u0010\u00c6\u0001R)\u0010\u009a\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00e8\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u0098\u0003\u0010\u00e2\u0001\"\u0006\u0008\u0099\u0003\u0010\u00e4\u0001R*\u0010\u009d\u0003\u001a\u00030\u00c0\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00eb\u0002\u0010\u00c2\u0001\u001a\u0006\u0008\u009b\u0003\u0010\u00c4\u0001\"\u0006\u0008\u009c\u0003\u0010\u00c6\u0001R)\u0010\u00a0\u0003\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00f4\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u009e\u0003\u0010\u00d7\u0001\"\u0006\u0008\u009f\u0003\u0010\u00d9\u0001R)\u0010\u00a3\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00f7\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00a1\u0003\u0010\u00e2\u0001\"\u0006\u0008\u00a2\u0003\u0010\u00e4\u0001R)\u0010\u00a6\u0003\u001a\u00020Z8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00c7\u0002\u0010\u00d5\u0001\u001a\u0006\u0008\u00a4\u0003\u0010\u00d7\u0001\"\u0006\u0008\u00a5\u0003\u0010\u00d9\u0001R)\u0010\u00a9\u0003\u001a\u00020X8\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00d3\u0002\u0010\u00e0\u0001\u001a\u0006\u0008\u00a7\u0003\u0010\u00e2\u0001\"\u0006\u0008\u00a8\u0003\u0010\u00e4\u0001R\u0018\u0010l\u001a\u00020\u00028\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u00cb\u0002\u0010\u00aa\u0003R\u001b\u0010\u00ab\u0003\u001a\u0004\u0018\u00010X8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00d7\u0002\u0010\u00e0\u0001R\u001c\u0010\u00ae\u0003\u001a\u0005\u0018\u00010\u00ac\u00038\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00cf\u0002\u0010\u00ad\u0003R\u001c\u0010\u00b1\u0003\u001a\u0005\u0018\u00010\u00af\u00038\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00fe\u0001\u0010\u00b0\u0003R\u001c\u0010\u00b3\u0003\u001a\u0005\u0018\u00010\u0099\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0095\u0002\u0010\u00b2\u0003R\u001d\u0010\u00b8\u0003\u001a\u00030\u00b4\u00038\u0006\u00a2\u0006\u0010\n\u0006\u0008\u0099\u0002\u0010\u00b5\u0003\u001a\u0006\u0008\u00b6\u0003\u0010\u00b7\u0003R\u001a\u0010\u00b9\u0003\u001a\u00030\u00c0\u00018\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0084\u0002\u0010\u00c2\u0001R*\u0010\u00bd\u0003\u001a\u00020\u00112\u0007\u0010\u00ba\u0003\u001a\u00020\u00118\u0006@BX\u0086\u000e\u00a2\u0006\u0010\n\u0006\u0008\u0091\u0002\u0010\u00ca\u0002\u001a\u0006\u0008\u00bb\u0003\u0010\u00bc\u0003R\u001f\u0010\u00bf\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u000f0$8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0089\u0002\u0010\u00be\u0003R,\u0010\u00c3\u0003\u001a\u0017\u0012\u0012\u0012\u0010\u0012\u0005\u0012\u00030\u00c2\u0003\u0012\u0004\u0012\u00020\u000f0\u00c1\u00030\u00c0\u00038\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00a1\u0002\u0010\u00be\u0003R\u001a\u0010\u00c6\u0003\u001a\u00030\u00c4\u00038\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u00a5\u0002\u0010\u00c5\u0003R!\u0010\u00ca\u0003\u001a\n\u0012\u0005\u0012\u00030\u00c8\u00030\u00c7\u00038\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u00ad\u0002\u0010\u00c9\u0003R\u001a\u0010\u00cd\u0003\u001a\u00030\u00cb\u00038\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u00a1\u0003\u0010\u00cc\u0003R+\u0010\u00d3\u0003\u001a\u0004\u0018\u00010\u001c8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0018\n\u0006\u0008\u00b3\u0001\u0010\u00ce\u0003\u001a\u0006\u0008\u00cf\u0003\u0010\u00d0\u0003\"\u0006\u0008\u00d1\u0003\u0010\u00d2\u0003\u00a8\u0006\u00d6\u0003"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;",
        "Ll/v1b0;",
        "Ll/ikx;",
        "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V",
        "",
        "P",
        "()V",
        "K1",
        "J1",
        "I1",
        "F1",
        "G1",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
        "type",
        "",
        "V",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)I",
        "page",
        "retry",
        "P1",
        "(II)V",
        "g1",
        "(I)V",
        "T1",
        "cardType",
        "",
        "B1",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Ljava/lang/String;",
        "z1",
        "Z",
        "resId",
        "b0",
        "(I)Ljava/lang/String;",
        "",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;",
        "e0",
        "()Ljava/util/List;",
        "k1",
        "Landroid/view/View;",
        "U",
        "()Landroid/view/View;",
        "T",
        "f1",
        "e1",
        "item",
        "",
        "isVip",
        "isSee",
        "isPremium",
        "isUltra",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;",
        "f0",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;ZZZZ)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;",
        "titleRes",
        "checkIconRes",
        "targetVal",
        "targetColor",
        "youOwned",
        "youVal",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "hideYouColumn",
        "O",
        "(IILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;IZLcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;Lcom/p1/mobile/putong/core/data/Privilege;Z)V",
        "",
        "sizeDp",
        "Landroid/widget/FrameLayout;",
        "W",
        "(IF)Landroid/widget/FrameLayout;",
        "Y",
        "()Landroid/widget/FrameLayout;",
        "Landroid/widget/LinearLayout$LayoutParams;",
        "R",
        "()Landroid/widget/LinearLayout$LayoutParams;",
        "picVerified",
        "w1",
        "(Z)V",
        "countView",
        "badgeView",
        "A1",
        "(Landroid/view/View;Landroid/view/View;)V",
        "",
        "seeBadgeCount",
        "r1",
        "(J)V",
        "Lv/VText_NoTopPadding;",
        "countBadge",
        "Lv/VImage;",
        "plusBadge",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;",
        "n1",
        "(Lv/VText_NoTopPadding;Lv/VImage;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V",
        "p1",
        "d1",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I",
        "badge",
        "Q",
        "(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "E",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "F",
        "presenter",
        "S",
        "(Ll/ikx;)V",
        "inflateView",
        "r",
        "active",
        "L1",
        "h1",
        "types",
        "R1",
        "(Ljava/util/List;)V",
        "C1",
        "a0",
        "()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "u1",
        "(Lcom/p1/mobile/putong/data/User;)V",
        "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
        "uri",
        "l1",
        "(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V",
        "v1",
        "S1",
        "H1",
        "t1",
        "show",
        "O1",
        "j1",
        "likesYou",
        "likesSent",
        "visitors",
        "showVisitorDot",
        "s1",
        "(JJJJZ)V",
        "o1",
        "m1",
        "y1",
        "Landroid/content/Intent;",
        "intent",
        "Q1",
        "(Landroid/content/Intent;)V",
        "D1",
        "a1",
        "M1",
        "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
        "guide",
        "q1",
        "(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;)V",
        "x2",
        "o",
        "()Z",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "a",
        "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "c0",
        "()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "Lv/VRelative;",
        "b",
        "Lv/VRelative;",
        "get_new_tab_me_test1",
        "()Lv/VRelative;",
        "set_new_tab_me_test1",
        "(Lv/VRelative;)V",
        "_new_tab_me_test1",
        "Lv/navigationbar/VNavigationBar;",
        "c",
        "Lv/navigationbar/VNavigationBar;",
        "Z0",
        "()Lv/navigationbar/VNavigationBar;",
        "set_top_navigationbar",
        "(Lv/navigationbar/VNavigationBar;)V",
        "_top_navigationbar",
        "Landroid/widget/ScrollView;",
        "d",
        "Landroid/widget/ScrollView;",
        "get_content_view",
        "()Landroid/widget/ScrollView;",
        "set_content_view",
        "(Landroid/widget/ScrollView;)V",
        "_content_view",
        "Lv/VLinear;",
        "e",
        "Lv/VLinear;",
        "get_test1_content",
        "()Lv/VLinear;",
        "set_test1_content",
        "(Lv/VLinear;)V",
        "_test1_content",
        "f",
        "get_test1_header_container",
        "set_test1_header_container",
        "_test1_header_container",
        "Lv/AutoVDraweeView;",
        "g",
        "Lv/AutoVDraweeView;",
        "p0",
        "()Lv/AutoVDraweeView;",
        "set_test1_header_container_test1_avatar",
        "(Lv/AutoVDraweeView;)V",
        "_test1_header_container_test1_avatar",
        "h",
        "Lv/VImage;",
        "q0",
        "()Lv/VImage;",
        "set_test1_header_container_test1_avatar_edit",
        "(Lv/VImage;)V",
        "_test1_header_container_test1_avatar_edit",
        "i",
        "get_test1_header_container_test1_name_row",
        "set_test1_header_container_test1_name_row",
        "_test1_header_container_test1_name_row",
        "j",
        "Lv/VText_NoTopPadding;",
        "r0",
        "()Lv/VText_NoTopPadding;",
        "set_test1_header_container_test1_name_row_test1_name",
        "(Lv/VText_NoTopPadding;)V",
        "_test1_header_container_test1_name_row_test1_name",
        "k",
        "s0",
        "set_test1_header_container_test1_name_row_test1_verification_icon",
        "_test1_header_container_test1_name_row_test1_verification_icon",
        "l",
        "u0",
        "set_test1_header_container_test1_subscription_btn",
        "_test1_header_container_test1_subscription_btn",
        "m",
        "v0",
        "set_test1_header_container_test1_subscription_btn_test1_sub_badge",
        "_test1_header_container_test1_subscription_btn_test1_sub_badge",
        "n",
        "w0",
        "set_test1_header_container_test1_subscription_btn_test1_sub_text",
        "_test1_header_container_test1_subscription_btn_test1_sub_text",
        "Lv/VOnlineIndicator;",
        "Lv/VOnlineIndicator;",
        "t0",
        "()Lv/VOnlineIndicator;",
        "set_test1_header_container_test1_sub_dot",
        "(Lv/VOnlineIndicator;)V",
        "_test1_header_container_test1_sub_dot",
        "p",
        "P0",
        "set_test1_stats_container",
        "_test1_stats_container",
        "Lv/VFrame;",
        "q",
        "Lv/VFrame;",
        "S0",
        "()Lv/VFrame;",
        "set_test1_stats_container_test1_likes_you_stat",
        "(Lv/VFrame;)V",
        "_test1_stats_container_test1_likes_you_stat",
        "U0",
        "set_test1_stats_container_test1_likes_you_stat_test1_likes_you_count",
        "_test1_stats_container_test1_likes_you_stat_test1_likes_you_count",
        "s",
        "get_test1_stats_container_test1_likes_you_stat_test1_likes_you_label",
        "set_test1_stats_container_test1_likes_you_stat_test1_likes_you_label",
        "_test1_stats_container_test1_likes_you_stat_test1_likes_you_label",
        "t",
        "T0",
        "set_test1_stats_container_test1_likes_you_stat_test1_likes_you_badge",
        "_test1_stats_container_test1_likes_you_stat_test1_likes_you_badge",
        "u",
        "Q0",
        "set_test1_stats_container_test1_likes_sent_stat",
        "_test1_stats_container_test1_likes_sent_stat",
        "v",
        "R0",
        "set_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_count",
        "_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_count",
        "w",
        "get_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_label",
        "set_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_label",
        "_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_label",
        "x",
        "V0",
        "set_test1_stats_container_test1_visitors_stat",
        "_test1_stats_container_test1_visitors_stat",
        "y",
        "W0",
        "set_test1_stats_container_test1_visitors_stat_test1_visitors_count",
        "_test1_stats_container_test1_visitors_stat_test1_visitors_count",
        "z",
        "get_test1_stats_container_test1_visitors_stat_test1_visitors_label",
        "set_test1_stats_container_test1_visitors_stat_test1_visitors_label",
        "_test1_stats_container_test1_visitors_stat_test1_visitors_label",
        "A",
        "X0",
        "set_test1_stats_container_test1_visitors_stat_test1_visitors_dot",
        "_test1_stats_container_test1_visitors_stat_test1_visitors_dot",
        "B",
        "get_test1_iap_container",
        "set_test1_iap_container",
        "_test1_iap_container",
        "C",
        "x0",
        "set_test1_iap_container_test1_boost_card",
        "_test1_iap_container_test1_boost_card",
        "D",
        "z0",
        "set_test1_iap_container_test1_boost_card_test1_boost_icon",
        "_test1_iap_container_test1_boost_card_test1_boost_icon",
        "B0",
        "set_test1_iap_container_test1_boost_card_test1_boost_title",
        "_test1_iap_container_test1_boost_card_test1_boost_title",
        "y0",
        "set_test1_iap_container_test1_boost_card_test1_boost_badge",
        "_test1_iap_container_test1_boost_card_test1_boost_badge",
        "G",
        "A0",
        "set_test1_iap_container_test1_boost_card_test1_boost_plus_badge",
        "_test1_iap_container_test1_boost_card_test1_boost_plus_badge",
        "H",
        "K0",
        "set_test1_iap_container_test1_super_like_card",
        "_test1_iap_container_test1_super_like_card",
        "I",
        "M0",
        "set_test1_iap_container_test1_super_like_card_test1_super_like_icon",
        "_test1_iap_container_test1_super_like_card_test1_super_like_icon",
        "J",
        "O0",
        "set_test1_iap_container_test1_super_like_card_test1_super_like_title",
        "_test1_iap_container_test1_super_like_card_test1_super_like_title",
        "K",
        "L0",
        "set_test1_iap_container_test1_super_like_card_test1_super_like_badge",
        "_test1_iap_container_test1_super_like_card_test1_super_like_badge",
        "L",
        "N0",
        "set_test1_iap_container_test1_super_like_card_test1_super_like_plus_badge",
        "_test1_iap_container_test1_super_like_card_test1_super_like_plus_badge",
        "M",
        "D0",
        "set_test1_iap_container_test1_compliment_card",
        "_test1_iap_container_test1_compliment_card",
        "N",
        "get_test1_iap_container_test1_compliment_card_test1_compliment_icon",
        "set_test1_iap_container_test1_compliment_card_test1_compliment_icon",
        "_test1_iap_container_test1_compliment_card_test1_compliment_icon",
        "get_test1_iap_container_test1_compliment_card_test1_compliment_title",
        "set_test1_iap_container_test1_compliment_card_test1_compliment_title",
        "_test1_iap_container_test1_compliment_card_test1_compliment_title",
        "E0",
        "set_test1_iap_container_test1_compliment_card_test1_compliment_badge",
        "_test1_iap_container_test1_compliment_card_test1_compliment_badge",
        "G0",
        "set_test1_iap_container_test1_compliment_card_test1_compliment_plus_badge",
        "_test1_iap_container_test1_compliment_card_test1_compliment_plus_badge",
        "H0",
        "set_test1_iap_container_test1_instant_match_card",
        "_test1_iap_container_test1_instant_match_card",
        "get_test1_iap_container_test1_instant_match_card_test1_instant_match_icon",
        "set_test1_iap_container_test1_instant_match_card_test1_instant_match_icon",
        "_test1_iap_container_test1_instant_match_card_test1_instant_match_icon",
        "get_test1_iap_container_test1_instant_match_card_test1_instant_match_title",
        "set_test1_iap_container_test1_instant_match_card_test1_instant_match_title",
        "_test1_iap_container_test1_instant_match_card_test1_instant_match_title",
        "I0",
        "set_test1_iap_container_test1_instant_match_card_test1_instant_match_badge",
        "_test1_iap_container_test1_instant_match_card_test1_instant_match_badge",
        "J0",
        "set_test1_iap_container_test1_instant_match_card_test1_instant_match_lock_badge",
        "_test1_iap_container_test1_instant_match_card_test1_instant_match_lock_badge",
        "g0",
        "set_test1_banner_container",
        "_test1_banner_container",
        "X",
        "get_test1_card_container",
        "set_test1_card_container",
        "_test1_card_container",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "m0",
        "()Landroidx/recyclerview/widget/RecyclerView;",
        "set_test1_card_container_test1_card_pager",
        "(Landroidx/recyclerview/widget/RecyclerView;)V",
        "_test1_card_container_test1_card_pager",
        "h0",
        "set_test1_benefits_container",
        "_test1_benefits_container",
        "k0",
        "set_test1_benefits_container_test1_benefits_title",
        "_test1_benefits_container_test1_benefits_title",
        "l0",
        "set_test1_benefits_container_test1_benefits_you_title",
        "_test1_benefits_container_test1_benefits_you_title",
        "j0",
        "set_test1_benefits_container_test1_benefits_target_title",
        "_test1_benefits_container_test1_benefits_target_title",
        "F0",
        "i0",
        "set_test1_benefits_container_test1_benefits_rows",
        "_test1_benefits_container_test1_benefits_rows",
        "n0",
        "set_test1_fake_tip",
        "_test1_fake_tip",
        "get_test1_verification_banner",
        "set_test1_verification_banner",
        "_test1_verification_banner",
        "get_test1_verification_banner_test1_verification_banner_icon",
        "set_test1_verification_banner_test1_verification_banner_icon",
        "_test1_verification_banner_test1_verification_banner_icon",
        "Y0",
        "set_test1_verification_banner_test1_verification_banner_text",
        "_test1_verification_banner_test1_verification_banner_text",
        "get_test1_verification_banner_test1_verification_banner_arrow",
        "set_test1_verification_banner_test1_verification_banner_arrow",
        "_test1_verification_banner_test1_verification_banner_arrow",
        "o0",
        "set_test1_floating_cta",
        "_test1_floating_cta",
        "Ll/ikx;",
        "navWalletText",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "boostSvga",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;",
        "renewGuideBanner",
        "Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;",
        "lastRenewGuide",
        "Ll/zdo;",
        "Ll/zdo;",
        "d0",
        "()Ll/zdo;",
        "intlMeTabDiscountEntryHost",
        "verificationBanner",
        "value",
        "getCurrentCardPage",
        "()I",
        "currentCardPage",
        "Ljava/util/List;",
        "displayedCardTypes",
        "",
        "Lkotlin/Pair;",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;",
        "cardViewsList",
        "Ll/dix;",
        "Ll/dix;",
        "pagerSnapHelper",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "cardAdapter",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "cardLayoutManager",
        "Ljava/lang/String;",
        "getCachedUpgradePriceText",
        "()Ljava/lang/String;",
        "E1",
        "(Ljava/lang/String;)V",
        "cachedUpgradePriceText",
        "Companion",
        "BenefitValue",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VLinear;

.field public C:Lv/VFrame;

.field public D:Lv/VImage;

.field public E:Lv/VText_NoTopPadding;

.field public E0:Lv/VText_NoTopPadding;

.field public F:Lv/VText_NoTopPadding;

.field public F0:Lv/VLinear;

.field public G:Lv/VImage;

.field public G0:Lv/VText_NoTopPadding;

.field public H:Lv/VFrame;

.field public H0:Lv/VLinear;

.field public I:Lv/VImage;

.field public I0:Lv/VImage;

.field public J:Lv/VText_NoTopPadding;

.field public J0:Lv/VText_NoTopPadding;

.field public K:Lv/VText_NoTopPadding;

.field public K0:Lv/VImage;

.field public L:Lv/VImage;

.field public L0:Lv/VText_NoTopPadding;

.field public M:Lv/VFrame;

.field public M0:Ll/ikx;

.field public N:Lv/VImage;

.field public N0:Lv/VText_NoTopPadding;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public O:Lv/VText_NoTopPadding;

.field public O0:Lcom/tantan/library/svga/SVGAnimationView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public P:Lv/VText_NoTopPadding;

.field public P0:Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public Q:Lv/VImage;

.field public Q0:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public R:Lv/VFrame;

.field public final R0:Ll/zdo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public S:Lv/VImage;

.field public S0:Lv/VLinear;

.field public T:Lv/VText_NoTopPadding;

.field public T0:I

.field public U:Lv/VText_NoTopPadding;

.field public U0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public V:Lv/VImage;

.field public final V0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public W:Lv/VLinear;

.field public W0:Ll/dix;

.field public X:Lv/VLinear;

.field public X0:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$b;",
            ">;"
        }
    .end annotation
.end field

.field public Y:Landroidx/recyclerview/widget/RecyclerView;

.field public Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public Z:Lv/VLinear;

.field public Z0:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lv/VRelative;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Landroid/widget/ScrollView;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Lv/AutoVDraweeView;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText_NoTopPadding;

.field public k:Lv/VImage;

.field public k0:Lv/VText_NoTopPadding;

.field public l:Lv/VLinear;

.field public m:Lv/VImage;

.field public n:Lv/VText_NoTopPadding;

.field public o:Lv/VOnlineIndicator;

.field public p:Lv/VLinear;

.field public p0:Lv/VText_NoTopPadding;

.field public q:Lv/VFrame;

.field public r:Lv/VText_NoTopPadding;

.field public s:Lv/VText_NoTopPadding;

.field public t:Lv/VText_NoTopPadding;

.field public u:Lv/VLinear;

.field public v:Lv/VText_NoTopPadding;

.field public w:Lv/VText_NoTopPadding;

.field public x:Lv/VFrame;

.field public y:Lv/VText_NoTopPadding;

.field public z:Lv/VText_NoTopPadding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$c;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$c;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Companion:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$c;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 8
    .line 9
    new-instance v0, Ll/zdo;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/zdo;-><init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0:Ll/zdo;

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->VIP:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->SEE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->PREMIUM:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->ULTRA:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 23
    .line 24
    filled-new-array {p1, v0, v1, v2}, [Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 40
    .line 41
    return-void
.end method

.method public static A(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->L1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->J1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static C(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->D1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final synthetic G(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic H(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic I(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic J(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic K(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ll/dix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic L(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Ll/ikx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic M(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic N(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IFILjava/lang/Object;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/high16 p2, 0x41800000    # 16.0f

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W(IF)Landroid/widget/FrameLayout;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 p2, p2, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P1(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->E1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-wide/16 v0, 0xa0

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->B1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->z1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->I1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private final f1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->p0()Lv/AutoVDraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/elx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/elx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->q0()Lv/VImage;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/lkx;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/lkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->r0()Lv/VText_NoTopPadding;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/mkx;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/mkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S0()Lv/VFrame;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/nkx;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/nkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q0()Lv/VLinear;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/okx;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/okx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0()Lv/VFrame;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/pkx;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/pkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->x0()Lv/VFrame;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/qkx;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/qkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->K0()Lv/VFrame;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/rkx;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/rkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->D0()Lv/VFrame;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Ll/skx;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/skx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->H0()Lv/VFrame;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/tkx;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/tkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/flx;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/flx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/glx;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/glx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S0:Lv/VLinear;

    .line 146
    .line 147
    if-nez v0, :cond_0

    .line 148
    .line 149
    const-string v0, "verificationBanner"

    .line 150
    .line 151
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    const/4 v0, 0x0

    .line 155
    :cond_0
    new-instance v1, Ll/kkx;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/kkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->H1()V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Ll/yyh0;->INSTANCE:Ll/yyh0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/yyh0;->k(Lcom/p1/mobile/android/app/Frag;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/box;->INSTANCE:Ll/box;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/box;->l()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0:Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 2
    .line 3
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "button"

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q1(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static l(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q1(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static m(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/high16 v1, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr p1, v1

    .line 27
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static n(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;ZZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    move-object p6, p5

    .line 12
    move-object p5, p4

    .line 13
    move p4, p3

    .line 14
    move p3, p2

    .line 15
    move-object p2, p1

    .line 16
    move-object p1, p0

    .line 17
    invoke-virtual/range {p1 .. p6}, Ll/ikx;->t1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;ZZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static p(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->x1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static q(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0:Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 5
    .line 6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object p0
.end method

.method public static s(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "presenter"

    .line 6
    .line 7
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/ikx;->v1(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static u(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "presenter"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->H1()V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method

.method public static v(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "button"

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q1(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "presenter"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->C1()V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method

.method public static x(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IILandroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 7
    .line 8
    if-eqz v0, :cond_6

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 16
    .line 17
    if-eq v1, p1, :cond_2

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_2
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-nez v0, :cond_3

    .line 25
    .line 26
    const/4 p3, 0x3

    .line 27
    if-ge p2, p3, :cond_6

    .line 28
    .line 29
    add-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P1(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 36
    .line 37
    const/4 p2, 0x0

    .line 38
    if-nez p1, :cond_4

    .line 39
    .line 40
    const-string p1, "pagerSnapHelper"

    .line 41
    .line 42
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    move-object p1, p2

    .line 46
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 47
    .line 48
    if-nez p0, :cond_5

    .line 49
    .line 50
    const-string p0, "cardLayoutManager"

    .line 51
    .line 52
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_5
    move-object p2, p0

    .line 57
    :goto_0
    invoke-virtual {p1, p2, v0}, Ll/dix;->c(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;)[I

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    aget p0, p0, p1

    .line 65
    .line 66
    if-eqz p0, :cond_6

    .line 67
    .line 68
    invoke-virtual {p3, p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 69
    .line 70
    .line 71
    :cond_6
    :goto_1
    return-void
.end method

.method public static y(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->H1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ikx;->F1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final A0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_boost_card_test1_boost_plus_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final A1(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p0, Ll/jkx;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/jkx;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final B0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->E:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_boost_card_test1_boost_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final B1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->PREMIUM:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 8
    .line 9
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->g0:Z

    .line 10
    .line 11
    if-nez v1, :cond_3

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 14
    .line 15
    const-string v1, "meTabSubscriptionCard"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->H3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->S4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 60
    .line 61
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R9:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->T3()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 79
    .line 80
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R9:I

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;->a(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/4 v0, 0x0

    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    return-object v0

    .line 97
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 100
    .line 101
    invoke-virtual {v1, p1}, Ll/lc9;->l3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_6

    .line 110
    .line 111
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-nez p1, :cond_5

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    sget-object p1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 119
    .line 120
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 121
    .line 122
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Xg:I

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    const/4 v0, 0x1

    .line 132
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :cond_6
    :goto_1
    return-object v0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final C1(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 4
    .line 5
    check-cast v0, Ljava/util/Collection;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ge p1, v0, :cond_2

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->m0()Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P1(II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k1(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T1(I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    :goto_0
    return-void
.end method

.method public final D0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_compliment_card"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public D1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0:Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;->n0(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q5()Lrx/c;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0:Ll/zdo;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/zdo;->c()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
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
    invoke-static {p0, p1, p2}, Ll/ilx;->b(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final E0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_compliment_card_test1_compliment_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final E1(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final F()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ilx;->c(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final F1()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->x0()Lv/VFrame;

    .line 9
    .line 10
    .line 11
    move-result-object v7

    .line 12
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    const/16 v5, 0xe

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x8

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/high16 v3, 0x42600000    # 56.0f

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    const/16 v3, 0x31

    .line 44
    .line 45
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 46
    .line 47
    invoke-virtual {v7, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->O0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v1, "https://auto.tancdn.com/v1/raw/e75c2718-a663-4b43-b675-12b67f54c98d.svga"

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final G0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_compliment_card_test1_compliment_plus_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final G1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->m0()Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v1, v2, v3, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/dix;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/dix;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/w;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 28
    .line 29
    .line 30
    sget-object v1, Ll/eix;->INSTANCE:Ll/eix;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ll/eix;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$f;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X0:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$g;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$g;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final H0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_instant_match_card"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final H1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n0()Lv/VText_NoTopPadding;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/wkx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final I0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_instant_match_card_test1_instant_match_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final I1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0()Lv/VImage;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/dbc0;->pe:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->O0()Lv/VText_NoTopPadding;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v2, Lcom/p1/mobile/putong/core/R$string;->q2:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->B0()Lv/VText_NoTopPadding;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v2, Lcom/p1/mobile/putong/core/R$string;->r2:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->F1()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final J0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_instant_match_card_test1_instant_match_lock_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final J1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast v0, Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g0()Lv/VLinear;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0:Ll/zdo;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g0()Lv/VLinear;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v2, v0, p0}, Ll/zdo;->a(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    if-ltz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-le p0, v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    instance-of v1, v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v0, 0x0

    .line 55
    :goto_0
    if-eqz v0, :cond_1

    .line 56
    .line 57
    sget v1, Ll/qa00;->j:I

    .line 58
    .line 59
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 63
    .line 64
    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public final K0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->H:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_super_like_card"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final K1()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    sget v1, Ll/adc0;->Od:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    check-cast v1, Lv/VLinear;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S0:Lv/VLinear;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const-string v3, "verificationBanner"

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    move-object v1, v2

    .line 36
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n0()Lv/VText_NoTopPadding;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P0()Lv/VLinear;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n0()Lv/VText_NoTopPadding;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    add-int/lit8 v5, v1, 0x1

    .line 59
    .line 60
    invoke-virtual {v0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S0:Lv/VLinear;

    .line 64
    .line 65
    if-nez v4, :cond_1

    .line 66
    .line 67
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move-object v2, v4

    .line 72
    :goto_0
    add-int/lit8 v1, v1, 0x2

    .line 73
    .line 74
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0()Lv/VText_NoTopPadding;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final L0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->K:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_super_like_card_test1_super_like_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final L1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->O0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->z0()Lv/VImage;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x4

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void

    .line 30
    :cond_2
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-virtual {v0, p1, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 41
    .line 42
    .line 43
    :cond_3
    const/16 p1, 0x8

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->z0()Lv/VImage;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final M0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_super_like_card_test1_super_like_icon"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final M1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bix;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q0:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->q1(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final N0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->L:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_super_like_card_test1_super_like_plus_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final O(IILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;IZLcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;Lcom/p1/mobile/putong/core/data/Privilege;Z)V
    .locals 16

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const-string v1, "%s"

    .line 13
    .line 14
    const/4 v8, 0x0

    .line 15
    const/4 v9, 0x2

    .line 16
    const/4 v10, 0x0

    .line 17
    invoke-static {v2, v1, v8, v9, v10}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/4 v6, 0x4

    .line 24
    const/4 v7, 0x0

    .line 25
    const-string v3, "%s"

    .line 26
    .line 27
    const-string v4, ""

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-static/range {v2 .. v7}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    :cond_0
    move-object v7, v2

    .line 43
    new-instance v11, Lv/VLinear;

    .line 44
    .line 45
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v11, v1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v11, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 53
    .line 54
    .line 55
    const/16 v12, 0x10

    .line 56
    .line 57
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->i0()Lv/VLinear;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 65
    .line 66
    const/high16 v3, 0x42200000    # 40.0f

    .line 67
    .line 68
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    const/4 v13, -0x1

    .line 73
    invoke-direct {v2, v13, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v11, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ja:I

    .line 80
    .line 81
    const/4 v14, 0x1

    .line 82
    if-ne v0, v1, :cond_1

    .line 83
    .line 84
    move v3, v14

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    move v3, v8

    .line 87
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->LOCK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 88
    .line 89
    move-object/from16 v15, p3

    .line 90
    .line 91
    if-ne v15, v1, :cond_2

    .line 92
    .line 93
    move v4, v14

    .line 94
    goto :goto_1

    .line 95
    :cond_2
    move v4, v8

    .line 96
    :goto_1
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->b0(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    new-instance v0, Ll/alx;

    .line 101
    .line 102
    move-object/from16 v1, p0

    .line 103
    .line 104
    move-object/from16 v2, p7

    .line 105
    .line 106
    move-object/from16 v5, p8

    .line 107
    .line 108
    invoke-direct/range {v0 .. v6}, Ll/alx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;ZZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v11, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Lv/VText_NoTopPadding;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-direct {v0, v2}, Lv/VText_NoTopPadding;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 127
    .line 128
    .line 129
    const/high16 v2, 0x41600000    # 14.0f

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 132
    .line 133
    .line 134
    const/high16 v2, -0x1a000000

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    .line 138
    .line 139
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 142
    .line 143
    .line 144
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 145
    .line 146
    const/high16 v4, 0x3f800000    # 1.0f

    .line 147
    .line 148
    invoke-direct {v3, v8, v13, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v11, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    .line 153
    .line 154
    const-string v3, "1"

    .line 155
    .line 156
    const-string v4, "2"

    .line 157
    .line 158
    const-string v5, "3"

    .line 159
    .line 160
    const-string v6, ""

    .line 161
    .line 162
    const/4 v7, 0x4

    .line 163
    const/high16 v8, 0x41800000    # 16.0f

    .line 164
    .line 165
    const/4 v12, 0x3

    .line 166
    const/4 v13, 0x0

    .line 167
    if-nez p9, :cond_9

    .line 168
    .line 169
    if-nez p5, :cond_3

    .line 170
    .line 171
    sget v0, Ll/dbc0;->we:I

    .line 172
    .line 173
    invoke-static {v1, v0, v13, v9, v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IFILjava/lang/Object;)Landroid/widget/FrameLayout;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 178
    .line 179
    .line 180
    move-result-object v10

    .line 181
    invoke-virtual {v11, v0, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->b:[I

    .line 186
    .line 187
    invoke-virtual/range {p6 .. p6}, Ljava/lang/Enum;->ordinal()I

    .line 188
    .line 189
    .line 190
    move-result v10

    .line 191
    aget v10, v0, v10

    .line 192
    .line 193
    if-eq v10, v14, :cond_5

    .line 194
    .line 195
    if-eq v10, v9, :cond_5

    .line 196
    .line 197
    if-eq v10, v12, :cond_5

    .line 198
    .line 199
    if-eq v10, v7, :cond_4

    .line 200
    .line 201
    sget v0, Ll/dbc0;->qe:I

    .line 202
    .line 203
    invoke-virtual {v1, v0, v8}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W(IF)Landroid/widget/FrameLayout;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 208
    .line 209
    .line 210
    move-result-object v10

    .line 211
    invoke-virtual {v11, v0, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y()Landroid/widget/FrameLayout;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 220
    .line 221
    .line 222
    move-result-object v10

    .line 223
    invoke-virtual {v11, v0, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 224
    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_5
    invoke-virtual/range {p6 .. p6}, Ljava/lang/Enum;->ordinal()I

    .line 228
    .line 229
    .line 230
    move-result v10

    .line 231
    aget v0, v0, v10

    .line 232
    .line 233
    if-eq v0, v14, :cond_8

    .line 234
    .line 235
    if-eq v0, v9, :cond_7

    .line 236
    .line 237
    if-eq v0, v12, :cond_6

    .line 238
    .line 239
    move-object v0, v6

    .line 240
    goto :goto_2

    .line 241
    :cond_6
    move-object v0, v5

    .line 242
    goto :goto_2

    .line 243
    :cond_7
    move-object v0, v4

    .line 244
    goto :goto_2

    .line 245
    :cond_8
    move-object v0, v3

    .line 246
    :goto_2
    new-instance v10, Lv/VText_NoTopPadding;

    .line 247
    .line 248
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 249
    .line 250
    .line 251
    move-result-object v13

    .line 252
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    .line 254
    .line 255
    invoke-direct {v10, v13}, Lv/VText_NoTopPadding;-><init>(Landroid/content/Context;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    .line 260
    .line 261
    const/16 v0, 0x11

    .line 262
    .line 263
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 267
    .line 268
    .line 269
    const/high16 v0, 0x4d000000    # 1.3421773E8f

    .line 270
    .line 271
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v11, v10, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 282
    .line 283
    .line 284
    :cond_9
    :goto_3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->b:[I

    .line 285
    .line 286
    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    .line 287
    .line 288
    .line 289
    move-result v10

    .line 290
    aget v10, v0, v10

    .line 291
    .line 292
    if-eq v10, v7, :cond_f

    .line 293
    .line 294
    const/4 v7, 0x5

    .line 295
    if-eq v10, v7, :cond_e

    .line 296
    .line 297
    const/4 v7, 0x6

    .line 298
    if-eq v10, v7, :cond_d

    .line 299
    .line 300
    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    .line 301
    .line 302
    .line 303
    move-result v7

    .line 304
    aget v0, v0, v7

    .line 305
    .line 306
    if-eq v0, v14, :cond_c

    .line 307
    .line 308
    if-eq v0, v9, :cond_b

    .line 309
    .line 310
    if-eq v0, v12, :cond_a

    .line 311
    .line 312
    move-object v3, v6

    .line 313
    goto :goto_4

    .line 314
    :cond_a
    move-object v3, v5

    .line 315
    goto :goto_4

    .line 316
    :cond_b
    move-object v3, v4

    .line 317
    :cond_c
    :goto_4
    new-instance v0, Lv/VText_NoTopPadding;

    .line 318
    .line 319
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    .line 325
    .line 326
    invoke-direct {v0, v4}, Lv/VText_NoTopPadding;-><init>(Landroid/content/Context;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    .line 331
    .line 332
    const/16 v3, 0x11

    .line 333
    .line 334
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 338
    .line 339
    .line 340
    move/from16 v3, p4

    .line 341
    .line 342
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    invoke-virtual {v11, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 353
    .line 354
    .line 355
    return-void

    .line 356
    :cond_d
    sget v0, Ll/dbc0;->we:I

    .line 357
    .line 358
    const/4 v2, 0x0

    .line 359
    const/4 v3, 0x0

    .line 360
    invoke-static {v1, v0, v2, v9, v3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IFILjava/lang/Object;)Landroid/widget/FrameLayout;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-virtual {v11, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 369
    .line 370
    .line 371
    return-void

    .line 372
    :cond_e
    move/from16 v0, p2

    .line 373
    .line 374
    const/4 v2, 0x0

    .line 375
    const/4 v3, 0x0

    .line 376
    invoke-static {v1, v0, v2, v9, v3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IFILjava/lang/Object;)Landroid/widget/FrameLayout;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-virtual {v11, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :cond_f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y()Landroid/widget/FrameLayout;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R()Landroid/widget/LinearLayout$LayoutParams;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-virtual {v11, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 397
    .line 398
    .line 399
    return-void
.end method

.method public final O0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_super_like_card_test1_super_like_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final O1(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->t0()Lv/VOnlineIndicator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final P()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, -0x1

    .line 14
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    const v1, 0x800035

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget v0, Ll/adc0;->W1:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v0, 0x0

    .line 50
    :goto_0
    if-nez v0, :cond_2

    .line 51
    .line 52
    :goto_1
    return-void

    .line 53
    :cond_2
    const/high16 v1, 0x41800000    # 16.0f

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final P0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->p:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final P1(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0:Ll/dix;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->m0()Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    if-ge p2, v1, :cond_4

    .line 27
    .line 28
    new-instance v1, Ll/clx;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, p2}, Ll/clx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 38
    .line 39
    if-nez v1, :cond_3

    .line 40
    .line 41
    const-string v1, "cardLayoutManager"

    .line 42
    .line 43
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    :cond_3
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v1, p1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/dlx;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1, p2, v0}, Ll/dlx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;IILandroidx/recyclerview/widget/RecyclerView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    :cond_4
    :goto_0
    return-void
.end method

.method public final Q(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    const/high16 v2, 0x41000000    # 8.0f

    .line 11
    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->d1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget p2, Ll/c9c0;->c2:I

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/content/Context;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0x11

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move p0, v1

    .line 61
    :goto_0
    const/4 p2, 0x3

    .line 62
    const/high16 v0, 0x41400000    # 12.0f

    .line 63
    .line 64
    const/high16 v2, 0x40400000    # 3.0f

    .line 65
    .line 66
    if-lt p0, p2, :cond_1

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 69
    .line 70
    .line 71
    const/high16 p0, 0x41f00000    # 30.0f

    .line 72
    .line 73
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {p1, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 78
    .line 79
    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    invoke-virtual {p1, p0, v1, p2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    const/4 p2, 0x2

    .line 93
    if-ne p0, p2, :cond_2

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 96
    .line 97
    .line 98
    const/high16 p0, 0x41a00000    # 20.0f

    .line 99
    .line 100
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p1, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 105
    .line 106
    .line 107
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    invoke-virtual {p1, p0, v1, p2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 120
    .line 121
    .line 122
    const/high16 p0, 0x41800000    # 16.0f

    .line 123
    .line 124
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-virtual {p1, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 129
    .line 130
    .line 131
    const/high16 p0, 0x40800000    # 4.0f

    .line 132
    .line 133
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    invoke-virtual {p1, p2, v1, p0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public final Q0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_likes_sent_stat"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final Q1(Landroid/content/Intent;)V
    .locals 0
    .param p1    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final R()Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 1
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v0, 0x42800000    # 64.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final R0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->v:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_likes_sent_stat_test1_likes_sent_count"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final R1(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X0:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    const-string p0, "cardAdapter"

    .line 30
    .line 31
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public S(Ll/ikx;)V
    .locals 0
    .param p1    # Ll/ikx;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->M0:Ll/ikx;

    .line 5
    .line 6
    return-void
.end method

.method public final S0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->q:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_likes_you_stat"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final S1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v1, Ll/box;->INSTANCE:Ll/box;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/box;->m()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/k3g;->a()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->sj()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 32
    .line 33
    sget v2, Lcom/p1/mobile/putong/core/R$string;->x4:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n0()Lv/VText_NoTopPadding;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v2, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n0()Lv/VText_NoTopPadding;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    const/4 p0, 0x0

    .line 67
    :goto_1
    if-eqz p0, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->t7()V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method public final T()Landroid/view/View;
    .locals 5

    .line 1
    new-instance v0, Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/dbc0;->ze:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lv/VFrame;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    sget v2, Ll/adc0;->W1:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    const/high16 v3, 0x41c00000    # 24.0f

    .line 32
    .line 33
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    const v3, 0x800033

    .line 45
    .line 46
    .line 47
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 48
    .line 49
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 50
    .line 51
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    sget v0, Ll/qa00;->j:I

    .line 55
    .line 56
    sget v2, Ll/qa00;->h:I

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-virtual {v1, v3, v0, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/blx;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/blx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    return-object v1
.end method

.method public final T0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->t:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_likes_you_stat_test1_likes_you_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final T1(I)V
    .locals 4

    .line 1
    const v0, -0xdbdee4

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1, p1}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ll/joa;->k4()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ll/lc9;->l3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/16 p1, 0x8

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v2, 0x0

    .line 52
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->B1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->a:[I

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    aget p1, v2, p1

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    if-eq p1, v2, :cond_8

    .line 69
    .line 70
    const/4 v3, 0x2

    .line 71
    if-eq p1, v3, :cond_6

    .line 72
    .line 73
    const/4 v3, 0x3

    .line 74
    if-eq p1, v3, :cond_4

    .line 75
    .line 76
    const/4 v0, 0x4

    .line 77
    if-ne p1, v0, :cond_3

    .line 78
    .line 79
    new-instance p1, Lkotlin/Triple;

    .line 80
    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 86
    .line 87
    sget v1, Lcom/p1/mobile/putong/core/R$string;->db:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    const-string v1, "Ultra Premium"

    .line 97
    .line 98
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    :cond_2
    sget v0, Ll/dbc0;->le:I

    .line 111
    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const v2, -0x61801

    .line 117
    .line 118
    .line 119
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-direct {p1, v1, v0, v2}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :cond_3
    invoke-static {}, Ll/nbr;->a()V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_4
    new-instance p1, Lkotlin/Triple;

    .line 133
    .line 134
    if-nez v1, :cond_5

    .line 135
    .line 136
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 139
    .line 140
    sget v3, Lcom/p1/mobile/putong/core/R$string;->db:I

    .line 141
    .line 142
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    const-string v3, "PREMIUM"

    .line 150
    .line 151
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    :cond_5
    sget v2, Ll/dbc0;->je:I

    .line 164
    .line 165
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-direct {p1, v1, v2, v0}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_6
    new-instance p1, Lkotlin/Triple;

    .line 174
    .line 175
    if-nez v1, :cond_7

    .line 176
    .line 177
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 178
    .line 179
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 180
    .line 181
    sget v1, Lcom/p1/mobile/putong/core/R$string;->db:I

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 191
    .line 192
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Mn:I

    .line 193
    .line 194
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    :cond_7
    sget v0, Ll/dbc0;->ke:I

    .line 211
    .line 212
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    const/4 v2, -0x1

    .line 217
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-direct {p1, v1, v0, v2}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    goto :goto_0

    .line 225
    :cond_8
    new-instance p1, Lkotlin/Triple;

    .line 226
    .line 227
    if-nez v1, :cond_9

    .line 228
    .line 229
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 230
    .line 231
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 232
    .line 233
    sget v3, Lcom/p1/mobile/putong/core/R$string;->db:I

    .line 234
    .line 235
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 240
    .line 241
    .line 242
    const-string v3, "VIP"

    .line 243
    .line 244
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    :cond_9
    sget v2, Ll/dbc0;->ie:I

    .line 257
    .line 258
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-direct {p1, v1, v2, v0}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    :goto_0
    invoke-virtual {p1}, Lkotlin/Triple;->component1()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {p1}, Lkotlin/Triple;->component2()Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    check-cast v1, Ljava/lang/Number;

    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {p1}, Lkotlin/Triple;->component3()Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    check-cast p1, Ljava/lang/Number;

    .line 286
    .line 287
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o0()Lv/VText_NoTopPadding;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public final U()Landroid/view/View;
    .locals 7

    .line 1
    new-instance v0, Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/adc0;->X1:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lv/VLinear;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    const/16 v3, 0x10

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 31
    .line 32
    .line 33
    new-instance v3, Lv/VImage;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v3, v4}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    sget v4, Ll/dbc0;->Re:I

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    const/high16 v5, 0x41c00000    # 24.0f

    .line 50
    .line 51
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Lv/VText_NoTopPadding;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-direct {v3, v4}, Lv/VText_NoTopPadding;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    const/high16 v4, 0x41400000    # 12.0f

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 80
    .line 81
    sget v5, Ll/c9c0;->Q:I

    .line 82
    .line 83
    invoke-virtual {v4, v5}, Landroid/content/Context;->getColor(I)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    const/4 v4, 0x3

    .line 91
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 96
    .line 97
    .line 98
    const/4 v4, 0x1

    .line 99
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 100
    .line 101
    .line 102
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 103
    .line 104
    const/4 v5, -0x2

    .line 105
    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 106
    .line 107
    .line 108
    sget v6, Ll/qa00;->g:I

    .line 109
    .line 110
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 111
    .line 112
    invoke-virtual {v1, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    .line 114
    .line 115
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->N0:Lv/VText_NoTopPadding;

    .line 116
    .line 117
    new-instance v3, Ll/ukx;

    .line 118
    .line 119
    invoke-direct {v3, p0}, Ll/ukx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 126
    .line 127
    invoke-direct {p0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 128
    .line 129
    .line 130
    const v3, 0x800033

    .line 131
    .line 132
    .line 133
    iput v3, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 134
    .line 135
    sget v3, Ll/qa00;->e:I

    .line 136
    .line 137
    sget v4, Ll/qa00;->j:I

    .line 138
    .line 139
    invoke-virtual {v0, v3, v4, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    .line 144
    .line 145
    return-object v0
.end method

.method public final U0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->r:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_likes_you_stat_test1_likes_you_count"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final V(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_3

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x4

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    sget p0, Ll/kec0;->s7:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    sget p0, Ll/kec0;->q7:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_2
    sget p0, Ll/kec0;->r7:I

    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    sget p0, Ll/kec0;->t7:I

    .line 36
    .line 37
    return p0
.end method

.method public final V0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->x:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_visitors_stat"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final W(IF)Landroid/widget/FrameLayout;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lv/VImage;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    invoke-direct {p1, p0, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    const/16 p0, 0x11

    .line 31
    .line 32
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final W0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->y:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_visitors_stat_test1_visitors_count"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final X0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->A:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_stats_container_test1_visitors_stat_test1_visitors_dot"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final Y()Landroid/widget/FrameLayout;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lv/VImage;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget p0, Ll/dbc0;->ve:I

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/high16 v2, 0x41800000    # 16.0f

    .line 31
    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/high16 v3, 0x41000000    # 8.0f

    .line 37
    .line 38
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-direct {p0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    const/16 v2, 0x11

    .line 46
    .line 47
    iput v2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 48
    .line 49
    invoke-virtual {v0, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public final Y0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_verification_banner_test1_verification_banner_text"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final Z(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->h0()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-wide/16 v2, 0x96

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;

    .line 28
    .line 29
    invoke-direct {v2, p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;ILv/VLinear;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final Z0()Lv/navigationbar/VNavigationBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_top_navigationbar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final a0()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 10
    .line 11
    return-object p0
.end method

.method public final a1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bix;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g0()Lv/VLinear;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final b0(I)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Landroid/content/res/Configuration;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v0}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    const/4 p1, 0x0

    .line 40
    const-string v1, "%s"

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-static {v0, v1, v2, p0, p1}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    const/4 v4, 0x4

    .line 50
    const/4 v5, 0x0

    .line 51
    const-string v1, "%s"

    .line 52
    .line 53
    const-string v2, ""

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-static/range {v0 .. v5}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_0
    return-object v0
.end method

.method public final c0()Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->a:Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d0()Ll/zdo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0:Ll/zdo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d1(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->c:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_3

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x4

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    const p0, -0x20ba01

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    const/16 p0, -0x44f4

    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    const p0, -0xd43301

    .line 34
    .line 35
    .line 36
    return p0

    .line 37
    :cond_3
    const p0, -0x9c4d

    .line 38
    .line 39
    .line 40
    return p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0:Ll/zdo;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zdo;->b()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->F()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e0()Ljava/util/List;
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->q9:I

    .line 8
    .line 9
    :goto_0
    move v3, v1

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->p9:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :goto_1
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/core/R$string;->id:I

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->hd:I

    .line 20
    .line 21
    :goto_2
    sget-object v6, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->LOCK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 22
    .line 23
    sget-object v8, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->CHECK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 24
    .line 25
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 26
    .line 27
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Mn:I

    .line 28
    .line 29
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    move-object v7, v8

    .line 32
    move-object v9, v7

    .line 33
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 34
    .line 35
    .line 36
    move-object v1, v4

    .line 37
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 38
    .line 39
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Ms:I

    .line 40
    .line 41
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    move-object/from16 v27, v7

    .line 44
    .line 45
    move-object v7, v6

    .line 46
    move-object/from16 v6, v27

    .line 47
    .line 48
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 49
    .line 50
    .line 51
    move-object v12, v4

    .line 52
    move-object v11, v6

    .line 53
    move-object v6, v7

    .line 54
    new-instance v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 55
    .line 56
    sget-object v6, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_1:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 57
    .line 58
    sget-object v9, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_INF:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 59
    .line 60
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    move-object v5, v7

    .line 63
    move-object v4, v7

    .line 64
    move-object v7, v9

    .line 65
    invoke-direct/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 66
    .line 67
    .line 68
    move-object v6, v4

    .line 69
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 70
    .line 71
    sget-object v8, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_2:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 72
    .line 73
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 74
    .line 75
    move-object v7, v6

    .line 76
    move v5, v0

    .line 77
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 78
    .line 79
    .line 80
    move-object v0, v12

    .line 81
    move-object v12, v4

    .line 82
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 83
    .line 84
    sget v5, Lcom/p1/mobile/putong/core/R$string;->J9:I

    .line 85
    .line 86
    sget-object v8, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_3:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 87
    .line 88
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 89
    .line 90
    move-object v9, v8

    .line 91
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 92
    .line 93
    .line 94
    move-object v13, v4

    .line 95
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 96
    .line 97
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Ja:I

    .line 98
    .line 99
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 100
    .line 101
    move-object v8, v6

    .line 102
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 103
    .line 104
    .line 105
    move-object v14, v4

    .line 106
    new-instance v15, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 107
    .line 108
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ng:I

    .line 109
    .line 110
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 111
    .line 112
    move-object v8, v11

    .line 113
    move-object v9, v11

    .line 114
    move-object v6, v11

    .line 115
    move-object v4, v15

    .line 116
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 117
    .line 118
    .line 119
    move-object v8, v6

    .line 120
    move-object v6, v7

    .line 121
    new-instance v16, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 122
    .line 123
    sget v5, Lcom/p1/mobile/putong/core/R$string;->nh:I

    .line 124
    .line 125
    const/4 v10, 0x0

    .line 126
    move-object v9, v8

    .line 127
    move-object/from16 v4, v16

    .line 128
    .line 129
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 130
    .line 131
    .line 132
    new-instance v17, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 133
    .line 134
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ac:I

    .line 135
    .line 136
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->intl_visitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 137
    .line 138
    move-object/from16 v4, v17

    .line 139
    .line 140
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 141
    .line 142
    .line 143
    new-instance v18, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 144
    .line 145
    sget v5, Lcom/p1/mobile/putong/core/R$string;->q3:I

    .line 146
    .line 147
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 148
    .line 149
    move-object/from16 v4, v18

    .line 150
    .line 151
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 152
    .line 153
    .line 154
    new-instance v19, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 155
    .line 156
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Yg:I

    .line 157
    .line 158
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 159
    .line 160
    move-object/from16 v4, v19

    .line 161
    .line 162
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 163
    .line 164
    .line 165
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 166
    .line 167
    sget v5, Lcom/p1/mobile/putong/core/R$string;->eg:I

    .line 168
    .line 169
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 170
    .line 171
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 172
    .line 173
    .line 174
    move-object/from16 v20, v4

    .line 175
    .line 176
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 177
    .line 178
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Ar:I

    .line 179
    .line 180
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 181
    .line 182
    move-object v7, v8

    .line 183
    move-object v9, v7

    .line 184
    move-object/from16 v27, v7

    .line 185
    .line 186
    move-object v7, v6

    .line 187
    move-object/from16 v6, v27

    .line 188
    .line 189
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 190
    .line 191
    .line 192
    move-object/from16 v21, v4

    .line 193
    .line 194
    move-object v8, v6

    .line 195
    move-object v6, v7

    .line 196
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 197
    .line 198
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Wa:I

    .line 199
    .line 200
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 201
    .line 202
    move-object v9, v8

    .line 203
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 204
    .line 205
    .line 206
    move-object/from16 v22, v4

    .line 207
    .line 208
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 209
    .line 210
    sget v5, Lcom/p1/mobile/putong/core/R$string;->lg:I

    .line 211
    .line 212
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 213
    .line 214
    move-object v7, v8

    .line 215
    move-object v9, v7

    .line 216
    move-object/from16 v27, v7

    .line 217
    .line 218
    move-object v7, v6

    .line 219
    move-object/from16 v6, v27

    .line 220
    .line 221
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 222
    .line 223
    .line 224
    move-object/from16 v23, v4

    .line 225
    .line 226
    move-object v8, v6

    .line 227
    move-object v6, v7

    .line 228
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 229
    .line 230
    sget v5, Lcom/p1/mobile/putong/core/R$string;->kg:I

    .line 231
    .line 232
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 233
    .line 234
    move-object v7, v8

    .line 235
    move-object v9, v7

    .line 236
    move-object/from16 v27, v7

    .line 237
    .line 238
    move-object v7, v6

    .line 239
    move-object/from16 v6, v27

    .line 240
    .line 241
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 242
    .line 243
    .line 244
    move-object/from16 v24, v4

    .line 245
    .line 246
    move-object v8, v6

    .line 247
    move-object v6, v7

    .line 248
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 249
    .line 250
    sget v5, Lcom/p1/mobile/putong/core/R$string;->mg:I

    .line 251
    .line 252
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 253
    .line 254
    move-object v7, v8

    .line 255
    move-object v9, v7

    .line 256
    move-object/from16 v27, v7

    .line 257
    .line 258
    move-object v7, v6

    .line 259
    move-object/from16 v6, v27

    .line 260
    .line 261
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 262
    .line 263
    .line 264
    move-object/from16 v25, v4

    .line 265
    .line 266
    move-object v8, v6

    .line 267
    move-object v6, v7

    .line 268
    new-instance v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 269
    .line 270
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Bc:I

    .line 271
    .line 272
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 273
    .line 274
    move-object v7, v8

    .line 275
    move-object v9, v7

    .line 276
    move-object/from16 v27, v7

    .line 277
    .line 278
    move-object v7, v6

    .line 279
    move-object/from16 v6, v27

    .line 280
    .line 281
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;-><init>(ILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 282
    .line 283
    .line 284
    move-object v10, v0

    .line 285
    move-object v9, v1

    .line 286
    move-object v11, v2

    .line 287
    move-object/from16 v26, v4

    .line 288
    .line 289
    filled-new-array/range {v9 .. v26}, [Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    return-object v0
.end method

.method public final e1()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k1(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f0(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;ZZZZ)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;
    .locals 0

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->e()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p4, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->a()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    if-eqz p2, :cond_3

    .line 16
    .line 17
    if-eqz p3, :cond_3

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->f()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object p2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->LOCK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 24
    .line 25
    if-eq p0, p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->f()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->c()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_3
    if-eqz p2, :cond_4

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->f()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_4
    if-eqz p3, :cond_5

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->c()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->LOCK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 52
    .line 53
    return-object p0
.end method

.method public final g0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_banner_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final g1(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->z1(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T1(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final h0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_benefits_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final h1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 13
    .line 14
    check-cast p0, Ljava/lang/Iterable;

    .line 15
    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    invoke-static {p0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lkotlin/Pair;

    .line 42
    .line 43
    invoke-virtual {v2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 48
    .line 49
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p0, 0x0

    .line 54
    new-array p0, p0, [Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 55
    .line 56
    invoke-interface {v1, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, [Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 61
    .line 62
    array-length v1, p0

    .line 63
    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, [Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper;->d([Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final i0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->F0:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_benefits_container_test1_benefits_rows"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ikx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S(Ll/ikx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final j0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->E0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_benefits_container_test1_benefits_target_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final j1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const v1, 0x3f8a3d71    # 1.08f

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-wide/16 v1, 0xa0

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/vkx;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/vkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final k0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_benefits_container_test1_benefits_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final k1(I)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0:Ljava/util/List;

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    move-object v7, v1

    .line 12
    check-cast v7, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 13
    .line 14
    if-nez v7, :cond_0

    .line 15
    .line 16
    goto/16 :goto_7

    .line 17
    .line 18
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->j0()Lv/VText_NoTopPadding;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k0()Lv/VText_NoTopPadding;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    sget v4, Lcom/p1/mobile/putong/core/R$string;->o9:I

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->i0()Lv/VLinear;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 42
    .line 43
    .line 44
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->a:[I

    .line 45
    .line 46
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    aget v3, v2, v3

    .line 51
    .line 52
    const/16 v4, -0x36fc

    .line 53
    .line 54
    const/16 v5, -0x72ce

    .line 55
    .line 56
    const v6, -0xc7200

    .line 57
    .line 58
    .line 59
    const v8, -0x38b71b

    .line 60
    .line 61
    .line 62
    const/high16 v9, 0x41400000    # 12.0f

    .line 63
    .line 64
    const/4 v10, 0x4

    .line 65
    const/4 v11, 0x3

    .line 66
    const/4 v12, 0x2

    .line 67
    const/4 v13, 0x1

    .line 68
    if-eq v3, v13, :cond_4

    .line 69
    .line 70
    if-eq v3, v12, :cond_3

    .line 71
    .line 72
    if-eq v3, v11, :cond_2

    .line 73
    .line 74
    if-ne v3, v10, :cond_1

    .line 75
    .line 76
    const-string v3, "ULTRA\nPREMIUM"

    .line 77
    .line 78
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    const/high16 v3, 0x41300000    # 11.0f

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    .line 85
    .line 86
    const/4 v3, 0x0

    .line 87
    const/high16 v9, 0x3f800000    # 1.0f

    .line 88
    .line 89
    invoke-virtual {v1, v3, v9}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-static {}, Ll/nbr;->a()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    const-string v3, "PREMIUM"

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    const-string v3, "SEE"

    .line 113
    .line 114
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    const-string v3, "VIP"

    .line 125
    .line 126
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    .line 134
    .line 135
    :goto_0
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    aget v1, v2, v1

    .line 140
    .line 141
    if-eq v1, v13, :cond_8

    .line 142
    .line 143
    if-eq v1, v12, :cond_7

    .line 144
    .line 145
    if-eq v1, v11, :cond_6

    .line 146
    .line 147
    if-ne v1, v10, :cond_5

    .line 148
    .line 149
    sget v1, Ll/dbc0;->te:I

    .line 150
    .line 151
    :goto_1
    move v9, v1

    .line 152
    goto :goto_2

    .line 153
    :cond_5
    invoke-static {}, Ll/nbr;->a()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_6
    sget v1, Ll/dbc0;->re:I

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_7
    sget v1, Ll/dbc0;->se:I

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_8
    sget v1, Ll/dbc0;->ue:I

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :goto_2
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    aget v1, v2, v1

    .line 171
    .line 172
    if-eq v1, v13, :cond_b

    .line 173
    .line 174
    if-eq v1, v12, :cond_a

    .line 175
    .line 176
    if-eq v1, v11, :cond_c

    .line 177
    .line 178
    if-ne v1, v10, :cond_9

    .line 179
    .line 180
    move v6, v8

    .line 181
    goto :goto_3

    .line 182
    :cond_9
    invoke-static {}, Ll/nbr;->a()V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_a
    move v6, v5

    .line 187
    goto :goto_3

    .line 188
    :cond_b
    move v6, v4

    .line 189
    :cond_c
    :goto_3
    invoke-static {}, Ll/joa;->n4()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    xor-int/lit8 v2, v1, 0x1

    .line 194
    .line 195
    invoke-static {}, Ll/joa;->i4()Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    xor-int/lit8 v3, v1, 0x1

    .line 200
    .line 201
    invoke-static {}, Ll/joa;->f4()Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    xor-int/lit8 v4, v1, 0x1

    .line 206
    .line 207
    invoke-static {}, Ll/joa;->k4()Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    xor-int/lit8 v5, v1, 0x1

    .line 212
    .line 213
    if-nez v1, :cond_d

    .line 214
    .line 215
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->ULTRA:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    .line 216
    .line 217
    if-ne v7, v1, :cond_d

    .line 218
    .line 219
    move v8, v13

    .line 220
    goto :goto_4

    .line 221
    :cond_d
    const/4 v1, 0x0

    .line 222
    move v8, v1

    .line 223
    :goto_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->l0()Lv/VText_NoTopPadding;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    xor-int/lit8 v14, v8, 0x1

    .line 228
    .line 229
    invoke-static {v1, v14}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->e0()Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 237
    .line 238
    .line 239
    move-result-object v14

    .line 240
    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;

    .line 251
    .line 252
    sget-object v15, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->a:[I

    .line 253
    .line 254
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 255
    .line 256
    .line 257
    move-result v16

    .line 258
    aget v15, v15, v16

    .line 259
    .line 260
    if-eq v15, v13, :cond_11

    .line 261
    .line 262
    if-eq v15, v12, :cond_10

    .line 263
    .line 264
    if-eq v15, v11, :cond_f

    .line 265
    .line 266
    if-ne v15, v10, :cond_e

    .line 267
    .line 268
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->e()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 269
    .line 270
    .line 271
    move-result-object v15

    .line 272
    goto :goto_6

    .line 273
    :cond_e
    invoke-static {}, Ll/nbr;->a()V

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->a()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 278
    .line 279
    .line 280
    move-result-object v15

    .line 281
    goto :goto_6

    .line 282
    :cond_10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->c()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 283
    .line 284
    .line 285
    move-result-object v15

    .line 286
    goto :goto_6

    .line 287
    :cond_11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->f()Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 288
    .line 289
    .line 290
    move-result-object v15

    .line 291
    :goto_6
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->g(ZZZZ)Z

    .line 292
    .line 293
    .line 294
    move-result v16

    .line 295
    move/from16 v17, v6

    .line 296
    .line 297
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->f0(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;ZZZZ)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    .line 298
    .line 299
    .line 300
    move-result-object v6

    .line 301
    move/from16 v18, v2

    .line 302
    .line 303
    move/from16 v19, v3

    .line 304
    .line 305
    move/from16 v20, v4

    .line 306
    .line 307
    move/from16 v21, v5

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->d()I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$a;->b()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    move v2, v9

    .line 318
    move-object v3, v15

    .line 319
    move/from16 v5, v16

    .line 320
    .line 321
    move/from16 v4, v17

    .line 322
    .line 323
    move v9, v8

    .line 324
    move-object v8, v1

    .line 325
    move v1, v0

    .line 326
    move-object/from16 v0, p0

    .line 327
    .line 328
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->O(IILcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;IZLcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;Lcom/p1/mobile/putong/core/data/Privilege;Z)V

    .line 329
    .line 330
    .line 331
    move v6, v4

    .line 332
    move v8, v9

    .line 333
    move/from16 v3, v19

    .line 334
    .line 335
    move/from16 v4, v20

    .line 336
    .line 337
    move/from16 v5, v21

    .line 338
    .line 339
    move v9, v2

    .line 340
    move/from16 v2, v18

    .line 341
    .line 342
    goto :goto_5

    .line 343
    :cond_12
    :goto_7
    return-void
.end method

.method public final l0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->p0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_benefits_container_test1_benefits_you_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final l1(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Picture$ImageUri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->p0()Lv/AutoVDraweeView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m0()Landroidx/recyclerview/widget/RecyclerView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Y:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_card_container_test1_card_pager"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final m1(Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T1(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_fake_tip"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final n1(Lv/VText_NoTopPadding;Lv/VImage;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V
    .locals 4

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {p3}, Ll/gix;->e(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    const-string p2, "\u221e"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {p3}, Ll/gix;->a(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-lez v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    int-to-long v0, v1

    .line 37
    const/4 p2, 0x2

    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-static {v0, v1, v2, p2, v3}, Ll/znx;->b(JIILjava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    if-eqz p2, :cond_3

    .line 54
    .line 55
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final o0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->L0:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_floating_cta"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final o1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->y0()Lv/VText_NoTopPadding;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->A0()Lv/VImage;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->BOOST:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n1(Lv/VText_NoTopPadding;Lv/VImage;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->L0()Lv/VText_NoTopPadding;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->N0()Lv/VImage;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n1(Lv/VText_NoTopPadding;Lv/VImage;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->E0()Lv/VText_NoTopPadding;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G0()Lv/VImage;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->COMPLIMENT:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n1(Lv/VText_NoTopPadding;Lv/VImage;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->p1()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final p0()Lv/AutoVDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g:Lv/AutoVDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_avatar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final p1()V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->INSTANT_MATCH:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gix;->e(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0()Lv/VImage;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "\u221e"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {v0}, Ll/gix;->f(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-lez v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0()Lv/VImage;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    int-to-long v4, v1

    .line 68
    const/4 v1, 0x2

    .line 69
    const/4 v6, 0x0

    .line 70
    invoke-static {v4, v5, v3, v1, v6}, Ll/znx;->b(JIILjava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q(Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I0()Lv/VText_NoTopPadding;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0()Lv/VImage;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/gix;->c()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0()Lv/VImage;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget v0, Ll/dbc0;->oe:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J0()Lv/VImage;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget v0, Ll/dbc0;->me:I

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final q0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->h:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_avatar_edit"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final q1(Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Q0:Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;

    .line 2
    .line 3
    invoke-static {}, Ll/bix;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g0()Lv/VLinear;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Ll/iix;->INSTANCE:Ll/iix;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->g0()Lv/VLinear;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v4, Ll/xkx;

    .line 29
    .line 30
    invoke-direct {v4, p0}, Ll/xkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 31
    .line 32
    .line 33
    new-instance v5, Ll/ykx;

    .line 34
    .line 35
    invoke-direct {v5, p0}, Ll/ykx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 36
    .line 37
    .line 38
    move-object v2, p1

    .line 39
    invoke-virtual/range {v0 .. v5}, Ll/iix;->a(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/IntlTabMePayGuide;Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    new-array v1, v1, [Landroid/view/View;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object v0, v1, v2

    .line 10
    .line 11
    invoke-static {v1}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    const v2, 0x106000b

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    filled-new-array {v1}, [Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z0()Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    filled-new-array {v1}, [Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->P()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->K1()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->J1()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->I1()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->G1()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->e1()V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->f1()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final r0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->j:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_name_row_test1_name"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final r1(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0()Lv/VText_NoTopPadding;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long p1, p1, v0

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/spl0;->K()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const-string p1, ""

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    sget p1, Ll/dbc0;->e:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 26
    .line 27
    .line 28
    const/high16 p1, 0x41000000    # 8.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    .line 54
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2, p2, p2, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 64
    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final s0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->k:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_name_row_test1_verification_icon"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final s1(JJJJZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0()Lv/VText_NoTopPadding;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, p2}, Ll/znx;->d(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->R0()Lv/VText_NoTopPadding;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p3, p4}, Ll/znx;->c(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0()Lv/VText_NoTopPadding;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p5, p6}, Ll/znx;->e(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p7, p8}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->r1(J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X0()Lv/VImage;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1, p9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->U0()Lv/VText_NoTopPadding;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->T0()Lv/VText_NoTopPadding;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->A1(Landroid/view/View;Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->W0()Lv/VText_NoTopPadding;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->X0()Lv/VImage;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->A1(Landroid/view/View;Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final t0()Lv/VOnlineIndicator;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->o:Lv/VOnlineIndicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_sub_dot"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final t1(Lcom/p1/mobile/putong/data/User;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->v0()Lv/VImage;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->w0()Lv/VText_NoTopPadding;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->a(Landroid/view/View;Lv/VImage;Lv/VText_NoTopPadding;Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampSubscriptionStyle$Tier;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->u0()Lv/VLinear;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/zkx;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/zkx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final u0()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->l:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_subscription_btn"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final u1(Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->r0()Lv/VText_NoTopPadding;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->m:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_subscription_btn_test1_sub_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final v1(Lcom/p1/mobile/putong/data/User;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/dbc0;->Du:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance v1, Landroid/graphics/ColorMatrix;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 39
    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v3, Landroid/graphics/ColorMatrixColorFilter;

    .line 50
    .line 51
    invoke-direct {v3, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Lv/VImage;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->s0()Lv/VImage;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->w1(Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final w0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_header_container_test1_subscription_btn_test1_sub_text"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final w1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->S0:Lv/VLinear;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "verificationBanner"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p1, 0x0

    .line 17
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final x0()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->C:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_boost_card"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public x2()V
    .locals 0

    .line 1
    return-void
.end method

.method public final y0()Lv/VText_NoTopPadding;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->F:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_boost_card_test1_boost_badge"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final y1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/aox;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->N0:Lv/VText_NoTopPadding;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final z0()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->D:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_test1_iap_container_test1_boost_card_test1_boost_icon"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final z1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->V0:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lkotlin/Pair;

    .line 16
    .line 17
    invoke-virtual {p0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;->e()Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$a;->e()Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
