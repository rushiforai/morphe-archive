.class public final Lu92;
.super Lw92;
.source "SourceFile"


# static fields
.field public static final e:Ljava/util/Set;


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Lo29;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    const-string v12, "application/vnd.openxmlformats-officedocument.wordprocessingml.document"

    const-string v13, "text/plain"

    const-string v0, "application/json"

    const-string v1, "application/pdf"

    const-string v2, "image/*"

    const-string v3, "video/*"

    const-string v4, "audio/*"

    const-string v5, "text/css"

    const-string v6, "text/html"

    const-string v7, "text/javascript"

    const-string v8, "text/xml"

    const-string v9, "text/csv"

    const-string v10, "application/vnd.openxmlformats-officedocument.presentationml.presentation"

    const-string v11, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lu92;->e:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Lo29;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu92;->a:Landroid/net/Uri;

    iput-object p2, p0, Lu92;->b:Lo29;

    iput-object p4, p0, Lu92;->c:Ljava/lang/String;

    const-string p1, "application/octet-stream"

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_3c

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    throw p0

    :pswitch_1d
    const-string p3, "application/pdf"

    goto :goto_39

    :pswitch_20
    const-string p3, "text/html"

    goto :goto_39

    :pswitch_23
    const-string p3, "text/plain"

    goto :goto_39

    :pswitch_26
    sget-object p1, Ls29;->a:Ljava/util/HashSet;

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p4, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_39

    move-object p3, p1

    :cond_39
    :goto_39
    :pswitch_39
    iput-object p3, p0, Lu92;->d:Ljava/lang/String;

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_26
        :pswitch_39
        :pswitch_26
        :pswitch_39
        :pswitch_39
        :pswitch_39
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_26
        :pswitch_39
        :pswitch_39
        :pswitch_26
        :pswitch_39
        :pswitch_26
    .end packed-switch
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3a

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const-class v1, Lu92;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    check-cast p1, Lu92;

    iget-object v0, p0, Lu92;->a:Landroid/net/Uri;

    iget-object v1, p1, Lu92;->a:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lu92;->b:Lo29;

    iget-object v1, p1, Lu92;->b:Lo29;

    if-ne v0, v1, :cond_38

    iget-object v0, p0, Lu92;->c:Ljava/lang/String;

    iget-object v1, p1, Lu92;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p0, p0, Lu92;->d:Ljava/lang/String;

    iget-object p1, p1, Lu92;->d:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    :cond_38
    const/4 p0, 0x0

    return p0

    :cond_3a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lu92;->a:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lu92;->b:Lo29;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lu92;->c:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lu92;->d:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
