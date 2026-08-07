.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;
.super Lcom/p1/mobile/android/media/gltransition/TransitionEngine;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b8\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u0007\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0016\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u00ce\u00012\u00020\u0001:\u0002\u00cf\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0003J+\u0010\u0015\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u00102\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u00122\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0003J\u000f\u0010\u0018\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0003J\u0017\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u001a\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0019\u0010\u001e\u001a\u0004\u0018\u00010\u00122\u0006\u0010\u001d\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u001f\u0010!\u001a\u00020\u00192\u0006\u0010 \u001a\u00020\u00122\u0006\u0010\u001d\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u001f\u0010&\u001a\u00020\u00192\u0006\u0010$\u001a\u00020#2\u0006\u0010%\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008&\u0010\'J3\u0010.\u001a\u00020-2\u000e\u0010)\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010(2\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\u00080*H\u0003\u00a2\u0006\u0004\u0008.\u0010/J\u001f\u00101\u001a\u00020-2\u000e\u0010)\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010(H\u0003\u00a2\u0006\u0004\u00081\u00102J\u0017\u00103\u001a\u00020\u00082\u0006\u0010$\u001a\u00020#H\u0002\u00a2\u0006\u0004\u00083\u00104J\u0017\u00106\u001a\u00020#2\u0006\u00105\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u00086\u00107J\u0017\u00106\u001a\u00020#2\u0006\u00108\u001a\u000200H\u0002\u00a2\u0006\u0004\u00086\u00109J\u0017\u0010<\u001a\u00020#2\u0006\u0010;\u001a\u00020:H\u0002\u00a2\u0006\u0004\u0008<\u0010=J\u000f\u0010>\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008>\u0010\u0003J\u000f\u0010?\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008?\u0010\u0003J\u000f\u0010@\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008@\u0010\u0003J\u001f\u0010C\u001a\u00020\u00082\u000e\u0008\u0002\u0010B\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0002\u00a2\u0006\u0004\u0008C\u0010DJ\u0017\u0010F\u001a\u00020\u00082\u0006\u0010F\u001a\u00020EH\u0002\u00a2\u0006\u0004\u0008F\u0010GJ\u001d\u0010K\u001a\u00020\u00082\u000c\u0010J\u001a\u0008\u0012\u0004\u0012\u00020I0HH\u0002\u00a2\u0006\u0004\u0008K\u0010LJ \u0010M\u001a\u00020\u00082\u000e\u0008\u0004\u0010K\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0082\u0008\u00a2\u0006\u0004\u0008M\u0010DJ\u001d\u0010O\u001a\u00020\u00082\u000c\u0010N\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0002\u00a2\u0006\u0004\u0008O\u0010DJ\u0017\u0010P\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008P\u0010\u000eJ\u0017\u0010Q\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008Q\u0010\u000eJ\u001d\u0010S\u001a\u00020\u00082\u000c\u0010R\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0016\u00a2\u0006\u0004\u0008S\u0010DJ;\u0010V\u001a\u00020\u00082\u000e\u0010)\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010(2\u0006\u0010U\u001a\u00020T2\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\u00080*H\u0016\u00a2\u0006\u0004\u0008V\u0010WJ;\u0010Y\u001a\u00020\u00082\u000e\u0010X\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010(2\u0006\u0010U\u001a\u00020T2\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\u00080*H\u0016\u00a2\u0006\u0004\u0008Y\u0010WJ\'\u0010Z\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008Z\u0010\u0016J#\u0010[\u001a\u00020\u00082\u0012\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u00080*H\u0016\u00a2\u0006\u0004\u0008[\u0010\\J\u000f\u0010]\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008]\u0010\u0003J\u001f\u0010^\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008^\u0010\nJ\u001f\u0010c\u001a\u00020\u00082\u0006\u0010`\u001a\u00020_2\u0006\u0010b\u001a\u00020aH\u0016\u00a2\u0006\u0004\u0008c\u0010dJ\u001f\u0010g\u001a\u00020\u00082\u0006\u0010 \u001a\u00020\u00122\u0006\u0010f\u001a\u00020eH\u0016\u00a2\u0006\u0004\u0008g\u0010hJ\u000f\u0010i\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008i\u0010\u0003J\u001d\u0010k\u001a\u00020\u00082\u000c\u0010N\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0010\u00a2\u0006\u0004\u0008j\u0010DJ%\u0010p\u001a\u00020-2\u0006\u0010m\u001a\u00020l2\u000c\u0010N\u001a\u0008\u0012\u0004\u0012\u00020\u00080AH\u0010\u00a2\u0006\u0004\u0008n\u0010oJ\u0017\u0010u\u001a\u00020\u00082\u0006\u0010r\u001a\u00020qH\u0010\u00a2\u0006\u0004\u0008s\u0010tJ\u001f\u0010u\u001a\u00020\u00082\u0006\u0010w\u001a\u00020v2\u0006\u0010x\u001a\u00020EH\u0010\u00a2\u0006\u0004\u0008s\u0010yJ\u000f\u0010}\u001a\u00020zH\u0010\u00a2\u0006\u0004\u0008{\u0010|J\u000f\u0010x\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008x\u0010\u0003J6\u0010\u0082\u0001\u001a\u00020\u00082\u0006\u0010~\u001a\u00020E2\u0006\u0010\u001a\u001a\u00020\u00192\u0012\u0010\u007f\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00080*H\u0010\u00a2\u0006\u0006\u0008\u0080\u0001\u0010\u0081\u0001R\u0018\u0010\u0084\u0001\u001a\u00030\u0083\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0084\u0001\u0010\u0085\u0001R#\u0010\u0088\u0001\u001a\u000c\u0018\u00010\u0086\u0001j\u0005\u0018\u0001`\u0087\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0088\u0001\u0010\u0089\u0001R\u001a\u0010\u008b\u0001\u001a\u00030\u008a\u00018\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u008b\u0001\u0010\u008c\u0001R\u0019\u0010\u008d\u0001\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008d\u0001\u0010\u008e\u0001R\u0019\u0010\u008f\u0001\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008f\u0001\u0010\u008e\u0001R\u001a\u0010\u0091\u0001\u001a\u00030\u0090\u00018\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0091\u0001\u0010\u0092\u0001R\u0019\u0010\u0093\u0001\u001a\u00020\u000b8\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0093\u0001\u0010\u0094\u0001R\u001a\u0010\u0096\u0001\u001a\u00030\u0095\u00018\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0096\u0001\u0010\u0097\u0001R\u0019\u0010\u0098\u0001\u001a\u00020\u00048\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0098\u0001\u0010\u0099\u0001R\u001a\u0010\u009b\u0001\u001a\u00030\u009a\u00018\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u009b\u0001\u0010\u009c\u0001R!\u0010\u009d\u0001\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u009d\u0001\u0010\u009e\u0001R!\u0010\u009f\u0001\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u009f\u0001\u0010\u009e\u0001R \u0010\u00a1\u0001\u001a\t\u0012\u0004\u0012\u00020#0\u00a0\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00a1\u0001\u0010\u009e\u0001R\u001f\u0010\u00a2\u0001\u001a\u0008\u0012\u0004\u0012\u00020e0(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00a2\u0001\u0010\u009e\u0001R\'\u0010\u00a5\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0005\u0012\u00030\u00a4\u00010\u00a3\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00a5\u0001\u0010\u00a6\u0001R\u0019\u0010\u00a7\u0001\u001a\u00020+8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00a7\u0001\u0010\u00a8\u0001R\u001a\u0010\u00aa\u0001\u001a\u00030\u00a9\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00aa\u0001\u0010\u00ab\u0001R\u0017\u0010\u0011\u001a\u00020\u00108\u0002@\u0002X\u0082.\u00a2\u0006\u0007\n\u0005\u0008\u0011\u0010\u00ac\u0001R\u001a\u0010\u00ae\u0001\u001a\u00030\u00ad\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00ae\u0001\u0010\u00af\u0001R\u001c\u0010\u00b1\u0001\u001a\u0005\u0018\u00010\u00b0\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00b1\u0001\u0010\u00b2\u0001R\u001b\u0010\u00b3\u0001\u001a\u0004\u0018\u00010z8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00b3\u0001\u0010\u00b4\u0001R\u001d\u0010\u00b5\u0001\u001a\u0008\u0012\u0004\u0012\u00020I0H8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00b5\u0001\u0010\u00b6\u0001R\u0019\u0010\u00b7\u0001\u001a\u00020E8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00b7\u0001\u0010\u00b8\u0001R\u001a\u0010\u00ba\u0001\u001a\u00030\u00b9\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00ba\u0001\u0010\u00bb\u0001R\u001c\u0010\u00bc\u0001\u001a\u0005\u0018\u00010\u00b0\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00bc\u0001\u0010\u00b2\u0001R\u0017\u0010\u001a\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u001a\u0010\u00bd\u0001R4\u0010\u00be\u0001\u001a\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u00080*8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0017\n\u0006\u0008\u00be\u0001\u0010\u00bf\u0001\u001a\u0006\u0008\u00c0\u0001\u0010\u00c1\u0001\"\u0005\u0008\u00c2\u0001\u0010\\R\u0019\u0010\u00c3\u0001\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00c3\u0001\u0010\u008e\u0001R\u0019\u0010\u00c4\u0001\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00c4\u0001\u0010\u008e\u0001R\u0017\u0010\u0013\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0013\u0010\u008e\u0001R\u0017\u0010\u0014\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0014\u0010\u008e\u0001R*\u0010\u00c6\u0001\u001a\u00020T2\u0007\u0010\u00c5\u0001\u001a\u00020T8\u0002@BX\u0082\u000e\u00a2\u0006\u0010\n\u0006\u0008\u00c6\u0001\u0010\u00c7\u0001\"\u0006\u0008\u00c8\u0001\u0010\u00c9\u0001R\u0018\u0010\u00cb\u0001\u001a\u00030\u00ca\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u00cb\u0001\u0010\u00cc\u0001R\u0019\u0010\u00cd\u0001\u001a\u00020E8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u00cd\u0001\u0010\u00b8\u0001\u00a8\u0006\u00d0\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;",
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine;",
        "<init>",
        "()V",
        "",
        "output",
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;",
        "exportListener",
        "",
        "internalExportVideo",
        "(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V",
        "Ll/ker;",
        "owner",
        "initialize",
        "(Ll/ker;)V",
        "initializeEGL",
        "Landroid/view/TextureView;",
        "textureView",
        "",
        "previewWidth",
        "previewHeight",
        "initPreview",
        "(Landroid/view/TextureView;II)V",
        "internalPlay",
        "prepareOutputSurface",
        "",
        "progress",
        "internalRender",
        "(F)V",
        "seekAt",
        "calculateIndexFromDuration",
        "(F)Ljava/lang/Integer;",
        "index",
        "calculateSeekOffset",
        "(IF)F",
        "Ll/u1e0;",
        "scene",
        "offset",
        "interpolateOffset",
        "(Ll/u1e0;F)F",
        "",
        "images",
        "Lkotlin/Function1;",
        "",
        "onLoaded",
        "Lkotlinx/coroutines/o;",
        "applyPathData",
        "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;",
        "Landroid/net/Uri;",
        "applyUriData",
        "(Ljava/util/List;)Lkotlinx/coroutines/o;",
        "processScene",
        "(Ll/u1e0;)V",
        "path",
        "createScene",
        "(Ljava/lang/String;)Ll/u1e0;",
        "uri",
        "(Landroid/net/Uri;)Ll/u1e0;",
        "Ljava/io/File;",
        "cacheFile",
        "assembleScene",
        "(Ljava/io/File;)Ll/u1e0;",
        "evaluateDuration",
        "setDefaultEndTransition",
        "prepareDrawer",
        "Lkotlin/Function0;",
        "draw",
        "renderFramebuffer",
        "(Lkotlin/jvm/functions/Function0;)V",
        "",
        "renderSurface",
        "(Z)V",
        "Ljava/util/Queue;",
        "Ljava/lang/Runnable;",
        "runnables",
        "run",
        "(Ljava/util/Queue;)V",
        "addPreDrawQueue",
        "runnable",
        "io",
        "onCreate",
        "onDestroy",
        "log",
        "setLogger",
        "Ll/del0;",
        "format",
        "loadImageFromPath",
        "(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V",
        "uris",
        "loadImageFromUri",
        "setPreview",
        "play",
        "(Lkotlin/jvm/functions/Function1;)V",
        "pause",
        "exportVideo",
        "Ll/vdl0;",
        "videoEntry",
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;",
        "assembleListener",
        "assembleVideo",
        "(Ll/vdl0;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;)V",
        "Ll/ahj0;",
        "transition",
        "setTransitionAt",
        "(ILl/ahj0;)V",
        "cancel",
        "render$android_release",
        "render",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
        "dispatcher",
        "launch$android_release",
        "(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;)Lkotlinx/coroutines/o;",
        "launch",
        "Landroid/graphics/SurfaceTexture;",
        "texture",
        "createWindowSurface$android_release",
        "(Landroid/graphics/SurfaceTexture;)V",
        "createWindowSurface",
        "Landroid/view/Surface;",
        "surface",
        "release",
        "(Landroid/view/Surface;Z)V",
        "Ll/gse;",
        "requireEglCore$android_release",
        "()Ll/gse;",
        "requireEglCore",
        "renderToSurface",
        "onDraw",
        "processFrame$android_release",
        "(ZFLkotlin/jvm/functions/Function1;)V",
        "processFrame",
        "Ll/xqb;",
        "exceptionHandler",
        "Ll/xqb;",
        "Landroid/view/TextureView$SurfaceTextureListener;",
        "Lcom/p1/mobile/android/media/gltransition/TextureListener;",
        "userTextureListener",
        "Landroid/view/TextureView$SurfaceTextureListener;",
        "Ll/fhq0;",
        "outputSurface",
        "Ll/fhq0;",
        "framebuffer",
        "I",
        "outputTexId",
        "Ll/gij0;",
        "textureDrawer",
        "Ll/gij0;",
        "lifecycleOwner",
        "Ll/ker;",
        "Landroid/content/Context;",
        "context",
        "Landroid/content/Context;",
        "baseDir",
        "Ljava/lang/String;",
        "Ll/s13;",
        "bitmapCache",
        "Ll/s13;",
        "imageUris",
        "Ljava/util/List;",
        "imagePaths",
        "",
        "scenes",
        "transitions",
        "",
        "Ll/dij0;",
        "transitionRenders",
        "Ljava/util/Map;",
        "totalDuration",
        "J",
        "",
        "durations",
        "[J",
        "Landroid/view/TextureView;",
        "Ll/hij0;",
        "renderThread",
        "Ll/hij0;",
        "Landroid/os/Handler;",
        "renderHandler",
        "Landroid/os/Handler;",
        "eglCore",
        "Ll/gse;",
        "preDraw",
        "Ljava/util/Queue;",
        "isPlaying",
        "Z",
        "Ll/g1m;",
        "ioThread",
        "Ll/g1m;",
        "ioHandler",
        "F",
        "playProgress",
        "Lkotlin/jvm/functions/Function1;",
        "getPlayProgress",
        "()Lkotlin/jvm/functions/Function1;",
        "setPlayProgress",
        "videoWidth",
        "videoHeight",
        "value",
        "videoFormat",
        "Ll/del0;",
        "setVideoFormat",
        "(Ll/del0;)V",
        "Ll/tcl0;",
        "videoComposer",
        "Ll/tcl0;",
        "prepared",
        "Companion",
        "a",
        "android_release"
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
.field private static final BASE_DIR:Ljava/lang/String; = "image.video"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final Companion:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private baseDir:Ljava/lang/String;

.field private bitmapCache:Ll/s13;

.field private context:Landroid/content/Context;

.field private durations:[J
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private eglCore:Ll/gse;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final exceptionHandler:Ll/xqb;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private framebuffer:I

.field private imagePaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private imageUris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private ioHandler:Landroid/os/Handler;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private ioThread:Ll/g1m;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private isPlaying:Z

.field private lifecycleOwner:Ll/ker;

.field private outputSurface:Ll/fhq0;

.field private outputTexId:I

.field private playProgress:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final preDraw:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private prepared:Z

.field private previewHeight:I

.field private previewWidth:I

.field private progress:F

.field private renderHandler:Landroid/os/Handler;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private renderThread:Ll/hij0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private scenes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/u1e0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private textureDrawer:Ll/gij0;

.field private textureView:Landroid/view/TextureView;

.field private totalDuration:J

.field private transitionRenders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/dij0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private transitions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Ll/ahj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private userTextureListener:Landroid/view/TextureView$SurfaceTextureListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final videoComposer:Ll/tcl0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private videoFormat:Ll/del0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private videoHeight:I

.field private videoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->Companion:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/xqb;->h0:Ll/xqb$a;

    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$f;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$f;-><init>(Ll/xqb$a;)V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->exceptionHandler:Ll/xqb;

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->framebuffer:I

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputTexId:I

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 24
    .line 25
    sget-object v0, Ll/fij0;->INSTANCE:Ll/fij0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/fij0;->b()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->transitions:Ljava/util/List;

    .line 32
    .line 33
    check-cast v0, Ljava/lang/Iterable;

    .line 34
    .line 35
    const/16 v1, 0xa

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/16 v2, 0x10

    .line 46
    .line 47
    invoke-static {v1, v2}, Lkotlin/ranges/a;->b(II)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 52
    .line 53
    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Ll/ahj0;

    .line 71
    .line 72
    invoke-virtual {v1}, Ll/ahj0;->b()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    sget-object v4, Ll/cij0;->Companion:Ll/cij0$a;

    .line 77
    .line 78
    invoke-virtual {v4, v1}, Ll/cij0$a;->a(Ll/ahj0;)Ll/dij0;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v3, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iput-object v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->transitionRenders:Ljava/util/Map;

    .line 99
    .line 100
    const/4 v0, 0x0

    .line 101
    new-array v0, v0, [J

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->durations:[J

    .line 104
    .line 105
    new-instance v0, Ll/hij0;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/hij0;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderThread:Ll/hij0;

    .line 111
    .line 112
    new-instance v0, Ljava/util/LinkedList;

    .line 113
    .line 114
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 118
    .line 119
    new-instance v0, Ll/g1m;

    .line 120
    .line 121
    invoke-direct {v0}, Ll/g1m;-><init>()V

    .line 122
    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioThread:Ll/g1m;

    .line 125
    .line 126
    new-instance v0, Ll/khj0;

    .line 127
    .line 128
    invoke-direct {v0}, Ll/khj0;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->playProgress:Lkotlin/jvm/functions/Function1;

    .line 132
    .line 133
    const/16 v0, 0x2d0

    .line 134
    .line 135
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoWidth:I

    .line 136
    .line 137
    const/16 v1, 0x500

    .line 138
    .line 139
    iput v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoHeight:I

    .line 140
    .line 141
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewWidth:I

    .line 142
    .line 143
    iput v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewHeight:I

    .line 144
    .line 145
    sget-object v0, Ll/del0;->Companion:Ll/del0$a;

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/del0$a;->b()Ll/del0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 152
    .line 153
    new-instance v0, Ll/tcl0;

    .line 154
    .line 155
    invoke-direct {v0, p0}, Ll/tcl0;-><init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;)V

    .line 156
    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoComposer:Ll/tcl0;

    .line 159
    .line 160
    return-void
.end method

.method public static final synthetic access$createScene(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/net/Uri;)Ll/u1e0;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->createScene(Landroid/net/Uri;)Ll/u1e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$createScene(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ljava/lang/String;)Ll/u1e0;
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->createScene(Ljava/lang/String;)Ll/u1e0;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$evaluateDuration(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->evaluateDuration()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getOutputTexId$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputTexId:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getTotalDuration$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->totalDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic access$getTransitionRenders$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->transitionRenders:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getVideoFormat$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ll/del0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$prepareDrawer(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->prepareDrawer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$processScene(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ll/u1e0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->processScene(Ll/u1e0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setDefaultEndTransition(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->setDefaultEndTransition()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setFramebuffer$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->framebuffer:I

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setImagePaths$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->imagePaths:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setImageUris$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->imageUris:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setOutputTexId$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputTexId:I

    .line 2
    .line 3
    return-void
.end method

.method private final addPreDrawQueue(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$b;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$b;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final applyPathData(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlinx/coroutines/o;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->lifecycleOwner:Ll/ker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "lifecycleOwner"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-static {v0}, Ll/ler;->a(Ll/ker;)Landroidx/lifecycle/LifecycleCoroutineScope;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-instance v5, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;

    .line 21
    .line 22
    invoke-direct {v5, p1, p0, p2, v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;-><init>(Ljava/util/List;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    .line 23
    .line 24
    .line 25
    const/4 v6, 0x2

    .line 26
    const/4 v7, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static/range {v2 .. v7}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private final applyUriData(Ljava/util/List;)Lkotlinx/coroutines/o;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/net/Uri;",
            ">;)",
            "Lkotlinx/coroutines/o;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->lifecycleOwner:Ll/ker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "lifecycleOwner"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-static {v0}, Ll/ler;->a(Ll/ker;)Landroidx/lifecycle/LifecycleCoroutineScope;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-instance v5, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1;

    .line 21
    .line 22
    invoke-direct {v5, p1, p0, v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1;-><init>(Ljava/util/List;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/coroutines/Continuation;)V

    .line 23
    .line 24
    .line 25
    const/4 v6, 0x2

    .line 26
    const/4 v7, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-static/range {v2 .. v7}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private final assembleScene(Ljava/io/File;)Ll/u1e0;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/bok0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 13
    .line 14
    check-cast v1, Ljava/lang/Iterable;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    move-object v4, v2

    .line 32
    check-cast v4, Ll/u1e0;

    .line 33
    .line 34
    invoke-virtual {v4}, Ll/u1e0;->b()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move-object v2, v3

    .line 46
    :goto_0
    check-cast v2, Ll/u1e0;

    .line 47
    .line 48
    if-nez v2, :cond_6

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;->FIT_CENTER:Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->bitmapCache:Ll/s13;

    .line 53
    .line 54
    const-string v4, "bitmapCache"

    .line 55
    .line 56
    if-nez v2, :cond_2

    .line 57
    .line 58
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    move-object v2, v3

    .line 62
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;->key()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    new-instance v6, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v2, v5}, Ll/s13;->a(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->bitmapCache:Ll/s13;

    .line 88
    .line 89
    if-nez p0, :cond_3

    .line 90
    .line 91
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    move-object v3, p0

    .line 96
    :goto_1
    invoke-virtual {v1}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;->key()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v3, p0}, Ll/s13;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    goto :goto_3

    .line 120
    :cond_4
    sget-object v2, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->Companion:Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;

    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    new-instance v5, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;

    .line 134
    .line 135
    invoke-direct {v5, v2}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;-><init>(Landroid/graphics/Bitmap;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/del0;->g()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iget-object v6, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 145
    .line 146
    invoke-virtual {v6}, Ll/del0;->f()I

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    iget-object v7, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 151
    .line 152
    invoke-virtual {v7}, Ll/del0;->c()I

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    invoke-virtual {v5, v2, v6, v7}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->l(III)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->k()Landroid/graphics/Bitmap;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->bitmapCache:Ll/s13;

    .line 164
    .line 165
    if-nez p0, :cond_5

    .line 166
    .line 167
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_5
    move-object v3, p0

    .line 172
    :goto_2
    invoke-virtual {v1}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;->key()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    new-instance v1, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {v3, p0, v2}, Ll/s13;->c(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 192
    .line 193
    .line 194
    move-object p0, v2

    .line 195
    :goto_3
    new-instance v1, Ll/u1e0;

    .line 196
    .line 197
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 205
    .line 206
    .line 207
    invoke-direct {v1, v0, p1, p0}, Ll/u1e0;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 208
    .line 209
    .line 210
    return-object v1

    .line 211
    :cond_6
    return-object v2
.end method

.method private final calculateIndexFromDuration(F)Ljava/lang/Integer;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->durations:[J

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-wide v2, p0, v1

    .line 8
    .line 9
    long-to-float v2, v2

    .line 10
    cmpg-float v2, p1, v2

    .line 11
    .line 12
    if-gtz v2, :cond_0

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method private final calculateSeekOffset(IF)F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->durations:[J

    .line 2
    .line 3
    add-int/lit8 v1, p1, -0x1

    .line 4
    .line 5
    if-ltz v1, :cond_0

    .line 6
    .line 7
    array-length v2, v0

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget-wide v1, v0, v1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    :goto_0
    long-to-float v0, v1

    .line 16
    sub-float/2addr p2, v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/u1e0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/u1e0;->a()J

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    long-to-float p0, p0

    .line 30
    div-float/2addr p2, p0

    .line 31
    return p2
.end method

.method public static final create(Ll/ker;)Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;
    .locals 1
    .param p0    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->Companion:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;

    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;->c(Ll/ker;)Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    move-result-object p0

    return-object p0
.end method

.method private final createScene(Landroid/net/Uri;)Ll/u1e0;
    .locals 6

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->baseDir:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "baseDir"

    .line 9
    .line 10
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v1, v2

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-static {v3}, Ll/bok0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v5, "image-"

    .line 28
    .line 29
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v3, ".jpg"

    .line 36
    .line 37
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->context:Landroid/content/Context;

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    const-string v1, "context"

    .line 52
    .line 53
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    move-object v1, v2

    .line 57
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v1, Ljava/io/FileOutputStream;

    .line 66
    .line 67
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 68
    .line 69
    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    const/4 v4, 0x2

    .line 74
    invoke-static {p1, v1, v3, v4, v2}, Lkotlin/io/ByteStreamsKt;->b(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 75
    .line 76
    .line 77
    :cond_2
    if-eqz p1, :cond_3

    .line 78
    .line 79
    invoke-static {p1}, Ll/bok0;->e(Ljava/io/InputStream;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-static {v1}, Ll/bok0;->f(Ljava/io/OutputStream;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->assembleScene(Ljava/io/File;)Ll/u1e0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method private final createScene(Ljava/lang/String;)Ll/u1e0;
    .locals 6

    .line 90
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->baseDir:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "baseDir"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    move-object v1, v2

    :cond_0
    invoke-static {p1}, Ll/bok0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "image-"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".jpg"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/io/FileOutputStream;

    .line 92
    invoke-direct {p1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/4 v3, 0x0

    const/4 v4, 0x2

    .line 93
    invoke-static {v1, p1, v3, v4, v2}, Lkotlin/io/ByteStreamsKt;->b(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 94
    invoke-static {v1}, Ll/bok0;->e(Ljava/io/InputStream;)V

    .line 95
    invoke-static {p1}, Ll/bok0;->f(Ljava/io/OutputStream;)V

    .line 96
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->assembleScene(Ljava/io/File;)Ll/u1e0;

    move-result-object p0

    return-object p0
.end method

.method private final evaluateDuration()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Iterable;

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ll/u1e0;

    .line 31
    .line 32
    invoke-virtual {v3}, Ll/u1e0;->a()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    invoke-virtual {v3}, Ll/u1e0;->d()Ll/ahj0;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Ll/ahj0;->a()J

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    add-long/2addr v4, v6

    .line 45
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->sumOfLong(Ljava/lang/Iterable;)J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    iput-wide v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->totalDuration:J

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 60
    .line 61
    check-cast v0, Ljava/lang/Iterable;

    .line 62
    .line 63
    new-instance v1, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 70
    .line 71
    .line 72
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-wide/16 v2, 0x0

    .line 77
    .line 78
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_1

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Ll/u1e0;

    .line 89
    .line 90
    invoke-virtual {v4}, Ll/u1e0;->a()J

    .line 91
    .line 92
    .line 93
    move-result-wide v5

    .line 94
    invoke-virtual {v4}, Ll/u1e0;->d()Ll/ahj0;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v4}, Ll/ahj0;->a()J

    .line 99
    .line 100
    .line 101
    move-result-wide v7

    .line 102
    add-long/2addr v5, v7

    .line 103
    add-long/2addr v2, v5

    .line 104
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-interface {v1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->toLongArray(Ljava/util/Collection;)[J

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->durations:[J

    .line 117
    .line 118
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;->b()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Lkotlin/Unit;
    .locals 3

    .line 1
    new-instance v0, Ll/gse;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, v2}, Ll/gse;-><init>(Landroid/opengl/EGLContext;I)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->eglCore:Ll/gse;

    .line 9
    .line 10
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    return-object p0
.end method

.method private final initPreview(Landroid/view/TextureView;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureView:Landroid/view/TextureView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewWidth:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewHeight:I

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->userTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->createWindowSurface$android_release(Landroid/graphics/SurfaceTexture;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic initPreview$default(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/view/TextureView;IIILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x2

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const/16 p2, 0x2d0

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    const/16 p3, 0x500

    .line 12
    .line 13
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->initPreview(Landroid/view/TextureView;II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private final initialize(Ll/ker;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->lifecycleOwner:Ll/ker;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->Companion:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;->b(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;Ll/ker;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->context:Landroid/content/Context;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "context"

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    move-object p1, v1

    .line 20
    :cond_0
    invoke-static {v0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;->a(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$a;Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->baseDir:Ljava/lang/String;

    .line 25
    .line 26
    new-instance p1, Ll/s13;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->context:Landroid/content/Context;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v1, v0

    .line 37
    :goto_0
    invoke-direct {p1, v1}, Ll/s13;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->bitmapCache:Ll/s13;

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderThread:Ll/hij0;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 45
    .line 46
    .line 47
    new-instance p1, Landroid/os/Handler;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderThread:Ll/hij0;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderHandler:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioThread:Ll/g1m;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 63
    .line 64
    .line 65
    new-instance p1, Landroid/os/Handler;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioThread:Ll/g1m;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioHandler:Landroid/os/Handler;

    .line 77
    .line 78
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->initializeEGL()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private final initializeEGL()V
    .locals 1

    .line 1
    new-instance v0, Ll/jhj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final internalExportVideo(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V
    .locals 6

    .line 1
    invoke-interface {p2}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;->d()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vdl0;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iget-wide v4, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->totalDuration:J

    .line 10
    .line 11
    move-object v3, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Ll/vdl0;-><init>(Ll/del0;Ll/qa1;Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoComposer:Ll/tcl0;

    .line 16
    .line 17
    new-instance v2, Ll/shj0;

    .line 18
    .line 19
    invoke-direct {v2, p2}, Ll/shj0;-><init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 20
    .line 21
    .line 22
    new-instance v3, Ll/thj0;

    .line 23
    .line 24
    invoke-direct {v3, p2}, Ll/thj0;-><init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 25
    .line 26
    .line 27
    new-instance v4, Ll/uhj0;

    .line 28
    .line 29
    invoke-direct {v4, p2}, Ll/uhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 30
    .line 31
    .line 32
    new-instance v5, Ll/vhj0;

    .line 33
    .line 34
    invoke-direct {v5, p2}, Ll/vhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 35
    .line 36
    .line 37
    move-object v1, v0

    .line 38
    move-object v0, p0

    .line 39
    invoke-virtual/range {v0 .. v5}, Ll/tcl0;->o(Ll/vdl0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private final internalPlay()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->isPlaying:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iget-object v3, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 14
    .line 15
    invoke-virtual {v3}, Ll/del0;->e()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    int-to-double v3, v3

    .line 20
    const-wide v5, 0x41cdcd6500000000L    # 1.0E9

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    div-double v6, v5, v3

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    iget-wide v8, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->totalDuration:J

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    iput-boolean v5, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->isPlaying:Z

    .line 35
    .line 36
    iget v10, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->progress:F

    .line 37
    .line 38
    const-wide/16 v11, 0x0

    .line 39
    .line 40
    move-wide v13, v11

    .line 41
    move-wide v11, v3

    .line 42
    :goto_0
    iget-boolean v5, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->isPlaying:Z

    .line 43
    .line 44
    if-eqz v5, :cond_4

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v15

    .line 50
    move-wide/from16 v17, v1

    .line 51
    .line 52
    sub-long v1, v15, v3

    .line 53
    .line 54
    long-to-float v1, v1

    .line 55
    long-to-float v2, v8

    .line 56
    div-float/2addr v1, v2

    .line 57
    move-wide v15, v3

    .line 58
    float-to-double v2, v1

    .line 59
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 60
    .line 61
    cmpl-double v2, v2, v4

    .line 62
    .line 63
    if-ltz v2, :cond_1

    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    move-wide v15, v2

    .line 70
    :cond_1
    const/4 v2, 0x0

    .line 71
    const/high16 v3, 0x3f800000    # 1.0f

    .line 72
    .line 73
    invoke-static {v1, v2, v3}, Ll/bok0;->d(FFF)F

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 78
    .line 79
    .line 80
    move-result-wide v19

    .line 81
    sub-long v2, v19, v17

    .line 82
    .line 83
    long-to-double v2, v2

    .line 84
    div-double/2addr v2, v6

    .line 85
    add-double/2addr v13, v2

    .line 86
    cmpl-double v2, v13, v4

    .line 87
    .line 88
    if-ltz v2, :cond_2

    .line 89
    .line 90
    add-float/2addr v1, v10

    .line 91
    iput v1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->progress:F

    .line 92
    .line 93
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 94
    .line 95
    add-double/2addr v13, v2

    .line 96
    iget-object v2, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->playProgress:Lkotlin/jvm/functions/Function1;

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    :cond_2
    iget v2, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->progress:F

    .line 106
    .line 107
    const/4 v4, 0x4

    .line 108
    const/4 v5, 0x0

    .line 109
    const/4 v1, 0x1

    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->processFrame$android_release$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;ZFLkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 115
    .line 116
    .line 117
    move-result-wide v0

    .line 118
    sub-long/2addr v0, v11

    .line 119
    const-wide/16 v2, 0x3e8

    .line 120
    .line 121
    cmp-long v0, v0, v2

    .line 122
    .line 123
    if-lez v0, :cond_3

    .line 124
    .line 125
    add-long/2addr v11, v2

    .line 126
    :cond_3
    move-object/from16 v0, p0

    .line 127
    .line 128
    move-wide v3, v15

    .line 129
    move-wide/from16 v1, v19

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    :goto_1
    return-void
.end method

.method private final internalRender(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->run(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->totalDuration:J

    .line 7
    .line 8
    long-to-float v0, v0

    .line 9
    mul-float/2addr v0, p1

    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->calculateIndexFromDuration(F)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->calculateSeekOffset(IF)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/u1e0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/u1e0;->c()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x1

    .line 39
    .line 40
    invoke-static {v3, p1}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ll/u1e0;

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/u1e0;->c()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 p1, -0x1

    .line 54
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->transitionRenders:Ljava/util/Map;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/u1e0;->d()Ll/ahj0;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v4}, Ll/ahj0;->b()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ll/dij0;

    .line 69
    .line 70
    if-nez v3, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    invoke-direct {p0, v1, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->interpolateOffset(Ll/u1e0;F)F

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/4 v1, 0x0

    .line 78
    const/high16 v4, 0x3f800000    # 1.0f

    .line 79
    .line 80
    invoke-static {v0, v1, v4}, Ll/bok0;->h(FFF)F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {v3, v0}, Ll/dij0;->C(F)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/whj0;

    .line 88
    .line 89
    invoke-direct {v0, v3, v2, p1}, Ll/whj0;-><init>(Ll/dij0;II)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderFramebuffer(Lkotlin/jvm/functions/Function0;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_1
    return-void
.end method

.method private final interpolateOffset(Ll/u1e0;F)F
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/u1e0;->a()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ll/u1e0;->d()Ll/ahj0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/ahj0;->a()J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    long-to-float p0, p0

    .line 14
    long-to-float p1, v0

    .line 15
    div-float/2addr p0, p1

    .line 16
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    sub-float v0, p1, p0

    .line 19
    .line 20
    sub-float/2addr p2, v0

    .line 21
    div-float/2addr p2, p0

    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p2, p0, p1}, Ll/bok0;->d(FFF)F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method private final io(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nhj0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/nhj0;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;->c()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Iterable;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/u1e0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/u1e0;->e()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->transitionRenders:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Iterable;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/dij0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/cij0;->o()V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->eglCore:Ll/gse;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/gse;->e()V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderThread:Ll/hij0;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 63
    .line 64
    .line 65
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 66
    .line 67
    return-object p0
.end method

.method public static l(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->internalPlay()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static m()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method

.method public static n(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;Ljava/lang/Throwable;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;->a(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static o(F)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/view/Surface;Z)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/fhq0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->requireEglCore$android_release()Ll/gse;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p1, p2}, Ll/fhq0;-><init>(Ll/gse;Landroid/view/Surface;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/gte;->b()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureDrawer:Ll/gij0;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    new-instance p1, Ll/gij0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/gij0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureDrawer:Ll/gij0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/gij0;->b()V

    .line 31
    .line 32
    .line 33
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 34
    .line 35
    return-object p0
.end method

.method private final prepareDrawer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final prepareOutputSurface()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->prepared:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureView:Landroid/view/TextureView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "textureView"

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :cond_1
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->createWindowSurface$android_release(Landroid/graphics/SurfaceTexture;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->prepared:Z

    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method private final processScene(Ll/u1e0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;

    .line 9
    .line 10
    invoke-direct {v1, p1, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;-><init>(Ll/u1e0;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static q(Ll/dij0;II)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dij0;->z(II)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static r(Lkotlin/jvm/functions/Function0;)V
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 14
    .line 15
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private final renderFramebuffer(Lkotlin/jvm/functions/Function0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoWidth:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoHeight:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->framebuffer:I

    .line 10
    .line 11
    const v0, 0x8d40

    .line 12
    .line 13
    .line 14
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic renderFramebuffer$default(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/ohj0;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/ohj0;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderFramebuffer(Lkotlin/jvm/functions/Function0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final renderSurface(Z)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 5
    .line 6
    const-string v0, "outputSurface"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object p1, v1

    .line 15
    :cond_1
    invoke-virtual {p1}, Ll/gte;->b()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureDrawer:Ll/gij0;

    .line 19
    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    const-string p1, "textureDrawer"

    .line 23
    .line 24
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object p1, v1

    .line 28
    :cond_2
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputTexId:I

    .line 29
    .line 30
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewWidth:I

    .line 31
    .line 32
    iget v4, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->previewHeight:I

    .line 33
    .line 34
    invoke-virtual {p1, v2, v3, v4}, Ll/gij0;->a(III)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 38
    .line 39
    if-nez p0, :cond_3

    .line 40
    .line 41
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    move-object v1, p0

    .line 46
    :goto_0
    invoke-virtual {v1}, Ll/gte;->d()Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private final run(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Runnable;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void
.end method

.method public static s(Lkotlin/jvm/functions/Function0;)V
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 14
    .line 15
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private final setDefaultEndTransition()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ll/f4g0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/f4g0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->setTransitionAt(ILl/ahj0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final setVideoFormat(Ll/del0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/del0;->g()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoWidth:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/del0;->f()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoHeight:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoFormat:Ll/del0;

    .line 14
    .line 15
    return-void
.end method

.method public static t(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;F)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;->e(F)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static u(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/graphics/SurfaceTexture;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/fhq0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->requireEglCore$android_release()Ll/gse;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p1}, Ll/fhq0;-><init>(Ll/gse;Landroid/graphics/SurfaceTexture;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputSurface:Ll/fhq0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/gte;->b()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureDrawer:Ll/gij0;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    new-instance p1, Ll/gij0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/gij0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->textureDrawer:Ll/gij0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/gij0;->b()V

    .line 31
    .line 32
    .line 33
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 34
    .line 35
    return-object p0
.end method

.method public static v(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Lkotlin/Unit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->ioThread:Ll/g1m;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 4
    .line 5
    .line 6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object p0
.end method


# virtual methods
.method public assembleVideo(Ll/vdl0;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;)V
    .locals 0
    .param p1    # Ll/vdl0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->videoComposer:Ll/tcl0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tcl0;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public createWindowSurface$android_release(Landroid/graphics/SurfaceTexture;)V
    .locals 1
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rhj0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/rhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/graphics/SurfaceTexture;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public createWindowSurface$android_release(Landroid/view/Surface;Z)V
    .locals 1
    .param p1    # Landroid/view/Surface;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    new-instance v0, Ll/lhj0;

    invoke-direct {v0, p0, p1, p2}, Ll/lhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/view/Surface;Z)V

    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public exportVideo(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;
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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->internalExportVideo(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final getPlayProgress()Lkotlin/jvm/functions/Function1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->playProgress:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object p0
.end method

.method public launch$android_release(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;)Lkotlinx/coroutines/o;
    .locals 8
    .param p1    # Lkotlinx/coroutines/CoroutineDispatcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineDispatcher;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlinx/coroutines/o;"
        }
    .end annotation

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
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->lifecycleOwner:Ll/ker;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "lifecycleOwner"

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v0, v1

    .line 18
    :cond_0
    invoke-static {v0}, Ll/ler;->a(Ll/ker;)Landroidx/lifecycle/LifecycleCoroutineScope;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->exceptionHandler:Ll/xqb;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v5, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$launch$1;

    .line 29
    .line 30
    invoke-direct {v5, p2, v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$launch$1;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    .line 31
    .line 32
    .line 33
    const/4 v6, 0x2

    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-static/range {v2 .. v7}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public loadImageFromPath(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/del0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/del0;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->applyPathData(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->setVideoFormat(Ll/del0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public loadImageFromUri(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/del0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/net/Uri;",
            ">;",
            "Ll/del0;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->applyUriData(Ljava/util/List;)Lkotlinx/coroutines/o;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->setVideoFormat(Ll/del0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onCreate(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->initialize(Ll/ker;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDestroy(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public pause()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->isPlaying:Z

    .line 3
    .line 4
    return-void
.end method

.method public play(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->playProgress:Lkotlin/jvm/functions/Function1;

    .line 5
    .line 6
    new-instance p1, Ll/ihj0;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/ihj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public processFrame$android_release(ZFLkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZF",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->prepareOutputSurface()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->internalRender(F)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderSurface(Z)V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->outputTexId:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->isPlaying:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->cancel()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/phj0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/phj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/qhj0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/qhj0;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->io(Lkotlin/jvm/functions/Function0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public render$android_release(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->renderHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/mhj0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/mhj0;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public requireEglCore$android_release()Ll/gse;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->eglCore:Ll/gse;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Required value was null."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public setLogger(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final setPlayProgress(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->playProgress:Lkotlin/jvm/functions/Function1;

    .line 5
    .line 6
    return-void
.end method

.method public setPreview(Landroid/view/TextureView;II)V
    .locals 0
    .param p1    # Landroid/view/TextureView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->initPreview(Landroid/view/TextureView;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTransitionAt(ILl/ahj0;)V
    .locals 1
    .param p2    # Ll/ahj0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ge p1, v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->scenes:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/u1e0;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ll/u1e0;->f(Ll/ahj0;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->preDraw:Ljava/util/Queue;

    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ll/ahj0;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "index out of range"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
