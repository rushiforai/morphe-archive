.class public Ll/xn90$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xn90;->t(Lcom/google/android/gms/ads/AdView;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xn90;


# direct methods
.method public constructor <init>(Ll/xn90;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xn90$a;->a:Ll/xn90;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d70;->onAdClicked()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p0, p0, [Ll/sfj0$a;

    .line 6
    .line 7
    const-string v0, "e_clone_profile_info_ads"

    .line 8
    .line 9
    const-string v1, "p_suggest_users_home_view"

    .line 10
    .line 11
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
