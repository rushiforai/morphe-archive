.class public final Ll/qtj0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xke$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qtj0;->g4()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/qtj0$c",
        "Ll/xke$c;",
        "",
        "inputText",
        "",
        "a",
        "(Ljava/lang/CharSequence;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/qtj0;


# direct methods
.method public constructor <init>(Ll/qtj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qtj0$c;->a:Ll/qtj0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/qtj0;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qtj0;->W3(Ll/qtj0;)Ll/xke;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "inputEditAlert"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/xke;->d()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qtj0$c;->a:Ll/qtj0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Ll/qtj0$c;->a:Ll/qtj0;

    .line 11
    .line 12
    new-instance v1, Ll/stj0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/stj0;-><init>(Ll/qtj0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, p1, v1}, Ll/qtj0;->T3(Ll/qtj0;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
