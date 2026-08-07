.class public Ll/bm5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bm5;->H()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bm5;


# direct methods
.method public constructor <init>(Ll/bm5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bm5$a;->a:Ll/bm5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bm5$a;->a:Ll/bm5;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bm5;->C(Ll/bm5;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x5

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    const-string p1, "e_delete_account_policy_close"

    .line 11
    .line 12
    const-string v0, "p_delete_account_policy"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/bm5$a;->a:Ll/bm5;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
