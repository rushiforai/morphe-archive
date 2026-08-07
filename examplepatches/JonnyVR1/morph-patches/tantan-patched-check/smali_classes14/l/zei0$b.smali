.class public final Ll/zei0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/url;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zei0;->k()Ll/url;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J%\u0010\u0006\u001a\u0004\u0018\u00010\u00022\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0017\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "l/zei0$b",
        "Ll/url;",
        "",
        "originHost",
        "Landroid/net/Uri;",
        "uri",
        "a",
        "(Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/lhl;->l(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
