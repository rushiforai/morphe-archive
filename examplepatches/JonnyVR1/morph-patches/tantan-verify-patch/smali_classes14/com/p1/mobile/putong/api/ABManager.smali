.class public final Lcom/p1/mobile/putong/api/ABManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/ABManager$a;,
        Lcom/p1/mobile/putong/api/ABManager$b;,
        Lcom/p1/mobile/putong/api/ABManager$c;,
        Lcom/p1/mobile/putong/api/ABManager$d;,
        Lcom/p1/mobile/putong/api/ABManager$Mode;,
        Lcom/p1/mobile/putong/api/ABManager$e;,
        Lcom/p1/mobile/putong/api/ABManager$f;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00a2\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008!\n\u0002\u0010!\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u001c\n\u0002\u0010\"\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\n\u0087\u0001\u00ab\u0001\u0008\u0005\u0080\u0001\u0085\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u0006J\u001b\u0010\r\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u000c\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u0019\u0010\u0010\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u000c\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u0019\u0010\u0014\u001a\u00020\u00132\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001b\u0010\u0016\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0004\u0008\u0016\u0010\u000eJ\'\u0010\u001b\u001a\u00020\u00192\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u001a\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ!\u0010\u001d\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ+\u0010 \u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u00072\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0004\u0008 \u0010!J\u0015\u0010#\u001a\u0008\u0012\u0004\u0012\u00020\u00190\"H\u0007\u00a2\u0006\u0004\u0008#\u0010$J\u0015\u0010&\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008&\u0010$J\u0015\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008\'\u0010$J\u0015\u0010(\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008(\u0010$J\u0015\u0010)\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008)\u0010$J\u0015\u0010*\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008*\u0010$J\u0015\u0010+\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008+\u0010$J\u0015\u0010,\u001a\u0008\u0012\u0004\u0012\u00020%0\"H\u0007\u00a2\u0006\u0004\u0008,\u0010$J\u000f\u0010-\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008-\u0010\tJ\u0017\u00100\u001a\u00020\u00132\u0006\u0010/\u001a\u00020.H\u0007\u00a2\u0006\u0004\u00080\u00101J\u0017\u00103\u001a\u00020\u00132\u0006\u00102\u001a\u00020.H\u0007\u00a2\u0006\u0004\u00083\u00101J%\u00107\u001a\u0004\u0018\u0001042\u0008\u00105\u001a\u0004\u0018\u0001042\u0008\u00106\u001a\u0004\u0018\u000104H\u0002\u00a2\u0006\u0004\u00087\u00108J\u000f\u00109\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u00089\u0010\u0003J\u0017\u0010<\u001a\u00020\u00132\u0006\u0010;\u001a\u00020:H\u0007\u00a2\u0006\u0004\u0008<\u0010=J\u000f\u0010>\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008>\u0010\u0003J\u000f\u0010?\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008?\u0010\u0003J\u0017\u0010B\u001a\u00020A2\u0006\u0010@\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008B\u0010CJ\u0017\u0010F\u001a\u00020D2\u0006\u0010E\u001a\u00020DH\u0007\u00a2\u0006\u0004\u0008F\u0010GJ\u000f\u0010H\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008H\u0010\u0003J\u000f\u0010I\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008I\u0010\u0003J\'\u0010M\u001a\u00020\u00132\u0006\u0010J\u001a\u00020\u00072\u0006\u0010K\u001a\u00020\u00072\u0006\u0010L\u001a\u00020AH\u0007\u00a2\u0006\u0004\u0008M\u0010NJ\u0019\u0010Q\u001a\u00020\u00072\u0008\u0010P\u001a\u0004\u0018\u00010OH\u0002\u00a2\u0006\u0004\u0008Q\u0010RJ\u0017\u0010U\u001a\u00020S2\u0006\u0010T\u001a\u00020SH\u0002\u00a2\u0006\u0004\u0008U\u0010VJ\u001f\u0010Y\u001a\u00020\u00132\u0006\u0010T\u001a\u00020S2\u0006\u0010X\u001a\u00020WH\u0002\u00a2\u0006\u0004\u0008Y\u0010ZJ\u0017\u0010[\u001a\u00020S2\u0006\u0010T\u001a\u00020SH\u0002\u00a2\u0006\u0004\u0008[\u0010VJ\u001f\u0010\\\u001a\u00020\u00132\u0006\u0010T\u001a\u00020S2\u0006\u0010X\u001a\u00020WH\u0002\u00a2\u0006\u0004\u0008\\\u0010ZJ\u001f\u0010^\u001a\u00020\u00132\u0006\u0010X\u001a\u00020W2\u0006\u0010K\u001a\u00020]H\u0007\u00a2\u0006\u0004\u0008^\u0010_J#\u0010b\u001a\u0004\u0018\u0001042\u0006\u0010`\u001a\u00020\u00072\u0008\u0008\u0002\u0010a\u001a\u00020AH\u0002\u00a2\u0006\u0004\u0008b\u0010cJ#\u0010f\u001a\u00020\u00192\u0008\u0010d\u001a\u0004\u0018\u0001042\u0008\u0010e\u001a\u0004\u0018\u000104H\u0002\u00a2\u0006\u0004\u0008f\u0010gJ\u0019\u0010i\u001a\u00020A2\u0008\u0008\u0001\u0010h\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008i\u0010CJ\u000f\u0010j\u001a\u00020AH\u0007\u00a2\u0006\u0004\u0008j\u0010kJ\u0017\u0010m\u001a\u00020\u00132\u0006\u0010l\u001a\u00020AH\u0007\u00a2\u0006\u0004\u0008m\u0010nJ\u0017\u0010p\u001a\u00020\u00132\u0006\u0010o\u001a\u00020AH\u0007\u00a2\u0006\u0004\u0008p\u0010nJ\u000f\u0010q\u001a\u00020AH\u0007\u00a2\u0006\u0004\u0008q\u0010kJ\u000f\u0010r\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008r\u0010\u0003J\u000f\u0010s\u001a\u00020\u0013H\u0007\u00a2\u0006\u0004\u0008s\u0010\u0003J\u0019\u0010t\u001a\u00020\u00132\u0008\u0008\u0001\u0010h\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u0008t\u0010uJ+\u0010w\u001a\u0004\u0018\u00010\u00072\u0008\u0010v\u001a\u0004\u0018\u0001042\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008w\u0010xJ\u001f\u0010z\u001a\u00020\u00132\u0006\u0010y\u001a\u0002042\u0006\u0010J\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008z\u0010{J\u000f\u0010|\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008|\u0010\u0003J\u0017\u0010}\u001a\u00020\u00132\u0006\u0010K\u001a\u00020]H\u0007\u00a2\u0006\u0004\u0008}\u0010~R\u001d\u0010\u0082\u0001\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u007f8\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0080\u0001\u0010\u0081\u0001R\u0016\u0010\u0084\u0001\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008\u0005\u0010\u0083\u0001R\u0017\u0010\u0086\u0001\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0085\u0001\u0010\u0083\u0001R\u0017\u0010\u0088\u0001\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0087\u0001\u0010\u0083\u0001R\u0016\u0010\u0089\u0001\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008\u0008\u0010\u0083\u0001R\u001d\u0010\u008c\u0001\u001a\t\u0012\u0004\u0012\u00020\u00190\u008a\u00018\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008F\u0010\u008b\u0001R\u001e\u0010\u008e\u0001\u001a\t\u0012\u0004\u0012\u00020%0\u008a\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u008d\u0001\u0010\u008b\u0001R\u001e\u0010\u0090\u0001\u001a\t\u0012\u0004\u0012\u00020%0\u008a\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u008f\u0001\u0010\u008b\u0001R\u001e\u0010\u0092\u0001\u001a\t\u0012\u0004\u0012\u00020%0\u008a\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0091\u0001\u0010\u008b\u0001R\u001e\u0010\u0094\u0001\u001a\t\u0012\u0004\u0012\u00020%0\u008a\u00018\u0002X\u0082\u0004\u00a2\u0006\u0008\n\u0006\u0008\u0093\u0001\u0010\u008b\u0001R\u0017\u0010l\u001a\u00020A8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0095\u0001\u0010MR\u0017\u0010\u0096\u0001\u001a\u00020A8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008Q\u0010MR\u0017\u0010\u0097\u0001\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008&\u0010\u000bR\u001a\u0010\u0099\u0001\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008*\u0010\u0098\u0001R\u001a\u0010\u009a\u0001\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\'\u0010\u0098\u0001R\u001a\u0010\u009b\u0001\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008+\u0010\u0098\u0001R\u0017\u0010\u009c\u0001\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008)\u0010\u000bR\u0017\u0010\u009d\u0001\u001a\u00020A8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008,\u0010MR\u001f\u0010\u009f\u0001\u001a\u0004\u0018\u00010\u00078FX\u0087\u0004\u00a2\u0006\u000e\u0012\u0005\u0008\u009e\u0001\u0010\u0003\u001a\u0005\u0008\u008f\u0001\u0010\tR \u0010\u00a2\u0001\u001a\u0004\u0018\u00010O8FX\u0087\u0004\u00a2\u0006\u000f\u0012\u0005\u0008\u00a1\u0001\u0010\u0003\u001a\u0006\u0008\u0095\u0001\u0010\u00a0\u0001R\u001d\u0010\u00a4\u0001\u001a\u00020\u00078FX\u0087\u0004\u00a2\u0006\u000e\u0012\u0005\u0008\u00a3\u0001\u0010\u0003\u001a\u0005\u0008\u0093\u0001\u0010\tR\u001d\u0010\u00a6\u0001\u001a\u00020\u00078FX\u0087\u0004\u00a2\u0006\u000e\u0012\u0005\u0008\u00a5\u0001\u0010\u0003\u001a\u0005\u0008\u0091\u0001\u0010\tR\'\u0010\u00aa\u0001\u001a\u000b\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00a7\u00018FX\u0087\u0004\u00a2\u0006\u000f\u0012\u0005\u0008\u00a9\u0001\u0010\u0003\u001a\u0006\u0008\u008d\u0001\u0010\u00a8\u0001\u00a8\u0006\u00ac\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/api/ABManager;",
        "",
        "<init>",
        "()V",
        "Ll/wyd0;",
        "b",
        "()Ll/wyd0;",
        "",
        "e",
        "()Ljava/lang/String;",
        "c0",
        "I",
        "key",
        "i0",
        "(Ljava/lang/String;)Ljava/lang/String;",
        "b0",
        "j0",
        "Lcom/p1/mobile/putong/api/ABManager$d;",
        "abController",
        "",
        "R",
        "(Lcom/p1/mobile/putong/api/ABManager$d;)V",
        "h0",
        "ab_key",
        "property_key",
        "",
        "defaultVal",
        "A",
        "(Ljava/lang/String;Ljava/lang/String;I)I",
        "P",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        "defaultString",
        "Q",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        "Lrx/c;",
        "W",
        "()Lrx/c;",
        "Ll/uxj0;",
        "m",
        "o",
        "L",
        "q",
        "n",
        "p",
        "r",
        "E",
        "Landroid/os/Bundle;",
        "outState",
        "K",
        "(Landroid/os/Bundle;)V",
        "savedInstanceState",
        "J",
        "Lcom/p1/mobile/putong/api/ABManager$b;",
        "oldGroup",
        "newGroup",
        "G",
        "(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;",
        "D",
        "Landroid/content/Context;",
        "context",
        "V",
        "(Landroid/content/Context;)V",
        "x",
        "a0",
        "state",
        "",
        "v",
        "(I)Z",
        "Ll/rg50$b;",
        "client",
        "f",
        "(Ll/rg50$b;)Ll/rg50$b;",
        "U",
        "T",
        "type",
        "mode",
        "oneIdTimeOut",
        "Z",
        "(Ljava/lang/String;Ljava/lang/String;Z)V",
        "Lorg/json/JSONArray;",
        "jsonArray",
        "l",
        "(Lorg/json/JSONArray;)Ljava/lang/String;",
        "Ll/x1d0;",
        "request",
        "B",
        "(Ll/x1d0;)Ll/x1d0;",
        "Ll/i5d0;",
        "response",
        "C",
        "(Ll/x1d0;Ll/i5d0;)V",
        "M",
        "N",
        "Lcom/p1/mobile/putong/api/ABManager$Mode;",
        "g0",
        "(Ll/i5d0;Lcom/p1/mobile/putong/api/ABManager$Mode;)V",
        "testBody",
        "ignoreexpiredSince",
        "s",
        "(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;",
        "oldItem",
        "newItem",
        "H",
        "(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)I",
        "deviceABStatus",
        "y",
        "u",
        "()Z",
        "hasRequestUidAb",
        "X",
        "(Z)V",
        "hasUidOnNext",
        "Y",
        "z",
        "d0",
        "f0",
        "e0",
        "(I)V",
        "abGroups",
        "O",
        "(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        "groups",
        "S",
        "(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;)V",
        "w",
        "F",
        "(Lcom/p1/mobile/putong/api/ABManager$Mode;)V",
        "",
        "a",
        "Ljava/util/List;",
        "controllers",
        "Ll/wyd0;",
        "abgroups_mode_device",
        "c",
        "abgroups_mode_uid",
        "d",
        "newAbgroups_mode_device",
        "newAbgroups_mode_uid",
        "Lrx/subjects/a;",
        "Lrx/subjects/a;",
        "restartBs",
        "g",
        "modeDeviceBs",
        "h",
        "oneIdDeviceBs",
        "i",
        "modeUserBs",
        "j",
        "modeUidBs",
        "k",
        "hasUidABOnNext",
        "INIT_STATE",
        "Lcom/p1/mobile/putong/api/ABManager$b;",
        "abGroupsUser",
        "abGroupsDevice",
        "abGroupsUid",
        "sDeviceABStatus",
        "hasInitABGroup",
        "getAbHeader$annotations",
        "abHeader",
        "()Lorg/json/JSONArray;",
        "getJSONAbNames$annotations",
        "jSONAbNames",
        "getDeviceABNames$annotations",
        "deviceABNames",
        "getAbNames$annotations",
        "abNames",
        "",
        "()Ljava/util/Set;",
        "getABGroupKeys$annotations",
        "aBGroupKeys",
        "Mode",
        "putong-common_intlGmsRelease"
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
.field public static final INSTANCE:Lcom/p1/mobile/putong/api/ABManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/api/ABManager$d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ll/wyd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:Ll/wyd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Ll/wyd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:Ll/wyd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static volatile k:Z

.field public static volatile l:Z

.field public static volatile m:I

.field public static n:Lcom/p1/mobile/putong/api/ABManager$b;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static o:Lcom/p1/mobile/putong/api/ABManager$b;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static p:Lcom/p1/mobile/putong/api/ABManager$b;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static volatile q:I

.field public static volatile r:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/ABManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->a:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ll/wyd0;

    .line 16
    .line 17
    const-string v1, "abgroups_mode_device"

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->b:Ll/wyd0;

    .line 25
    .line 26
    new-instance v0, Ll/wyd0;

    .line 27
    .line 28
    const-string v1, "abgroups_mode_uid"

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->c:Ll/wyd0;

    .line 34
    .line 35
    new-instance v0, Ll/wyd0;

    .line 36
    .line 37
    const-string v1, "newabgroups_mode_device"

    .line 38
    .line 39
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 43
    .line 44
    new-instance v0, Ll/wyd0;

    .line 45
    .line 46
    const-string v1, "newabgroups_mode_uid"

    .line 47
    .line 48
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->e:Ll/wyd0;

    .line 52
    .line 53
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->f:Lrx/subjects/a;

    .line 61
    .line 62
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->g:Lrx/subjects/a;

    .line 70
    .line 71
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->h:Lrx/subjects/a;

    .line 79
    .line 80
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->i:Lrx/subjects/a;

    .line 88
    .line 89
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->j:Lrx/subjects/a;

    .line 97
    .line 98
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

.method public static final A(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/putong/api/ABManager;->O(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return p0

    .line 22
    :catch_0
    :cond_0
    return p2
.end method

.method public static final declared-synchronized D()V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    sput v1, Lcom/p1/mobile/putong/api/ABManager;->m:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v1

    .line 10
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v1
.end method

.method public static final E()Ljava/lang/String;
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move-object v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    move-object v2, v1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :goto_1
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 24
    .line 25
    if-nez v3, :cond_2

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_2
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    return-object v0
.end method

.method public static final F(Lcom/p1/mobile/putong/api/ABManager$Mode;)V
    .locals 4
    .param p0    # Lcom/p1/mobile/putong/api/ABManager$Mode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager$f;->a:[I

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    aget p0, v0, p0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    if-eq p0, v0, :cond_2

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-eq p0, v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    if-ne p0, v1, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->e:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    .line 33
    .line 34
    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    .line 35
    .line 36
    .line 37
    throw p0

    .line 38
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->I()Ll/wyd0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ljava/lang/String;

    .line 56
    .line 57
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    const/4 p0, 0x0

    .line 74
    :goto_1
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/api/ABManager;->l(Lorg/json/JSONArray;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v0, "e_clone_ab_info"

    .line 79
    .line 80
    const-string v1, ""

    .line 81
    .line 82
    new-instance v2, Ll/pf60;

    .line 83
    .line 84
    const-string v3, "clone_ab_info"

    .line 85
    .line 86
    invoke-direct {v2, v3, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    filled-new-array {v2}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 97
    .line 98
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :catchall_0
    move-exception p0

    .line 103
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 104
    .line 105
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public static final I()Ll/wyd0;
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "newabgroups_user"

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "ab_nerver_save"

    .line 26
    .line 27
    invoke-direct {v0, v1, v2, v3}, Ll/wyd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static final declared-synchronized J(Landroid/os/Bundle;)V
    .locals 9
    .param p0    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-string v0, "onRestoreAbGroupsInfo abGroupsUser = "

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/api/ABManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const-string v2, "abGroupsUser"

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    const/4 v4, 0x2

    .line 21
    const/4 v5, 0x0

    .line 22
    const/4 v6, 0x1

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/api/ABManager;->m:I

    .line 30
    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_0
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    check-cast v7, Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2, v7, v5, v4, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    sput-object v7, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->I()Ll/wyd0;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v8

    .line 66
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    check-cast v8, Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2, v8, v6}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    invoke-virtual {v2, v7, v8}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    sput-object v2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 80
    .line 81
    sput v6, Lcom/p1/mobile/putong/api/ABManager;->m:I

    .line 82
    .line 83
    :cond_1
    const-string v2, "abGroupsDevice"

    .line 84
    .line 85
    invoke-virtual {p0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_2

    .line 94
    .line 95
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 96
    .line 97
    if-nez v2, :cond_2

    .line 98
    .line 99
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->e()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-static {v2, v7, v5, v4, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    sput-object v7, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 110
    .line 111
    sget-object v8, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 112
    .line 113
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    .line 119
    .line 120
    check-cast v8, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v2, v8, v6}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    invoke-virtual {v2, v7, v8}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    sput-object v2, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 131
    .line 132
    :cond_2
    const-string v2, "abGroupsUid"

    .line 133
    .line 134
    invoke-virtual {p0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-nez p0, :cond_3

    .line 143
    .line 144
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 145
    .line 146
    if-nez p0, :cond_3

    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->c0()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {p0, v2, v5, v4, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    sput-object v2, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 159
    .line 160
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->e:Ll/wyd0;

    .line 161
    .line 162
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    check-cast v3, Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p0, v3, v6}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    sput-object p0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 180
    .line 181
    :cond_3
    const-string p0, "[putong-common][ab]"

    .line 182
    .line 183
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 184
    .line 185
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 186
    .line 187
    sget-object v4, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 188
    .line 189
    new-instance v5, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v0, ", abGroupsDevice = "

    .line 198
    .line 199
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string v0, ", abGroupsUid = "

    .line 206
    .line 207
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-static {p0, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    .line 219
    .line 220
    monitor-exit v1

    .line 221
    return-void

    .line 222
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    throw p0
.end method

.method public static final K(Landroid/os/Bundle;)V
    .locals 2
    .param p0    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->e()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "abGroupsUser"

    .line 22
    .line 23
    const-string v1, "abGroupsUser.responseBody"

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->e()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    const-string v0, "abGroupsDevice"

    .line 46
    .line 47
    const-string v1, "abGroupsDevice.responseBody"

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->e()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    const-string v0, "abGroupsUid"

    .line 70
    .line 71
    const-string v1, "abGroupsUid.responseBody"

    .line 72
    .line 73
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public static final L()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static final Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static final R(Lcom/p1/mobile/putong/api/ABManager$d;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/api/ABManager$d;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    sget-boolean v0, Lcom/p1/mobile/putong/api/ABManager;->r:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/api/ABManager$d;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public static final declared-synchronized T()V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    sput v1, Lcom/p1/mobile/putong/api/ABManager;->m:I

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->i:Lrx/subjects/a;

    .line 8
    .line 9
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/api/ABManager$d;

    .line 31
    .line 32
    invoke-interface {v2}, Lcom/p1/mobile/putong/api/ABManager$d;->b()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const-string v1, "[putong-common][ab]"

    .line 39
    .line 40
    const-string v2, "resetAllAb"

    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw v1
.end method

.method public static final declared-synchronized U()V
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ll/wyd0;->clear()Z

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->c:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/wyd0;->clear()Z

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    sput-object v1, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 18
    .line 19
    sput-object v1, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 20
    .line 21
    const-string v1, "[putong-common][ab]"

    .line 22
    .line 23
    const-string v2, "resetUserAb"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v1
.end method

.method public static final V(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->f:Lrx/subjects/a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->v(I)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    const v1, 0x10008000

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static final W()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->f:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final X(Z)V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/api/ABManager;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final Y(Z)V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/api/ABManager;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final Z(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/pf60;

    .line 8
    .line 9
    const-string v1, "ab_type"

    .line 10
    .line 11
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/pf60;

    .line 15
    .line 16
    const-string v1, "ab_mode"

    .line 17
    .line 18
    invoke-direct {p0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/pf60;

    .line 22
    .line 23
    const-string v1, "oneid_timeout"

    .line 24
    .line 25
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-direct {p1, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    filled-new-array {v0, p0, p1}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "e_ab_report"

    .line 37
    .line 38
    const-string p2, ""

    .line 39
    .line 40
    invoke-static {p1, p2, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static a(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static final a0()V
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast v1, Ljava/lang/String;

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sput-object v1, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->I()Ll/wyd0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    check-cast v2, Ljava/lang/String;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->a:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/api/ABManager$d;

    .line 68
    .line 69
    invoke-interface {v1}, Lcom/p1/mobile/putong/api/ABManager$d;->a()V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const-string v0, "[putong-common][ab]"

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "tryInitUserAbInApplication abGroupsUser = "

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :catch_0
    move-exception v0

    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public static final b()Ll/wyd0;
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "abgroups"

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "ab_nerver_save"

    .line 26
    .line 27
    invoke-direct {v0, v1, v2, v3}, Ll/wyd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static final b0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$a;->c()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object p0

    .line 30
    :cond_1
    :goto_0
    const-string p0, ""

    .line 31
    .line 32
    return-object p0
.end method

.method public static final synthetic c(Lcom/p1/mobile/putong/api/ABManager;Ll/x1d0;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/ABManager;->B(Ll/x1d0;)Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final c0()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->c:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    return-object v0
.end method

.method public static final synthetic d(Lcom/p1/mobile/putong/api/ABManager;Ll/x1d0;Ll/i5d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/ABManager;->C(Ll/x1d0;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final d0()V
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->b:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sput-object v1, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "tryInitDeviceGroupUseOld abGroupsDevice = "

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "[putong-common][ab]"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static final e()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    return-object v0
.end method

.method public static final declared-synchronized e0(I)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sput p0, Lcom/p1/mobile/putong/api/ABManager;->q:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p0
.end method

.method public static final f(Ll/rg50$b;)Ll/rg50$b;
    .locals 1
    .param p0    # Ll/rg50$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager;->w()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager$c;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/ABManager$c;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public static final f0()V
    .locals 5
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->c:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sput-object v1, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->e:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "tryInitUidGroupUseOld abGroupsUid = "

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "[putong-common][ab]"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static final g()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0

    .line 29
    :cond_1
    return-object v1
.end method

.method public static final g0(Ll/i5d0;Lcom/p1/mobile/putong/api/ABManager$Mode;)V
    .locals 1
    .param p0    # Ll/i5d0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/api/ABManager$Mode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/i5d0;->I()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :goto_0
    move-object v0, p0

    .line 26
    goto :goto_1

    .line 27
    :catch_0
    move-exception p0

    .line 28
    goto :goto_2

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    invoke-static {v0}, Ll/l2;->K(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_3

    .line 39
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 43
    .line 44
    if-ne p1, p0, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->I()Ll/wyd0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_4

    .line 54
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 55
    .line 56
    if-ne p1, p0, :cond_2

    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_4

    .line 64
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 65
    .line 66
    if-ne p1, p0, :cond_3

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->e:Ll/wyd0;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_4
    return-void
.end method

.method public static final h()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string v0, ""

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    return-object v0

    .line 38
    :cond_1
    return-object v1

    .line 39
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    return-object v0

    .line 48
    :cond_3
    return-object v1

    .line 49
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    if-eqz v0, :cond_5

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    return-object v0

    .line 60
    :cond_5
    return-object v1
.end method

.method public static final h0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final i()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->k()Lorg/json/JSONArray;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/api/ABManager;->l(Lorg/json/JSONArray;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static final i0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final j()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/api/ABManager;->l(Lorg/json/JSONArray;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static final j0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$a;->c()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object p0

    .line 30
    :cond_1
    :goto_0
    const-string p0, ""

    .line 31
    .line 32
    return-object p0
.end method

.method public static final k()Lorg/json/JSONArray;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    return-object v0

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    return-object v0

    .line 45
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    return-object v0

    .line 57
    :cond_2
    const/4 v0, 0x0

    .line 58
    return-object v0
.end method

.method public static final m()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->g:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final n()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->g:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final o()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final p()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final q()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static final r()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static final u()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/api/ABManager;->k:Z

    .line 2
    .line 3
    return v0
.end method

.method public static final declared-synchronized v(I)Z
    .locals 7
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-string v0, "initAbGroup , state = "

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/api/ABManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "[putong-common][ab]"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    :try_start_1
    sget v2, Lcom/p1/mobile/putong/api/ABManager;->m:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    add-int/2addr v2, p0

    .line 27
    const/4 v3, 0x3

    .line 28
    const/4 v4, 0x0

    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    monitor-exit v1

    .line 32
    return v4

    .line 33
    :cond_0
    :try_start_2
    sput p0, Lcom/p1/mobile/putong/api/ABManager;->m:I

    .line 34
    .line 35
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    check-cast v3, Ljava/lang/String;

    .line 49
    .line 50
    const/4 v5, 0x2

    .line 51
    const/4 v6, 0x0

    .line 52
    invoke-static {v2, v3, v4, v5, v6}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sput-object v3, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->I()Ll/wyd0;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    check-cast v4, Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2, v4, v0}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    sput-object v2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->c0()V

    .line 82
    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->i:Lrx/subjects/a;

    .line 85
    .line 86
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 92
    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->a:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_1

    .line 112
    .line 113
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/api/ABManager$d;

    .line 118
    .line 119
    invoke-interface {v3}, Lcom/p1/mobile/putong/api/ABManager$d;->a()V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :catchall_0
    move-exception p0

    .line 124
    goto :goto_3

    .line 125
    :catch_0
    move-exception p0

    .line 126
    goto :goto_1

    .line 127
    :cond_1
    sput-boolean v0, Lcom/p1/mobile/putong/api/ABManager;->r:Z

    .line 128
    .line 129
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 130
    .line 131
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 132
    .line 133
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    const-string v4, "user"

    .line 137
    .line 138
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/api/ABManager;->S(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sget-object v2, Ll/uqb0;->Q:Ll/l2;

    .line 142
    .line 143
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/ABManager$b;->a()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {v2, v3}, Ll/l2;->W(Ljava/lang/String;)Lrx/c;

    .line 153
    .line 154
    .line 155
    :cond_2
    const-string v2, "[putong-common][ab]"

    .line 156
    .line 157
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 158
    .line 159
    new-instance v4, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v5, "initAbGroup abGroupsUser = "

    .line 165
    .line 166
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v3, ", state = "

    .line 173
    .line 174
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {v2, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 185
    .line 186
    .line 187
    goto :goto_2

    .line 188
    :goto_1
    :try_start_3
    new-instance v2, Ljava/lang/Exception;

    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    new-instance v4, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    const-string v5, "ABManager initAbGroup:"

    .line 200
    .line 201
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-direct {v2, v3, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    .line 213
    .line 214
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 215
    .line 216
    .line 217
    const-string v2, "[putong-common][ab]"

    .line 218
    .line 219
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    new-instance v3, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    .line 227
    .line 228
    const-string v4, "initAbGroup error : e = "

    .line 229
    .line 230
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-static {v2, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 241
    .line 242
    .line 243
    :goto_2
    monitor-exit v1

    .line 244
    return v0

    .line 245
    :goto_3
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 246
    throw p0
.end method

.method public static final x()V
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final declared-synchronized y(I)Z
    .locals 8
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const-string v0, "initPreSignInDeviceGroup abGroupsDevice = "

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/api/ABManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget v2, Lcom/p1/mobile/putong/api/ABManager;->q:I

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x2

    .line 10
    if-eq v2, v4, :cond_4

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/api/ABManager;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager;

    .line 13
    .line 14
    sget-object v5, Lcom/p1/mobile/putong/api/ABManager;->b:Ll/wyd0;

    .line 15
    .line 16
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    check-cast v5, Ljava/lang/String;

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-static {v2, v5, v3, v4, v6}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    sput-object v5, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 31
    .line 32
    sget-object v6, Lcom/p1/mobile/putong/api/ABManager;->d:Ll/wyd0;

    .line 33
    .line 34
    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    check-cast v6, Ljava/lang/String;

    .line 42
    .line 43
    const/4 v7, 0x1

    .line 44
    invoke-virtual {v2, v6, v7}, Lcom/p1/mobile/putong/api/ABManager;->s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    invoke-virtual {v2, v5, v6}, Lcom/p1/mobile/putong/api/ABManager;->G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    sput-object v5, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 53
    .line 54
    sget v5, Lcom/p1/mobile/putong/api/ABManager;->q:I

    .line 55
    .line 56
    if-eqz v5, :cond_0

    .line 57
    .line 58
    if-eq p0, v4, :cond_3

    .line 59
    .line 60
    :cond_0
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->g:Lrx/subjects/a;

    .line 61
    .line 62
    sget-object v4, Ll/uxj0;->a:Ll/uxj0;

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager$e;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager$e;

    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/ABManager$e;->a()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->h:Lrx/subjects/a;

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 84
    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    const-string v4, "device"

    .line 91
    .line 92
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/api/ABManager;->S(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sget-object v2, Ll/uqb0;->Q:Ll/l2;

    .line 96
    .line 97
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/ABManager$b;->a()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v2, v3}, Ll/l2;->W(Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    :cond_2
    const-string v2, "[putong-common][ab]"

    .line 110
    .line 111
    sget-object v3, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 112
    .line 113
    new-instance v4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    move v3, v7

    .line 129
    :cond_3
    sput p0, Lcom/p1/mobile/putong/api/ABManager;->q:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    :cond_4
    monitor-exit v1

    .line 132
    return v3

    .line 133
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    throw p0
.end method

.method public static final z()Z
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->f0()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/p1/mobile/putong/api/ABManager;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/api/ABManager;->j:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->Y(Z)V

    .line 17
    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    return v0
.end method


# virtual methods
.method public final B(Ll/x1d0;)Ll/x1d0;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/ABHeaderControl;->NO_AB_HEADER:Lcom/p1/mobile/putong/api/ABHeaderControl;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/api/ABHeaderControl;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/ABManager;->M(Ll/x1d0;)Ll/x1d0;

    .line 13
    .line 14
    .line 15
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return-object p0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    new-instance v0, Ljava/lang/Exception;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "ABManager interceptRequest:"

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public final C(Ll/x1d0;Ll/i5d0;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/ABManager;->N(Ll/x1d0;Ll/i5d0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    new-instance p1, Ljava/lang/Exception;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "ABManager interceptRespose:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-direct {p1, p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)Lcom/p1/mobile/putong/api/ABManager$b;
    .locals 3

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_4

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    if-eqz p0, :cond_4

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    sget-object p0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager$h;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/ABManager$h;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0, v0}, Ll/euk;->c(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    check-cast p0, Ljava/util/List;

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Lcom/p1/mobile/putong/api/ABManager$g;

    .line 61
    .line 62
    invoke-direct {v1}, Lcom/p1/mobile/putong/api/ABManager$g;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v0, v1}, Ll/euk;->c(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    check-cast v0, Ljava/util/List;

    .line 77
    .line 78
    new-instance v1, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    check-cast p0, Ljava/util/Collection;

    .line 84
    .line 85
    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    check-cast v0, Ljava/util/Collection;

    .line 89
    .line 90
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/euk;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/api/ABManager$b;->f(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 101
    .line 102
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 108
    .line 109
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    if-eqz p0, :cond_2

    .line 121
    .line 122
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    if-eqz p0, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    const/4 v0, 0x0

    .line 133
    :goto_2
    if-ge v0, p2, :cond_4

    .line 134
    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    if-eqz v1, :cond_1

    .line 140
    .line 141
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 146
    .line 147
    .line 148
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->d()Lorg/json/JSONArray;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/api/ABManager$b;->i(Lorg/json/JSONArray;)V

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_3
    return-object p2

    .line 160
    :cond_4
    :goto_3
    return-object p1
.end method

.method public final H(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)I
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    check-cast v1, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/ABManager$a;->b()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    :cond_1
    const/4 p0, 0x2

    .line 62
    return p0

    .line 63
    :cond_2
    if-eqz p2, :cond_5

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    check-cast v0, Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    check-cast v1, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/ABManager$a;->b()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    if-eqz p1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_3

    .line 122
    .line 123
    :cond_4
    const/4 p0, 0x1

    .line 124
    return p0

    .line 125
    :cond_5
    const/4 p0, 0x0

    .line 126
    return p0
.end method

.method public final M(Ll/x1d0;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, ""

    .line 12
    .line 13
    const-string v1, "X-Testing-Group"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez p0, :cond_3

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_f

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object p1, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object v0, p1

    .line 48
    :cond_2
    :goto_0
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 61
    .line 62
    if-eqz p0, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    move-object p0, v2

    .line 70
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_7

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget-object p1, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 81
    .line 82
    if-eqz p1, :cond_6

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    if-nez p1, :cond_5

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    move-object v0, p1

    .line 92
    :cond_6
    :goto_2
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/bzd0;->b()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Ljava/lang/Boolean;

    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-nez p0, :cond_f

    .line 117
    .line 118
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 119
    .line 120
    if-eqz p0, :cond_8

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    goto :goto_3

    .line 127
    :cond_8
    move-object p0, v2

    .line 128
    :goto_3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-nez p0, :cond_b

    .line 133
    .line 134
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    sget-object p1, Lcom/p1/mobile/putong/api/ABManager;->p:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 139
    .line 140
    if-eqz p1, :cond_a

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    if-nez p1, :cond_9

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_9
    move-object v0, p1

    .line 150
    :cond_a
    :goto_4
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    return-object p0

    .line 162
    :cond_b
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 163
    .line 164
    if-eqz p0, :cond_c

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    :cond_c
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-nez p0, :cond_f

    .line 175
    .line 176
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    sget-object p1, Lcom/p1/mobile/putong/api/ABManager;->o:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 181
    .line 182
    if-eqz p1, :cond_e

    .line 183
    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    if-nez p1, :cond_d

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :cond_d
    move-object v0, p1

    .line 192
    :cond_e
    :goto_5
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 201
    .line 202
    .line 203
    return-object p0

    .line 204
    :cond_f
    return-object p1
.end method

.method public final N(Ll/x1d0;Ll/i5d0;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/i5d0;->I()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "X-Testing-Group-V2-Tag"

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x2

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static {v0, v1, v2, v3, v4}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    const-string v0, ""

    .line 33
    .line 34
    :try_start_0
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5}, Ll/k5d0;->string()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ll/l2;->K(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v5

    .line 51
    invoke-static {v5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 55
    .line 56
    const-string v6, "Date"

    .line 57
    .line 58
    invoke-virtual {p2, v6}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {v5, p2}, Lcom/p1/mobile/putong/api/api/Network;->updateServerTime(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    sget-object v5, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 70
    .line 71
    new-instance v6, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-static {p2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    const-string v5, "[putong-common][ab]"

    .line 88
    .line 89
    const-string v6, "response"

    .line 90
    .line 91
    if-eqz p2, :cond_0

    .line 92
    .line 93
    const-string p1, "user"

    .line 94
    .line 95
    invoke-static {v6, p1, v2}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    new-instance p1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string p2, "initAbUser : "

    .line 108
    .line 109
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {v5, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    invoke-static {p0, v0, v2, v3, v4}, Lcom/p1/mobile/putong/api/ABManager;->t(Lcom/p1/mobile/putong/api/ABManager;Ljava/lang/String;ZILjava/lang/Object;)Lcom/p1/mobile/putong/api/ABManager$b;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    sget p2, Lcom/p1/mobile/putong/api/ABManager;->m:I

    .line 136
    .line 137
    if-eqz p2, :cond_3

    .line 138
    .line 139
    sget-object p2, Lcom/p1/mobile/putong/api/ABManager;->n:Lcom/p1/mobile/putong/api/ABManager$b;

    .line 140
    .line 141
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/api/ABManager;->H(Lcom/p1/mobile/putong/api/ABManager$b;Lcom/p1/mobile/putong/api/ABManager$b;)I

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_3

    .line 146
    .line 147
    new-instance p1, Ll/b;

    .line 148
    .line 149
    invoke-direct {p1, p0}, Ll/b;-><init>(I)V

    .line 150
    .line 151
    .line 152
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_2

    .line 156
    .line 157
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    sget-object p2, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 162
    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    if-eqz p0, :cond_2

    .line 180
    .line 181
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager$e;->INSTANCE:Lcom/p1/mobile/putong/api/ABManager$e;

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/ABManager$e;->b(Ll/x1d0;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/ABManager$e;->a()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_1

    .line 191
    .line 192
    const-string p0, "oneid"

    .line 193
    .line 194
    invoke-static {v6, p0, v2}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 195
    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_1
    const-string p0, "deviceid"

    .line 199
    .line 200
    invoke-static {v6, p0, v2}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 201
    .line 202
    .line 203
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->b:Ll/wyd0;

    .line 204
    .line 205
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    new-instance p0, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    const-string p1, "initAbDevice : "

    .line 211
    .line 212
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-static {v5, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_2
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    sget-object p1, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 231
    .line 232
    new-instance p2, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-eqz p0, :cond_3

    .line 249
    .line 250
    const-string p0, "uid"

    .line 251
    .line 252
    invoke-static {v6, p0, v2}, Lcom/p1/mobile/putong/api/ABManager;->Z(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 253
    .line 254
    .line 255
    sget-object p0, Lcom/p1/mobile/putong/api/ABManager;->c:Ll/wyd0;

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    new-instance p0, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string p1, "initAbUid : "

    .line 263
    .line 264
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-static {v5, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    :cond_3
    :goto_2
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$a;->a()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/String;

    .line 44
    .line 45
    :cond_0
    return-object p0
.end method

.method public final S(Lcom/p1/mobile/putong/api/ABManager$b;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    new-instance p0, Ljava/lang/Throwable;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->c()Ljava/util/HashMap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/ABManager$b;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "HeaderNull "

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p2, "  group = "

    .line 48
    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p2, " header = "

    .line 56
    .line 57
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public final l(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_1

    .line 23
    :catch_0
    move-exception v2

    .line 24
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, ","

    .line 31
    .line 32
    invoke-static {p1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public final s(Ljava/lang/String;Z)Lcom/p1/mobile/putong/api/ABManager$b;
    .locals 22

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    const-string v0, ":"

    .line 4
    .line 5
    const-string v2, "restart"

    .line 6
    .line 7
    const-string v3, "ab_nerver_save"

    .line 8
    .line 9
    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    return-object v5

    .line 17
    :cond_0
    new-instance v4, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    const-string v7, "[]"

    .line 27
    .line 28
    const-wide v8, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    if-nez v6, :cond_1

    .line 34
    .line 35
    new-instance v6, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v10, "real_ab_test_data:"

    .line 38
    .line 39
    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const-string v10, "[putong-common][ab]"

    .line 50
    .line 51
    invoke-static {v10, v6}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-direct {v6, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v10, "expiredSince"

    .line 60
    .line 61
    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    invoke-static {v10}, Lcom/p1/mobile/putong/data/Converter;->apiTimeStringToDate(Ljava/lang/String;)D

    .line 66
    .line 67
    .line 68
    move-result-wide v8

    .line 69
    if-nez p2, :cond_2

    .line 70
    .line 71
    sget-object v10, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 72
    .line 73
    invoke-virtual {v10}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 74
    .line 75
    .line 76
    move-result-wide v10
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    long-to-double v10, v10

    .line 78
    cmpl-double v10, v8, v10

    .line 79
    .line 80
    if-lez v10, :cond_1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    move-object v2, v5

    .line 84
    move-object v10, v7

    .line 85
    move-object v7, v2

    .line 86
    goto/16 :goto_f

    .line 87
    .line 88
    :catch_0
    move-exception v0

    .line 89
    move-object v2, v5

    .line 90
    goto/16 :goto_e

    .line 91
    .line 92
    :cond_2
    :goto_0
    :try_start_1
    const-string v10, "abHeader"

    .line 93
    .line 94
    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_6

    .line 99
    .line 100
    .line 101
    :try_start_2
    const-string v7, "names"

    .line 102
    .line 103
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 104
    .line 105
    .line 106
    move-result-object v7
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_5

    .line 107
    const/4 v12, 0x1

    .line 108
    if-nez v7, :cond_3

    .line 109
    .line 110
    move v13, v12

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    const/4 v13, 0x0

    .line 113
    :goto_1
    if-eqz v13, :cond_4

    .line 114
    .line 115
    :try_start_3
    new-instance v14, Lorg/json/JSONArray;

    .line 116
    .line 117
    invoke-direct {v14}, Lorg/json/JSONArray;-><init>()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 118
    .line 119
    .line 120
    move-object v7, v14

    .line 121
    goto :goto_2

    .line 122
    :catch_1
    move-exception v0

    .line 123
    move-object v2, v5

    .line 124
    move-object v5, v7

    .line 125
    move-object v7, v10

    .line 126
    goto/16 :goto_e

    .line 127
    .line 128
    :cond_4
    :goto_2
    :try_start_4
    const-string v14, "groups"

    .line 129
    .line 130
    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    move-result-object v14

    .line 134
    const-string v15, "properties"

    .line 135
    .line 136
    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    move-result-object v6
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 140
    if-eqz v14, :cond_5

    .line 141
    .line 142
    :try_start_5
    invoke-virtual {v14}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 143
    .line 144
    .line 145
    move-result-object v15
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    .line 146
    goto :goto_3

    .line 147
    :cond_5
    move-object v15, v5

    .line 148
    :goto_3
    if-eqz v15, :cond_10

    .line 149
    .line 150
    :try_start_6
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    if-ne v5, v12, :cond_10

    .line 155
    .line 156
    new-instance v5, Lcom/p1/mobile/putong/api/ABManager$a;

    .line 157
    .line 158
    invoke-direct {v5}, Lcom/p1/mobile/putong/api/ABManager$a;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v16

    .line 165
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    move-object/from16 v12, v16

    .line 169
    .line 170
    check-cast v12, Ljava/lang/String;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_4

    .line 171
    .line 172
    if-eqz v14, :cond_6

    .line 173
    .line 174
    :try_start_7
    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v16
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_2

    .line 178
    move-object/from16 v11, v16

    .line 179
    .line 180
    goto :goto_6

    .line 181
    :catch_2
    move-exception v0

    .line 182
    :goto_4
    move-object v5, v7

    .line 183
    move-object v7, v10

    .line 184
    :goto_5
    const/4 v2, 0x0

    .line 185
    goto/16 :goto_e

    .line 186
    .line 187
    :cond_6
    const/4 v11, 0x0

    .line 188
    :goto_6
    :try_start_8
    invoke-virtual {v5, v12}, Lcom/p1/mobile/putong/api/ABManager$a;->d(Ljava/lang/String;)V
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_4

    .line 189
    .line 190
    .line 191
    if-eqz v6, :cond_9

    .line 192
    .line 193
    move-wide/from16 v17, v8

    .line 194
    .line 195
    :try_start_9
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 196
    .line 197
    .line 198
    move-result-object v8

    .line 199
    if-eqz v8, :cond_8

    .line 200
    .line 201
    invoke-virtual {v8}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 202
    .line 203
    .line 204
    move-result-object v9

    .line 205
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    :goto_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 209
    .line 210
    .line 211
    move-result v19

    .line 212
    if-eqz v19, :cond_8

    .line 213
    .line 214
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v19

    .line 218
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 219
    .line 220
    .line 221
    move-object/from16 v20, v6

    .line 222
    .line 223
    move-object/from16 v6, v19

    .line 224
    .line 225
    check-cast v6, Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v6, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v19

    .line 231
    if-eqz v19, :cond_7

    .line 232
    .line 233
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/api/ABManager$a;->e(Z)V

    .line 238
    .line 239
    .line 240
    move-object/from16 v6, v20

    .line 241
    .line 242
    goto :goto_7

    .line 243
    :catch_3
    move-exception v0

    .line 244
    move-object v5, v7

    .line 245
    move-object v7, v10

    .line 246
    move-wide/from16 v8, v17

    .line 247
    .line 248
    goto :goto_5

    .line 249
    :cond_7
    move-object/from16 v19, v2

    .line 250
    .line 251
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/ABManager$a;->a()Ljava/util/Map;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    move-object/from16 v21, v9

    .line 256
    .line 257
    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v9

    .line 261
    invoke-interface {v2, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-object/from16 v2, v19

    .line 265
    .line 266
    move-object/from16 v6, v20

    .line 267
    .line 268
    move-object/from16 v9, v21

    .line 269
    .line 270
    goto :goto_7

    .line 271
    :cond_8
    move-object/from16 v19, v2

    .line 272
    .line 273
    move-object/from16 v20, v6

    .line 274
    .line 275
    goto :goto_8

    .line 276
    :cond_9
    move-object/from16 v19, v2

    .line 277
    .line 278
    move-object/from16 v20, v6

    .line 279
    .line 280
    move-wide/from16 v17, v8

    .line 281
    .line 282
    :goto_8
    if-eqz v11, :cond_e

    .line 283
    .line 284
    const/4 v2, 0x2

    .line 285
    const/4 v6, 0x0

    .line 286
    const/4 v8, 0x0

    .line 287
    invoke-static {v11, v0, v6, v2, v8}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v9

    .line 291
    const/4 v8, 0x1

    .line 292
    if-ne v9, v8, :cond_d

    .line 293
    .line 294
    new-instance v8, Lkotlin/text/Regex;

    .line 295
    .line 296
    invoke-direct {v8, v0}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v8, v11, v6}, Lkotlin/text/Regex;->split(Ljava/lang/CharSequence;I)Ljava/util/List;

    .line 300
    .line 301
    .line 302
    move-result-object v8

    .line 303
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 304
    .line 305
    .line 306
    move-result v6

    .line 307
    if-nez v6, :cond_b

    .line 308
    .line 309
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 310
    .line 311
    .line 312
    move-result v6

    .line 313
    invoke-interface {v8, v6}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 314
    .line 315
    .line 316
    move-result-object v6

    .line 317
    :goto_9
    invoke-interface {v6}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 318
    .line 319
    .line 320
    move-result v9

    .line 321
    if-eqz v9, :cond_b

    .line 322
    .line 323
    invoke-interface {v6}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v9

    .line 327
    check-cast v9, Ljava/lang/String;

    .line 328
    .line 329
    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    .line 330
    .line 331
    .line 332
    move-result v9

    .line 333
    if-nez v9, :cond_a

    .line 334
    .line 335
    goto :goto_9

    .line 336
    :cond_a
    check-cast v8, Ljava/lang/Iterable;

    .line 337
    .line 338
    invoke-interface {v6}, Ljava/util/ListIterator;->nextIndex()I

    .line 339
    .line 340
    .line 341
    move-result v6

    .line 342
    const/4 v9, 0x1

    .line 343
    add-int/2addr v6, v9

    .line 344
    invoke-static {v8, v6}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 345
    .line 346
    .line 347
    move-result-object v6

    .line 348
    goto :goto_a

    .line 349
    :cond_b
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 350
    .line 351
    .line 352
    move-result-object v6

    .line 353
    :goto_a
    check-cast v6, Ljava/util/Collection;

    .line 354
    .line 355
    const/4 v8, 0x0

    .line 356
    new-array v9, v8, [Ljava/lang/String;

    .line 357
    .line 358
    invoke-interface {v6, v9}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    check-cast v6, [Ljava/lang/String;

    .line 363
    .line 364
    array-length v9, v6

    .line 365
    if-ne v9, v2, :cond_c

    .line 366
    .line 367
    const/4 v9, 0x1

    .line 368
    aget-object v2, v6, v9

    .line 369
    .line 370
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/api/ABManager$a;->f(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-interface {v4, v12, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    goto :goto_c

    .line 377
    :cond_c
    const/4 v9, 0x1

    .line 378
    goto :goto_c

    .line 379
    :cond_d
    move v9, v8

    .line 380
    move v8, v6

    .line 381
    goto :goto_b

    .line 382
    :cond_e
    const/4 v8, 0x0

    .line 383
    const/4 v9, 0x1

    .line 384
    :goto_b
    invoke-virtual {v5, v11}, Lcom/p1/mobile/putong/api/ABManager$a;->f(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    invoke-interface {v4, v12, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    :goto_c
    if-eqz v13, :cond_f

    .line 391
    .line 392
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_3

    .line 396
    .line 397
    .line 398
    :cond_f
    move v12, v9

    .line 399
    move-wide/from16 v8, v17

    .line 400
    .line 401
    move-object/from16 v2, v19

    .line 402
    .line 403
    move-object/from16 v6, v20

    .line 404
    .line 405
    const/4 v5, 0x0

    .line 406
    goto/16 :goto_3

    .line 407
    .line 408
    :catch_4
    move-exception v0

    .line 409
    move-wide/from16 v17, v8

    .line 410
    .line 411
    goto/16 :goto_4

    .line 412
    .line 413
    :cond_10
    move-wide/from16 v17, v8

    .line 414
    .line 415
    move-wide/from16 v8, v17

    .line 416
    .line 417
    const/4 v2, 0x0

    .line 418
    goto :goto_f

    .line 419
    :catch_5
    move-exception v0

    .line 420
    move-wide/from16 v17, v8

    .line 421
    .line 422
    move-object v7, v10

    .line 423
    :goto_d
    const/4 v2, 0x0

    .line 424
    const/4 v5, 0x0

    .line 425
    goto :goto_e

    .line 426
    :catch_6
    move-exception v0

    .line 427
    move-wide/from16 v17, v8

    .line 428
    .line 429
    goto :goto_d

    .line 430
    :goto_e
    new-instance v6, Ljava/lang/Exception;

    .line 431
    .line 432
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v10

    .line 436
    new-instance v11, Ljava/lang/StringBuilder;

    .line 437
    .line 438
    const-string v12, "\n                    ABManager handleAbJson:"

    .line 439
    .line 440
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    const-string v10, "\n                    testBody="

    .line 447
    .line 448
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    const-string v10, "\n                    "

    .line 455
    .line 456
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    .line 458
    .line 459
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v10

    .line 463
    invoke-static {v10}, Lkotlin/text/b;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v10

    .line 467
    invoke-direct {v6, v10, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 468
    .line 469
    .line 470
    invoke-static {v6}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 471
    .line 472
    .line 473
    move-object v10, v7

    .line 474
    move-object v7, v5

    .line 475
    :goto_f
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    if-nez v0, :cond_11

    .line 480
    .line 481
    new-instance v5, Lcom/p1/mobile/putong/api/ABManager$b;

    .line 482
    .line 483
    invoke-direct {v5}, Lcom/p1/mobile/putong/api/ABManager$b;-><init>()V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/api/ABManager$b;->j(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    invoke-virtual {v5, v7}, Lcom/p1/mobile/putong/api/ABManager$b;->i(Lorg/json/JSONArray;)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/api/ABManager$b;->h(Ljava/util/HashMap;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v5, v10}, Lcom/p1/mobile/putong/api/ABManager$b;->f(Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    invoke-virtual {v5, v8, v9}, Lcom/p1/mobile/putong/api/ABManager$b;->g(D)V

    .line 499
    .line 500
    .line 501
    goto :goto_10

    .line 502
    :cond_11
    move-object v5, v2

    .line 503
    :goto_10
    return-object v5
.end method

.method public final w()V
    .locals 0

    .line 1
    new-instance p0, Ll/kl40;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kl40;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ll/srb0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/srb0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->R(Lcom/p1/mobile/putong/api/ABManager$d;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
