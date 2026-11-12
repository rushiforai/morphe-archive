.class public final Ld3;
.super Ll7n;
.source "SourceFile"


# static fields
.field public static final i:Ljava/text/SimpleDateFormat;


# instance fields
.field public final b:Lcom/opera/android/PushedContentHandler;

.field public final c:Lmdh;

.field public final d:Lb1o;

.field public final e:Lorm;

.field public final f:Ld8j;

.field public final g:Lnak;

.field public final h:Lrlh;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmm"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    sput-object v0, Ld3;->i:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lhom;Lcom/opera/android/PushedContentHandler;Lmdh;Lb1o;Lorm;Ld8j;)V
    .registers 8

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p3, p0, Ld3;->b:Lcom/opera/android/PushedContentHandler;

    iput-object p4, p0, Ld3;->c:Lmdh;

    iput-object p5, p0, Ld3;->d:Lb1o;

    iput-object p6, p0, Ld3;->e:Lorm;

    iput-object p7, p0, Ld3;->f:Ld8j;

    new-instance p4, Lb3;

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object p5

    invoke-static {p3}, Lx1p;->R(Lcom/opera/android/PushedContentHandler;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Lno7;->i()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfom;

    iget-object p2, p2, Lfom;->b:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p6

    if-eqz p6, :cond_26

    const/4 p2, 0x0

    :cond_26
    invoke-direct {p4, p1, p5, p3, p2}, Lb3;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p4}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Ld3;->g:Lnak;

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Ld3;->h:Lrlh;

    return-void
.end method
