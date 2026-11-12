.class public final Luqi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "SdxSpeedDialPrefs"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Luqi;->a:Lb59;

    return-void
.end method
