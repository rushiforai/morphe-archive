.class public final synthetic Lc18;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# static fields
.field public static final a:Lc18;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lc18;

    const-string v4, "register(Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content/browser/PopupController$HideablePopup;)V"

    const/4 v5, 0x0

    const/4 v1, 0x2

    const-class v2, Lyng;

    const-string v3, "register"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lc18;->a:Lc18;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Lorg/chromium/content_public/browser/WebContents;

    check-cast p2, Lxng;

    if-eqz p1, :cond_15

    const-class p0, Lyng;

    sget-object v0, Lmkh;->e:Lodf;

    invoke-interface {p1, p0, v0}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p0

    check-cast p0, Lyng;

    iget-object p0, p0, Lyng;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
