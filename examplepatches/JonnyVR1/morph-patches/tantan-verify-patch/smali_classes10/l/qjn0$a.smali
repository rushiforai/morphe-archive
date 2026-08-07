.class public Ll/qjn0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qjn0;->P3(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/qjn0;


# direct methods
.method public constructor <init>(Ll/qjn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qjn0$a;->a:Ll/qjn0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qjn0$a;->a:Ll/qjn0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qjn0;->L3(Ll/qjn0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/xjn0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xjn0;->l()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/qjn0$a;->a:Ll/qjn0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/qjn0;->K3(Ll/qjn0;)Ll/pyn0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/qjn0$a;->a:Ll/qjn0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/qjn0;->K3(Ll/qjn0;)Ll/pyn0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Ll/pyn0;->N3(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method
