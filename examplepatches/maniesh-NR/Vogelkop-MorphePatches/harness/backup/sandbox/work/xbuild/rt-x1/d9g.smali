.class public final synthetic Ld9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/BrowserDataManager$CookiesAndLocalStorageUsageCallback;
.implements Lvlf;


# instance fields
.field public final synthetic a:Lg9g;


# direct methods
.method public synthetic constructor <init>(Lg9g;)V
    .registers 2

    iput-object p1, p0, Ld9g;->a:Lg9g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run([Ljava/lang/String;JZ)V
    .registers 6

    iget-object p0, p0, Ld9g;->a:Lg9g;

    iget-object v0, p0, Lg9g;->y:Landroid/view/View;

    if-nez v0, :cond_7

    return-void

    :cond_7
    array-length p1, p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lg9g;->H0(IJZ)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 9

    if-eqz p2, :cond_6

    sget-object p1, Lkag;->b:Lkag;

    :goto_4
    move-object v4, p1

    goto :goto_9

    :cond_6
    sget-object p1, Lkag;->c:Lkag;

    goto :goto_4

    :goto_9
    sget-object v0, Ls9g;->h:Ls9g;

    iget-object p0, p0, Ld9g;->a:Lg9g;

    iget-object v2, p0, Lg9g;->w:Ljava/lang/String;

    sget-object v3, Llag;->g:Llag;

    const/4 v5, 0x1

    const/4 v1, 0x0

    invoke-virtual/range {v0 .. v5}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    invoke-virtual {p0, p2}, Lg9g;->J0(Z)V

    return-void
.end method
