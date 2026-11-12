.class public final synthetic Lltp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# static fields
.field public static final synthetic b:Lltp;


# instance fields
.field public final synthetic a:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lltp;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lltp;-><init>(B)V

    sput-object v0, Lltp;->b:Lltp;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lltp;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;)Z
    .registers 5

    iget-byte p0, p0, Lltp;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_46

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v2, "index"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "index-dir"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    move v0, v1

    :cond_20
    return v0

    :pswitch_21
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_3a

    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result p0

    if-nez p0, :cond_3a

    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result p0

    if-eqz p0, :cond_3a

    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result p0

    if-eqz p0, :cond_3a

    move v0, v1

    :cond_3a
    return v0

    :pswitch_3b
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, ".apk"

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_21
    .end packed-switch
.end method
