.class public final Lnicoid/network238/okhttp3/OkHttpClient$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008n\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0011\u0008\u0010\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0002\u0010\u0006J\u0015\u0010\u0008\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0015\u0010\u000b\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0013\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J)\u0010\u0012\u001a\u00020\u00002\u0014\u0008\u0004\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00160\u0014H\u0087\u0008\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0013\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r\u00a2\u0006\u0004\u0008\u001a\u0010\u0010J\u0015\u0010\u001b\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u001b\u0010\u0013J)\u0010\u001b\u001a\u00020\u00002\u0014\u0008\u0004\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00160\u0014H\u0087\u0008\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u001c\u0010\u0019J\u0015\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\u001d\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0015\u0010!\u001a\u00020\u00002\u0006\u0010!\u001a\u00020 \u00a2\u0006\u0004\u0008!\u0010\"J\u0015\u0010$\u001a\u00020\u00002\u0006\u0010$\u001a\u00020#\u00a2\u0006\u0004\u0008$\u0010%J\u0015\u0010&\u001a\u00020\u00002\u0006\u0010&\u001a\u00020#\u00a2\u0006\u0004\u0008&\u0010%J\u0015\u0010(\u001a\u00020\u00002\u0006\u0010(\u001a\u00020\'\u00a2\u0006\u0004\u0008(\u0010)J\u0015\u0010*\u001a\u00020\u00002\u0006\u0010*\u001a\u00020#\u00a2\u0006\u0004\u0008*\u0010%J\u0015\u0010,\u001a\u00020\u00002\u0006\u0010+\u001a\u00020#\u00a2\u0006\u0004\u0008,\u0010%J\u0015\u0010.\u001a\u00020\u00002\u0006\u0010.\u001a\u00020-\u00a2\u0006\u0004\u0008.\u0010/J\u0017\u00101\u001a\u00020\u00002\u0008\u00101\u001a\u0004\u0018\u000100\u00a2\u0006\u0004\u00081\u00102J\u0017\u00104\u001a\u00020\u00002\u0006\u00104\u001a\u000203H\u0000\u00a2\u0006\u0004\u00085\u00106J\u0015\u00108\u001a\u00020\u00002\u0006\u00108\u001a\u000207\u00a2\u0006\u0004\u00088\u00109J\u0017\u0010;\u001a\u00020\u00002\u0008\u0010;\u001a\u0004\u0018\u00010:\u00a2\u0006\u0004\u0008;\u0010<J\u0015\u0010>\u001a\u00020\u00002\u0006\u0010>\u001a\u00020=\u00a2\u0006\u0004\u0008>\u0010?J\u0015\u0010@\u001a\u00020\u00002\u0006\u0010@\u001a\u00020\'\u00a2\u0006\u0004\u0008@\u0010)J\u0015\u0010B\u001a\u00020\u00002\u0006\u0010B\u001a\u00020A\u00a2\u0006\u0004\u0008B\u0010CJ\u0017\u0010E\u001a\u00020\u00002\u0006\u0010E\u001a\u00020DH\u0007\u00a2\u0006\u0004\u0008E\u0010FJ\u001d\u0010E\u001a\u00020\u00002\u0006\u0010E\u001a\u00020D2\u0006\u0010H\u001a\u00020G\u00a2\u0006\u0004\u0008E\u0010IJ\u001b\u0010L\u001a\u00020\u00002\u000c\u0010L\u001a\u0008\u0012\u0004\u0012\u00020K0J\u00a2\u0006\u0004\u0008L\u0010MJ\u001b\u0010O\u001a\u00020\u00002\u000c\u0010O\u001a\u0008\u0012\u0004\u0012\u00020N0J\u00a2\u0006\u0004\u0008O\u0010MJ\u0015\u0010Q\u001a\u00020\u00002\u0006\u0010Q\u001a\u00020P\u00a2\u0006\u0004\u0008Q\u0010RJ\u0015\u0010T\u001a\u00020\u00002\u0006\u0010T\u001a\u00020S\u00a2\u0006\u0004\u0008T\u0010UJ\u001d\u0010Z\u001a\u00020\u00002\u0006\u0010W\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008Z\u0010[J\u0017\u0010Z\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008Z\u0010^J\u0015\u0010Z\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008`\u0010aJ\u001d\u0010b\u001a\u00020\u00002\u0006\u0010W\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008b\u0010[J\u0017\u0010b\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008b\u0010^J\u0015\u0010b\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008c\u0010aJ\u001d\u0010d\u001a\u00020\u00002\u0006\u0010W\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008d\u0010[J\u0017\u0010d\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008d\u0010^J\u0015\u0010d\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008e\u0010aJ\u001d\u0010f\u001a\u00020\u00002\u0006\u0010W\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008f\u0010[J\u0017\u0010f\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008f\u0010^J\u0015\u0010f\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008g\u0010aJ\u001d\u0010i\u001a\u00020\u00002\u0006\u0010h\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008i\u0010[J\u0017\u0010i\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008i\u0010^J\u0015\u0010i\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008j\u0010aJ\u001d\u0010k\u001a\u00020\u00002\u0006\u0010W\u001a\u00020V2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008k\u0010[J\u0017\u0010k\u001a\u00020\u00002\u0006\u0010]\u001a\u00020\\H\u0007\u00a2\u0006\u0004\u0008k\u0010^J\u0015\u0010k\u001a\u00020\u00002\u0006\u0010]\u001a\u00020_\u00a2\u0006\u0004\u0008l\u0010aJ\u0015\u0010n\u001a\u00020\u00002\u0006\u0010m\u001a\u00020V\u00a2\u0006\u0004\u0008n\u0010aJ\r\u0010o\u001a\u00020\u0004\u00a2\u0006\u0004\u0008o\u0010pR\"\u0010\u0008\u001a\u00020\u00078\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0008\u0010q\u001a\u0004\u0008r\u0010s\"\u0004\u0008t\u0010uR$\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010v\u001a\u0004\u0008w\u0010x\"\u0004\u0008y\u0010zR \u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010{\u001a\u0004\u0008|\u0010\u0010R \u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010{\u001a\u0004\u0008}\u0010\u0010R%\u0010!\u001a\u00020 8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0015\n\u0004\u0008!\u0010~\u001a\u0005\u0008\u007f\u0010\u0080\u0001\"\u0006\u0008\u0081\u0001\u0010\u0082\u0001R\'\u0010$\u001a\u00020#8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008$\u0010\u0083\u0001\u001a\u0006\u0008\u0084\u0001\u0010\u0085\u0001\"\u0006\u0008\u0086\u0001\u0010\u0087\u0001R\'\u0010&\u001a\u00020#8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008&\u0010\u0083\u0001\u001a\u0006\u0008\u0088\u0001\u0010\u0085\u0001\"\u0006\u0008\u0089\u0001\u0010\u0087\u0001R\'\u0010(\u001a\u00020\'8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008(\u0010\u008a\u0001\u001a\u0006\u0008\u008b\u0001\u0010\u008c\u0001\"\u0006\u0008\u008d\u0001\u0010\u008e\u0001R\'\u0010*\u001a\u00020#8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008*\u0010\u0083\u0001\u001a\u0006\u0008\u008f\u0001\u0010\u0085\u0001\"\u0006\u0008\u0090\u0001\u0010\u0087\u0001R\'\u0010,\u001a\u00020#8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008,\u0010\u0083\u0001\u001a\u0006\u0008\u0091\u0001\u0010\u0085\u0001\"\u0006\u0008\u0092\u0001\u0010\u0087\u0001R\'\u0010.\u001a\u00020-8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008.\u0010\u0093\u0001\u001a\u0006\u0008\u0094\u0001\u0010\u0095\u0001\"\u0006\u0008\u0096\u0001\u0010\u0097\u0001R)\u00101\u001a\u0004\u0018\u0001008\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u00081\u0010\u0098\u0001\u001a\u0006\u0008\u0099\u0001\u0010\u009a\u0001\"\u0006\u0008\u009b\u0001\u0010\u009c\u0001R\'\u00108\u001a\u0002078\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u00088\u0010\u009d\u0001\u001a\u0006\u0008\u009e\u0001\u0010\u009f\u0001\"\u0006\u0008\u00a0\u0001\u0010\u00a1\u0001R)\u0010;\u001a\u0004\u0018\u00010:8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008;\u0010\u00a2\u0001\u001a\u0006\u0008\u00a3\u0001\u0010\u00a4\u0001\"\u0006\u0008\u00a5\u0001\u0010\u00a6\u0001R)\u0010>\u001a\u0004\u0018\u00010=8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008>\u0010\u00a7\u0001\u001a\u0006\u0008\u00a8\u0001\u0010\u00a9\u0001\"\u0006\u0008\u00aa\u0001\u0010\u00ab\u0001R\'\u0010@\u001a\u00020\'8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008@\u0010\u008a\u0001\u001a\u0006\u0008\u00ac\u0001\u0010\u008c\u0001\"\u0006\u0008\u00ad\u0001\u0010\u008e\u0001R\'\u0010B\u001a\u00020A8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008B\u0010\u00ae\u0001\u001a\u0006\u0008\u00af\u0001\u0010\u00b0\u0001\"\u0006\u0008\u00b1\u0001\u0010\u00b2\u0001R+\u0010\u00b3\u0001\u001a\u0004\u0018\u00010D8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0018\n\u0006\u0008\u00b3\u0001\u0010\u00b4\u0001\u001a\u0006\u0008\u00b5\u0001\u0010\u00b6\u0001\"\u0006\u0008\u00b7\u0001\u0010\u00b8\u0001R+\u0010\u00b9\u0001\u001a\u0004\u0018\u00010G8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0018\n\u0006\u0008\u00b9\u0001\u0010\u00ba\u0001\u001a\u0006\u0008\u00bb\u0001\u0010\u00bc\u0001\"\u0006\u0008\u00bd\u0001\u0010\u00be\u0001R+\u0010L\u001a\u0008\u0012\u0004\u0012\u00020K0J8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0015\n\u0004\u0008L\u0010{\u001a\u0005\u0008\u00bf\u0001\u0010\u0010\"\u0006\u0008\u00c0\u0001\u0010\u00c1\u0001R+\u0010O\u001a\u0008\u0012\u0004\u0012\u00020N0J8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0015\n\u0004\u0008O\u0010{\u001a\u0005\u0008\u00c2\u0001\u0010\u0010\"\u0006\u0008\u00c3\u0001\u0010\u00c1\u0001R\'\u0010Q\u001a\u00020P8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008Q\u0010\u00c4\u0001\u001a\u0006\u0008\u00c5\u0001\u0010\u00c6\u0001\"\u0006\u0008\u00c7\u0001\u0010\u00c8\u0001R\'\u0010T\u001a\u00020S8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008T\u0010\u00c9\u0001\u001a\u0006\u0008\u00ca\u0001\u0010\u00cb\u0001\"\u0006\u0008\u00cc\u0001\u0010\u00cd\u0001R,\u0010\u00cf\u0001\u001a\u0005\u0018\u00010\u00ce\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0018\n\u0006\u0008\u00cf\u0001\u0010\u00d0\u0001\u001a\u0006\u0008\u00d1\u0001\u0010\u00d2\u0001\"\u0006\u0008\u00d3\u0001\u0010\u00d4\u0001R(\u0010Z\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008Z\u0010\u00d6\u0001\u001a\u0006\u0008\u00d7\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00d9\u0001\u0010\u00da\u0001R(\u0010b\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008b\u0010\u00d6\u0001\u001a\u0006\u0008\u00db\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00dc\u0001\u0010\u00da\u0001R(\u0010d\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008d\u0010\u00d6\u0001\u001a\u0006\u0008\u00dd\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00de\u0001\u0010\u00da\u0001R(\u0010f\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008f\u0010\u00d6\u0001\u001a\u0006\u0008\u00df\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00e0\u0001\u0010\u00da\u0001R(\u0010i\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008i\u0010\u00d6\u0001\u001a\u0006\u0008\u00e1\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00e2\u0001\u0010\u00da\u0001R(\u0010k\u001a\u00030\u00d5\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008k\u0010\u00d6\u0001\u001a\u0006\u0008\u00e3\u0001\u0010\u00d8\u0001\"\u0006\u0008\u00e4\u0001\u0010\u00da\u0001R\'\u0010n\u001a\u00020V8\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u0008n\u0010\u00e5\u0001\u001a\u0006\u0008\u00e6\u0001\u0010\u00e7\u0001\"\u0006\u0008\u00e8\u0001\u0010\u00e9\u0001R,\u0010\u00eb\u0001\u001a\u0005\u0018\u00010\u00ea\u00018\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0018\n\u0006\u0008\u00eb\u0001\u0010\u00ec\u0001\u001a\u0006\u0008\u00ed\u0001\u0010\u00ee\u0001\"\u0006\u0008\u00ef\u0001\u0010\u00f0\u0001R)\u00104\u001a\u0004\u0018\u0001038\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0017\n\u0005\u00084\u0010\u00f1\u0001\u001a\u0006\u0008\u00f2\u0001\u0010\u00f3\u0001\"\u0006\u0008\u00f4\u0001\u0010\u00f5\u0001\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u00f6\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "",
        "<init>",
        "()V",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "okHttpClient",
        "(Lnicoid/network238/okhttp3/OkHttpClient;)V",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "dispatcher",
        "(Lnicoid/network238/okhttp3/Dispatcher;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "connectionPool",
        "(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "interceptors",
        "()Ljava/util/List;",
        "interceptor",
        "addInterceptor",
        "(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/kotlin/Function1;",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "Lnicoid/network238/okhttp3/Response;",
        "block",
        "-addInterceptor",
        "(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "networkInterceptors",
        "addNetworkInterceptor",
        "-addNetworkInterceptor",
        "Lnicoid/network238/okhttp3/EventListener;",
        "eventListener",
        "(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/EventListener$Factory;",
        "eventListenerFactory",
        "(Lnicoid/network238/okhttp3/EventListener$Factory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "",
        "retryOnConnectionFailure",
        "(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "fastFallback",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "authenticator",
        "(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "followRedirects",
        "followProtocolRedirects",
        "followSslRedirects",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "cookieJar",
        "(Lnicoid/network238/okhttp3/CookieJar;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/Cache;",
        "cache",
        "(Lnicoid/network238/okhttp3/Cache;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "taskRunner",
        "taskRunner$okhttp",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/Dns;",
        "dns",
        "(Lnicoid/network238/okhttp3/Dns;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Ljava/net/Proxy;",
        "proxy",
        "(Ljava/net/Proxy;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Ljava/net/ProxySelector;",
        "proxySelector",
        "(Ljava/net/ProxySelector;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "proxyAuthenticator",
        "Ljavax/net/SocketFactory;",
        "socketFactory",
        "(Ljavax/net/SocketFactory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "sslSocketFactory",
        "(Ljavax/net/ssl/SSLSocketFactory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Ljavax/net/ssl/X509TrustManager;",
        "trustManager",
        "(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "",
        "Lnicoid/network238/okhttp3/ConnectionSpec;",
        "connectionSpecs",
        "(Ljava/util/List;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/Protocol;",
        "protocols",
        "Ljavax/net/ssl/HostnameVerifier;",
        "hostnameVerifier",
        "(Ljavax/net/ssl/HostnameVerifier;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "certificatePinner",
        "(Lnicoid/network238/okhttp3/CertificatePinner;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "",
        "timeout",
        "Ljava/util/concurrent/TimeUnit;",
        "unit",
        "callTimeout",
        "(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Ljava/time/Duration;",
        "duration",
        "(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "Lnicoid/network238/kotlin/time/Duration;",
        "callTimeout-LRDsOJo",
        "(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "connectTimeout",
        "connectTimeout-LRDsOJo",
        "readTimeout",
        "readTimeout-LRDsOJo",
        "writeTimeout",
        "writeTimeout-LRDsOJo",
        "interval",
        "pingInterval",
        "pingInterval-LRDsOJo",
        "webSocketCloseTimeout",
        "webSocketCloseTimeout-LRDsOJo",
        "bytes",
        "minWebSocketMessageToCompress",
        "build",
        "()Lnicoid/network238/okhttp3/OkHttpClient;",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "getDispatcher$okhttp",
        "()Lnicoid/network238/okhttp3/Dispatcher;",
        "setDispatcher$okhttp",
        "(Lnicoid/network238/okhttp3/Dispatcher;)V",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "getConnectionPool$okhttp",
        "()Lnicoid/network238/okhttp3/ConnectionPool;",
        "setConnectionPool$okhttp",
        "(Lnicoid/network238/okhttp3/ConnectionPool;)V",
        "Ljava/util/List;",
        "getInterceptors$okhttp",
        "getNetworkInterceptors$okhttp",
        "Lnicoid/network238/okhttp3/EventListener$Factory;",
        "getEventListenerFactory$okhttp",
        "()Lnicoid/network238/okhttp3/EventListener$Factory;",
        "setEventListenerFactory$okhttp",
        "(Lnicoid/network238/okhttp3/EventListener$Factory;)V",
        "Z",
        "getRetryOnConnectionFailure$okhttp",
        "()Z",
        "setRetryOnConnectionFailure$okhttp",
        "(Z)V",
        "getFastFallback$okhttp",
        "setFastFallback$okhttp",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "getAuthenticator$okhttp",
        "()Lnicoid/network238/okhttp3/Authenticator;",
        "setAuthenticator$okhttp",
        "(Lnicoid/network238/okhttp3/Authenticator;)V",
        "getFollowRedirects$okhttp",
        "setFollowRedirects$okhttp",
        "getFollowSslRedirects$okhttp",
        "setFollowSslRedirects$okhttp",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "getCookieJar$okhttp",
        "()Lnicoid/network238/okhttp3/CookieJar;",
        "setCookieJar$okhttp",
        "(Lnicoid/network238/okhttp3/CookieJar;)V",
        "Lnicoid/network238/okhttp3/Cache;",
        "getCache$okhttp",
        "()Lnicoid/network238/okhttp3/Cache;",
        "setCache$okhttp",
        "(Lnicoid/network238/okhttp3/Cache;)V",
        "Lnicoid/network238/okhttp3/Dns;",
        "getDns$okhttp",
        "()Lnicoid/network238/okhttp3/Dns;",
        "setDns$okhttp",
        "(Lnicoid/network238/okhttp3/Dns;)V",
        "Ljava/net/Proxy;",
        "getProxy$okhttp",
        "()Ljava/net/Proxy;",
        "setProxy$okhttp",
        "(Ljava/net/Proxy;)V",
        "Ljava/net/ProxySelector;",
        "getProxySelector$okhttp",
        "()Ljava/net/ProxySelector;",
        "setProxySelector$okhttp",
        "(Ljava/net/ProxySelector;)V",
        "getProxyAuthenticator$okhttp",
        "setProxyAuthenticator$okhttp",
        "Ljavax/net/SocketFactory;",
        "getSocketFactory$okhttp",
        "()Ljavax/net/SocketFactory;",
        "setSocketFactory$okhttp",
        "(Ljavax/net/SocketFactory;)V",
        "sslSocketFactoryOrNull",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "getSslSocketFactoryOrNull$okhttp",
        "()Ljavax/net/ssl/SSLSocketFactory;",
        "setSslSocketFactoryOrNull$okhttp",
        "(Ljavax/net/ssl/SSLSocketFactory;)V",
        "x509TrustManagerOrNull",
        "Ljavax/net/ssl/X509TrustManager;",
        "getX509TrustManagerOrNull$okhttp",
        "()Ljavax/net/ssl/X509TrustManager;",
        "setX509TrustManagerOrNull$okhttp",
        "(Ljavax/net/ssl/X509TrustManager;)V",
        "getConnectionSpecs$okhttp",
        "setConnectionSpecs$okhttp",
        "(Ljava/util/List;)V",
        "getProtocols$okhttp",
        "setProtocols$okhttp",
        "Ljavax/net/ssl/HostnameVerifier;",
        "getHostnameVerifier$okhttp",
        "()Ljavax/net/ssl/HostnameVerifier;",
        "setHostnameVerifier$okhttp",
        "(Ljavax/net/ssl/HostnameVerifier;)V",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "getCertificatePinner$okhttp",
        "()Lnicoid/network238/okhttp3/CertificatePinner;",
        "setCertificatePinner$okhttp",
        "(Lnicoid/network238/okhttp3/CertificatePinner;)V",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "certificateChainCleaner",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "getCertificateChainCleaner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "setCertificateChainCleaner$okhttp",
        "(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V",
        "",
        "I",
        "getCallTimeout$okhttp",
        "()I",
        "setCallTimeout$okhttp",
        "(I)V",
        "getConnectTimeout$okhttp",
        "setConnectTimeout$okhttp",
        "getReadTimeout$okhttp",
        "setReadTimeout$okhttp",
        "getWriteTimeout$okhttp",
        "setWriteTimeout$okhttp",
        "getPingInterval$okhttp",
        "setPingInterval$okhttp",
        "getWebSocketCloseTimeout$okhttp",
        "setWebSocketCloseTimeout$okhttp",
        "J",
        "getMinWebSocketMessageToCompress$okhttp",
        "()J",
        "setMinWebSocketMessageToCompress$okhttp",
        "(J)V",
        "Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "routeDatabase",
        "Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "getRouteDatabase$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "setRouteDatabase$okhttp",
        "(Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;)V",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "getTaskRunner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "setTaskRunner$okhttp",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private authenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private cache:Lnicoid/network238/okhttp3/Cache;

.field private callTimeout:I

.field private certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

.field private certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

.field private connectTimeout:I

.field private connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

.field private connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private cookieJar:Lnicoid/network238/okhttp3/CookieJar;

.field private dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

.field private dns:Lnicoid/network238/okhttp3/Dns;

.field private eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

.field private fastFallback:Z

.field private followRedirects:Z

.field private followSslRedirects:Z

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private minWebSocketMessageToCompress:J

.field private final networkInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private pingInterval:I

.field private protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field private proxy:Ljava/net/Proxy;

.field private proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private proxySelector:Ljava/net/ProxySelector;

.field private readTimeout:I

.field private retryOnConnectionFailure:Z

.field private routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

.field private socketFactory:Ljavax/net/SocketFactory;

.field private sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

.field private taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private webSocketCloseTimeout:I

.field private writeTimeout:I

.field private x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 590
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 591
    new-instance v0, Lnicoid/network238/okhttp3/Dispatcher;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Dispatcher;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    .line 593
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 594
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 595
    sget-object v0, Lnicoid/network238/okhttp3/EventListener;->NONE:Lnicoid/network238/okhttp3/EventListener;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->asFactory(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener$Factory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    .line 596
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    .line 597
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->fastFallback:Z

    .line 598
    sget-object v1, Lnicoid/network238/okhttp3/Authenticator;->NONE:Lnicoid/network238/okhttp3/Authenticator;

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 599
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 600
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 601
    sget-object v0, Lnicoid/network238/okhttp3/CookieJar;->NO_COOKIES:Lnicoid/network238/okhttp3/CookieJar;

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    .line 603
    sget-object v0, Lnicoid/network238/okhttp3/Dns;->SYSTEM:Lnicoid/network238/okhttp3/Dns;

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    .line 606
    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 607
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 610
    sget-object v0, Lnicoid/network238/okhttp3/OkHttpClient;->Companion:Lnicoid/network238/okhttp3/OkHttpClient$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Companion;->getDEFAULT_CONNECTION_SPECS$okhttp()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 611
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Companion;->getDEFAULT_PROTOCOLS$okhttp()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 612
    sget-object v0, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 613
    sget-object v0, Lnicoid/network238/okhttp3/CertificatePinner;->DEFAULT:Lnicoid/network238/okhttp3/CertificatePinner;

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    .line 616
    const/16 v0, 0x2710

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 617
    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 618
    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 620
    const v0, 0xea60

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    .line 621
    const-wide/16 v0, 0x400

    iput-wide v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->minWebSocketMessageToCompress:J

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/OkHttpClient;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 625
    invoke-direct {p0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    .line 626
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    .line 627
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    .line 628
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 629
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 630
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->eventListenerFactory()Lnicoid/network238/okhttp3/EventListener$Factory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    .line 631
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    .line 632
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->fastFallback()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->fastFallback:Z

    .line 633
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->authenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 634
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->followRedirects()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 635
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->followSslRedirects()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 636
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    .line 637
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->cache()Lnicoid/network238/okhttp3/Cache;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cache:Lnicoid/network238/okhttp3/Cache;

    .line 638
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    .line 639
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    .line 640
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    .line 641
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 642
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 643
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 644
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    .line 645
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 646
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->protocols()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 647
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 648
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    .line 649
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    .line 650
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->callTimeoutMillis()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout:I

    .line 651
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->connectTimeoutMillis()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 652
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->readTimeoutMillis()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 653
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->writeTimeoutMillis()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 654
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval:I

    .line 655
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->webSocketCloseTimeout()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    .line 656
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->minWebSocketMessageToCompress()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->minWebSocketMessageToCompress:J

    .line 657
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 658
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-void
.end method


# virtual methods
.method public final -addInterceptor(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Lnicoid/network238/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 693
    .local v0, "$i$f$-addInterceptor":I
    new-instance v1, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addInterceptor$2;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addInterceptor$2;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    check-cast v1, Lnicoid/network238/okhttp3/Interceptor;

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    return-object v1
.end method

.method public final -addNetworkInterceptor(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Lnicoid/network238/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 709
    .local v0, "$i$f$-addNetworkInterceptor":I
    new-instance v1, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addNetworkInterceptor$2;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addNetworkInterceptor$2;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    check-cast v1, Lnicoid/network238/okhttp3/Interceptor;

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    return-object v1
.end method

.method public final addInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 688
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 704
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final authenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 780
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object p0
.end method

.method public final build()Lnicoid/network238/okhttp3/OkHttpClient;
    .registers 2

    .line 1385
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/OkHttpClient;-><init>(Lnicoid/network238/okhttp3/OkHttpClient$Builder;)V

    return-object v0
.end method

.method public final cache(Lnicoid/network238/okhttp3/Cache;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 814
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cache:Lnicoid/network238/okhttp3/Cache;

    return-object p0
.end method

.method public final callTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1098
    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout:I

    return-object p0
.end method

.method public final callTimeout(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1115
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final callTimeout-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1130
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout:I

    return-object p0
.end method

.method public final certificatePinner(Lnicoid/network238/okhttp3/CertificatePinner;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1077
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1078
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 1081
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-object p0
.end method

.method public final connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1144
    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    return-object p0
.end method

.method public final connectTimeout(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1158
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final connectTimeout-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1170
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    return-object p0
.end method

.method public final connectionPool(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 676
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-object p0
.end method

.method public final connectionSpecs(Ljava/util/List;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;)",
            "Lnicoid/network238/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 986
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 987
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 990
    :cond_0
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    return-object p0
.end method

.method public final cookieJar(Lnicoid/network238/okhttp3/CookieJar;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 808
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-object p0
.end method

.method public final dispatcher(Lnicoid/network238/okhttp3/Dispatcher;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 666
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    return-object p0
.end method

.method public final dns(Lnicoid/network238/okhttp3/Dns;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 829
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 830
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 832
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    return-object p0
.end method

.method public final eventListener(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 719
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->asFactory(Lnicoid/network238/okhttp3/EventListener;)Lnicoid/network238/okhttp3/EventListener$Factory;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-object p0
.end method

.method public final eventListenerFactory(Lnicoid/network238/okhttp3/EventListener$Factory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 730
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-object p0
.end method

.method public final fastFallback(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 769
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->fastFallback:Z

    return-object p0
.end method

.method public final followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 786
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    return-object p0
.end method

.method public final followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 797
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    return-object p0
.end method

.method public final getAuthenticator$okhttp()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 598
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final getCache$okhttp()Lnicoid/network238/okhttp3/Cache;
    .registers 2

    .line 602
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cache:Lnicoid/network238/okhttp3/Cache;

    return-object v0
.end method

.method public final getCallTimeout$okhttp()I
    .registers 2

    .line 615
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout:I

    return v0
.end method

.method public final getCertificateChainCleaner$okhttp()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 2

    .line 614
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-object v0
.end method

.method public final getCertificatePinner$okhttp()Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 2

    .line 613
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-object v0
.end method

.method public final getConnectTimeout$okhttp()I
    .registers 2

    .line 616
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    return v0
.end method

.method public final getConnectionPool$okhttp()Lnicoid/network238/okhttp3/ConnectionPool;
    .registers 2

    .line 592
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-object v0
.end method

.method public final getConnectionSpecs$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation

    .line 610
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    return-object v0
.end method

.method public final getCookieJar$okhttp()Lnicoid/network238/okhttp3/CookieJar;
    .registers 2

    .line 601
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-object v0
.end method

.method public final getDispatcher$okhttp()Lnicoid/network238/okhttp3/Dispatcher;
    .registers 2

    .line 591
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    return-object v0
.end method

.method public final getDns$okhttp()Lnicoid/network238/okhttp3/Dns;
    .registers 2

    .line 603
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    return-object v0
.end method

.method public final getEventListenerFactory$okhttp()Lnicoid/network238/okhttp3/EventListener$Factory;
    .registers 2

    .line 595
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-object v0
.end method

.method public final getFastFallback$okhttp()Z
    .registers 2

    .line 597
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->fastFallback:Z

    return v0
.end method

.method public final getFollowRedirects$okhttp()Z
    .registers 2

    .line 599
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    return v0
.end method

.method public final getFollowSslRedirects$okhttp()Z
    .registers 2

    .line 600
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    return v0
.end method

.method public final getHostnameVerifier$okhttp()Ljavax/net/ssl/HostnameVerifier;
    .registers 2

    .line 612
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public final getInterceptors$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 593
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method public final getMinWebSocketMessageToCompress$okhttp()J
    .registers 3

    .line 621
    iget-wide v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->minWebSocketMessageToCompress:J

    return-wide v0
.end method

.method public final getNetworkInterceptors$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 594
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    return-object v0
.end method

.method public final getPingInterval$okhttp()I
    .registers 2

    .line 619
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return v0
.end method

.method public final getProtocols$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .line 611
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    return-object v0
.end method

.method public final getProxy$okhttp()Ljava/net/Proxy;
    .registers 2

    .line 604
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public final getProxyAuthenticator$okhttp()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 606
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final getProxySelector$okhttp()Ljava/net/ProxySelector;
    .registers 2

    .line 605
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public final getReadTimeout$okhttp()I
    .registers 2

    .line 617
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    return v0
.end method

.method public final getRetryOnConnectionFailure$okhttp()Z
    .registers 2

    .line 596
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    return v0
.end method

.method public final getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;
    .registers 2

    .line 622
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    return-object v0
.end method

.method public final getSocketFactory$okhttp()Ljavax/net/SocketFactory;
    .registers 2

    .line 607
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public final getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .line 608
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public final getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 2

    .line 623
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object v0
.end method

.method public final getWebSocketCloseTimeout$okhttp()I
    .registers 2

    .line 620
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    return v0
.end method

.method public final getWriteTimeout$okhttp()I
    .registers 2

    .line 618
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    return v0
.end method

.method public final getX509TrustManagerOrNull$okhttp()Ljavax/net/ssl/X509TrustManager;
    .registers 2

    .line 609
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    return-object v0
.end method

.method public final hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1063
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1064
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 1067
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object p0
.end method

.method public final interceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 684
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method public final minWebSocketMessageToCompress(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 1382
    iput-wide p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->minWebSocketMessageToCompress:J

    return-object p0

    .line 1379
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "minWebSocketMessageToCompress must be positive: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1378
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final networkInterceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 700
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    return-object v0
.end method

.method public final pingInterval(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1285
    const-string v0, "interval"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return-object p0
.end method

.method public final pingInterval(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1305
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final pingInterval-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1323
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return-object p0
.end method

.method public final protocols(Ljava/util/List;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;)",
            "Lnicoid/network238/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1027
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 1030
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1031
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "protocols must contain h2_prior_knowledge or http/1.1: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1030
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1033
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 1034
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "protocols containing h2_prior_knowledge cannot use other protocols: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1033
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1036
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1039
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1045
    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->SPDY_3:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1047
    iget-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1048
    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 1400
    :cond_2
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1052
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    return-object p0

    .line 1039
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "protocols must not contain null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1037
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "protocols must not contain http/1.0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1036
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final proxy(Ljava/net/Proxy;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    .line 842
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 843
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 845
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    return-object p0
.end method

.method public final proxyAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 872
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 873
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 876
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object p0
.end method

.method public final proxySelector(Ljava/net/ProxySelector;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 857
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 858
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 861
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    return-object p0
.end method

.method public final readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1187
    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    return-object p0
.end method

.method public final readTimeout(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1204
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final readTimeout-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1219
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    return-object p0
.end method

.method public final retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 753
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    return-object p0
.end method

.method public final setAuthenticator$okhttp(Lnicoid/network238/okhttp3/Authenticator;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 598
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-void
.end method

.method public final setCache$okhttp(Lnicoid/network238/okhttp3/Cache;)V
    .registers 2

    .line 602
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cache:Lnicoid/network238/okhttp3/Cache;

    return-void
.end method

.method public final setCallTimeout$okhttp(I)V
    .registers 2

    .line 615
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->callTimeout:I

    return-void
.end method

.method public final setCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V
    .registers 2

    .line 614
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-void
.end method

.method public final setCertificatePinner$okhttp(Lnicoid/network238/okhttp3/CertificatePinner;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 613
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-void
.end method

.method public final setConnectTimeout$okhttp(I)V
    .registers 2

    .line 616
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    return-void
.end method

.method public final setConnectionPool$okhttp(Lnicoid/network238/okhttp3/ConnectionPool;)V
    .registers 2

    .line 592
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-void
.end method

.method public final setConnectionSpecs$okhttp(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 610
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    return-void
.end method

.method public final setCookieJar$okhttp(Lnicoid/network238/okhttp3/CookieJar;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 601
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-void
.end method

.method public final setDispatcher$okhttp(Lnicoid/network238/okhttp3/Dispatcher;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 591
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    return-void
.end method

.method public final setDns$okhttp(Lnicoid/network238/okhttp3/Dns;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 603
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->dns:Lnicoid/network238/okhttp3/Dns;

    return-void
.end method

.method public final setEventListenerFactory$okhttp(Lnicoid/network238/okhttp3/EventListener$Factory;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 595
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-void
.end method

.method public final setFastFallback$okhttp(Z)V
    .registers 2

    .line 597
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->fastFallback:Z

    return-void
.end method

.method public final setFollowRedirects$okhttp(Z)V
    .registers 2

    .line 599
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    return-void
.end method

.method public final setFollowSslRedirects$okhttp(Z)V
    .registers 2

    .line 600
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    return-void
.end method

.method public final setHostnameVerifier$okhttp(Ljavax/net/ssl/HostnameVerifier;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 612
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public final setMinWebSocketMessageToCompress$okhttp(J)V
    .registers 3

    .line 621
    iput-wide p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->minWebSocketMessageToCompress:J

    return-void
.end method

.method public final setPingInterval$okhttp(I)V
    .registers 2

    .line 619
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return-void
.end method

.method public final setProtocols$okhttp(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 611
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    return-void
.end method

.method public final setProxy$okhttp(Ljava/net/Proxy;)V
    .registers 2

    .line 604
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    return-void
.end method

.method public final setProxyAuthenticator$okhttp(Lnicoid/network238/okhttp3/Authenticator;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 606
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-void
.end method

.method public final setProxySelector$okhttp(Ljava/net/ProxySelector;)V
    .registers 2

    .line 605
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    return-void
.end method

.method public final setReadTimeout$okhttp(I)V
    .registers 2

    .line 617
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout:I

    return-void
.end method

.method public final setRetryOnConnectionFailure$okhttp(Z)V
    .registers 2

    .line 596
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    return-void
.end method

.method public final setRouteDatabase$okhttp(Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;)V
    .registers 2

    .line 622
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    return-void
.end method

.method public final setSocketFactory$okhttp(Ljavax/net/SocketFactory;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 607
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method

.method public final setSslSocketFactoryOrNull$okhttp(Ljavax/net/ssl/SSLSocketFactory;)V
    .registers 2

    .line 608
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    return-void
.end method

.method public final setTaskRunner$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
    .registers 2

    .line 623
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-void
.end method

.method public final setWebSocketCloseTimeout$okhttp(I)V
    .registers 2

    .line 620
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    return-void
.end method

.method public final setWriteTimeout$okhttp(I)V
    .registers 2

    .line 618
    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    return-void
.end method

.method public final setX509TrustManagerOrNull$okhttp(Ljavax/net/ssl/X509TrustManager;)V
    .registers 2

    .line 609
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    return-void
.end method

.method public final socketFactory(Ljavax/net/SocketFactory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 888
    instance-of v0, p1, Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_1

    .line 890
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 891
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 894
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-object p0

    .line 888
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "socketFactory instanceof SSLSocketFactory"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 912
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 913
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 916
    :cond_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 918
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 917
    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    .line 923
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->buildCertificateChainCleaner(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object p1

    .line 922
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-object p0

    .line 918
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 919
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to extract the trust manager on "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", sslSocketFactory is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 920
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    .line 919
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 918
    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 975
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 976
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 979
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 980
    sget-object p1, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;->Companion:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;->get(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    .line 981
    iput-object p2, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    return-object p0
.end method

.method public final taskRunner$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 819
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object p0
.end method

.method public final webSocketCloseTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1338
    const-string v0, "webSocketCloseTimeout"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    return-object p0
.end method

.method public final webSocketCloseTimeout(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1353
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final webSocketCloseTimeout-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1366
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->webSocketCloseTimeout:I

    return-object p0
.end method

.method public final writeTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1235
    const-string v0, "timeout"

    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    return-object p0
.end method

.method public final writeTimeout(Ljava/time/Duration;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1251
    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    return-object p0
.end method

.method public final writeTimeout-LRDsOJo(J)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 1265
    const-string v0, "duration"

    invoke-static {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    return-object p0
.end method
