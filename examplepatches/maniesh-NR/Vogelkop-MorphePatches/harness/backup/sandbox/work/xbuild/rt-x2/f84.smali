.class public final Lf84;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lesg;

.field public final b:Lydp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lumi;Lzsd;)V
    .registers 9

    new-instance v0, Lydp;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "caching_image_loader_prefs-account_profile_picture"

    invoke-static {p1, p3, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v1

    new-instance v2, Ld84;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iget-object p4, p4, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p4, Lr9i;

    new-instance v3, Le84;

    invoke-direct {v3, v1}, Le84;-><init>(Lb59;)V

    invoke-direct {p4, p1, v3, p3}, Lr9i;-><init>(Landroid/content/Context;Le84;Lumi;)V

    new-instance p1, Lesg;

    invoke-direct {p1, v2, p4, p2}, Lesg;-><init>(Ld84;Lr9i;Ljava/lang/String;)V

    iput-object p1, p0, Lf84;->a:Lesg;

    iput-object v0, p0, Lf84;->b:Lydp;

    return-void
.end method
