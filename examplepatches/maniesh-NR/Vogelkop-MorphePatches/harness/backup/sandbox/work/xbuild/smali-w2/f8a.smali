.class public final Lf8a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lf8a;

.field public static final e:Lf8a;

.field public static final f:Lf8a;

.field public static final g:Lf8a;

.field public static final h:Lf8a;

.field public static final i:Lf8a;

.field public static final j:Lf8a;

.field public static final k:[C

.field public static final l:[C


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lv7a;

.field public final c:Lkotlin/jvm/functions/Function1;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lf8a;

    sget-object v1, Lv7a;->a:Lv7a;

    sget-object v2, Lu91;->e:Lu91;

    const-string v3, "MD5"

    invoke-direct {v0, v3, v1, v2}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->d:Lf8a;

    new-instance v0, Lf8a;

    const-string v2, "SHA1"

    sget-object v3, Lu91;->f:Lu91;

    invoke-direct {v0, v2, v1, v3}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->e:Lf8a;

    new-instance v0, Lf8a;

    sget-object v2, Lv7a;->b:Lv7a;

    sget-object v3, Lu91;->g:Lu91;

    const-string v4, "SHA256"

    invoke-direct {v0, v4, v2, v3}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->f:Lf8a;

    new-instance v0, Lf8a;

    sget-object v2, Lv7a;->d:Lv7a;

    sget-object v3, Lu91;->h:Lu91;

    invoke-direct {v0, v4, v2, v3}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->g:Lf8a;

    new-instance v0, Lf8a;

    sget-object v2, Lu91;->i:Lu91;

    invoke-direct {v0, v4, v1, v2}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->h:Lf8a;

    new-instance v0, Lf8a;

    sget-object v2, Lv7a;->c:Lv7a;

    sget-object v3, Lu91;->j:Lu91;

    const-string v4, "SHA512"

    invoke-direct {v0, v4, v2, v3}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->i:Lf8a;

    new-instance v0, Lf8a;

    sget-object v2, Lu91;->k:Lu91;

    invoke-direct {v0, v4, v1, v2}, Lf8a;-><init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V

    sput-object v0, Lf8a;->j:Lf8a;

    const/16 v0, 0x10

    new-array v1, v0, [C

    fill-array-data v1, :array_60

    sput-object v1, Lf8a;->k:[C

    new-array v0, v0, [C

    fill-array-data v0, :array_74

    sput-object v0, Lf8a;->l:[C

    return-void

    :array_60
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data

    :array_74
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Lv7a;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf8a;->a:Ljava/lang/String;

    iput-object p2, p0, Lf8a;->b:Lv7a;

    iput-object p3, p0, Lf8a;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lf8a;->b([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b([B)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lf8a;->a:Ljava/lang/String;

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    iget-object p0, p0, Lf8a;->b:Lv7a;

    invoke-static {v0, p0}, Lw7d;->u(Ljava/security/MessageDigest;Lv7a;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
