.class public final Ld5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llnf;


# instance fields
.field public a:Z

.field public final b:Lm4k;

.field public final c:Lm4k;


# direct methods
.method public constructor <init>(Lm4k;Lm4k;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld5k;->b:Lm4k;

    iput-object p2, p0, Ld5k;->c:Lm4k;

    return-void
.end method

.method public static b(Lcue;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_a

    const-string p0, ""

    goto :goto_c

    :cond_a
    const-string p0, "newsfeed"

    :goto_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startpage"

    invoke-static {v1}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?newsBackend="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "&newsCategory="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f1410aa

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/net/Uri;ZLandroid/os/Parcelable;)Lknf;
    .registers 4

    if-eqz p2, :cond_9

    iget-object p0, p0, Ld5k;->c:Lm4k;

    invoke-virtual {p0, p1, p3}, Ln1;->U(Landroid/net/Uri;Landroid/os/Parcelable;)Ln4k;

    move-result-object p0

    return-object p0

    :cond_9
    iget-object p0, p0, Ld5k;->b:Lm4k;

    invoke-virtual {p0, p1, p3}, Ln1;->U(Landroid/net/Uri;Landroid/os/Parcelable;)Ln4k;

    move-result-object p0

    return-object p0
.end method
