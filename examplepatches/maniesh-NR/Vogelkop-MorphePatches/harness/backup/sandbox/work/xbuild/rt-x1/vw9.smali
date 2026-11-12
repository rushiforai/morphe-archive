.class public final Lvw9;
.super Lzb5;
.source "SourceFile"


# instance fields
.field public final f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lywh;Lqtm;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lzb5;-><init>(Landroid/content/Context;Lywh;Lqtm;)V

    iget-object p1, p3, Ld93;->a:Lyla;

    iget-object p1, p1, Lyla;->e:Ll0c;

    if-eqz p1, :cond_1b

    iget-object p1, p1, Ll0c;->a:Ljava/lang/String;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "us"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1b

    const/4 p1, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    iput-boolean p1, p0, Lvw9;->f:Z

    return-void
.end method
