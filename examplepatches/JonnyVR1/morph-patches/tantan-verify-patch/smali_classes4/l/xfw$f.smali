.class public Ll/xfw$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xfw;->q0(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/xfw;


# direct methods
.method public constructor <init>(Ll/xfw;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xfw$f;->b:Ll/xfw;

    .line 2
    .line 3
    iput p2, p0, Ll/xfw$f;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/xfw$f;->b:Ll/xfw;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/xfw$f;->b:Ll/xfw;

    .line 11
    .line 12
    invoke-static {p1}, Ll/xfw;->o0(Ll/xfw;)Ll/iam;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/yfw;

    .line 17
    .line 18
    iget-object p1, p1, Ll/yfw;->e:Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;

    .line 19
    .line 20
    iget p0, p0, Ll/xfw$f;->a:I

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/ChooseGreetingsView;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xfw$f;->a(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
